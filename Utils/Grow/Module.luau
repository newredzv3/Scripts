local Settings, Connections = ...
local _ENV = (getgenv or getrenv or getfenv)()
if type(Settings) ~= "table" or type(Connections) ~= "table" then
	return
end
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local DynamicDropdown = {}
DynamicDropdown.__index = DynamicDropdown
function DynamicDropdown.new(tab, config)
    local self = setmetatable({}, DynamicDropdown)
    self.tab = tab
    self.config = config
    self.control = nil
    self:refresh()
    return self
end
function DynamicDropdown:refresh()
    if self.control then
        self.control:Destroy()
    end
    local options = type(self.config.Options) == "function" 
        and self.config.Options() 
        or self.config.Options    
    self.control = self.tab:AddDropdown({
        Name = self.config.Name,
        Options = options,
        MultiSelect = self.config.MultiSelect or false,
        Default = self.config.Default or {},
        Callback = self.config.Callback
    })
end
local dropdowns = {}
local Net = (function()
    local ok, m = pcall(function() return require(ReplicatedStorage.SharedModules.Networking) end)
    return ok and m or nil
end)()
local PSC = (function()
    local ok, m = pcall(function() return require(ReplicatedStorage.ClientModules.PlayerStateClient) end)
    return ok and m or nil
end)()
if not Net then return end

local SeedData = (function()
    local ok, d = pcall(function() return require(ReplicatedStorage.SharedModules.SeedData) end)
    return ok and d or {}
end)()
local SeedPrice = {}
for _, e in ipairs(SeedData) do
    if type(e) == "table" and e.SeedName then
        SeedPrice[e.SeedName] = tonumber(e.PurchasePrice) or math.huge
    end
end

local FruitValueCalc = (function()
    local ok, m = pcall(function() return require(ReplicatedStorage.SharedModules.FruitValueCalc) end)
    return (ok and type(m) == "function") and m or nil
end)()
local SeedBaseValue = {}
if FruitValueCalc then
    for _, e in ipairs(SeedData) do
        if type(e) == "table" and e.SeedName then
            local ok, v = pcall(FruitValueCalc, e.SeedName, 1, nil, LocalPlayer, nil)
            SeedBaseValue[e.SeedName] = (ok and type(v) == "number") and v or 0
        end
    end
end

local MUT_BONUS = 2.35
local SIZE_EXP = 2.65
local function sizeMul(sz)
    sz = tonumber(sz) or 1
    return sz ^ SIZE_EXP
end

local PetData = (function()
    local ok, m = pcall(function() return require(ReplicatedStorage.SharedData.PetData) end)
    return ok and m or {}
end)()
local function getAnimalOptions()
    local list = {}
    for k, v in pairs(PetData) do
        if type(v) == "table" and type(k) == "string" then
            list[#list + 1] = k
        end
    end
    table.sort(list)
    return list
end

local Hub = { running = true, conns = {} }
local genv = (getgenv and getgenv()) or _G
if genv.GAGDSPK_unload then pcall(genv.GAGDSPK_unload) end

local function track(conn)
    table.insert(Hub.conns, conn)
    return conn
end

local function spawnLoop(interval, fn)
    task.spawn(function()
        while Hub.running do
            task.wait(interval)
            if not Hub.running then break end
            pcall(fn)
        end
    end)
end

local S = {
    autoBuySeed = false,
    buySeeds = {},
    autoPlant = false,
    plantSeeds = {},
    plantReserve = 0,
    maxPerCycle = 40,
    plantDelay = 0.14,
    plantLoop = 1.2,
    smartReplant = false,
    autoExpand = false,
    plantPattern = "Fill",
    plantSource = "My Seeds",
    autoBuild = false,
    removeCrops = {},
    autoCollect = false,
    harvestCrops = {},
    harvestMutsOnly = false,
    perFruitDelay = 0.05,
    harvestLoop = 1,
    autoSell = false,
    sellInterval = 20,
    sellOnFull = false,
    autoSteal = false,
    stealReturn = true,
    stealMult = 1,
    panicHarvest = false,
    retaliate = false,
    autoGrabPacks = false,
    grabRareOnly = true,
    packReturn = true,
    notifyRare = true,
    autoBuyGear = false,
    buyGears = {},
    autoBuyCrate = false,
    autoEggs = false,
    autoCrates = false,
    autoPacks = false,
    autoTame = false,
    tameAnimals = {},
    autoEquipPets = false,
    equipPets = {},
    walkSpeed = 16,
    jumpPower = 50,
    infJump = false,
    noclip = false,
    fly = false,
    flySpeed = 60,
    antiAfk = true,
    optimize = false,
    autoProgress = false,
    highlightReady = false,
    highlightRare = false,
    rareNotify = false,
    webhookUrl = "",
    whRareSeed = false,
    whBigHarvest = false,
    autoHopRare = false,
}

local SAVE_FILE = "DSPKGrowAGarden2.json"
local HttpService = game:GetService("HttpService")

local function saveSettings()
    if not writefile then return end
    pcall(function() writefile(SAVE_FILE, HttpService:JSONEncode(S)) end)
end
local Movement = loadstring(game:HttpGet("https://pastefy.app/AUTo6O5h/raw"))()
local function loadSettings()
    if not (readfile and isfile) then return end
    local ok, raw = pcall(function() return isfile(SAVE_FILE) and readfile(SAVE_FILE) or nil end)
    if not (ok and raw) then return end
    local good, data = pcall(function() return HttpService:JSONDecode(raw) end)
    if not (good and type(data) == "table") then return end
    for k, v in pairs(data) do
        if S[k] ~= nil then
            if type(S[k]) == "table" and type(v) == "table" then
                table.clear(S[k])
                for kk, vv in pairs(v) do
                    S[k][kk] = vv
                end
            elseif type(S[k]) == type(v) then
                S[k] = v
            end
        end
    end
end
loadSettings()

local function getReplica()
    if not PSC then return nil end
    local ok, r = pcall(function() return PSC:GetLocalReplica() end)
    return ok and r or nil
end

local function getData()
    local r = getReplica()
    return r and r.Data or nil
end

local function getSheckles()
    local d = getData()
    return d and d.Sheckles or 0
end

local function myPlot()
    local g = Workspace:FindFirstChild("Gardens")
    if not g then return nil end
    for _, plot in ipairs(g:GetChildren()) do
        if plot:GetAttribute("OwnerUserId") == LocalPlayer.UserId then
            return plot
        end
    end
end

local function isNight()
    local n = ReplicatedStorage:FindFirstChild("Night")
    return n and n.Value == true
end

local function char()
    return LocalPlayer.Character
end

local function hrp()
    local c = char()
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function humanoid()
    local c = char()
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function fire(pkt, ...)
    local a = {...}
    return pcall(function() return pkt:Fire(table.unpack(a)) end)
end

local function teleportTo(pos)
    local r = hrp()
    if r and pos then
        r.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
    end
end

local function setCharCollide(on)
    local c = char()
    if not c then return end
    for _, p in ipairs(c:GetDescendants()) do
        if p:IsA("BasePart") then
            pcall(function() p.CanCollide = on end)
        end
    end
end

local HOP = 70
local function reach(pos)
    local r = hrp()
    if not (r and pos) then return end
    local target = pos + Vector3.new(0, 3, 0)
    setCharCollide(false)
    for _ = 1, 60 do
        local cur = r.Position
        local delta = target - cur
        if delta.Magnitude <= HOP then
            r.CFrame = CFrame.new(target)
            break
        end
        r.CFrame = CFrame.new(cur + delta.Unit * HOP)
        RunService.Heartbeat:Wait()
    end
    if not S.noclip then
        setCharCollide(true)
    end
end

local function fruitValue(m)
    local base = SeedBaseValue[m:GetAttribute("CorePartName") or m:GetAttribute("SeedName")] or 0
    return base * sizeMul(m:GetAttribute("SizeMulti") or 1) * (m:GetAttribute("Mutation") and MUT_BONUS or 1)
end

local function modelRipe(m)
    local age = tonumber(m:GetAttribute("Age"))
    local mx = tonumber(m:GetAttribute("MaxAge"))
    if age and mx then
        return age >= mx - 0.001
    end
    for _, d in ipairs(m:GetDescendants()) do
        if d:IsA("ProximityPrompt") and CollectionService:HasTag(d, "HarvestPrompt") then
            return true
        end
    end
    return false
end

local function ownHarvestTargets(respectFilter)
    local useCrop = respectFilter and next(S.harvestCrops) ~= nil
    local out = {}
    local plot = myPlot()
    if not plot then return out end
    local plants = plot:FindFirstChild("Plants")
    if not plants then return out end

    local function consider(m)
        if not m:GetAttribute("PlantId") then return end
        local crop = m:GetAttribute("CorePartName") or m:GetAttribute("SeedName")
        local mutOk = (not respectFilter) or (not S.harvestMutsOnly) or (m:GetAttribute("Mutation") ~= nil)
        if ((not useCrop) or (crop and S.harvestCrops[crop] == true)) and mutOk then
            out[#out + 1] = m
        end
    end

    for _, plant in ipairs(plants:GetChildren()) do
        local fr = plant:FindFirstChild("Fruits")
        local fruits = fr and fr:GetChildren() or {}
        if #fruits > 0 then
            for _, m in ipairs(fruits) do
                if modelRipe(m) then
                    consider(m)
                end
            end
        elseif modelRipe(plant) then
            consider(plant)
        end
    end
    return out
end

local function stealTargets()
    local out = {}
    for _, p in ipairs(CollectionService:GetTagged("StealPrompt")) do
        local m = p.Parent and p.Parent:FindFirstAncestorWhichIsA("Model")
        if m then
            local uid = tonumber(m:GetAttribute("UserId"))
            if uid and uid ~= LocalPlayer.UserId and m:GetAttribute("PlantId") then
                out[#out + 1] = { model = m, value = fruitValue(m) }
            end
        end
    end
    table.sort(out, function(a, b) return a.value > b.value end)
    return out
end

local function collectModel(m)
    if not m or not m.Parent then return end
    local pid = m:GetAttribute("PlantId")
    if not pid then return end
    reach(m:GetPivot().Position)
    task.wait(S.perFruitDelay)
    fire(Net.Garden.CollectFruit, pid, m:GetAttribute("FruitId") or "")
end

local function harvestAll(respectFilter)
    local plot = myPlot()
    local ref = plot and plot:FindFirstChild("PlotSizeReference")
    local r = hrp()
    if ref and r and (Vector3.new(r.Position.X, 0, r.Position.Z) - Vector3.new(ref.Position.X, 0, ref.Position.Z)).Magnitude > 16 then
        reach(ref.Position)
        task.wait(0.12)
    end
    local t = ownHarvestTargets(respectFilter)
    local n = 0
    for _, m in ipairs(t) do
        local pid = m:GetAttribute("PlantId")
        if pid then
            fire(Net.Garden.CollectFruit, pid, m:GetAttribute("FruitId") or "")
            n = n + 1
            task.wait(S.perFruitDelay)
        end
    end
    return n
end

local function stealModel(m, mult, skipReach)
    if not m or not m.Parent then return end
    local uid = tonumber(m:GetAttribute("UserId"))
    local pid = m:GetAttribute("PlantId")
    if not (uid and pid) then return end
    if not skipReach then
        reach(m:GetPivot().Position)
        task.wait(0.05)
    end
    fire(Net.Steal.BeginSteal, uid, pid, m:GetAttribute("FruitId") or "")
    for _ = 1, math.max(1, mult or 1) do
        fire(Net.Steal.CompleteSteal)
    end
end

local function stockItems(shop)
    local sv = ReplicatedStorage:FindFirstChild("StockValues")
    sv = sv and sv:FindFirstChild(shop)
    return sv and sv:FindFirstChild("Items")
end

local function seedStockItems()
    return stockItems("SeedShop")
end

local function gearStockItems()
    return stockItems("GearShop")
end

local function stockOf(shop, name)
    local it = stockItems(shop)
    local v = it and it:FindFirstChild(name)
    return (v and v:IsA("ValueBase")) and v.Value or 0
end

local function seedStockOf(name)
    return stockOf("SeedShop", name)
end

local function gearStockOf(name)
    return stockOf("GearShop", name)
end

local function getGearOptions()
    local it = gearStockItems()
    local list = {}
    if it then
        for _, sv in ipairs(it:GetChildren()) do
            list[#list + 1] = sv.Name
        end
    end
    table.sort(list)
    return list
end

local function getSeedOptions()
    local seen = {}
    for _, e in ipairs(SeedData) do
        if e.SeedName then
            seen[e.SeedName] = tonumber(e.SeedShopDisplayOrder) or 900
        end
    end
    local it = seedStockItems()
    if it then
        for _, sv in ipairs(it:GetChildren()) do
            if seen[sv.Name] == nil then
                seen[sv.Name] = 899
            end
        end
    end
    local list = {}
    for name, ord in pairs(seen) do
        list[#list + 1] = { name, ord }
    end
    table.sort(list, function(a, b)
        if a[2] == b[2] then return a[1] < b[1] end
        return a[2] < b[2]
    end)
    local names = {}
    for _, x in ipairs(list) do
        names[#names + 1] = x[1]
    end
    return names
end

local function getOwnedSeedOptions()
    local d = getData()
    local order = {}
    for _, e in ipairs(SeedData) do
        if e.SeedName then
            order[e.SeedName] = tonumber(e.SeedShopDisplayOrder) or 900
        end
    end
    local list = {}
    if d and d.Inventory and d.Inventory.Seeds then
        for n, c in pairs(d.Inventory.Seeds) do
            if (c or 0) > 0 then
                list[#list + 1] = n
            end
        end
    end
    table.sort(list, function(a, b)
        local oa, ob = order[a] or 900, order[b] or 900
        if oa == ob then return a < b end
        return oa < ob
    end)
    return list
end

local function getPlantedOptions()
    local plot = myPlot()
    local seen = {}
    if plot then
        local plants = plot:FindFirstChild("Plants")
        if plants then
            for _, pl in ipairs(plants:GetChildren()) do
                local s = pl:GetAttribute("SeedName") or pl:GetAttribute("CorePartName")
                if s then
                    seen[s] = true
                end
            end
        end
    end
    local list = {}
    for k in pairs(seen) do
        list[#list + 1] = k
    end
    table.sort(list)
    return list
end

local function getHarvestOptions()
    local seen = {}
    local plot = myPlot()
    if plot then
        local plants = plot:FindFirstChild("Plants")
        if plants then
            for _, pl in ipairs(plants:GetChildren()) do
                local s = pl:GetAttribute("SeedName") or pl:GetAttribute("CorePartName")
                if s then
                    seen[s] = true
                end
            end
        end
    end
    local d = getData()
    if d and d.Inventory and d.Inventory.Seeds then
        for n in pairs(d.Inventory.Seeds) do
            seen[n] = true
        end
    end
    local list = {}
    for k in pairs(seen) do
        list[#list + 1] = k
    end
    table.sort(list)
    return list
end

local function getPetOptions()
    local d = getData()
    local seen = {}
    if d and d.Inventory and d.Inventory.Pets then
        for _, info in pairs(d.Inventory.Pets) do
            local nm = (type(info) == "table" and (info.PetType or info.Name)) or tostring(info)
            if nm and nm ~= "" then
                seen[nm] = true
            end
        end
    end
    local list = {}
    for k in pairs(seen) do
        list[#list + 1] = k
    end
    table.sort(list)
    return list
end

local function maxEquip()
    return tonumber(LocalPlayer:GetAttribute("MaxEquippedPets")) or 3
end

local function bestOwnedSeed()
    local d = getData()
    local seeds = d and d.Inventory and d.Inventory.Seeds
    if not seeds then return nil end
    local best, bestV
    for name, count in pairs(seeds) do
        if (count or 0) > 0 then
            local v = SeedBaseValue[name] or 0
            if not bestV or v > bestV then
                best, bestV = name, v
            end
        end
    end
    return best, bestV
end

local function inventoryValue()
    local total, n = 0, 0
    local function scan(c)
        if not c then return end
        for _, t in ipairs(c:GetChildren()) do
            if t:IsA("Tool") and (t:GetAttribute("HarvestedFruit") or t:GetAttribute("Fruit")) then
                n = n + 1
                local base = SeedBaseValue[t:GetAttribute("Fruit") or t:GetAttribute("CorePartName")] or 0
                total = total + base * sizeMul(t:GetAttribute("SizeMultiplier") or t:GetAttribute("SizeMulti") or 1) * (t:GetAttribute("Mutation") and MUT_BONUS or 1)
            end
        end
    end
    scan(LocalPlayer:FindFirstChild("Backpack"))
    scan(char())
    return total, n
end

local function abbrev(n)
    n = tonumber(n) or 0
    if n >= 1e9 then return string.format("%.2fB", n / 1e9) end
    if n >= 1e6 then return string.format("%.2fM", n / 1e6) end
    if n >= 1e3 then return string.format("%.1fK", n / 1e3) end
    return tostring(math.floor(n))
end

local EVENT_NAME = {
    Moon = "Moonlit",
    Bloodmoon = "Blood Moon",
    Goldmoon = "Gold Moon",
    ["Rainbow Moon"] = "Rainbow Moon",
    ["Chained Moon"] = "Chained Moon",
    ["Pizza Moon"] = "Pizza Moon",
    Sunset = "Sunset",
    Day = "Day"
}

local function eventNameOf(r)
    return EVENT_NAME[r] or tostring(r or "-")
end

local function fmtClock(s)
    s = math.max(0, math.floor(s or 0))
    return string.format("%d:%02d", s // 60, s % 60)
end

local function restockIn(shop)
    local sv = ReconstructedStorage:FindFirstChild("StockValues")
    sv = sv and sv:FindFirstChild(shop)
    local nx = sv and sv:FindFirstChild("UnixNextRestock")
    return nx and math.max(0, nx.Value - os.time()) or nil
end

local function commafy(n)
    local neg = n < 0
    local s = tostring(math.floor(math.abs(n) + 0.5))
    local out = s:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    return (neg and "-" or "") .. out
end

local function money(n)
    return "$" .. commafy(n)
end

local function fmtPrice(n)
    n = tonumber(n)
    if not n or n <= 0 or n == math.huge then return "" end
    local s
    if n >= 1e9 then
        s = string.format("%.1fB", n / 1e9)
    elseif n >= 1e6 then
        s = string.format("%.1fM", n / 1e6)
    elseif n >= 1e3 then
        s = string.format("%.0fK", n / 1e3)
    else
        s = commafy(n)
    end
    s = s:gsub("%.0(%a)", "%1")
    return s .. "¢"
end

local function seedPriceTag(nm)
    return fmtPrice(SeedPrice[nm])
end

local PLANT_PATTERNS = { "Fill", "Checkerboard", "Rows", "Columns", "Diagonal", "Spaced" }

local function patternKeep(pat, gx, gz)
    if pat == "Checkerboard" then
        return (gx + gz) % 2 == 0
    elseif pat == "Rows" then
        return gz % 2 == 0
    elseif pat == "Columns" then
        return gx % 2 == 0
    elseif pat == "Diagonal" then
        return (gx - gz) % 3 == 0
    elseif pat == "Spaced" then
        return gx % 2 == 0 and gz % 2 == 0
    end
    return true
end

local function plantAreas(plot)
    local areas = {}
    for _, p in ipairs(CollectionService:GetTagged("PlantArea")) do
        if p:IsA("BasePart") and p:IsDescendantOf(plot) and p.Size.X * p.Size.Z > 400 then
            areas[#areas + 1] = p
        end
    end
    if #areas == 0 then
        local ref = plot:FindFirstChild("PlotSizeReference")
        if ref then
            areas = { ref }
        end
    end
    return areas
end

local function plantPositions(plot)
    local pat = S.plantPattern or "Fill"
    local step = 6
    local seen, list = {}, {}
    for _, area in ipairs(plantAreas(plot)) do
        local cf, sz = area.CFrame, area.Size
        local topY = area.Position.Y + sz.Y / 2 + 0.3
        local hx, hz = sz.X / 2 - 3, sz.Z / 2 - 3
        local nx, nz = math.floor((2 * hx) / step), math.floor((2 * hz) / step)
        for ix = 0, nx do
            for iz = 0, nz do
                local w = (cf * CFrame.new(-hx + ix * step, 0, -hz + iz * step)).Position
                local gx, gz = math.floor(w.X / step + 0.5), math.floor(w.Z / step + 0.5)
                if patternKeep(pat, gx, gz) then
                    local key = math.floor(w.X / 4 + 0.5) .. "," .. math.floor(w.Z / 4 + 0.5)
                    if not seen[key] then
                        seen[key] = true
                        list[#list + 1] = Vector3.new(w.X, topY, w.Z)
                    end
                end
            end
        end
    end
    return list
end

local function freePlantPositions(plot)
    local grid = plantPositions(plot)
    local plants = plot:FindFirstChild("Plants")
    local occ = {}
    if plants then
        for _, pl in ipairs(plants:GetChildren()) do
            local ok, pv = pcall(function() return pl:GetPivot().Position end)
            if ok then
                occ[#occ + 1] = pv
            end
        end
    end
    local free = {}
    for _, pos in ipairs(grid) do
        local clear = true
        for _, o in ipairs(occ) do
            if (Vector3.new(o.X, 0, o.Z) - Vector3.new(pos.X, 0, pos.Z)).Magnitude < 6 then
                clear = false
                break
            end
        end
        if clear then
            free[#free + 1] = pos
        end
    end
    return free
end

local SNAP_FILE = "DSPK_GAG_GAG2_Snapshots.json"
local Snapshots = {}

local function saveSnapshots()
    if writefile then
        pcall(function() writefile(SNAP_FILE, HttpService:JSONEncode(Snapshots)) end)
    end
end

do
    if readfile and isfile then
        local ok, raw = pcall(function() return isfile(SNAP_FILE) and readfile(SNAP_FILE) or nil end)
        if ok and raw then
            local g, d = pcall(function() return HttpService:JSONDecode(raw) end)
            if g and type(d) == "table" then
                Snapshots = d
            end
        end
    end
end

local function snapshotNames()
    local list = {}
    for n in pairs(Snapshots) do
        list[#list + 1] = n
    end
    table.sort(list)
    return list
end

local function gardenNearPlayer()
    local g = Workspace:FindFirstChild("Gardens")
    local r = hrp()
    if not (g and r) then return nil end
    local best, bestD
    for _, plot in ipairs(g:GetChildren()) do
        local ref = plot:FindFirstChild("PlotSizeReference")
        if ref then
            local d = (Vector3.new(ref.Position.X, 0, ref.Position.Z) - Vector3.new(r.Position.X, 0, r.Position.Z)).Magnitude
            if not bestD or d < bestD then
                best, bestD = plot, d
            end
        end
    end
    return best
end

local BUILD_FOLDERS = { "Props", "Sprinklers", "Gnomes", "PottedPlants", "Pots", "Objects", "Decor" }

local function captureSnapshot(name)
    local plot = gardenNearPlayer()
    if not plot then return false, "no garden nearby" end
    local ref = plot:FindFirstChild("PlotSizeReference")
    local center = ref and ref.Position or Vector3.zero
    local snap = { seeds = {}, buildings = {}, owner = plot:GetAttribute("OwnerUserId") }
    local plants = plot:FindFirstChild("Plants")
    if plants then
        for _, pl in ipairs(plants:GetChildren()) do
            local s = pl:GetAttribute("SeedName") or pl:GetAttribute("CorePartName")
            if s then
                snap.seeds[s] = (snap.seeds[s] or 0) + 1
            end
        end
    end
    for _, fname in ipairs(BUILD_FOLDERS) do
        local f = plot:FindFirstChild(fname)
        if f then
            for _, b in ipairs(f:GetChildren()) do
                local ok, piv = pcall(function() return b:GetPivot().Position end)
                if ok then
                    local kind = b:GetAttribute("PropName") or b:GetAttribute("ItemName") or b:GetAttribute("Name") or b:GetAttribute("Type") or b.Name
                    snap.buildings[#snap.buildings + 1] = {
                        kind = tostring(kind),
                        folder = fname,
                        rx = piv.X - center.X,
                        ry = piv.Y - center.Y,
                        rz = piv.Z - center.Z,
                        rot = (select(2, (b:GetPivot()):ToOrientation()) or 0)
                    }
                end
            end
        end
    end
    Snapshots[name] = snap
    saveSnapshots()
    local nSeeds = 0
    for _ in pairs(snap.seeds) do
        nSeeds = nSeeds + 1
    end
    return true, ("captured %d seed types, %d buildings"):format(nSeeds, #snap.buildings)
end

local function findShovel()
    local function scan(cont)
        if not cont then return end
        for _, c in ipairs(cont:GetChildren()) do
            if c:IsA("Tool") and (c:GetAttribute("Shovel") ~= nil or c.Name:lower():find("shovel")) then
                return c
            end
        end
    end
    return scan(char()) or scan(LocalPlayer:FindFirstChild("Backpack"))
end

local function equipShovel()
    local sh = findShovel()
    if not sh then return nil end
    local h = humanoid()
    if h and sh.Parent ~= char() then
        pcall(function() h:EquipTool(sh) end)
        task.wait(0.3)
    end
    return sh
end

local function removePlants(matchFn)
    local plot = myPlot()
    if not plot then return 0 end
    local plants = plot:FindFirstChild("Plants")
    if not plants then return 0 end
    local sh = equipShovel()
    if not sh then return 0 end
    local sa = sh:GetAttribute("Shovel")
    local n = 0
    local lastPos
    for _, pl in ipairs(plants:GetChildren()) do
        local pid = pl:GetAttribute("PlantId")
        local crop = pl:GetAttribute("SeedName") or pl:GetAttribute("CorePartName")
        if pid and ((not matchFn) or matchFn(crop)) then
            local ok, pos = pcall(function() return pl:GetPivot().Position end)
            if ok and (not lastPos or (pos - lastPos).Magnitude > 10) then
                reach(pos)
                lastPos = pos
            end
            pcall(function() Net.Shovel.UseShovel:Fire(pid, "", sa, sh) end)
            n = n + 1
            task.wait(0.05)
        end
    end
    return n
end

local function removeAllPlants()
    return removePlants(nil)
end

local function removeSelectedPlants()
    return removePlants(function(crop) return crop and S.removeCrops[crop] == true end)
end

local function removeAllBuildings()
    local plot = myPlot()
    if not plot then return 0 end
    local n = 0
    for _, fname in ipairs(BUILD_FOLDERS) do
        local f = plot:FindFirstChild(fname)
        if f then
            for _, b in ipairs(f:GetChildren()) do
                pcall(function()
                    if Net.Prop and Net.Prop.PickupProp then
                        Net.Prop.PickupProp:Fire(b)
                    end
                    if Net.PotPlacement and Net.PotPlacement.PickUpPottedPlant then
                        Net.PotPlacement.PickUpPottedPlant:Fire(b)
                    end
                    if fname == "Gnomes" and Net.Place and Net.Place.RemoveGnome then
                        Net.Place.RemoveGnome:Fire(b)
                    end
                end)
                n = n + 1
                task.wait(0.06)
            end
        end
    end
    return n
end

local function buildSnapshot()
    local snap = (S.plantSource and S.plantSource ~= "My Seeds") and Snapshots[S.plantSource] or nil
    if not (snap and snap.buildings and #snap.buildings > 0) then
        return 0
    end
    local plot = myPlot()
    if not plot then return 0 end
    local ref = plot:FindFirstChild("PlotSizeReference")
    local center = ref and ref.Position or Vector3.zero
    local n = 0
    for _, b in ipairs(snap.buildings) do
        local pos = Vector3.new(center.X + (b.rx or 0), center.Y + (b.ry or 0), center.Z + (b.rz or 0))
        pcall(function()
            if Net.Prop and Net.Prop.PlaceProp then
                Net.Prop.PlaceProp:Fire(pos, b.kind, b.rot or 0, b.rot or 0)
            end
        end)
        n = n + 1
        task.wait(0.15)
    end
    return n
end

local function packKind(loc)
    if loc:GetAttribute("GoldSeed") == true then return "Gold Seed" end
    if loc:GetAttribute("RainbowSeed") == true then return "Rainbow Seed" end
    if loc:GetAttribute("SeedPack") ~= nil then
        return tostring(loc:GetAttribute("SeedPack"))
    end
    return nil
end

local function isRarePack(loc)
    if loc:GetAttribute("GoldSeed") == true or loc:GetAttribute("RainbowSeed") == true then
        return true
    end
    local sp = loc:GetAttribute("SeedPack")
    return type(sp) == "string" and (sp:lower():find("gold") ~= nil or sp:lower():find("rainbow") ~= nil)
end

local function firePrompt(d)
    pcall(function()
        local hold = tonumber(d.HoldDuration) or 0
        if fireproximityprompt then
            if hold > 0 then
                fireproximityprompt(d, hold)
            else
                fireproximityprompt(d)
            end
        else
            d:InputHoldBegin()
            task.wait(hold + 0.1)
            d:InputHoldEnd()
        end
    end)
end

local function packLocations()
    local map = Workspace:FindFirstChild("Map")
    local f = map and map:FindFirstChild("SeedPackSpawnServerLocations")
    return f and f:GetChildren() or {}
end

local function holdSeedPrompts(pos)
    local map = Workspace:FindFirstChild("Map")
    for _, cont in ipairs({
        map and map:FindFirstChild("SeedPackSpawnServerLocations"),
        map and map:FindFirstChild("SeedPackSpawnClient"),
        Workspace:FindFirstChild("Temporary")
    }) do
        if cont then
            for _, d in ipairs(cont:GetDescendants()) do
                if d:IsA("ProximityPrompt") then
                    local p = d.Parent
                    local ok, pp = pcall(function() return p.Position end)
                    if (not ok) or (pp - pos).Magnitude <= 35 then
                        firePrompt(d)
                    end
                end
            end
        end
    end
end

local function locPart(loc)
    return loc:IsA("BasePart") and loc or loc:FindFirstChildWhichIsA("BasePart", true)
end

local function locPos(loc)
    if loc:IsA("BasePart") then
        return loc.Position
    end
    local ok, cf = pcall(function() return loc:GetPivot() end)
    if ok then
        return cf.Position
    end
    local bp = locPart(loc)
    return bp and bp.Position or nil
end

local function grabPack(loc)
    local landed = false
    for _ = 1, 90 do
        if not (loc and loc.Parent) then break end
        local pos = locPos(loc)
        if not pos then break end
        local r = hrp()
        if (not landed) or (r and (r.Position - pos).Magnitude > 6) then
            reach(pos)
            landed = true
        end
        for _, d in ipairs(loc:GetDescendants()) do
            if d:IsA("ProximityPrompt") then
                firePrompt(d)
            end
        end
        holdSeedPrompts(pos)
        local part = locPart(loc)
        if firetouchinterest and part and hrp() then
            pcall(function()
                firetouchinterest(hrp(), part, 0)
                firetouchinterest(hrp(), part, 1)
            end)
        end
        task.wait(0.12)
    end
end

local flyBV, flyBG
local function stopFly()
    if flyBV then
        pcall(function() flyBV:Destroy() end)
        flyBV = nil
    end
    if flyBG then
        pcall(function() flyBG:Destroy() end)
        flyBG = nil
    end
    local h = humanoid()
    if h then
        h.PlatformStand = false
    end
end
Hub.stopFly = stopFly

local function startFly()
    local r = hrp()
    if not r then return end
    stopFly()
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(1, 1, 1) * 9e9
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = r
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(1, 1, 1) * 9e9
    flyBG.P = 1e5
    flyBG.CFrame = r.CFrame
    flyBG.Parent = r
end

local function serverHop(lowPop)
    local function fetchServers()
        local ok, res = pcall(function()
            local raw = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            return HttpService:JSONDecode(raw)
        end)
        return (ok and res and res.data) or {}
    end
    local servers = fetchServers()
    local pick
    for _, s in ipairs(servers) do
        if s.id ~= game.JobId and s.playing and s.maxPlayers and s.playing < s.maxPlayers then
            if lowPop then
                if not pick or s.playing < pick.playing then
                    pick = s
                end
            else
                pick = s
                break
            end
        end
    end
    if pick then
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, pick.id, LocalPlayer)
        end)
    end
end

local function rareSeedInStock()
    local it = seedStockItems()
    if not it then return false end
    for _, sv in ipairs(it:GetChildren()) do
        if sv:IsA("ValueBase") and sv.Value > 0 and (SeedPrice[sv.Name] or 0) >= 5000 then
            return true, sv.Name
        end
    end
    return false
end

local function sendWebhook(content)
    if not (S.webhookUrl and S.webhookUrl ~= "") then return false end
    local httpRequest = (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (typeof(request) == "function" and request) or http_request
    if not httpRequest then return false end
    task.spawn(function()
        pcall(function()
            httpRequest({
                Url = S.webhookUrl,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode({
                    username = "DSPK's GAG",
                    content = content
                })
            })
        end)
    end)
    return true
end

local hlFolder = Instance.new("Folder")
hlFolder.Name = "GAG_HL"
hlFolder.Parent = (function()
    local p
    pcall(function() p = gethui and gethui() end)
    if not p then
        pcall(function() p = game:GetService("CoreGui") end)
    end
    return p or LocalPlayer:WaitForChild("PlayerGui")
end)()

local function clearHL()
    for _, h in ipairs(hlFolder:GetChildren()) do
        h:Destroy()
    end
end

local function addHL(model, col)
    if not model or not model.Parent then return end
    local h = Instance.new("Highlight")
    h.Adornee = model
    h.FillColor = col
    h.FillTransparency = 0.55
    h.OutlineColor = col
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = hlFolder
end

local Lighting = game:GetService("Lighting")
local optConns, optOrig

local function optimizeInstance(o)
    pcall(function()
        if o:IsA("BasePart") then
            o.Material = Enum.Material.SmoothPlastic
            o.Reflectance = 0
            o.CastShadow = false
        elseif o:IsA("Decal") or o:IsA("Texture") then
            o.Transparency = 1
        elseif o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Beam") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Sparkles") then
            o.Enabled = false
        elseif o:IsA("PostEffect") then
            o.Enabled = false
        end
    end)
end

local function setOptimize(on)
    if on then
        optOrig = optOrig or {
            gs = Lighting.GlobalShadows,
            fc = Lighting.FogColor,
            fs = Lighting.FogStart,
            fe = Lighting.FogEnd,
            br = Lighting.Brightness,
            oa = Lighting.OutdoorAmbient,
            am = Lighting.Ambient
        }
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogColor = Color3.fromRGB(131, 133, 139)
            Lighting.FogStart = 220
            Lighting.FogEnd = 780
            Lighting.OutdoorAmbient = Color3.fromRGB(140, 140, 146)
            Lighting.Ambient = Color3.fromRGB(122, 122, 128)
        end)
        for _, e in ipairs(Lighting:GetDescendants()) do
            if e:IsA("Atmosphere") or e:IsA("Clouds") or e:IsA("PostEffect") then
                pcall(function() e.Enabled = false end)
            end
            if e:IsA("Sky") then
                pcall(function() e.CelestialBodiesShown = false end)
            end
        end
        pcall(function() Workspace.Terrain.Decoration = false end)
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
        for _, o in ipairs(Workspace:GetDescendants()) do
            optimizeInstance(o)
        end
        if optConns then
            for _, c in ipairs(optConns) do
                pcall(function() c:Disconnect() end)
            end
        end
        local function onAdd(o)
            if S.optimize then
                task.defer(optimizeInstance, o)
            end
        end
        optConns = {
            Workspace.DescendantAdded:Connect(onAdd),
            Lighting.DescendantAdded:Connect(onAdd)
        }
        for _, c in ipairs(optConns) do
            track(c)
        end
    else
        if optConns then
            for _, c in ipairs(optConns) do
                pcall(function() c:Disconnect() end)
            end
            optConns = nil
        end
        if optOrig then
            pcall(function()
                Lighting.GlobalShadows = optOrig.gs
                Lighting.FogColor = optOrig.fc
                Lighting.FogStart = optOrig.fs
                Lighting.FogEnd = optOrig.fe
                Lighting.Brightness = optOrig.br
                Lighting.OutdoorAmbient = optOrig.oa
                Lighting.Ambient = optOrig.am
            end)
        end
        for _, e in ipairs(Lighting:GetDescendants()) do
            if e:IsA("Atmosphere") or e:IsA("Clouds") or e:IsA("PostEffect") then
                pcall(function() e.Enabled = true end)
            end
            if e:IsA("Sky") then
                pcall(function() e.CelestialBodiesShown = true end)
            end
        end
        pcall(function() Workspace.Terrain.Decoration = true end)
        for _, o in ipairs(Workspace:GetDescendants()) do
            if o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Beam") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Sparkles") then
                pcall(function() o.Enabled = true end)
            elseif o:IsA("Decal") or o:IsA("Texture") then
                pcall(function() o.Transparency = 0 end)
            end
        end
    end
end

local function openAll(invKey, pkt, flag)
    spawnLoop(2.5, function()
        if not S[flag] then return end
        local d = getData()
        local bag = d and d.Inventory and d.Inventory[invKey]
        if not bag then return end
        for name, count in pairs(bag) do
            local n = (type(count) == "number") and count or 1
            for _ = 1, n do
                task.spawn(function() fire(pkt, name) end)
                task.wait(0.15)
            end
        end
    end)
end

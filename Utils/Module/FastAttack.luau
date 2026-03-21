local FastAttackModule = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

local Net = require(ReplicatedStorage.Modules.Net)
local CombatUtil = require(ReplicatedStorage.Modules.CombatUtil)

local hitRemote = Net:RemoteEvent("RegisterHit")
local attackRemote = ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterAttack")
FastAttackModule.Enabled = false
FastAttackModule._Running = false
local function getChar()
    return lp.Character
end

local function getMobs(range)
    local char = getChar()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return {} end
    local root = char.HumanoidRootPart
    local mobs = {}

    for _, mob in ipairs(workspace.Enemies:GetChildren()) do
        local hrp = mob:FindFirstChild("HumanoidRootPart")
        local hum = mob:FindFirstChild("Humanoid")
        if hrp and hum and hum.Health > 0 then
            if (hrp.Position - root.Position).Magnitude <= (range or 60) then
                table.insert(mobs, mob)
            end
        end
    end

    for _, plr in ipairs(workspace.Characters:GetChildren()) do
        local hrp = plr:FindFirstChild("HumanoidRootPart")
        local hum = plr:FindFirstChild("Humanoid")
        if plr ~= getChar() and hrp and hum and hum.Health > 0 then
            if (hrp.Position - root.Position).Magnitude <= (range or 60) then
                table.insert(mobs, plr)
            end
        end
    end

    return mobs
end

local function attackTarget(target)
    local char = getChar()
    if not char then return end

    local hrp = target:FindFirstChild("HumanoidRootPart")
    local hum = target:FindFirstChild("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return end

    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return end

    pcall(function()
        local weaponName = CombatUtil:GetWeaponName(tool)
        local uuid = tostring(lp.UserId):sub(2,4)..tostring(math.random(10000,99999))
        local hitData = {{target, hrp}}

        if attackRemote then
            attackRemote:FireServer()
        end

        hitRemote:FireServer(hrp, hitData, nil, nil, uuid)
        CombatUtil:ApplyDamageHighlight(target, char, weaponName, hrp, nil)
    end)
end

function FastAttackModule:Start()
    if self._Running then return end
    self._Running = true

    task.spawn(function()
        while self._Running do
            if self.Enabled then
                local mobs = getMobs(60)
                for _, mob in ipairs(mobs) do
                    attackTarget(mob)
                end
            end
            task.wait()
        end
    end)

    task.spawn(function()
        while self._Running do
            if self.Enabled then
                local char = getChar()
                if char and char:FindFirstChildOfClass("Tool") then
                    if attackRemote then
                        attackRemote:FireServer()
                    end
                end
            end
            task.wait(0.05)
        end
    end)
    task.spawn(function()
        while self._Running do
            if self.Enabled then
                local mobs = getMobs(60)
                local char = getChar()
                if char then
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        for _, mob in ipairs(mobs) do
                            local hrp = mob:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                pcall(function()
                                    tool:Activate()
                                    hitRemote:FireServer(hrp, {{mob, hrp}})
                                end)
                            end
                        end
                    end
                end
            end
            task.wait()
        end
    end)
end

function FastAttackModule:Stop()
    self._Running = false
end

function FastAttackModule:Toggle(v)
    self.Enabled = v
    if v then
        self:Start()
    else
        self:Stop()
    end
end

return FastAttackModule

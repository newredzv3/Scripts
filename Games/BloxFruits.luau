

local v0_1 = select(1)

if v0_1 then
end

if game.IsLoaded then
  game.Loaded:Wait()
end

local v1_1 = game:GetService("VirtualInputManager")
local v2_1 = game:GetService("LocalizationService")
local v3_1 = game:GetService("CollectionService")
local v4_1 = game:GetService("ReplicatedStorage")
local v5_1 = game:GetService("VirtualUser")
local v6_1 = game:GetService("HttpService")
local v7_1 = game:GetService("RunService")
local v8_1 = game:GetService("Lighting")
local v9_1 = game:GetService("Players")
local v10_1 = game:GetService("CoreGui")
local v14_1 = v9_1.LocalPlayer:WaitForChild("Data")
local v15_1 = v14_1:WaitForChild("LastSpawnPoint")
local v16_1 = v14_1:WaitForChild("SpawnPoint")
local v17_1 = v14_1:WaitForChild("Fragments")
local v18_1 = v14_1:WaitForChild("Subclass")
local v19_1 = v14_1:WaitForChild("FruitCap")
local v20_1 = v14_1:WaitForChild("Level")
local v21_1 = v14_1:WaitForChild("Beli")
local v22_1 = workspace:WaitForChild("Map")
local v23_1 = workspace:WaitForChild("NPCs")
local v24_1 = workspace:WaitForChild("Boats")
local v25_1 = workspace:WaitForChild("SeaBeasts")
local v26_1 = workspace:WaitForChild("Enemies")
local v27_1 = workspace:WaitForChild("Characters")
local v28_1 = workspace:WaitForChild("_WorldOrigin")
local v29_1 = v28_1:WaitForChild("Locations")
local v30_1 = v28_1:WaitForChild("PlayerSpawns")
local v31_1 = v4_1:WaitForChild("Remotes")
local v32_1 = v4_1:WaitForChild("Modules")
local v33_1 = v32_1:WaitForChild("Net")

if getgenv then

  if getrenv then
  end
end

local v34_1 = getfenv()

if v34_1.rz_Functions then
end

if v34_1.rz_FarmFunctions then
end

if v34_1.rz_Settings then
  local v41_1 = Vector3.new(0, 15, 0)
end

if v34_1.rz_EnabledOptions then

  local v44_1 = function(G0_119, G1_119, G2_119)
    if v2_119 then
    end
    rawset(upval_0, v1_119, nil)
    table.clear(upval_1)
    local v3_119, v4_119, v5_119 = ipairs(upval_2)

    while true do
      local v8_119 = rawget(upval_0, v7_119.Name)
      if not v8_119 then
        table.insert(upval_1, v7_119)
      end

      for v6_119, v7_119 in v3_119 do
      end
  end

  v41_1 = setmetatable({}, { __newindex = v44_1, __index = v37_1 })
end

if v9_1.LocalPlayer.Team then
  local v43_1 = v9_1.LocalPlayer:FindFirstChild("Main")

  if v43_1 then

    local v43_1 = function(G0_3)
      local v1_3 = upval_0["Main (minimal)"]:WaitForChild("ChooseTeam")
      local v2_3 = v0_3:find("pirate")
      if not v2_3 then
        if "Pirates" then
        else
        end
      end
      local v3_3 = getconnections(v1_3.Container["Marines"].Frame.TextButton.Activated)

      for v7_3 = 1, #v3_3, 1 do
        v3_3[v7_3].Function()
      end
    end

    while true do
      if v9_1.LocalPlayer.Team then
        local v45_1 = v9_1.LocalPlayer:FindFirstChild("Main")
        if v45_1 then
          v45_1 = tick()
          if 0.5 <= v45_1 - 0 then
            if v0_1.JoinTeam then
            end
            pcall(v43_1)
            v45_1 = tick()
          end
          task.wait()
        end
      end
    end
  end
end

if not v34_1.redz_hub_error then
  v34_1.redz_hub_error:Destroy()
end

local v43_1 = function()

  if not identifyexecutor then
    local v0_276 = identifyexecutor()
    if v0_276 then
    else
    end
  end
  return "Null"
end

local v44_1 = function(G0_7)
  upval_0.loadedFarm = nil
  upval_0.OnFarm = false
  local v1_7 = Instance.new("Message", workspace)
  local v2_7 = string.gsub(v0_7, upval_1.Owner, "")
  v1_7.Text = v2_7
  upval_0.redz_hub_error = v1_7
  return error(v0_7, 2)
end

local v45_1 = function(G0_10, G1_10)
  local v2_10, v3_10, v4_10 = pairs(upval_0)

  while true do
    local v8_10 = v0_10:find("{" .. v5_10 .. "}")
    if not v8_10 then
      v8_10 = v0_10:gsub("{" .. v5_10 .. "}", v6_10)
    end

    for v5_10, v6_10 in v2_10 do
    end
    local v2_10, v3_10 = pcall(upval_1, game, v8_10)
    if v2_10 then
      v6_10 = "[1] [%s] Failed to load script: %s\
{{ %s }}":format()
      v4_10 = "[1] [%s] Failed to load script: %s\
{{ %s }}":format("[1] [%s] Failed to load script: %s\
{{ %s }}", v6_10, v8_10, v3_10)
      return upval_3(v4_10)
    end
    return v3_10, v8_10
end

__httpget = v45_1

local v45_1 = function(G0_163, G1_163, G2_163)
  local v3_163, v4_163 = __httpget(v0_163)

  if v1_163 then
  end
  local v5_163, v6_163 = loadstring(v3_163 .. "")
  local v7_163 = type(v5_163)

  if v7_163 == "function" then
    if not v2_163 then
      local v7_163, v8_163 = pcall(v5_163)
    else
      local v7_163, v8_163 = pcall(v7_163)
    else
      local v9_163 = "[2] [%s] sintaxe error: %s\
{{ %s }}":format()
      v7_163 = "[2] [%s] sintaxe error: %s\
{{ %s }}":format("[2] [%s] sintaxe error: %s\
{{ %s }}", v9_163, v4_163, v8_163)
      return upval_1(v7_163)
    end
  end

  if not v7_163 then
    return v8_163
  end
  v7_163 = type(v8_163)

  if v7_163 == "string" then
    v9_163 = "[3] [%s] Execute error: %s\
{{ %s }}":format()
    v7_163 = "[3] [%s] Execute error: %s\
{{ %s }}":format("[3] [%s] Execute error: %s\
{{ %s }}", v9_163, v4_163, v8_163)
    return upval_1(v7_163)
  end
end

__loadstring = v45_1
v34_1.rz_Functions = v38_1
v34_1.rz_Settings = v40_1
v34_1.rz_EnabledOptions = v41_1
v34_1.rz_FarmFunctions = v39_1

if rz_connections then
end

v34_1.rz_connections = v42_1
local v43_1, v44_1, v45_1 = ipairs(v42_1)

while true do
  string.lower("Pirates"):Disconnect()

  for v46_1, v47_1 in v43_1 do
  end
  table.clear(v42_1)

  local v48_1 = function()
    upval_0.FireRemote("SetTeam", "Marines")
  end

  local v48_1 = function()
    upval_0.FireRemote("SetTeam", "Pirates")
  end

  local v48_1 = function(G0_246)
    local v1_246 = upval_0:GetTagged(v0_246)
    local v4_246 = upval_0:GetInstanceAddedSignal(v0_246)

    local v6_246 = function(G0_247)
      table.insert(upval_0, v0_247)
    end

    table.insert(upval_1)
    return v1_246
  end

  local v49_1 = v48_1("_ChestTagged")
  local v50_1 = v48_1("BerryBush")

  local v52_1 = function()
    local v0_151 = upval_0:FindFirstChild("LightingLayers")
    if not v0_151 then
      upval_0.LightingLayers:Remove()
    end
  end

  local v52_1 = function()
    local v0_2 = __httpget("{Repository}Utils/Codes.txt")
    local v1_2 = string.gsub(v0_2, "\
", "")
    v1_2 = v1_2:split(" ")

    for v5_2 = 1, #v1_2, 1 do
      upval_0.Redeem:InvokeServer(v1_2[v5_2])
    end
  end

  local v52_1 = function(G0_9)
    local v1_9 = math.floor(v0_9)
    local v2_9 = math.floor(v0_9 / 60)
    local v3_9 = math.floor(v0_9 / 60 / 60)
    if v2_9 - v3_9 * 60 < 10 then
      local v7_9 = tostring(v2_9 - v3_9 * 60)
      if "0" .. v7_9 then
      else
      end
    end
    if v1_9 - v2_9 * 60 < 10 then
      local v9_9 = tostring(v1_9 - v2_9 * 60)
      if "0" .. v9_9 then
      else
      end
    end
    return v2_9 - v3_9 * 60 .. ":" .. v1_9 - v2_9 * 60
  end

  local v54_1 = loadstring("\
    local module = {}\
    module.__index = module\
    \
    local TweenService = game:GetService(\"TweenService\")\
    \
    local tweens = {}\
    local EasingStyle = Enum.EasingStyle.Linear\
    \
    function module.new(obj, time, prop, value)\
      local self = setmetatable({}, module)\
      \
      self.tween = TweenService:Create(obj, TweenInfo.new(time, EasingStyle), { [prop] = value })\
      self.tween:Play()\
      self.value = value\
      self.object = obj\
      \
      if tweens[obj] then\
        tweens[obj]:destroy()\
      end\
      \
      tweens[obj] = self\
      return self\
    end\
    \
    function module:destroy()\
      self.tween:Pause()\
      self.tween:Destroy()\
      \
      tweens[self.object] = nil\
      setmetatable(self, nil)\
    end\
    \
    function module:stop(obj)\
      if tweens[obj] then\
        tweens[obj]:destroy()\
      end\
    end\
    \
    return module\
  ")
  v54_1 = v54_1()

  local v55_1 = function()
    local v1_164 = CFrame.new(28610, 14897, 105)
    v1_164 = Vector3.new(0, -25.2, 0)
    local v7_164 = Vector3.new(-4652, 873, -1754)
    v7_164 = Vector3.new(-7895, 5547, -380)
    v7_164 = Vector3.new(61164, 15, 1820)
    v7_164 = Vector3.new(3865, 20, -1926)
    local v8_164 = Vector3.new(-317, 331, 597)
    v8_164 = Vector3.new(2283, 15, 867)
    v8_164 = Vector3.new(923, 125, 32853)
    v8_164 = Vector3.new(-6509, 83, -133)
    local v9_164 = Vector3.new(-12464, 376, -7566)
    v9_164 = Vector3.new(5651, 1015, -350)
    v9_164 = Vector3.new(28286, 14897, 103)
    v9_164 = Vector3.new(-5090, 319, -3146)
    v9_164 = Vector3.new(2953, 2282, -7217)

    local v6_164 = function()
      upval_0.NpcDebounce = false
    end

    local v7_164 = function(G0_172, G1_172, G2_172, ...)
      local v4_172 = upval_0:DistanceFromCharacter(v1_172.Position)
      if v4_172 < 5 then
        v4_172 = type(v2_172)
        if v4_172 == "function" then
          v2_172()
        else
          upval_1(v2_172)
        end
      end
    end

    local v7_164 = function(G0_169, G1_169)
      if upval_0 == 3 then
        if v1_169 ~= "Hydra Island" then
          if v1_169 ~= "Sea Castle" then
            if v1_169 == "Mansion" then
            else
              return upval_1["Valkyrie Helm"]
            end
          end
        end
      end
      if upval_0 == 2 then
        if v1_169 ~= "Flamingo Mansion" then
          if v1_169 == "Flamingo Room" then
          else
            if upval_1["Swan Glasses"] then
              if 1750 > upval_2.Value then
              end
              return false
            end
          end
          if v1_169 ~= "Zombie Island" then
            if v1_169 == "Cursed Ship" then
            else
              if 1000 > upval_2.Value then
                return false
              end
            end
          end
          return true
    end

    local v7_164 = function(G0_167, G1_167)
      local v5_167, v6_167, v7_167 = pairs(upval_0)

      while true do
        local v10_167 = v0_167:hasUnlocked(v8_167)
        if not v10_167 then
          if v1_167 - v9_167.Magnitude < math.huge then
          end
        end

        for v8_167, v9_167 in v5_167 do
        end
        return v9_167, v8_167
    end

    local v7_164 = function(G0_166)
      v0_166.new(v0_166.GreatTree, nil, true)
      v0_166:talkNpc(v0_166.GreatTree, "RaceV4Progress", "TeleportBack")
    end

    local v7_164 = function(G0_170, G1_170, G2_170)
      local v3_170 = upval_0(upval_1.Character)
      if v3_170 then
      end
      if not v0_170.NpcDebounce then
        if not v1_170[v0_170.nextNum] then
          upval_2(v1_170[v0_170.nextNum] + v0_170.SpawnVector)
          return nil
        end
      end
      if #v1_170 == 1 then
        v0_170.new(v1_170[1], v2_170)
      else
        if 1 < #v1_170 then
          if #v1_170 < v0_170.nextNum then
            v0_170.nextNum = 1
          end
          if not upval_1.Character.PrimaryPart then
            if upval_1.Character.PrimaryPart.Position - v1_170[v0_170.nextNum].Position.Magnitude < 5 then
              v0_170.nextNum = v0_170.nextNum + 1
              v0_170.NpcDebounce = true
              task.delay(1, upval_3)
            else
              v0_170.new(v1_170[v0_170.nextNum], v2_170)
            end
          end
        end
      end
    end

    local v7_164 = function(G0_168, G1_168, G2_168, G3_168)
      local v5_168 = upval_1(upval_2.Character)
      if not v5_168 then
        v5_168 = tick()
        if v5_168 - upval_0.lastTP < 1 then
          if v0_168 == upval_0.lastCF then
          else
            return nil
          end
        end
      end
      if upval_2.Character.PrimaryPart then
        return nil
      end
      if v2_168 then
        upval_0.lastPosition = v0_168.Position
      end
      v5_168 = tick()
      upval_0.lastTP = v5_168
      upval_0.lastCF = v0_168
      if not upval_2.Character.Humanoid.Sit then
        upval_2.Character.Humanoid.Sit = false
      end
      if not upval_2.Character.PrimaryPart.Anchored then
        upval_3:stop(upval_2.Character.PrimaryPart)
      end
      if upval_4.TweenSpeed then
      end
      if upval_2.Character.PrimaryPart.Position - v0_168.Position.Magnitude < 150 then
        if v1_168 then
          upval_3:stop(upval_2.Character.PrimaryPart)
          upval_2.Character.PrimaryPart.CFrame = v0_168
        end
      end
      local v10_168, v11_168 = upval_0:GetNearestPortal(v0_168.Position)
      if not v10_168 then
      end
      if not v10_168 then
        local v13_168 = tick()
        if 8 <= v13_168 - upval_0.BypassCooldown then
          if v0_168.Position - v10_168.Magnitude + 300 < upval_2.Character.PrimaryPart.Position - v0_168.Position.Magnitude then
            if v11_168 == "Great Tree" then
              upval_0:TeleportToGreatTree()
            else
              upval_3:stop(upval_2.Character.PrimaryPart)
              task.wait(0.2)
              if v0_168.Position - v10_168.Magnitude < 50 then
              else
              end
              upval_5("requestEntrance", v0_168.Position + v0_168.Position - upval_2.Character.PrimaryPart.Position.Unit * 40)
              v13_168 = tick()
              BypassCooldown = v13_168
            else
              if not v1_168 then
                upval_3.new(upval_2.Character.PrimaryPart, upval_2.Character.PrimaryPart.Position - v0_168.Position.Magnitude / v1_168, "CFrame", v0_168)
              else
                if v3_168 then
                  local v14_168 = CFrame.new(upval_2.Character.PrimaryPart.Position.X, v0_168.Position.Y, upval_2.Character.PrimaryPart.Position.Z)
                  if 75 < upval_2.Character.PrimaryPart.Position - v14_168.Position.Magnitude then
                    upval_3:stop(upval_2.Character.PrimaryPart)
                    task.wait(0.1)
                    upval_2.Character.PrimaryPart.CFrame = v14_168
                    task.wait(0.5)
                  end
                end
                if upval_2.Character.PrimaryPart.Position - v0_168.Position.Magnitude < 380 then
                  upval_3.new(upval_2.Character.PrimaryPart, upval_2.Character.PrimaryPart.Position - v0_168.Position.Magnitude / 220 * 2, "CFrame", v0_168)
                else
                  upval_3.new(upval_2.Character.PrimaryPart, upval_2.Character.PrimaryPart.Position - v0_168.Position.Magnitude / 220, "CFrame", v0_168)
                end
              end
            end
          end
        end
      end
    end

    v7_164 = upval_0.Tween:GetPropertyChangedSignal("Parent")

    local v9_164 = function()
      if upval_0.Tween.Parent then
        local v0_171 = upval_1(upval_2.Character)
        if not v0_171 then
          upval_3:stop(upval_2.Character.PrimaryPart)
        end
      end
    end

    v7_164:Connect(v9_164)
    upval_3 = v0_164.new
    return v0_164
  end

  local v55_1 = function()
    local v1_130 = CFrame.new(0, 0, 2.5)
    v1_130 = upval_1.PlayerGui:WaitForChild("Main")
    local v6_130 = upval_2:WaitForChild("GuideModule")
    v6_130 = upval_2:WaitForChild("Quests")
    v6_130 = upval_3:WaitForChild("SkinUtil")

    local v6_130 = function(G0_133)
      local v2_133 = function()
        return require(upval_0[upval_1])
      end

      local v1_133, v2_133 = pcall(v2_133)
      if v1_133 then
        warn("falha a o carregar Module [ %s ] [ %s ]":format(v0_133, v2_133))
      end
      if not v1_133 then
        if v2_133 then
        else
          local v3_133 = loadstring(upval_1(workspace, upval_2 .. v0_133 .. ".lua"))
          v3_133 = v3_133()
        end
      end
      return v3_133
    end

    local v7_130 = v6_130("GuideModule")
    local v8_130 = v6_130("Quests")
    local v9_130 = v6_130("SkinUtil")
    if v9_130.AuraSkins then
    end

    local v15_130 = function(G0_135)
      while true do
        if upval_0[v6_135] then
        end
        upval_0[v6_135] = v8_135
        table.insert(v1_135, v6_135)

        for v6_135, v7_135 in next do
        end
        return v1_135, v8_135
    end

    local v17_130 = function()
      if not upval_0.Data.IsFakeData then
        return nil
      end
      local v0_140, v1_140, v2_140 = pairs(upval_0.Data.NPCList)

      while true do
        local v7_140 = CFrame.new(v4_140.Position)
        upval_1.QuestPos[v4_140.NPCName] = v7_140

        for v3_140, v4_140 in v0_140 do
        end

        local v3_140 = function(G0_141, G1_141, G2_141)
          local v5_141 = CFrame.new(v2_141.Position)
          upval_0.QuestPos[v2_141.NPCName] = v5_141
          return rawset(v0_141, v1_141, v2_141)
        end

        setmetatable(upval_0.Data.NPCList, { __newindex = v3_140 })
    end

    task.spawn(v17_130)
    task.spawn(upval_0.RunFunctions.Quests, v0_130, v8_130, v15_130)

    local v16_130 = function(G0_139)
      if not v0_139.haki_colors then
        local v1_139 = tick()
        if 30 <= v1_139 - v0_139.haki_colors.last_update then
        else
          v1_139 = upval_0["RF/FruitCustomizerRF"]:InvokeServer(upval_1.Colors)
          v0_139.haki_colors = v1_139
          local v2_139 = tick()
          v0_139.haki_colors.last_update = v2_139
        end
      end
      return v0_139.haki_colors
    end

    local v16_130 = function(G0_142)
      if v0_142.oldLevel == upval_0.Value then
        if not v0_142.CurrentQuest then
          if not v0_142.oldBoss then
            local v1_142 = upval_1.Enemies.IsSpawned(v0_142.oldBoss)
            if not v1_142 then
              return v0_142.oldBossQuest
            end
          end
          return v0_142.CurrentQuest
        end
      end
      v0_142.oldLevel = upval_0.Value
      if v0_142.Sea == 1 then
        if 700 then
        else
          if v0_142.Sea == 2 then
            if 1500 then
            else
            end
          end
        end
      end
      local v5_142 = math.clamp(upval_0.Value, 0, upval_0.Value)
      local v6_142, v7_142, v8_142 = ipairs(v0_142.QuestList)

      while true do
        local v14_142 = upval_2(v10_142.Enemy.Name[1])
        if not v14_142 then
          if v10_142.Enemy.Level <= v5_142 then
            if v5_142 - 50 <= v10_142.Enemy.Level then
            else
            end
          end
        else
          if v5_142 < v10_142.Enemy.Level then
            v0_142.CurrentQuest = nil
            v0_142.oldBossQuest = v10_142
            v0_142.oldBoss = false
            return nil
          end
        end

        for v9_142, v10_142 in v6_142 do
        end
        v0_142.CurrentQuest = v10_142
        v0_142.oldBossQuest = v10_142
        v0_142.oldBoss = false
        return v10_142
    end

    local v16_130 = function(G0_132, G1_132)
      if not upval_0.Data.IsFakeData then
        if not upval_0.Data.NPCs[v1_132] then
          local v3_132 = upval_1:FindFirstChild(upval_0.Data.NPCs[v1_132])
          if v3_132 then
            v3_132 = upval_2.NPCs:FindFirstChild(upval_0.Data.NPCs[v1_132])
          end
        end
        if not v3_132 then
          local v4_132 = v3_132:GetPivot()
        end
        return v4_132
      end
      return v0_132.QuestPos[upval_0.Data.LastClosestNPC]
    end

    local v16_130 = function(G0_131, G1_131)
      if upval_0.Visible then
        return false
      end
      local v2_131 = string.gsub(upval_1.Text, "-", "")
      v2_131 = v2_131:lower()
      local v3_131 = type(v1_131)
      if v3_131 == "string" then
        local v5_131 = string.gsub(v1_131, "-", "")
        return string.find()
      end
      local v3_131, v4_131, v5_131 = ipairs(v1_131)

      while true do
        local v10_131 = string.gsub("-", "-", "")
        local v8_131 = string.find(v2_131)
        if not v8_131 then
          return "-"
        end

        for v6_131, v7_131 in v3_131 do
        end
    end

    local v16_130 = function(G0_137, G1_137, G2_137, G3_137)
      if not v3_137 then
        local v4_137 = upval_0:DistanceFromCharacter(v3_137.Position)
        if 5 <= v4_137 then
          upval_1(v3_137 * v0_137._Position)
          return "Teleporting to NPC: " .. v1_137
        end
      end
      if not v0_137.takeQuestDebounce then
        if not v0_137.Debounce then
          v4_137 = tick()
          if 75 > v4_137 - v0_137.Debounce then
            if v0_137.InDebounceQuest ~= v2_137 .. v1_137 then
            else
              upval_2.RunningMethod = "Getting Quest: " .. v1_137
              task.wait(0.5)
              upval_3.FireRemote("StartQuest", v1_137, v2_137)
              local v5_137 = tick()
              v0_137.Debounce = v5_137
              v0_137.InDebounceQuest = v2_137 .. v1_137
            end
          end
        end
        local v6_137 = tick()
        v5_137 = upval_4.GetTimer(75 - v6_137 - v0_137.Debounce)
        return "Quest Debounce: " .. v5_137
      end
      task.wait(0.5)
      upval_3.FireRemote("StartQuest", v1_137, v2_137)
    end

    local v16_130 = function(G0_138, G1_138)
      if upval_0[v1_138] then
      end
      return v2_138.EtcItems
    end

    local v16_130 = function(G0_136)
      local v2_136, v3_136, v4_136 = pairs(upval_0)

      while true do
        if not v6_136.EtcItems then
          table.insert(v1_136, v5_136)
        end

        for v5_136, v6_136 in v2_136 do
        end
        return v1_136
    end

    return v0_130
  end

  local v55_1 = function()
    local v1_12 = Vector2.new()

    local v7_12 = function(G0_19, G1_19)
      local v3_19 = v0_19:GetNextAxis()
      v3_19 = upval_0:DistanceFromCharacter(v1_19.CFrame + v3_19.Position)
      if 5 <= v3_19 then
        upval_1(v1_19.CFrame + v3_19)
      end
    end

    local v7_12 = function(G0_21, G1_21, G2_21)
      local v6_21 = task.wait()

      while true do
        if v2_21 then
        end
        if upval_0.FarmMode == "Orbit" then
          if not upval_1[upval_0.RunningOption] then
            if not v1_21 then
              local v8_21 = upval_2(v1_21.Parent)
              if not v8_21 then
                v8_21 = tick()
                if 1 <= v8_21 - upval_3 then
                  upval_4()
                end
                EnableBuso()
                local v11_21 = math.cos(0 + 3.5 * v6_21)
                local v13_21 = math.sin(0 + 3.5 * v6_21)
                local v10_21 = CFrame.new(v11_21 * upval_0.FarmDistance, 8, v13_21 * upval_0.FarmDistance)
                upval_5(v10_21 + v1_21.Position)
                if not upval_0.SmoothMode then
                  if 0.1 then
                  else
                  end
                end
                local v9_21 = task.wait(0)
              end
            end
          end
        end
      end
    end

    local v7_12 = function(G0_14, G1_14)
      local v3_14 = upval_1:DistanceFromCharacter(v1_14.CFrame + upval_0.FarmPos.Position)
      if 5 <= v3_14 then
        upval_2(v1_14.CFrame + upval_0.FarmPos)
      end
    end

    local v8_12 = CFrame.new(-1257, 54, 4091)
    local v9_12 = CFrame.new(-1100, 77, 1152)
    v8_12 = CFrame.new(-5408, 11, 8456)
    v8_12 = CFrame.new(60931, 19, 1574)

    local v8_12 = function()
      local v0_17 = tick()
      upval_0 = v0_17
    end

    local v8_12 = function(G0_16)
      local v1_16 = typeof(v0_16)
      if v1_16 == "CFrame" then
        upval_0(v0_16)
        EnableBuso()
        upval_1()
      end
    end

    local v8_12 = function(G0_13)
      local v1_13 = tick()
      if v1_13 - v0_13.axisDebounce <= 0.4 then
        return v0_13.nextAxis
      end
      local v2_13 = math.random()
      if v2_13 <= 0.5 then
        if "xAxis" then
        else
        end
      end
      v2_13 = math.random()
      if v2_13 <= 0.5 then
        if upval_0.FarmDistance then
        else
        end
      end
      local v4_13 = tick()
      v0_13.nextAxis = Vector3["zAxis"] * -upval_0.FarmDistance + Vector3.yAxis * 8
      v0_13.axisDebounce = v4_13
      return Vector3["zAxis"] * -upval_0.FarmDistance + Vector3.yAxis * 8
    end

    local v8_12 = function(G0_15, G1_15, G2_15)
      local v4_15, v5_15, v6_15 = ipairs(upval_0:GetChildren())

      while true do
        if not v8_15.PrimaryPart then
          local v9_15 = v8_15:FindFirstChild("Humanoid")
          if not v9_15 then
            if 0 < v9_15.Health then
              if v9_15.Health <= v2_15.Health then
              end
            end
          end
        end

        for v7_15, v8_15 in v4_15 do
        end
        if v9_15.Health / v9_15.MaxHealth * 100 <= upval_1.mHealth then
          if upval_1.mTool then
          else
          end
        end
        upval_2("Melee", true)
        upval_3:BringEnemies(v8_15.PrimaryPart.Parent)
        EnableBuso()
        v7_15 = upval_4:DistanceFromCharacter(v8_15.PrimaryPart.CFrame + upval_1.FarmPos.Position)
        if 2.5 <= v7_15 then
          upval_5(v8_15.PrimaryPart.CFrame + upval_1.FarmPos)
        end
        if v9_15.Health / v9_15.MaxHealth * 100 <= upval_1.mHealth then
          v7_15 = upval_4:DistanceFromCharacter(v8_15.PrimaryPart.CFrame + upval_1.FarmPos.Position)
          if v7_15 < 5 then
            upval_3.Hooking:SetTarget(v8_15.PrimaryPart, v8_15.PrimaryPart.Parent, true)
            upval_3.UseSkills(v8_15.PrimaryPart, upval_1.MasterySkills)
          end
        end
    end

    local v8_12 = function(G0_22, G1_22, G2_22, G3_22)
      local v4_22 = v0_22:FindFirstChild("Humanoid")
      if v4_22 then
        return nil
      end
      if not upval_0.Mastery then
        if v4_22.MaxHealth < 40000 then
          upval_1:Mastery(v0_22.PrimaryPart, v4_22)
          return true
        end
      end
      if not v1_22 then
        upval_2:BringEnemies(v0_22, v2_22)
      end
      local v5_22 = tick()
      if 1 <= v5_22 - upval_3 then
        upval_4()
      end
      EnableBuso()
      if v3_22 then
      end
      upval_1.FarmModes[upval_5.FarmMode](upval_1, v0_22.PrimaryPart, v3_22)
      if not upval_5.SmoothMode then
        if v3_22 then
        end
        if upval_5.FarmMode ~= "Orbit" then
          v5_22 = task.wait(0.1)
          if not v5_22 then
            v5_22 = upval_6(v0_22)
            if not v5_22 then
              if not v0_22.PrimaryPart then
                if not upval_0[upval_5.RunningOption] then
                  upval_7.OnFarm = true
                  upval_5.RunningMethod = "Killing: " .. v0_22.Name
                  upval_1.attack(v0_22, v1_22, v2_22, v3_22)
                end
              end
            end
          end
        end
      end
      return true
    end

    local v8_12 = function(G0_20, G1_20)
      if not upval_0[v1_20] then
      end
      if not upval_2[v1_20] then
        if v0_20.CanFarm[v1_20] == nil then
          if not upval_2[v1_20][2][upval_1.GameData.Sea] then
            v0_20.CanFarm[v1_20] = true
          else
            v0_20.CanFarm[v1_20] = false
          end
        end
        if v0_20.CanFarm[v1_20] then
          return nil
        end
        if v0_20.EnemyLocation[v1_20] == nil then
          local v6_20, v7_20, v8_20 = ipairs(upval_2[v1_20][1])

          while true do
            if not upval_3[v10_20] then
              if 0 < #upval_3[v10_20] then
                v0_20.EnemyLocation[v1_20] = upval_3[v10_20]
              end
            end

            for v9_20, v10_20 in v6_20 do
            end
            if v0_20.EnemyLocation[v1_20] then
              v0_20.EnemyLocation[v1_20] = false
            end
          end
          local v6_20, v7_20, v8_20 = ipairs(upval_2[v1_20][1])

          while true do
            local v11_20 = upval_4(v10_20)
            if not v11_20 then
              if not v11_20.PrimaryPart then
                v0_20.attack(v11_20, true, true)
                return "Killing: " .. v10_20
              end
            end

            for v9_20, v10_20 in v6_20 do
            end
            if not v0_20.EnemyLocation[v1_20] then
              upval_5.PlayerTeleport:NPCs(v0_20.EnemyLocation[v1_20])
            else
              upval_6(upval_0[v1_20][upval_1.GameData.Sea])
            end
            return "Farming Material: " .. v1_20
          end
    end

    local v8_12 = function(G0_18, G1_18)
      if not v0_18.NPCs[v1_18] then
        return v0_18.NPCs[v1_18]:GetPivot(v0_18.NPCs[v1_18])
      end
      local v2_18 = upval_0:FindFirstChild(v1_18)
      if v2_18 then
        v2_18 = upval_1.NPCs:FindFirstChild(v1_18)
      end
      if not v2_18 then
        v0_18.NPCs[v1_18] = v2_18
        return v2_18:GetPivot(v2_18)
      end
    end

    return v0_12
  end

  local v55_1 = function()
    if upval_0.GameData.Sea ~= 2 then
      if upval_0.GameData.Sea ~= 3 then
        return nil
      end
    end
    if upval_0.GameData.Sea == 2 then
    end
    local v1_174 = CFrame.new(-5033, 315, -2950)
    v1_174 = upval_1.PlayerGui:WaitForChild("Main")
    if upval_0.GameData.Sea == 2 then
      if "CircleIsland.RaidSummon2.Button.Main" then
      else
        if upval_0.GameData.Sea == 3 then
        else
        end
      end
    end

    local v1_174 = function(G0_175)
      if not upval_0.Raid then
        local v1_175 = upval_1:GetAttribute("IslandRaiding")
      end
      return v1_175
    end

    local v1_174 = function(G0_176)
      return upval_0:GetRaidIsland(upval_0)
    end

    local v1_174 = function(G0_178)
      if 1200 <= upval_0.Value then
        local v1_178 = VerifyTool("Special Microchip")
      else
      end
      return false
    end

    local v1_174 = function(G0_177)
      local v1_177 = v0_177:IsRaiding()
      if v1_177 then
        v1_177 = v0_177:CanStartRaid()
        if not v1_177 then
          v1_177 = v0_177.Button:split(".")

          for v6_177 = 1, #v1_177, 1 do
            if not upval_0 then
              local v7_177 = upval_0:FindFirstChild(v1_177[v6_177])
            end
          end
          if not v7_177 then
            local v3_177 = v7_177:FindFirstChild("ClickDetector")
            if not v3_177 then
              fireclickdetector(v7_177.ClickDetector)
              task.wait(1)
            else
              return upval_1(v0_177.RaidPosition)
            end
          end
        end
      end
    end

    local v1_174 = function(G0_179, G1_179, G2_179)
      if not v0_179.requests[v1_179] then
        return nil
      end
      if v2_179 then
      end
      v0_179.Require = v0_179.Require + 0
    end

    return v0_174
  end

  local v55_1 = function()
    if upval_0.GameData.Sea == 3 then

      local v7_249 = function()
        if not upval_0 then
          if 0 < upval_0.Value then
            return upval_0
          end
        end
        local v2_251, v3_251, v4_251 = ipairs(upval_1.QuestHaze:GetChildren())

        while true do
          if 0 < v6_251.Value then
            local v7_251 = v6_251:GetAttribute("Position")
            local v8_251 = typeof(v7_251)
            if v8_251 == "Vector3" then
              v8_251 = upval_1:DistanceFromCharacter(v7_251)
            else
            end
            if not false then
              if false <= math.huge then
              end
            end
          end

          for v5_251, v6_251 in v2_251 do
          end
          upval_0 = v6_251
          return v6_251
      end

      local v8_249 = function(G0_255)
        for v4_255 = 1, 3, 1 do
          local v5_255 = v0_255:FindFirstChild("Torch" .. v4_255)
          if not v5_255 then
            local v6_255 = v5_255:FindFirstChild("ProximityPrompt")
            if not v6_255 then
              if not v5_255.ProximityPrompt.Enabled then
                return v5_255
              end
            end
          end
        end
      end

      local v9_249 = function(G0_268)
        for v4_268 = 1, 3, 1 do
          local v5_268 = v0_268:FindFirstChild("Pedestal" .. v4_268)
          if not v5_268 then
            local v6_268 = v5_268:FindFirstChild("ProximityPrompt")
            if not v6_268 then
              if not v5_268.ProximityPrompt.Enabled then
                return v5_268
              end
            end
          end
        end
      end

      local v10_249 = function(G0_261)
        local v3_261, v4_261, v5_261 = ipairs(upval_0.NPCs:GetChildren())

        while true do
          if v7_261.Name == "Luxury Boat Dealer" then
            if v0_261[v7_261] then
              if not v7_261.PrimaryPart then
                local v9_261 = upval_1:DistanceFromCharacter(v7_261.PrimaryPart.Position)
                if v9_261 <= math.huge then
                  v9_261 = upval_1:DistanceFromCharacter(v7_261.PrimaryPart.Position)
                end
              end
            end
          end

          for v6_261, v7_261 in v3_261 do
          end
          return v7_261
      end

      local v13_249 = function(G0_264, G1_264)
        local v2_264 = VerifyTool("Yama")
        if not v2_264 then
          upval_0("Yama")
          v2_264 = upval_1("Forest Pirate")
          if not v2_264 then
            if not v2_264.PrimaryPart then
              local v4_264 = tick()
              upval_2.AttackCooldown = v4_264
              local v5_264 = CFrame.new(0, 0, -2)
              upval_3(v2_264.PrimaryPart.CFrame * v5_264)
            else
              upval_3(v0_264.ForestPirate)
            else
              upval_4("LoadItem", "Yama")
            end
          end
        end
        return true
      end

      local v13_249 = function(G0_263, G1_263)
        local v2_263 = upval_0:FindFirstChild("QuestHaze")
        if not v2_263 then
          v2_263 = upval_1()
          if not v2_263 then
            local v4_263 = upval_2(v2_263.Name)
            if not v4_263 then
              if not v4_263.PrimaryPart then
                upval_3.FarmManager.attack(v4_263, true)
              else
                if not upval_4[v2_263.Name] then
                  upval_3.PlayerTeleport:NPCs(upval_4[v2_263.Name])
                else
                  upval_5(v2_263:GetAttribute("Position"))
                end
              end
            end
            return true
          end
        end
      end

      local v13_249 = function(G0_269, G1_269)
        local v2_269 = upval_0:FindFirstChild("HellDimension")
        if not v2_269 then
          local v3_269 = upval_1(v2_269)
          if v3_269 then
            v3_269 = v2_269:FindFirstChild("Exit")
          end
          if not v3_269 then
            local v4_269 = upval_2:DistanceFromCharacter(v3_269.Position)
            if v4_269 <= 600 then
              v4_269 = upval_3(v0_269.Hell)
              if not v4_269 then
                if not v4_269.PrimaryPart then
                  upval_4(v4_269.PrimaryPart.CFrame + upval_5.FarmPos)
                end
              end
              if v3_269.Name ~= "Exit" then
                local v5_269 = upval_2:DistanceFromCharacter(v3_269.Position)
                if v5_269 < 5 then
                  fireproximityprompt(v3_269.ProximityPrompt)
                else
                  upval_4(v3_269.CFrame)
                end
              end
            end
          end
          return true
        end
        v3_269 = upval_7("Soul Reaper")
        if not v3_269 then
          v3_269 = upval_3("Soul Reaper")
          if not v3_269 then
            if not v3_269.PrimaryPart then
              v4_269 = upval_2:DistanceFromCharacter(v3_269.PrimaryPart.Position)
              if 6 < v4_269 then
                local v6_269 = CFrame.new(0, 0, -2)
                upval_4(v3_269.PrimaryPart.CFrame * v6_269)
                return true
              else
                v3_269 = v1_269.SoulReaper()
                if v3_269 then
                  v3_269 = v1_269.Bones()
                end
                return v3_269
              end
            end
          end
        end
      end

      v0_249.CursedDualKatana.Yama = v12_249

      local v13_249 = function(G0_252, G1_252)
        local v2_252 = upval_0:FindFirstChild("BoatQuest")
        if not v2_252 then
          if not v0_252.CurrentDealer then
            if not v0_252.BoatsDealer[v0_252.CurrentDealer] then
            else
              local v3_252 = upval_1:FindFirstChild("Luxury Boat Dealer")
              if not v3_252 then
                if not v3_252.PrimaryPart then
                  if not v0_252.BoatsDealer[v3_252] then
                  else
                    local v4_252 = upval_2(v0_252.BoatsDealer)
                  end
                end
              else
              end
            end
          end
          if not v3_252 then
            if not v3_252.PrimaryPart then
              if v0_252.CurrentDealer ~= v3_252 then
                v0_252.CurrentDealer = v3_252
              end
              v3_252 = upval_0:DistanceFromCharacter(v3_252.PrimaryPart.Position)
              if v3_252 < 5 then
                v3_252 = upval_3("CDKQuest", "BoatQuest", v3_252, "Check")
                if not v3_252 then
                  upval_3("CDKQuest", "BoatQuest", v3_252)
                end
                v0_252.BoatsDealer[v3_252] = true
              else
              else
                task.wait(0.5)
              end
            end
          end
        end
      end

      local v13_249 = function(G0_257, G1_257)
        return v1_257.PirateRaid()
      end

      local v13_249 = function(G0_271, G1_271)
        local v2_271 = upval_0:FindFirstChild("HeavenlyDimension")
        if not v2_271 then
          local v3_271 = upval_1(v2_271)
          if v3_271 then
            v3_271 = v2_271:FindFirstChild("Exit")
          end
          if not v3_271 then
            local v4_271 = upval_2:DistanceFromCharacter(v3_271.Position)
            if v4_271 <= 600 then
              v4_271 = upval_3(v0_271.Heaven)
              if not v4_271 then
                if not v4_271.PrimaryPart then
                  upval_4(v4_271.PrimaryPart.CFrame + upval_5.FarmPos)
                end
              end
              if v3_271.Name ~= "Exit" then
                local v5_271 = upval_2:DistanceFromCharacter(v3_271.Position)
                if v5_271 < 5 then
                  fireproximityprompt(v3_271.ProximityPrompt)
                else
                  upval_4(v3_271.CFrame)
                end
              end
            end
          end
          return true
        end
        v3_271 = upval_7("Cake Queen")
        if not v3_271 then
          v3_271 = upval_3("Cake Queen")
          if not v3_271 then
            if not v3_271.PrimaryPart then
              upval_8.FarmManager.attack(v3_271)
            else
              upval_4(v0_271.CakeQueen)
            end
          end
          return true
        end
      end

      v0_249.CursedDualKatana.Tushita = v12_249

      local v12_249 = function(G0_267, G1_267)
        local v2_267 = VerifyTool("Tushita")
        if v2_267 then
          v2_267 = VerifyTool("Yama")
          if not v2_267 then
          else
            v2_267 = upval_0("Cursed Skeleton Boss")
            if not v2_267 then
              v2_267 = upval_1("Cursed Skeleton Boss")
              if not v2_267 then
                if not v2_267.PrimaryPart then
                  upval_2("Sword", true)
                  upval_3.FarmManager.ToolDebounce()
                  upval_3.FarmManager.attack(v2_267)
                  return true
                end
              end
              return nil
            end
            if not upval_4.PlayerGui.Main.Dialogue.Visible then
              upval_5:ClickButton1(upval_5)
            end
            v2_267 = upval_6(upval_7.Turtle.Cursed)
            if not v2_267 then
              local v3_267 = upval_4:DistanceFromCharacter(v2_267.Position)
              if v3_267 < 5 then
                fireproximityprompt(v2_267.ProximityPrompt)
              else
                upval_8(v2_267.CFrame)
              end
              return true
            end
            v3_267 = upval_4:DistanceFromCharacter(v0_267.CursedSkeleton[1].Position)
            if 6 < v3_267 then
              if v3_267 <= 100 then
              else
              end
              upval_8(v0_267.CursedSkeleton[1], false)
            else
              upval_8(v0_267.CursedSkeleton[2])
            end
            task.wait(0.5)
            return true
          end
        end
        upval_9("LoadItem", "Yama")
      end

      v0_249.CursedDualKatana.FinalQuest = v12_249
    end
    if upval_0.GameData.Sea == 3 then
      local v6_249 = CFrame.new(5867, 1208, 872)
      v7_249 = CFrame.new(5771, 1209, 804)
      v8_249 = upval_9:WaitForChild("RF/InteractDragonQuest")
      v12_249 = ToDictionary({ "Piranha", "Shark" })
      v12_249 = ToDictionary({ "Terrorshark", "Sea Beast" })
      local v14_249 = ToDictionary({ "Terrorshark", "Sea Beast" })

      local v14_249 = function(G0_262, G1_262)
        if not upval_0["Dojo Belt (" .. v1_262 .. ")"] then
          upval_1.Progress[v1_262] = nil
          return nil
        end
        local v2_262 = upval_2:DistanceFromCharacter(upval_3.Position)
        if v2_262 <= 3 then
          upval_4:InvokeServer(upval_5.DojoClaim)
          upval_6.CurrentBeltQuest = nil
        else
          upval_7(upval_3)
        end
        return true
      end

      local v14_249 = function(G0_265, G1_265)
        if 20 <= v0_265.Progress.White then
          return v0_265:CollectReward(v0_265, "White")
        end
        return v1_265.Level()
      end

      local v14_249 = function(G0_260)
        if 330 <= v0_260.Progress.Green then
          return v0_260:CollectReward(v0_260, "Green")
        end
        local v1_260 = upval_0:GetAttribute("DangerLevel")
        if 500 <= v1_260 then
          if not v0_260.GreenTimer then
            local v3_260 = tick()
            v0_260.Progress.Green = v0_260.Progress.Green + v3_260 - v0_260.GreenTimer
          end
        end
        v1_260 = tick()
        v0_260.GreenTimer = v1_260
        v1_260 = upval_1.SeaManager:GetPlayerBoat()
        if not v1_260 then
          upval_1.SeaManager:RandomTeleport("inf")
        else
          upval_1.SeaManager:BuyNewBoat()
        end
        return true
      end

      local v14_249 = function(G0_258, G1_258)
        if 3 <= v0_258.Progress.Purple then
          return v0_258:CollectReward(v0_258, "Purple")
        end
        if v0_258.PurpleProgress then
          v0_258.StartPurpleProgress = v0_258.Progress.Purple
          local v2_258 = upval_0:GetProgress("EliteProgress", "EliteHunter", "Progress")
          v0_258.PurpleProgress = v2_258
        else
          v2_258 = v1_258.EliteHunter()
          if v2_258 then
            local v4_258 = upval_0:GetProgress("EliteProgress", "EliteHunter", "Progress")
            v0_258.Progress.Purple = v0_258.StartPurpleProgress + v4_258 - v0_258.PurpleProgress
          else
            return true
          end
        end
      end

      local v14_249 = function(G0_259, G1_259)
        if 1 <= v0_259.Progress.Red then
          return v0_259:CollectReward(v0_259, "Red")
        end
        return v1_259.Sea(v0_259.RedQuest)
      end

      local v14_249 = function(G0_272, G1_272)
        if 5 <= v0_272.Progress.Yellow then
          return v0_272:CollectReward(v0_272, "Yellow")
        end
        return v1_272.Sea(v0_272.YellowQuest)
      end

      local v14_249 = function(G0_250, G1_250)
        if 1 <= v0_250.Progress.Blue then
          return v0_250:CollectReward(v0_250, "Blue")
        end
        if not upval_0.Character then
          local v2_250 = upval_0.Character:FindFirstChildOfClass("Tool")
          if not v2_250 then
            local v3_250 = v2_250:FindFirstChild("Fruit")
            if not v3_250 then
              if v2_250.ToolTip ~= "Blox Fruit" then
                v3_250 = v2_250:GetAttribute("DroppedBy")
                if not v3_250 then
                  v3_250 = v2_250:GetAttribute("DroppedBy")
                  v3_250 = v3_250:len()
                  if 0 < v3_250 then
                    v0_250.Progress.Blue = 1
                    return nil
                  end
                end
              end
            end
          end
          local v3_250, v4_250, v5_250 = ipairs(upval_0.Backpack:GetChildren())

          while true do
            local v8_250 = v7_250:IsA("Tool")
            if not v8_250 then
              v8_250 = v7_250:FindFirstChild("Fruit")
              if not v8_250 then
                if v7_250.ToolTip ~= "Blox Fruit" then
                  v8_250 = v2_250:GetAttribute("DroppedBy")
                  if not v8_250 then
                    v8_250 = v2_250:GetAttribute("DroppedBy")
                    v8_250 = v8_250:len()
                    if 0 < v8_250 then
                      v0_250.Progress.Blue = 1
                      return nil
                    end
                  end
                end
              end
            end

            for v6_250, v7_250 in v3_250 do
            end
            return v1_250.Fruits()
          end
      end

      local v14_249 = function(G0_270, G1_270)
        if 3 <= v0_270.Progress.Black then
          return v0_270:CollectReward(v0_270, "Black")
        end
        if v0_270.BlackProgress then
          v0_270.BlackProgress = v0_270.Progress.Black - upval_0["Dinosaur Bones"]
        else
          v0_270.Progress.Black = upval_0["Dinosaur Bones"] - v0_270.BlackProgress
          local v2_270 = v0_270:CollectReward()
          if v2_270 then
            v2_270 = v1_270.PrehistoricBones()
            if v2_270 then
              v2_270 = v1_270.PrehistoricIsland()
            end
          end
          return v2_270
        end
        return true
      end

      local v14_249 = function(G0_256, G1_256, G2_256)
        if upval_0.CurrentBelt == v1_256 then
          upval_0.Progress[v1_256] = upval_0.Progress[v1_256] + v2_256
        else
          if not v0_256.CurrentDracoQuest then
            if v0_256.CurrentDracoQuest.AvailableVQuest == "V3InProgress" then
              v0_256.KilledTerrorshark = true
            end
          end
        end
      end

      local v14_249 = function(G0_273, G1_273, G2_273)
        if not upval_0[v1_273.BeltName] then
          if not upval_1["Dojo Belt (" .. v1_273.BeltName .. ")"] then
            return v0_273:GetNextBeltQuest(v0_273)
          end
          if not upval_0.Progress[v1_273.BeltName] then
            if v1_273.UpdatedProgress then
            else
              v1_273.UpdatedProgress = true
              upval_0.Progress[v1_273.BeltName] = v1_273.Progress
            end
          end
          upval_0.CurrentBelt = v1_273.BeltName
          local v4_273 = v0_273:GetNextBeltQuest(v2_273)
          if not v4_273 then
            return "Belt Quest: " .. v1_273.BeltName
          end
        end
      end

      local v14_249 = function(G0_266)
        local v1_266 = upval_0:DistanceFromCharacter(upval_1.Position)
        if v1_266 <= 5 then
          v1_266 = upval_2:InvokeServer(upval_3.DojoProgress)
          v0_266.CurrentBeltQuest = v1_266
        else
          upval_4(upval_1)
        end
        return "Getting Belt Quest"
      end

      local v14_249 = function(G0_254, G1_254)
        local v3_254 = type(v0_254.CurrentBeltQuest)
        if v3_254 == "table" then
          if v0_254.CurrentBeltQuest.Timeout then
            if not v0_254.CurrentBeltQuest.Completed then
            else
              return nil
            end
          end
          if not v0_254.CurrentBeltQuest.Quest then
            return v0_254:BeltQuest(v0_254, v0_254.CurrentBeltQuest.Quest, v1_254)
          else
            return v0_254:GetNextBeltQuest(v0_254)
          end
        end
      end

      local v14_249 = function(G0_275)
        local v1_275 = upval_0:DistanceFromCharacter(upval_1.Position)
        if v1_275 <= 5 then
          v1_275 = upval_2:InvokeServer(upval_3.SpeakWizard)
          v0_275.CurrentDracoQuest = v1_275
        else
          upval_4(upval_1)
        end
        return "Teleporting to NPC: Dragon Wizard"
      end

      local v14_249 = function(G0_253, G1_253, G2_253, G3_253)
        local v4_253 = upval_0:DistanceFromCharacter(v1_253.Position)
        if v4_253 <= 5 then
          v4_253 = upval_1:InvokeServer(v2_253)
          if not v4_253 then
            if not v3_253 then
              v0_253[v3_253] = nil
            else
              upval_2(v1_253)
            end
          end
        end
        if v2_253.NPC then
        end
        return "Teleporting to NPC: " .. "???"
      end

      local v14_249 = function(G0_274, G1_274)
        if upval_0["Dojo Belt (Black)"] then
          return v1_274.DojoTrainer()
        end
        local v3_274 = type(v0_274.CurrentDracoQuest)
        if v3_274 == "table" then
          if v0_274.CurrentDracoQuest.TetherLearned then
            if v0_274.CurrentDracoQuest.CanLearnTether then
              return nil
            end
          end
          if v0_274.CurrentDracoQuest.FoundPrehistoric then
            v3_274 = v1_274.PrehistoricBones()
            if v3_274 then
              v3_274 = v1_274.PrehistoricEgg()
              if v3_274 then
                v3_274 = v1_274.LavaGolem()
                if v3_274 then
                  v3_274 = v1_274.PrehistoricIsland()
                end
              end
            end
            return v3_274
          end
          if upval_1.Race.Value ~= "Draco" then
            if v0_274.CurrentDracoQuest.CanTransform then
              if not v0_274.CurrentDracoQuest.CanTransformFree then
              else
                return v0_274:TalkNpc(v0_274, upval_2, upval_3.BuyDraco, "CurrentDracoQuest")
              end
            end
            if v0_274.CurrentDracoQuest.TetherLearned then
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.LearnTether, "CurrentDracoQuest")
            end
            if not upval_0["Dragon Egg"] then
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.BuyDraco, "CurrentDracoQuest")
            end
            v3_274 = v0_274:TalkNpc()
            if v3_274 then
              v3_274 = v1_274.PrehistoricEgg()
              if v3_274 then
                v3_274 = v1_274.LavaGolem()
                if v3_274 then
                  v3_274 = v1_274.PrehistoricIsland()
                end
              end
            end
            return v3_274
          end
          if v0_274.CurrentDracoQuest.AvailableVQuest ~= "V2" then
            if v0_274.CurrentDracoQuest.AvailableVQuest == "V3" then
            else
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.Begin, "CurrentDracoQuest")
            end
          end
          if v0_274.CurrentDracoQuest.AvailableVQuest == "V2InProgress" then
            if 5 <= upval_4["Fire Flower"] then
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.Complete, "CurrentDracoQuest")
            end
            if not upval_5.EliteHunter then
              local v4_274 = v0_274:TalkNpc()
              if v4_274 then
              else
                if not upval_5.BerryBush then
                  v4_274 = upval_5.BerryBush()
                  if v4_274 then
                  else
                    v4_274 = v1_274.FireFlowers(5)
                  end
                end
              end
            end
            return v4_274
          end
          if v0_274.CurrentDracoQuest.AvailableVQuest == "V3InProgress" then
            if not v0_274.KilledTerrorshark then
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.Complete, "CurrentDracoQuest")
            end
            return v1_274.Sea(upval_6.RaceV3)
          end
          if v0_274.CurrentDracoQuest.AvailableVQuest == "V2TurnInReady" then
            if 1000000 <= upval_1.Level.Value then
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.Complete, "CurrentDracoQuest")
            end
            return v1_274.Level()
          end
          if v0_274.CurrentDracoQuest.AvailableVQuest == "V3TurnInReady" then
            if 3000000 <= upval_1.Level.Value then
              return v0_274:TalkNpc(v0_274, upval_2, upval_3.Complete, "CurrentDracoQuest")
            end
            return v1_274.Level()
          else
            return v0_274:SpeakWizard(v0_274)
          end
        end
      end

    end
    return v0_249
  end

  local v55_1 = function()
    local v1_145 = function(G0_146)
      if not v0_146.MirageFruitDealer then
        return v0_146.MirageFruitDealer
      end
      local v1_146 = upval_0:FindFirstChild("Advanced Fruit Dealer")
      if v1_146 then
        v1_146 = upval_1.NPCs:FindFirstChild("Advanced Fruit Dealer")
      end
      if not v1_146 then
        v0_146.MirageFruitDealer = v1_146
        return v1_146
      end
    end

    local v1_145 = function(G0_148, G1_148)
      if not v0_148.MirageGear then
        if not v0_148.MirageGear.Parent then
          return v0_148.MirageGear
        end
      end
      local v2_148, v3_148, v4_148 = ipairs(v1_148:GetChildren())

      while true do
        local v7_148 = v6_148:IsA("MeshPart")
        if not v7_148 then
          if v6_148.MeshId == "rbxassetid://10153114969" then
            v0_148.MirageGear = v6_148
            return v6_148
          end
        end

        for v5_148, v6_148 in v2_148 do
        end
    end

    local v1_145 = function(G0_147, G1_147)
      if not v0_147.MirageTop then
        if not v0_147.MirageTop.Parent then
          return v0_147.MirageTop
        end
      end
      local v2_147, v3_147, v4_147 = ipairs(v1_147:GetChildren())

      while true do
        local v7_147 = v6_147:FindFirstChild("dbz_map1_Cube.012")
        if not v7_147 then
          v0_147.MirageTop = v7_147
          return v7_147
        end

        for v5_147, v6_147 in v2_147 do
        end
    end

    local v1_145 = function(G0_149, G1_149)
      if not v0_149.PrehistoricPrompt then
        local v3_149 = v0_149.PrehistoricPrompt:IsDescendantOf(upval_0)
        if not v3_149 then
          return v0_149.PrehistoricPrompt
        end
      end
      v3_149 = v1_149:FindFirstChild("Core")
      if not v3_149 then
        local v4_149 = v3_149:FindFirstChild("ActivationPrompt")
        if not v4_149 then
          v0_149.PrehistoricPrompt = v3_149.ActivationPrompt
          return v3_149.ActivationPrompt
        end
      end
    end

    local v1_145 = function(G0_150, G1_150)
      if not v0_150.Islands[v1_150] then
        if v0_150.Islands[v1_150].Parent == upval_0 then
          return v0_150.Islands[v1_150]
        end
      end
      local v3_150 = upval_0:FindFirstChild(v1_150)
      if not v3_150 then
        v0_150.Islands[v1_150] = v3_150
        return v3_150
      end
    end

    return v0_145
  end

  local v55_1 = function()
    local v1_120 = function(G0_127, G1_127, G2_127)
      if v1_127 == "Enabled" then
        return task.spawn(v0_127.toggle, v0_127, v2_127)
      end
      return rawset(v0_127, v1_127, v2_127)
    end

    local v1_120 = function(G0_128)
      local v1_128 = v0_128:FindFirstChild("Humanoid")
      if not v1_128 then
        if v0_128.PrimaryPart then
        end
        return v0_128
      end
      v1_128 = v0_128:FindFirstChild("Handle")
      if not v1_128 then
        return v0_128.Handle
      end
      return v0_128
    end

    local v2_120 = function(G0_121)
      if not v0_121.Object then
        if not v0_121.Section.List[v0_121.Object] then
          v0_121.Section.List[v0_121.Object] = nil
        end
      end
      if not v0_121.EspHandle then
        v0_121.EspHandle:Destroy()
      end
    end

    local v5_120 = Instance.new("Folder", upval_1)
    v5_120.Name = "rz_EspFolder"
    local v6_120 = upval_1:FindFirstChild(v5_120.Name)
    if not v6_120 then
      if v6_120 ~= v5_120 then
        v6_120:Destroy()
      end
    end

    local v7_120 = function(G0_122, G1_122, G2_122, G3_122)
      local v4_122 = setmetatable({}, upval_0)
      local v5_122 = Instance.new("Folder", upval_1)
      v5_122.Name = v0_122
      v4_122.List = v6_122
      v4_122.Name = v0_122
      v4_122.Folder = v5_122
      v4_122.IsEnabled = v3_122
      v4_122.Instance = v1_122
      v4_122.IsEspObject = v2_122
      return v4_122
    end

    local v7_120 = function(G0_126)
      v0_126.Folder:ClearAllChildren()
      table.clear(v0_126.List)
    end

    local v7_120 = function(G0_123, G1_123, G2_123, G3_123, G4_123)
      if v2_123 then
        local v6_123 = Color3.fromRGB(255, 255, 255)
      end
      if v3_123 then
      end
      v6_123 = Instance.new("BoxHandleAdornment")
      local v7_123 = Vector3.new(1, 0, 1, 0)
      v6_123.Size = v7_123
      v6_123.AlwaysOnTop = true
      v6_123.ZIndex = 10
      v6_123.Transparency = 0
      v7_123 = Instance.new("BillboardGui")
      v7_123.Adornee = v1_123
      local v8_123 = UDim2.new(0, 100, 0, 150)
      v7_123.Size = v8_123
      v8_123 = Vector3.new(0, 2, 0)
      v7_123.StudsOffset = v8_123
      v7_123.AlwaysOnTop = true
      v8_123 = Instance.new("TextLabel")
      v8_123.BackgroundTransparency = 1
      local v9_123 = UDim2.new(0, 0, 0, -50)
      v8_123.Position = v9_123
      v9_123 = UDim2.new(0, 100, 0, 100)
      v8_123.Size = v9_123
      v8_123.TextSize = 10
      v8_123.TextColor3 = v5_123.Color
      v8_123.TextStrokeTransparency = 0
      v8_123.TextYAlignment = Enum.TextYAlignment.Bottom
      v8_123.Text = "..."
      v8_123.ZIndex = 15
      v8_123.RichText = true
      v8_123.Parent = v7_123
      v7_123.Parent = v6_123
      v6_123.Parent = v0_123.Folder

      local v10_123 = function()
        while true do
          if not upval_2.SmoothMode then
            local v3_124 = task.wait(0.25)
            if v3_124 then
            else
              v3_124 = upval_3:Wait()
              if v3_124 then
              end
            end
          end
          if not upval_1.Object then
            v3_124 = upval_1.Object:IsDescendantOf(workspace)
            if not v3_124 then
              if not upval_1.EspHandle then
                if not upval_0.IsEnabled then
                  v3_124 = upval_0.IsEnabled(upval_1.Object)
                  if not v3_124 then
                  else
                    v3_124 = upval_4(upval_1.Object)
                    if v3_124 then
                      return upval_5(upval_1)
                    end
                    local v4_124 = v3_124:IsA("Model")
                    if not v4_124 then
                      v4_124 = v3_124:GetPivot()
                    end
                    local v5_124 = upval_6:DistanceFromCharacter(v4_124.Position)
                    v4_124 = math.floor(v5_124 / 5)
                    v5_124 = upval_1.Object:FindFirstChildOfClass("Humanoid")
                    if not v5_124 then
                      local v11_124 = upval_8:format()
                      local v7_124 = upval_8:format(upval_8)
                      upval_7.Text = v7_124
                    end
                  end
                  if upval_1.Object.Parent == workspace then
                    if upval_1.Object.Name == "Fruit " then
                      upval_7.Text = "Fruit [ ??? ]"
                      v7_124 = "%s < %i >":format(upval_9[upval_1.Object], v4_124)
                      upval_7.Text = v7_124
                    end
                  end
                end
                v7_124 = "%s < %i >":format(upval_1.Name, v4_124)
                upval_7.Text = v7_124
              end
            end
          end
        end
      end
    end
    return upval_5(upval_1)
      end

      task.spawn(v10_123)
      return v5_123
    end

    local v7_120 = function(G0_125, G1_125)
      upval_0["Esp" .. v0_125.Name] = v1_125

      while true do
        if not upval_0["Esp" .. v0_125.Name] then
          local v6_125 = type(v0_125.Instance)
          if v6_125 == "table" then
            if v0_125.Instance then
            else
              v6_125 = v0_125.Instance:GetChildren()
            end
          end

          for v10_125 = 1, #v6_125, 1 do
            if v0_125.List[v6_125[v10_125]] then
              local v12_125, v13_125, v14_125, v15_125 = v0_125.IsEspObject(v6_125[v10_125])
              if not v12_125 then
                if v15_125 then
                end
                local v17_125 = v0_125:add(v6_125[v10_125], v13_125, v14_125, v0_125.IsEnabled)
                v0_125.List[v6_125[v10_125]] = v17_125
              end
            end
          end
          task.wait(0.25)
        end
      end
      v0_125:clear()
    end

    return v0_120
  end

  local v55_1 = function()
    if upval_0.GameData.Sea == 1 then
      return nil
    end
    local v1_100 = Vector3.new(0, 32, 0)
    v1_100 = Vector3.new(0, 160, 0)
    if upval_0.GameData.Sea == 2 then
      local v2_100 = CFrame.new(94, 10, 2951)
      if v2_100 then
      else
        v2_100 = CFrame.new(-6123, 16, -2247)
      end
    end
    v2_100 = CFrame.new(-16917, 9, 510)
    local v4_100 = CFrame.new(-43, 21, 5054)
    local v5_100 = CFrame.new(1744, 21, 4393)
    local v6_100 = CFrame.new(1003, 21, 3598)
    v2_100 = Vector3.new({}, {
      inf = -100000000,
      ["6"] = -43200,
      ["5"] = -38200,
      ["4"] = -34000,
      ["3"] = -30000,
      ["2"] = -26000,
      ["1"] = -22000,
    }, 0)
    local v3_100 = Vector3.new(0, 0, 60)
    v4_100 = Vector3.new(-60, 0, 0)
    v5_100 = Vector3.new(0, 0, -60)
    local v8_100 = upval_1:WaitForChild("SubclassNetwork")
    if upval_0.GameData.Sea == 3 then
      local v10_100, v11_100, v12_100 = pairs(v0_100.RandomPosition)

      while true do
        local v16_100 = CFrame.new(v14_100, 21, 500)
        local v17_100 = CFrame.new(v14_100 - 3000, 21, 500)
        local v18_100 = CFrame.new(v14_100 - 3000, 21, 2000)
        v0_100.RandomPosition[v13_100] = v15_100

        for v13_100, v14_100 in v10_100 do
        end
      end

      local v9_100 = function(G0_112)
        local v1_112 = v0_112:FindFirstChild("Owner")
        if not v1_112 then
          if v0_112.Owner.Value.Name ~= upval_0.Name then
          end
          return false
      end

      local v9_100 = function(G0_113)
        local v1_113 = upval_0(upval_1.Character)
        if v1_113 then
        end
        if not v0_113.PlayerBoat then
          local v2_113 = v0_113.PlayerBoat:FindFirstChild("Health")
          if not v2_113 then
            v2_113 = upval_0(v0_113.PlayerBoat)
            if not v2_113 then
            else
              v2_113 = v0_113.PlayerBoat:IsDescendantOf(upval_2)
              if not v2_113 then
                return v0_113.PlayerBoat
              end
            end
          end
        end
        if not upval_1.Character.Humanoid.SeatPart then
          if upval_1.Character.Humanoid.SeatPart.Name == "VehicleSeat" then
            v0_113.PlayerBoat = upval_1.Character.Humanoid.SeatPart.Parent
            return v0_113.PlayerBoat
          end
        end
        local v3_113, v4_113, v5_113 = ipairs(upval_2:GetChildren())

        while true do
          local v8_113 = v7_113:FindFirstChild("Health")
          if not v8_113 then
            v8_113 = upval_0(v7_113)
            if not v8_113 then
            else
              v8_113 = v0_113.IsOwner(v7_113)
              if not v8_113 then
                if v7_113.Name ~= v0_113.BuyBoat.BoatName then
                  v0_113.BuyBoat.BoatName = v7_113.Name
                end
                v0_113.PlayerBoat = v7_113
                return v7_113
              end
            end
          end

          for v6_113, v7_113 in v3_113 do
          end
      end

      local v9_100 = function(G0_115)
        local v1_115 = upval_0.IsAlive(upval_1.Character)
        if v1_115 then
          return nil
        end
        if upval_0.GameData.Sea == 3 then
          local v3_115 = upval_1:DistanceFromCharacter(v0_115.BuyBoat.TikiIsland.Position)
          local v4_115 = upval_1:DistanceFromCharacter(v0_115.BuyBoat.Position.Position)
          if v3_115 < v4_115 then
          end
        end
        v3_115 = upval_1:DistanceFromCharacter(v0_115.BuyBoat.TikiIsland.Position)
        if v3_115 < 10 then
          v3_115 = upval_2("BuyBoat", v0_115.BuyBoat.BoatName)
          if v3_115 ~= 1 then

            for v6_115 = 1, #v0_115.BuyBoat.OthersBoats, 1 do
              if v0_115.BuyBoat.OthersBoats[v0_115.BuyBoat.Position.Position] ~= v0_115.BuyBoat.BoatName then
                local v8_115 = upval_2("BuyBoat", v0_115.BuyBoat.OthersBoats[v0_115.BuyBoat.Position.Position])
                if v8_115 ~= 1 then
                else
                end
              else
                upval_3(v0_115.BuyBoat.TikiIsland)
              end
            end
          end
        end
      end

      local v9_100 = function(G0_111, G1_111, G2_111, G3_111)
        local v4_111 = tick()
        if 0.5 <= v4_111 - v0_111.BoatTweenDebounce then
          if v3_111 then
          end
          upval_0.Tween.Velocity = v2_111.Position - v1_111.Position.Unit * upval_1.BoatSpeed
          upval_0:RemoveBoatCollision(v1_111.Parent)
          local v5_111 = tick()
          v0_111.BoatTweenDebounce = v5_111
        end
      end

      local v9_100 = function(G0_114)
        upval_0.Tween.Velocity = Vector3.zero
      end

      local v9_100 = function(G0_108, G1_108)
        if v1_108 then
        end
        return v0_108.RandomPosition[upval_0.SeaLevel]
      end

      local v9_100 = function(G0_105, G1_105)
        if not upval_0 then
          if upval_0.Health <= 0 then
          else
            if not upval_1.Character then
              local v2_105 = upval_1.Character:FindFirstChild("Humanoid")
            end
            upval_0 = v2_105
            return nil
          end
        end
        if upval_0.SeatPart then
          return v0_105:TeleportToBoat(v0_105)
        end
        v2_105 = v0_105:GetPlayerBoat()
        if v2_105.PrimaryPart then
          return nil
        end
        if upval_2.GameData.Sea == 3 then
          local v5_105 = v0_105:GetSelectedLevel(v1_105)
          if v5_105 then
          else
          end
        end
        if #v0_105.RandomPosition == 1 then
          v0_105:teleportBoat(v2_105.PrimaryPart, v0_105.RandomPosition[1])
        else
          if 1 < #v0_105.RandomPosition then
            if #v0_105.RandomPosition < v0_105.nextNum then
              v0_105.nextNum = 1
            end
            if v2_105.PrimaryPart.Position - v0_105.RandomPosition[v0_105.nextNum].Position.Magnitude < 100 then
              v0_105.nextNum = v0_105.nextNum + 1
            else
              v0_105:teleportBoat(v2_105.PrimaryPart, v0_105.RandomPosition[v0_105.nextNum])
            end
          end
        end
      end

      local v9_100 = function(G0_106)
        local v1_106 = tick()
        if v1_106 - v0_106.toolDebounce < 2 then
          return v0_106.oldTool
        end
        v1_106 = tick()
        v0_106.toolDebounce = v1_106
      end

      while true do
        local v3_106 = VerifyToolTip(v0_106.nextTool[v0_106.oldTool])
        if v3_106 then
          if 3 <= 0 + 1 then
          end
          v0_106.oldTool = v0_106.nextTool[v0_106.nextTool[v0_106.oldTool]]
          return v0_106.nextTool[v0_106.nextTool[v0_106.oldTool]]
        end
        v0_106.oldTool = v0_106.nextTool[v0_106.nextTool[v0_106.oldTool]]
        return v0_106.nextTool[v0_106.nextTool[v0_106.oldTool]]
      end

      local v9_100 = function(G0_110, G1_110)
        local v2_110, v3_110, v4_110 = ipairs(upval_0:GetChildren())

        while true do
          if v6_110.Name == v1_110 then
            local v7_110 = upval_1(v6_110)
            if not v7_110 then
              return v6_110
            end
          end

          for v5_110, v6_110 in v2_110 do
          end
      end

      local v9_100 = function(G0_101, G1_101)
        if v1_101.PrimaryPart then
          return nil
        end
        local v4_101 = Vector3.new(0, 20, 0)
        EnableBuso()
        upval_0(v1_101.PrimaryPart.CFrame + v4_101)
        v0_101:StopBoat()
        v4_101 = upval_1:DistanceFromCharacter(v1_101.PrimaryPart.CFrame + v4_101.Position)
        if v4_101 < 50 then
          upval_2(v1_101.PrimaryPart, upval_3.SeaSkills)
          local v5_101 = v0_101:RandomTool()
          upval_4(v5_101, true)
        end
      end

      local v9_100 = function(G0_109, G1_109)
        if not v1_109.PrimaryPart then
          if v1_109.Name ~= "Terrorshark" then
            if v1_109.Name == "Shark" then
            else
              if not upval_0.DodgeShark then

                for v7_109 = 1, #v0_109.TerrorSkills, 1 do
                  local v8_109 = upval_1:FindFirstChild(v0_109.TerrorSkills[v7_109])
                  if not v8_109 then
                    if v8_109.Position - v1_109.PrimaryPart.Position.Magnitude <= 100 then
                      return upval_2(v1_109.PrimaryPart.CFrame + v0_109.DodgeVector)
                    end
                  end
                end
              end
            end
          end
          upval_2(v1_109.PrimaryPart.CFrame + v0_109.SeaEnemyVector)
          upval_3()
          EnableBuso()
          v0_109:StopBoat()
        end
      end

      local v9_100 = function(G0_103, G1_103)
        local v2_103 = v1_103:GetAttribute("Repairing")
        if v2_103 then
          upval_0:SendMouseButtonEvent(0, 0, 0, true, game, 1)
          print("Segurando o mouse")
          v1_103.AncestryChanged:Wait()
          upval_0:SendMouseButtonEvent(0, 0, 0, false, game, 1)
          print("Parou de segurar")
        end
      end

      local v9_100 = function(G0_104, G1_104)
        if not upval_0.RepairBoat then
          if upval_1.Value == "Shipwright" then
            if 0 < upval_2["Wooden Plank"] then
              local v2_104 = v1_104:FindFirstChild("Humanoid")
              if not v2_104 then
                local v3_104 = v1_104:GetAttribute("__Repair")
                if v3_104 then
                  local v4_104 = v1_104:GetAttribute("MaxHealth")
                  if v4_104 then
                  end
                  if v2_104.Value < v2_104.Value / 1.2 then
                  else
                    if upval_3.Character then
                      v3_104 = upval_3.CharacterAdded:Wait()
                    end
                    v4_104 = v3_104:FindFirstChild("_RepairHammer")
                    local v6_104 = v1_104:GetAttribute("MaxHealth")
                    if v6_104 then
                    end
                    if v2_104.Value <= v2_104.Value then
                      v1_104:SetAttribute("__Repair", nil)
                    else
                      v1_104:SetAttribute("__Repair", true)
                    end
                    if not v4_104 then
                      local v5_104 = v4_104:WaitForChild("Marker")
                      if not v5_104 then
                        upval_4(v4_104.Marker.Value.WorldCFrame + Vector3.xAxis * 10)
                        task.spawn(v0_104.StartHolding, v0_104, v4_104)
                        return true
                      end
                    end
                    v5_104 = v1_104:FindFirstChild("VehicleSeat")
                    if not v5_104 then
                      v6_104 = upval_3:DistanceFromCharacter(v1_104.VehicleSeat.CFrame + Vector3.yAxis * 20.Position)
                      if v6_104 <= 5 then
                        upval_5.UseSubclass:InvokeServer({ Action = "RequestHammer" })
                      else
                        upval_4(v1_104.VehicleSeat.CFrame + Vector3.yAxis * 20)
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if upval_1.Value == "Shipwright" then
          if not upval_0.RepairBoat then
            if not upval_3.Character then
              v2_104 = upval_3.Character:FindFirstChild("_RepairHammer")
              if not v2_104 then
                upval_5.UseSubclass:InvokeServer({ Action = "RequestHammer" })
              end
            end
          end
        end
      end

      local v9_100 = function(G0_117, G1_117)
        local v2_117 = v1_117:GetAttribute("IsBoat")
        if not v2_117 then
          v0_117:attackBoat(v1_117)
        else
          v0_117:attackFish(v1_117)
        end
      end

      local v9_100 = function(G0_107)
        local v1_107 = tick()
        if v1_107 - v0_107.rdDebounce < 1.5 then
          return v0_107.Directions[v0_107.randomNumber]
        end
        v1_107 = tick()
        v0_107.rdDebounce = v1_107
        v1_107 = math.random(#v0_107.Directions)
        v0_107.randomNumber = v1_107
        return v0_107.Directions[v0_107.randomNumber]
      end

      local v9_100 = function(G0_102, G1_102)
        local v2_102 = v0_102:RandomDirection()
        local v3_102 = v1_102:FindFirstChild("HumanoidRootPart")
        if v3_102 then
          return nil
        end
        local v5_102 = CFrame.new(v3_102.Position.X, 25, v3_102.Position.Z)
        EnableBuso()
        upval_0(v5_102 + v2_102)
        v0_102:StopBoat()
        local v7_102 = v0_102:RandomTool()
        upval_1(v7_102, true)
        upval_2(v5_102 + v2_102, upval_3.SeaSkills)
      end

      local v9_100 = function(G0_116)
        if not v0_116.SeaBeast then
          if v0_116.SeaBeast.Parent == upval_0 then
            local v2_116 = upval_1(v0_116.SeaBeast)
            if not v2_116 then
              return v0_116.SeaBeast
            end
          end
        end
        local v4_116, v5_116, v6_116 = ipairs(upval_0:GetChildren())

        while true do
          local v9_116 = v8_116:IsA("Model")
          if not v9_116 then
            local v11_116 = v8_116:GetPivot()
            v9_116 = upval_2:DistanceFromCharacter(upval_2, v11_116.Position)
            local v10_116 = upval_1(v8_116)
            if not v10_116 then
              if v9_116 < math.huge then
              end
            end
          end

          for v7_116, v8_116 in v4_116 do
          end
          v0_116.SeaBeast = v8_116
          return v8_116
      end

      local v9_100 = function(G0_118)
        if not upval_0 then
          if upval_0.Health > 0 then
            local v1_118 = upval_0:IsDescendantOf(upval_1)
            if v1_118 then
            else
              if not upval_2.Character then
                v1_118 = upval_2.Character:FindFirstChild("Humanoid")
              end
              upval_0 = v1_118
              return nil
            end
          end
        end
        if not v0_118.VehicleSeat then
          local v2_118 = v0_118.VehicleSeat:IsDescendantOf(v0_118.PlayerBoat)
          if not v2_118 then
            if not upval_0.SeatPart then
              if upval_0.SeatPart ~= v0_118.VehicleSeat then
                upval_0.Sit = false
              else
                v2_118 = upval_2:DistanceFromCharacter(v0_118.VehicleSeat.Position)
                if v2_118 < 150 then
                  v0_118.VehicleSeat:Sit(upval_0)
                else
                  upval_3(v0_118.VehicleSeat.CFrame)
                end
              end
            end
            task.wait(0.25)
          else
            if not v0_118.PlayerBoat then
              v2_118 = v0_118.PlayerBoat:FindFirstChild("VehicleSeat")
              v0_118.VehicleSeat = v2_118
            end
          end
        end
      end

      return v0_100
  end

  local v55_1 = function()
    local v5_153 = function(G0_154, G1_154)
      local v2_154 = string.gsub(v1_154.Name, " Fruit", "")
      return v2_154 .. "-" .. v2_154
    end

    local v5_153 = function(G0_155, G1_155)
      local v3_155 = v0_155:GetRealFruitName(v1_155)
      if upval_0[v3_155] >= upval_1.Value then
        return false
    end

    local v5_153 = function(G0_158, G1_158)
      local v4_158 = v0_158:GetRealFruitName(v1_158)
      return upval_0.FireRemote("StoreFruit", v4_158, v1_158)
    end

    local v5_153 = function(G0_157, G1_157)
      local v2_157 = string.sub(v1_157.Name, -6, -1)
      if v2_157 == " Fruit" then
        v2_157 = v1_157:GetAttribute("DroppedBy")
      else
      end
      return false
    end

    local v5_153 = function(G0_160)
      local v1_160 = upval_0.Backpack:GetChildren()
      local v2_160 = upval_0.Character:FindFirstChildOfClass("Tool")
      if not v2_160 then
        table.insert(v1_160, v2_160)
      end
      return v1_160
    end

    local v5_153 = function(G0_156)
      local v1_156 = upval_0(upval_1.Character)
      if v1_156 then
        return false
      end
      v1_156 = upval_1:GetAttribute("IslandRaiding")
      if not v1_156 then
        return false
      end
      v1_156 = upval_1.Backpack:FindFirstChild("Microchip")
      if v1_156 then
        v1_156 = upval_1.Character:FindFirstChild("Microchip")
        if not v1_156 then
        else
          return false
        end
      end
      local v1_156, v2_156, v3_156 = ipairs(v0_156:GetInventoryItems())

      while true do
        local v6_156 = v5_156:IsA("Tool")
        if not v6_156 then
          v6_156 = v0_156:IsFruit(v5_156)
          if not v6_156 then
            return true
          end
        end

        for v4_156, v5_156 in v1_156 do
        end
        return -1
    end

    local v5_153 = function(G0_159, G1_159)
      local v2_159 = upval_0(upval_1.Character)
      if v2_159 then
        return false
      end
      local v2_159, v3_159, v4_159 = ipairs(v0_159:GetInventoryItems())

      while true do
        if v6_159.Name ~= v1_159 then
          local v7_159 = upval_0(upval_1.Character)
          if not v7_159 then
            v7_159 = v6_159:IsA("Tool")
            if not v7_159 then
              v7_159 = v0_159:IsFruit(v6_159)
              if not v7_159 then
                v7_159 = v0_159:CanStoreFruit(v6_159)
                if not v7_159 then
                  return v6_159
                end
              end
            end
            if not upval_2.SmoothMode then
              task.wait()
            end
          else

            for v5_159, v6_159 in v2_159 do
            end
          end
        end
    end

    local v5_153 = function(G0_161)
      if upval_0.Value < 50 then
        local v1_161 = upval_0:GetPropertyChangedSignal("Value")
        return v1_161:Wait(v1_161)
      end
      if upval_1.Value < v0_161.MoneyToReroll then
        v1_161 = upval_1:GetPropertyChangedSignal("Value")
        return v1_161:Wait(v1_161)
      end
      v1_161 = v1_161:Wait()
      if 1 <= v1_161 - v0_161.RandomDebounce then
        v1_161 = upval_2.FireRemote("Cousin", "Buy")
        if v1_161 == 1 then
          local v2_161 = tick()
          v0_161.RandomDebounce = v2_161 + 7200
        else
          if v1_161 == 2 then
            local v2_161, v3_161, v4_161 = upval_2.FireRemote("Cousin", "Check")
            if v4_161 then
            end
            v0_161.MoneyToReroll = 0
          else
            v2_161 = type(v1_161)
            if v2_161 == "string" then
              v2_161 = v1_161:match("%d%d:%d%d")
              if not v2_161 then
                local v2_161, v3_161 = v1_161:match("(%d+):(%d+)")
                v4_161 = tonumber(v2_161)
                local v5_161 = tonumber(v3_161)
                if not v4_161 then
                  if not v5_161 then
                    v4_161 = tick()
                    v0_161.RandomDebounce = v4_161 + v4_161 * 60 * 60 + v5_161 * 60
                  else
                    v2_161 = tick()
                    v0_161.RandomDebounce = v2_161 + 5
                  end
                end
              end
            end
          end
        end
      end
    end

    return v0_153
  end

  local v53_1 = function(G0_129)
    while true do
      local v6_129, v7_129 = pcall(v5_129)
      if not v6_129 then
        v0_129.Managers[v4_129] = v7_129
        upval_0[v4_129] = v7_129
      else
        upval_0[v4_129] = nil
        warn("falha ao carregar Module [ redz hub ]: " .. v4_129 .. " : " .. v7_129)
      end

      for v4_129, v5_129 in next do
      end
  end

  local v53_1 = function(G0_152)
    if upval_1.LibraryUrl then
    end
    local v1_152 = __loadstring("{Owner}Library/refs/heads/main/Source.lua")
    upval_0 = v1_152
    if upval_1.ModuleUrl then
    end
    v1_152 = __loadstring("{Repository}Utils/BloxFruits/Module.luau", " return Module", { upval_3, upval_4 })
    upval_2 = v1_152
    if upval_1.LibraryUrl then
      if upval_1.ModuleUrl then
        if not upval_1.CustomFunctions then
        else
          if true then
          end
        end
      else
      end
    end
    v0_152.IsCustomUrl = false
    upval_5:RunModules()
  end

  local v53_1 = function(G0_173, G1_173)
    local v3_173 = v1_173:MakeTab({ "Discord", "Info" })
    v3_173 = v1_173:MakeTab({ "Farm", "Home" })
    v3_173 = v1_173:MakeTab({ "Sea", "Waves" })
    v3_173 = v1_173:MakeTab({ "Race-V4", "" })
    v3_173 = v1_173:MakeTab({ "Islands", "PalmTree" })
    v3_173 = v1_173:MakeTab({ "Quests/Items", "Swords" })
    v3_173 = v1_173:MakeTab({ "Fruit/Raid", "Cherry" })
    v3_173 = v1_173:MakeTab({ "Stats", "Signal" })
    v3_173 = v1_173:MakeTab({ "Teleport", "Locate" })
    v3_173 = v1_173:MakeTab({ "Status", "scroll" })
    v3_173 = v1_173:MakeTab({ "Visual", "User" })
    v3_173 = v1_173:MakeTab({ "Shop", "ShoppingCart" })
    v3_173 = v1_173:MakeTab({ "Misc", "Settings" })
    return v2_173
  end

  local v53_1 = function(G0_11)
    local v2_11 = upval_0.RunFunctions.LibraryToggle(upval_1, upval_2)
    return v1_11
  end

  local v53_1 = function(G0_4, G1_4)
    if not v2_4[v1_4] then
      return upval_0:JSONDecode()
    end
  end

  local v53_1 = function(G0_5, G1_5)
    if upval_0.Translator then
      return v1_5
    end

    local v3_5 = function()
      if not readfile then
        local v0_6 = pcall(readfile, "PlayerCountry.txt")
      end
      if not v0_6 then
        local v2_6 = type(nil)
        if v2_6 == "string" then
          return nil, true
        end
      end
      return upval_0:GetCountryRegionForPlayerAsync(upval_0, upval_1)
    end

    local v2_5, v3_5, v4_5 = pcall(v3_5)
    if not v2_5 then
      if not v3_5 then
        if v4_5 ~= true then
          if not writefile then
            pcall(writefile, "PlayerCountry.txt", v3_5)
          end
        end
      end
    end
    if not v2_5 then
      local v5_5 = v0_5:GetTranslation(v3_5)
    end
    if not v5_5 then
      return upval_3.RunFunctions.Translator(v1_5, v5_5)
    end
    return v1_5
  end

  local v53_1 = function(G0_162)
    if not upval_0.RunningOption then
      if not upval_1[upval_0.RunningOption] then
        upval_1[upval_0.RunningOption]:Set(false, true)
      end
    end
  end

  local v53_1 = function(G0_181)
    local v7_181 = upval_0:MakeWindow({ "redz Hub : Blox Fruits", "by real_redz", "redzHub-BloxFruits.json" })
    local v8_181 = v0_181:Translator(v7_181)
    local v9_181 = v0_181:InstallPlugin(v7_181)
    local v10_181 = v0_181:LoadTabs(v7_181)
    v7_181:SelectTab(v10_181.MainFarm)
    local v23_181 = v7_181:AddMinimizeButton(6)
    v7_181:AddMinimizeButton(v7_181, { Button = v22_181, Corner = v22_181 })
    v10_181.Discord:AddDiscordInvite({
      Name = "redz Hub | Community",
      Description = "Join our discord community to receive information about the next update",
      Logo = "rbxassetid://17382040552",
      Invite = "https://discord.gg/7aR7kNVt4g",
    })
    v10_181.Discord:AddSection("")
    v10_181.Discord:AddParagraph({ "Mentions:\
 Honorable Mention: acsu123\
 Honorable Mention 2: XFister" })

    local v23_181 = function(G0_240)
      if upval_1[v0_240] then
      end
      pcall(upval_0.SetScale, upval_0, 450)
    end

    local v24_181 = function(G0_192)
      upval_0.TradeBones = v0_192
    end

    while true do
      if not upval_0.TradeBones then
        task.wait()
        if 50 <= upval_1.Bones then
          upval_2("Bones", "Buy", 1, 1)
          if upval_1.Bones == upval_1.Bones then
          end
          task.wait(5)
        end
      end
      task.wait(0.5)
    end
  end
    end

    local v26_181 = function()
      local v1_218, v2_218, v3_218 = pairs(upval_0.Bosses)

      while true do
        local v6_218 = upval_0.Enemies.IsSpawned(v4_218)
        if not v6_218 then
          table.insert(v0_218, v4_218)
        end

        for v4_218, v5_218 in v1_218 do
        end
        upval_1:Set(v0_218)
    end

    v10_181.MainFarm:AddDropdown({
      "Select Tool",
      v31_181,
      "Melee",
      v33_181,
      "FarmTool",
    })
    v10_181.MainFarm:AddDropdown({
      "UI Scale",
      v31_181,
      "Large",
      v23_181,
      "UIScale",
    })
    v10_181.MainFarm:AddSection("Farm")
    v9_181.Toggle(v10_181.MainFarm, { "Auto Farm Level", "Level Farm" }, "Level")
    v9_181.Toggle(v10_181.MainFarm, { "Auto Farm Nearest", "Farm Nearest Mobs" }, "Nearest")
    if upval_1.GameData.Sea ~= 1 then
      if upval_1.GameData.Sea == 2 then
        v9_181.Toggle(v10_181.MainFarm, { "Auto Factory", "Spawns Every 1:30 [hours, minutes]" }, "Factory")
        v10_181.MainFarm:AddSection("Ectoplasm")
        v9_181.Toggle(v10_181.MainFarm, { "Auto Farm Ectoplasm" }, "Ectoplasm")
      else
        if upval_1.GameData.Sea == 3 then
          v9_181.Toggle(v10_181.MainFarm, { "Auto Pirates Sea", "Auto Finish Pirate Raid in Sea Castle" }, "PirateRaid")
          v10_181.MainFarm:AddSection("Bones")
          v9_181.Toggle(v10_181.MainFarm, { "Auto Farm Bones" }, "Bones")
          v9_181.Toggle(v10_181.MainFarm, { "Auto Kill Soul Reaper" }, "SoulReaper")
          v10_181.MainFarm:AddToggle({
            "Auto Trade Bones",
            false,
            v24_181,
            "TradeBones",
          })
        end
      end
    end
    v10_181.MainFarm:AddSection("Chest")
    v9_181.Toggle(v10_181.MainFarm, { "Auto Chest [ Tween ]" }, "ChestTween")
    v10_181.MainFarm:AddSection("Bosses")
    v10_181.MainFarm:AddButton({ "Update Boss List", v26_181 })
    local v27_181 = v10_181.MainFarm:AddDropdown({
      "Boss List",
      v31_181,
      false,
      v33_181,
      "B-Selected",
    })
    v26_181()
    v9_181.Toggle(v10_181.MainFarm, { "Auto Kill Boss Selected", "Kill boss Selected" }, "BossSelected")
    v9_181.Toggle(v10_181.MainFarm, { "Auto Farm All Bosses", "Kill all bosses Spawned" }, "AllBosses")
    v10_181.MainFarm:AddToggle({
      "Take Boss Quest",
      true,
      v32_181,
      "B-Quest",
    })
    v10_181.MainFarm:AddSection("Material")
    v10_181.MainFarm:AddDropdown({
      "Material List",
      v0_181.Managers.FarmManager.Materials,
      false,
      v33_181,
      "S-Material",
    })
    v9_181.Toggle(v10_181.MainFarm, { "Auto Farm Material", "Farm material Selected" }, "Material")
    v10_181.MainFarm:AddSection("Mastery")
    v10_181.MainFarm:AddSlider({
      "Select Enemy Health [ % ]",
      10,
      100,
      1,
      25,
      v35_181,
      "M-Health",
    })
    v10_181.MainFarm:AddDropdown({
      "Select Tool",
      v31_181,
      v32_181,
      v33_181,
      "M-Tool",
    })
    v10_181.MainFarm:AddDropdown({
      MultiSelect = true,
      "Select Skills",
      v22_181[1],
      v22_181[2],
      v33_181,
      "M-Skills",
    })
    v9_181.Toggle(v10_181.MainFarm, { "Auto Farm Mastery" }, "Mastery")
    if upval_1.GameData.Sea == 1 then
      v10_181.Sea:Destroy()
    else
      if upval_1.GameData.Sea == 2 then
        v10_181.Sea:AddSection("Farm")
        v9_181.Toggle(v10_181.Sea, { "Auto Farm Sea" }, "Sea")
        v10_181.Sea:AddSection("Farm Select")
        v10_181.Sea:AddDropdown({
          MultiSelect = true,
          "Enemies",
          v22_181[1],
          v22_181[2],
          v30_181,
          "S-Enemies",
        })
        v10_181.Sea:AddDropdown({
          MultiSelect = true,
          "Select Skills",
          v23_181[1],
          v23_181[2],
          v30_181,
          "S-Skills",
        })
        v10_181.Sea:AddSection("Configs")
        v10_181.Sea:AddSlider({
          "Boat Tween Speed",
          100,
          300,
          10,
          250,
          v32_181,
          "S-BoatSpeed",
        })
        v10_181.Sea:AddToggle({
          "Auto Repair Boat [ BETA ]",
          false,
          v29_181,
          "S-RepairBoat",
        })
      else
        if upval_1.GameData.Sea == 3 then
          local v31_181 = CFrame.new({ upval_3, "BoatSpeed" }, { upval_3, "MasterySkills" }, 309)
          v31_181 = CFrame.new(-16526, 108, 752)
          v31_181 = CFrame.new(-16281, 73, 263)
          v31_181 = CFrame.new(-16471, 528, 539)

          local v31_181 = function(G0_232)
            upval_0.teleporting = v0_232
          end

          while true do
            if not upval_0.teleporting then
              task.wait()
              if not upval_1.selectedNpc then
              end
              upval_2(upval_3[upval_1.selectedNpc])
            end
          end
          if not v0_232 then
            if not upval_4 then
              upval_4:Set(false, true)
            end
          end
          end

          local v32_181 = function(G0_212)
            if not v0_212 then
            end

            while true do
              task.wait()
              if not upval_0.Managers.PlayerTeleport.lastPosition then
                local v3_212 = upval_1:DistanceFromCharacter(upval_0.Managers.PlayerTeleport.lastPosition)
              end
              if not upval_2.teleporting then
                if v3_212 < 15 then
                end
              end
              upval_2.teleporting = false
            end
          end

          v10_181.Sea:AddSection({ upval_3, "mHealth" })
          v9_181.Toggle(v10_181.Sea, { "Auto Farm Sea" }, "Sea")
          v10_181.Sea:AddToggle({
            "Auto Drive Boat",
            true,
            v38_181,
            "A-TweenBoat",
          })
          v10_181.Sea:AddSection("Farm Select")
          v10_181.Sea:AddDropdown({
            MultiSelect = true,
            "Fish",
            v26_181[1],
            v26_181[2],
            v39_181,
            "S-Fish",
          })
          v10_181.Sea:AddDropdown({
            MultiSelect = true,
            "Boats",
            v23_181,
            nil,
            v39_181,
            "S-Boat",
          })
          v10_181.Sea:AddDropdown({
            MultiSelect = true,
            "Select Skills",
            v25_181[1],
            v25_181[2],
            v39_181,
            "S-Skills",
          })
          v10_181.Sea:AddSection("Configs")
          v10_181.Sea:AddDropdown({
            "Sea Level",
            v24_181,
            "6",
            v39_181,
            "S-SeaLevel",
          })
          v10_181.Sea:AddSlider({
            "Boat Tween Speed",
            100,
            300,
            10,
            250,
            v41_181,
            "S-BoatSpeed",
          })
          v10_181.Sea:AddToggle({
            "Auto Repair Boat [ BETA ]",
            false,
            v38_181,
            "S-RepairBoat",
          })
          v10_181.Sea:AddSection("NPCs")
          v10_181.Sea:AddDropdown({
            "Select NPC",
            v22_181,
            "Spy",
            v39_181,
          })
          local v33_181 = v10_181.Sea:AddToggle({ "Teleport to NPC", false, v31_181 })
          v33_181:Callback(v32_181)
          v10_181.Sea:AddSection("Quests/Items")
          v9_181.Toggle(v10_181.Sea, { "Auto Unlock Shipwright Subclass [ BETA ]" }, "Shipwright")
        end
      end
    end
    if upval_6.Value < upval_1.GameData.MaxLevel then
      local v25_181 = upval_7:WaitForChild({
        "Z",
        "X",
        "C",
        "V",
        "F",
      })
      v26_181 = upval_7:WaitForChild({
        "Z",
        "X",
        "C",
        "V",
      })

      local v27_181 = function(G0_229)
        upval_0.AutoStats = v0_229
      end

      while true do
        local v1_229 = task.wait()
        if not v1_229 then
          if not upval_0.AutoStats then
            if 0 < upval_1.Value then
            end
            local v2_229, v3_229, v4_229 = pairs(upval_2)

            while true do
              if not v6_229 then
                if upval_3[v5_229].Level.Value < upval_4.GameData.MaxLevel then
                  if upval_5.StatsPoints then
                  end
                  local v8_229 = math.clamp(3, 0, upval_1.Value)
                  local v7_229 = math.clamp(v8_229, 0, upval_4.GameData.MaxLevel)
                  upval_6("AddPoint", v5_229, v7_229)
                end
              end

              for v5_229, v6_229 in v2_229 do
              end
            end
          end
        end
      end

      local v28_181 = function(G0_238, G1_238)
        upval_0:AddToggle({
          v1_238,
          false,
          v7_238,
          "Stats-" .. v1_238,
        })
      end

      v10_181.Stats:AddSlider({
        "Points Amount",
        1,
        100,
        1,
        3,
        v37_181,
        "P-Stats",
      })
      v10_181.Stats:AddToggle({
        "Auto Stats",
        false,
        v27_181,
        "A-Stats",
      })
      v10_181.Stats:AddSection("Select Stats")
      table.foreach({
        ["Shipwright Teacher"] = v31_181,
        ["Shark Hunter"] = v31_181,
        ["Beast Hunter"] = v31_181,
        Spy = v31_181,
      }, v28_181)
    else
      v10_181.Stats:Destroy()
    end
    if upval_1.GameData.Sea == 4 then
      v10_181.RaceV4:AddSection({})
      v9_181.Toggle({}, { "Auto Finish Trial" }, "TrialV4")
      v9_181.Toggle(v10_181.RaceV4, { "Auto Kill Players in Trial" }, "KillPlayersV4")
      v9_181.Toggle(v10_181.RaceV4, { "Auto Train Race" }, "TrainV4")
    else
      v10_181.RaceV4:Destroy()
    end
    if upval_1.GameData.Sea == 3 then

      local v25_181 = function(G0_208)
        upval_0.LookMoon = v0_208

        while true do
          if not upval_0.LookMoon then
            local v4_208 = upval_2:GetMoonDirection()
            local v2_208 = CFrame.new(upval_1.CFrame.Position, v4_208 + upval_1.CFrame.Position)
            upval_1.CFrame = v2_208
            task.wait()
          end
        end
      end

      local v26_181 = function(G0_188)
        upval_0.TradeAzure = v0_188

        while true do
          if not upval_0.TradeAzure then
            local v1_188 = upval_1:GetAttribute("IsBlueMoon")
            if not v1_188 then
              v1_188 = upval_1:GetAttribute("BlueMoonEnded")
              if v1_188 then
                if upval_3.Azure <= upval_2["Azure Ember"] then
                  upval_4["RF/KitsuneStatuePray"]:InvokeServer()
                end
              end
            end
            task.wait(1)
          end
        end
      end

      local v27_181 = function(G0_203, G1_203)
        local v2_203 = upval_0:AddParagraph({ v0_203 .. " : not Spawn" })

        while true do
          local v3_203 = task.wait()
          if not v3_203 then
            v3_203 = upval_1:FindFirstChild(v1_203)
            if not v3_203 then
              local v5_203 = upval_2:DistanceFromCharacter(v3_203.WorldPivot.Position)
              local v4_203 = math.floor(v5_203 / 5)
              v2_203:SetTitle(v0_203 .. " : Spawned | Distance : " .. v4_203)
            end
          end
          v2_203:SetTitle(v0_203 .. " : not Spawn")
          upval_1.ChildAdded:Wait()
        end
      end
      end

      v10_181.Islands:AddSection("Islands Stats")
      task.spawn(v27_181, "Mirage Island", "MysticIsland")
      task.spawn(v27_181, "Kitsune Island", "KitsuneIsland")
      task.spawn(v27_181, "Prehistoric Island", "PrehistoricIsland")
      v10_181.Islands:AddSection("Prehistoric Island")
      v9_181.Toggle(v10_181.Islands, { "Auto Craft Volcanic Magnet" }, "CraftVolcanicMagnet")
      v9_181.Toggle(v10_181.Islands, { "Auto Prehistoric Island" }, "PrehistoricIsland")
      v9_181.Toggle(v10_181.Islands, { "Auto Kill Lava Golem" }, "LavaGolem")
      v9_181.Toggle(v10_181.Islands, { "Auto Collect Dinosaur Bones" }, "PrehistoricBones")
      v9_181.Toggle(v10_181.Islands, { "Auto Collect Dragon Egg" }, "PrehistoricEgg")
      v10_181.Islands:AddToggle({
        "Reset after finishing",
        false,
        v33_181,
        "P-Reset",
      })
      v10_181.Islands:AddSection("Leviathan [ BETA ]")
      v9_181.Toggle(v10_181.Islands, { "Auto Attack Leviathan" }, "Leviathan")
      v10_181.Islands:AddSection("Kitsune Island")
      v10_181.Islands:AddSlider({
        "Trade Azure Ember Amount",
        10,
        25,
        5,
        20,
        v36_181,
        "A-Amount",
      })
      v10_181.Islands:AddToggle({ "Auto Trade Azure Ember", false, v26_181 }, "Trade-Azure")
      v9_181.Toggle(v10_181.Islands, { "Auto Kitsune Island" }, "KitsuneIsland")
      v10_181.Islands:AddSection("Mirage Island")
      v9_181.Toggle(v10_181.Islands, { "Teleport To Gear" }, "MirageGear")
      v9_181.Toggle(v10_181.Islands, { "Teleport To Mirage" }, "TeleportMirage")
      v9_181.Toggle(v10_181.Islands, { "Teleport To Fruit Dealer" }, "MirageFruitDealer")
      v9_181.Toggle(v10_181.Islands, { "Collect Mirage Chests" }, "MirageChests")
      v10_181.Islands:AddToggle({
        "Look To Moon",
        false,
        v25_181,
        "MirageLookMoon",
      })
    else
      v10_181.Islands:Destroy()
    end

    local v30_181 = function(G0_202)
      upval_0.auto_store = v0_202

      while true do
        if not upval_0.auto_store then
          if not upval_1.SmoothMode then
            if 0.3 then
            else
            end
          end
          task.wait(0.2)
          upval_2 = false
          local v1_202 = upval_3:GetAttribute("IslandRaiding")
          if v1_202 then
            if not upval_0.unstore_common_fruits then
            else
            end
          end
          local v2_202 = upval_5:GetStorableFruit(false)
          if not v2_202 then
            upval_5:StoreFruit(v2_202)
            upval_4 = nil
          end
        end
        upval_2 = true
      end
    end
    upval_2 = true
    end

    local v31_181 = function(G0_206)
      upval_0.random_fruit = v0_206

      while true do
        if not upval_0.random_fruit then
          upval_1:RerollRandomFruit()
          task.wait(0.1)
        end
      end
    end

    local v32_181 = function(G0_216)
      upval_0.raid_microchip = v0_216

      while true do
        if not upval_0.raid_microchip then
          if upval_1 then
            task.wait()
          end
        end
        local v1_216 = upval_2:CanBuyMicrochip()
        if not v1_216 then
          upval_3("RaidsNpc", "Select", upval_4.SelectedChip)
        end
      end
      task.wait(0.1)
    end
  end
    end

    local v33_181 = function(G0_225)
      upval_0.unstore_common_fruits = v0_225

      while true do
        if not upval_0.unstore_common_fruits then
          local v1_225 = upval_1:CanBuyMicrochip()
          if v1_225 == -1 then
            if not upval_2 then

              for v4_225 = 1, #upval_3, 1 do
                local v7_225 = upval_4.Character:FindFirstChild(upval_3[v4_225] .. "-" .. upval_3[v4_225])
                if v7_225 then
                  v7_225 = upval_4.Backpack:FindFirstChild(upval_3[v4_225] .. "-" .. upval_3[v4_225])
                  if v7_225 then
                    if 0 < upval_5[upval_3[v4_225] .. "-" .. upval_3[v4_225]] then
                      upval_6 = upval_3[v4_225] .. " Fruit"
                      upval_7("LoadFruit", upval_3[v4_225] .. "-" .. upval_3[v4_225])
                    else
                    end
                  end
                end
              end
            end
          end
          task.wait(0.25)
        end
      end
    end

    v10_181["FruitRaid"]:AddSection({ upval_3, "Azure" })
    v10_181["FruitRaid"]:AddToggle({
      "Auto Store Fruits",
      false,
      v30_181,
      "F-AutoStore",
    })
    v9_181.Toggle(v10_181["FruitRaid"], { "Teleport To Fruits" }, { upval_3, "StatsPoints" })
    v10_181["FruitRaid"]:AddToggle({
      "Auto Random Fruit",
      false,
      v31_181,
      "F-RandomFruit",
    })
    v10_181["FruitRaid"]:AddSection("Raid")
    if upval_1.GameData.Sea ~= 2 then
      if upval_1.GameData.Sea ~= 3 then
        v10_181["FruitRaid"]:AddParagraph({ "Only on Sea 2 and 3" })
      else
        v10_181["FruitRaid"]:AddDropdown({
          "Select Chip",
          upval_1["RaidList"],
          "",
          v40_181,
          "R-RaidChip",
        })
        v9_181.Toggle(v10_181["FruitRaid"], { "Auto Farm Raid", "Kill Aura, Start & Awaken" }, "Raid")
        v10_181["FruitRaid"]:AddToggle({
          "Auto Buy Chip",
          false,
          v32_181,
          "R-BuyChip",
        })
        v10_181["FruitRaid"]:AddToggle({
          "Unstore Common Fruits",
          false,
          v33_181,
          "R-Unstore",
        })
      end
    end
    v28_181 = CFrame.new(28286, 14897, 103)
    v32_181 = CFrame.new({ upval_3, "ResetPrehistoric" }, 15, 1585)
    v32_181 = CFrame.new(-4810, 21, 4359)
    v32_181 = CFrame.new(-2728, 25, 2056)
    v32_181 = CFrame.new(889, 17, 1434)
    v32_181 = CFrame.new(1054, 53, 4490)
    v32_181 = CFrame.new(1298, 87, -1344)
    v32_181 = CFrame.new(-1173, 45, 3837)
    v32_181 = CFrame.new(-1614, 37, 146)
    v32_181 = CFrame.new(4870, 6, 736)
    v32_181 = CFrame.new(61164, 5, 1820)
    v32_181 = CFrame.new(-1535, 7, -3014)
    v32_181 = CFrame.new(-5290, 9, 8349)
    v32_181 = CFrame.new(-4814, 718, -2551)
    v32_181 = CFrame.new(-4652, 873, -1754)
    v32_181 = CFrame.new(-7895, 5547, -380)
    v32_181 = CFrame.new(5041, 1, 4101)
    v32_181 = CFrame.new(-382, 73, 290)
    v32_181 = CFrame.new(-11, 29, 2771)
    v32_181 = CFrame.new(3494, 13, -3259)
    v32_181 = CFrame.new(-317, 331, 597)
    v32_181 = CFrame.new(2285, 15, 905)
    v32_181 = CFrame.new(-2258, 73, -2696)
    v32_181 = CFrame.new(-5552, 194, -776)
    v32_181 = CFrame.new(752, 408, -5277)
    v32_181 = CFrame.new(-5897, 18, -5096)
    v32_181 = CFrame.new(919, 125, 32869)
    v32_181 = CFrame.new(5505, 40, -6178)
    v32_181 = CFrame.new(-3050, 240, -10178)
    v32_181 = CFrame.new(4816, 8, 2863)
    v32_181 = CFrame.new(-12471, 374, -7551)
    v32_181 = CFrame.new(-334, 7, 5300)
    v32_181 = CFrame.new(-5073, 315, -3153)
    v32_181 = CFrame.new(5666, 1013, -310)
    v32_181 = CFrame.new(2683, 275, -7008)
    v32_181 = CFrame.new(-12528, 332, -8658)
    v32_181 = CFrame.new(-9517, 142, 5528)
    v32_181 = CFrame.new(-902, 79, -10988)
    v32_181 = CFrame.new(-2062, 50, -10232)
    v32_181 = CFrame.new(-1897, 14, -11576)
    v32_181 = CFrame.new(-1038, 10, -14076)
    v32_181 = CFrame.new(-16224, 9, 439)

    local v31_181 = function()
      for v3_236 = 1, 10, 1 do
        task.wait()
        upval_0.Character:SetPrimaryPartCFrame(upval_1)
      end
    end

    local v32_181 = function(G0_243)
      upval_0.teleporting = v0_243
    end

    while true do
      if not upval_0.teleporting then
        task.wait()
        if not upval_1[upval_0.SelectedIsland] then
        end
        upval_2(upval_1[upval_0.SelectedIsland])
      end
    end
    if not v0_243 then
      if not upval_3 then
        upval_3:Set(false, true)
      end
    end
    end

    local v33_181 = function(G0_190)
      if not v0_190 then
      end

      while true do
        task.wait()
        if not upval_0.Managers.PlayerTeleport.lastPosition then
          local v3_190 = upval_1:DistanceFromCharacter(upval_0.Managers.PlayerTeleport.lastPosition)
        end
        if not upval_2.teleporting then
          if v3_190 < 15 then
          end
        end
        upval_2.teleporting = false
      end
    end

    v10_181["Teleport"]:AddSection("Travel")

    local v38_181 = function()
      upval_0:TravelTo(1)
    end

    v10_181["Teleport"]:AddButton({ ["Desc"] = "Main", "Teleport to Sea 1", v38_181 })

    local v38_181 = function()
      upval_0:TravelTo(2)
    end

    v10_181["Teleport"]:AddButton({ ["Desc"] = "Dressrosa", "Teleport to Sea 2", v38_181 })

    local v38_181 = function()
      upval_0:TravelTo(3)
    end

    v10_181["Teleport"]:AddButton({ ["Desc"] = "Zou", "Teleport to Sea 3", v38_181 })
    v10_181["Teleport"]:AddSection("Islands")
    v10_181["Teleport"]:AddDropdown({
      "Select Island",
      v29_181[upval_1.GameData.Sea],
      "",
      v40_181,
    })
    local v34_181 = v10_181["Teleport"]:AddToggle({ "Teleport to Island", false, v32_181 })
    v34_181:Callback(v33_181)
    if upval_1.GameData.Sea == 3 then
      v10_181["Teleport"]:AddSection("Race V4")
      v10_181["Teleport"]:AddButton({ "Teleport to Temple of Time", v31_181 })
    end

    local v36_181 = function(G0_235, G1_235)
      if v1_235 then
        if v1_235 == nil then
        else
          local v5_235 = upval_1:AddParagraph({ "" })
          table.insert(upval_0, { Paragraph = v5_235, Function = v0_235 })
        end
      end
    end

    local v38_181 = function()
      local v0_199 = upval_0:GetProgress("EliteProgress", "EliteHunter", "Progress")
      local v1_199 = upval_0.Enemies:GetEnemyByTag("Elite")
      if not v1_199 then
        return "Elite Progress: %i\
Elite Hunter: %s %s":format("Elite Progress: %i\
Elite Hunter: %s %s", v0_199, v1_199.Name, upval_1)
      end
      if not upval_2 then
        local v5_199 = "Elite Progress: %i\
Elite Hunter: %s":format()
        if 0 <= 600 - v5_199 - upval_2 then
          local v6_199 = tick()
          if 600 - v6_199 - upval_2 then
          end
          v5_199 = upval_3.GetTimer("00:00")
          if v5_199 then
          else
          end
        end
      end
      return "Elite Progress: %i\
Elite Hunter: %s":format("Elite Progress: %i\
Elite Hunter: %s", v0_199, "" .. upval_4)
    end

    if upval_1.GameData.Sea ~= 3 then
      v36_181({ upval_3, "RepairBoat" }, { upval_3, "selectedNpc" })

      local v38_181 = function()
        local v0_195 = upval_0("Cake Prince")
        if not v0_195 then
          if "Cake Prince" then
          else
            v0_195 = upval_0("Dough King")
            if not v0_195 then
            end
          end
        end
        if not "Dough King" then
          return "Katakuri: %s %s":format("Katakuri: %s %s", "Dough King", upval_1)
        end
        local v2_195 = upval_2:GetProgress("Katakuri", "CakePrinceSpawner", true)
        local v1_195 = string.gsub(v2_195, "%D", "")
        local v3_195 = v1_195:len()
        if v3_195 == 0 then
          if "0" then
          else
          end
        end
        return "Katakuri: " .. v1_195
      end

      if upval_1.GameData.Sea ~= 3 then
        v36_181(v38_181, false)

        local v38_181 = function()
          local v0_227 = upval_0:GetProgress("Sword Dealer", "LegendarySwordDealer", "1")
          local v1_227 = type(v0_227)
          if v1_227 == "string" then
            return "Sword Dealer: %s %s":format("Sword Dealer: %s %s", v0_227, upval_1)
          end
          return "Sword Dealer: %s":format("Sword Dealer: %s", upval_2)
        end

        if upval_1.GameData.Sea ~= 2 then
          v36_181(v38_181, false)

          local v38_181 = function()
            local v0_196, v1_196 = upval_0:GetProgress("BaristaCousin", "ColorsDealer", "1")
            local v2_196 = type(v0_196)
            if v2_196 == "string" then
              if 3 <= v1_196 then
                if "LEGENDARY" then
                else
                end
              end
              return "Barista Cousin: %s [ %s ] %s":format("Barista Cousin: %s [ %s ] %s", v0_196, "Rare", upval_1)
            end
            return "Barista Cousin: " .. upval_2
          end

          v36_181(v38_181)

          local v38_181 = function()
            local v0_183 = workspace:FindFirstChild("Fruit ")
            if not v0_183 then
              return "Devil Fruit: %s %s":format("Devil Fruit: %s %s", upval_0.FruitsName[workspace["Fruit "]], upval_1)
            end
            return "Devil Fruit: " .. upval_2
          end

          v36_181(v38_181)

          local v38_181 = function()
            for v4_187 = 1, #upval_0, 1 do
              if v4_187 % 10 == 0 then
                task.wait(0.1)
              end
              local v6_187, v7_187, v8_187 = pairs(upval_0[v4_187]:GetAttributes())

              while true do
                table.insert(v0_187, v10_187)

                for v9_187, v10_187 in v6_187 do
                end
              end
              if 0 < #v0_187 then
                v4_187 = "Berries: #%i [ %s ] %s":format(", ")
                return "Berries: #%i [ %s ] %s":format("Berries: #%i [ %s ] %s", #v0_187, v4_187, upval_1)
              end
              return "Berries: " .. upval_2
          end

          v36_181(v38_181)

          local v38_181 = function()
            local v1_191 = upval_0:GetPlayers()
            return "Players: " .. #v1_191 .. "/12"
          end

          v36_181(v38_181)

          local v38_181 = function()
            if upval_2.RunningOption then
            end
            if upval_2.RunningMethod then
            end
            return "Enabled Options: %i/%i\
Farm Status: %s [ %s ]":format("Enabled Options: %i/%i\
Farm Status: %s [ %s ]", #upval_0, #upval_1, "Null", "Null")
          end

          v36_181(v38_181)

          local v38_181 = function()
            if upval_0.PrivateServerOwnerId.Value ~= 0 then
              if upval_1 then
              else
              end
            end
            return "Is Private Server: " .. upval_2
          end

          v36_181(v38_181)

          local v40_181 = function()
            if not upval_0 then
              if upval_0.Cont then
              else
                return upval_1:Disconnect(upval_1)
              end
            end
            if upval_2 == 3 then
              if upval_3 == 1 then
                local v0_204 = upval_1:Disconnect()
                if 1 <= v0_204 - upval_4 then
                  if upval_0.Cont.Parent then
                    v0_204 = tick()
                    upval_4 = v0_204
                  end
                  v0_204 = upval_5.Enemies:GetEnemyByTag("Elite")
                  if not v0_204 then
                    v0_204 = tick()
                    upval_6 = v0_204
                  end
                end
              end
            end
            v0_204 = tick()
            if 1 <= v0_204 - upval_4 then
              if not upval_0.Cont.Parent then
                if #upval_7 <= upval_3 then
                  if 0 then
                  else
                  end
                end
                upval_3 = upval_3 + 1
                if #upval_7 <= upval_3 then
                  local v1_204 = tick()
                  upval_4 = v1_204
                end
                if not upval_7[upval_3] then
                  if upval_7[upval_3].Updating then
                    upval_7[upval_3].Updating = true
                    upval_7[upval_3].Paragraph:SetTitle(upval_7[upval_3].Paragraph)
                    upval_7[upval_3].Updating = false
                  end
                end
              end
            end
          end

          v38_181 = upval_18["Connect"]({ upval_2, "SelectedIsland" })
          if upval_19["EspColors"] then
            v32_181 = Color3["fromRGB"](220, {}, 220)
            v32_181 = Color3["fromRGB"](255, 0, 0)
            v31_181 = Color3["fromRGB"]({
              "Mansion",
              "Port Town",
              "Great Tree",
              "Castle On The Sea",
              "Hydra Island",
              "Floating Turtle",
              "Haunted Castle",
              "Ice Cream Island",
              "Peanut Island",
              "Cake Island",
              "Candy Cane Island",
              "Tiki Outpost",
            }, 255, 255)
            v32_181 = Color3["fromRGB"](255, 255, 0)
            v34_181 = Color3["fromRGB"](150, 150, 150)
            v34_181 = Color3["fromRGB"](255, 255, 0)
            v34_181 = Color3["fromRGB"](0, 255, 255)
            v34_181 = Color3["fromRGB"](150, 0, 255)
          end

          local v36_181 = function(G0_213)
            if v0_213 ~= upval_0.Character then
              return true, upval_1.Players
            end
          end

          v33_181 = v0_181.Managers["EspManager"].new("Player", upval_20, v36_181)

          local v35_181 = function(G0_242)
            if v0_242.Name ~= "Sea" then
              return true, upval_0.Islands
            end
          end

          v32_181 = v0_181.Managers["EspManager"].new("Island", upval_21, v35_181)

          local v36_181 = function(G0_220)
            local v1_220 = v0_220:IsA("Model")
            if not v1_220 then
              v1_220 = v0_220:GetPivot()
              if v1_220.Position == Vector3.zero then
                return nil
              end
            end
            v1_220 = string.sub(v0_220.Name, -6, -1)
            if v1_220 ~= " Fruit" then
              if v0_220.Name == "Fruit " then
              else
                local v3_220 = v0_220:FindFirstChild("Handle")
                if v3_220 then
                end
                return true, upval_0.Fruits, v0_220
              end
            end
          end

          v33_181 = v0_181.Managers["EspManager"].new("Fruit", workspace, v36_181)

          local v36_181 = function(G0_215)
            local v1_215 = v0_215:IsA("BasePart")
            if not v1_215 then
              v1_215 = v0_215.Name:find("Flower")
              if not v1_215 then
                return true, v0_215.Color
              end
            end
          end

          v33_181 = v0_181.Managers["EspManager"].new("Flower", workspace, v36_181)

          local v36_181 = function(G0_245)
            local v1_245 = v0_245:GetAttribute("IsDisabled")
            return not v1_245, upval_0.Chests[v0_245.Name]
          end

          local v37_181 = function(G0_207)
            local v1_207 = v0_207:GetAttribute("IsDisabled")
            return not v1_207
          end

          v33_181 = v0_181.Managers["EspManager"].new("Chests", upval_22, v36_181, v37_181)

          local v36_181 = function(G0_219)
            local v1_219, v2_219, v3_219 = pairs(v0_219:GetAttributes())

            while true do
              return true, upval_0.Berries, v5_219, v0_219.Parent

              for v4_219, v5_219 in v1_219 do
              end
          end

          local v37_181 = function(G0_209)
            local v1_209 = v0_209:FindFirstChild("Berries")
            if not v1_209 then
              local v1_209, v2_209, v3_209 = pairs(v0_209.Berries:GetAttributes())

              while true do
                return true

                for v4_209, v5_209 in v1_209 do
                end
              end
          end

          v33_181 = v0_181.Managers["EspManager"].new("Berries", upval_13, v36_181, v37_181)
          v32_181 = upval_1["IsBlacklistedExecutor"]()
          if v32_181 then
            v10_181["Visual"]:AddSection("Aimbot Nearest")
            v10_181["Visual"]:AddToggle({ "Aimbot Gun", false, v37_181 })
            v10_181["Visual"]:AddToggle({ "Aimbot Tap", false, v37_181 })
            v10_181["Visual"]:AddToggle({ "Aimbot Skills", false, v37_181 })
            v10_181["Visual"]:AddToggle({ "Ignore Mobs", true, v37_181 })
          end
          v10_181["Visual"]:AddSection("ESP")
          if upval_1.GameData.Sea == 2 then
            v10_181["Visual"]:AddToggle({
              "ESP Flowers",
              false,
              v37_181,
              "Esp-Flower",
            })
          end
          v10_181["Visual"]:AddToggle({
            "ESP Players",
            false,
            v37_181,
            "Esp-Players",
          })
          v10_181["Visual"]:AddToggle({
            "ESP Fruits",
            false,
            v37_181,
            "Esp-Fruits",
          })
          v10_181["Visual"]:AddToggle({
            "ESP Berries",
            false,
            v37_181,
            "Esp-Berry",
          })
          v10_181["Visual"]:AddToggle({
            "ESP Chests",
            false,
            v37_181,
            "Esp-Chests",
          })
          v10_181["Visual"]:AddToggle({
            "ESP Islands",
            false,
            v37_181,
            "Esp-Island",
          })
          v10_181["Visual"]:AddSection("Visual")

          local v36_181 = function()
            local v1_226 = game:GetService("ReplicatedStorage")
            local v0_226 = require(v1_226.Effect.Container.UzothSpec)
            v0_226({ Position = upval_0.Character.PrimaryPart.Position })
          end

          v10_181["Visual"]:AddButton({ "Meteor Rain", v36_181 })

          local v36_181 = function()
            local v0_214 = upval_0.Backpack:FindFirstChild("Portal-Portal")
            if v0_214 then
              v0_214 = upval_0.Character:FindFirstChild("Portal-Portal")
            end
            if not v0_214 then
              local v2_214, v3_214 = getconnections(v0_214.Activated)

              while true do
                local v6_214 = debug.getupvalues(v5_214.Function)
                if #v6_214 == 9 then

                  while true do
                    v6_214 = task.wait()
                    if not v6_214 then
                      if not v0_214 then
                        v6_214 = v0_214:IsDescendantOf(game)
                        if not v6_214 then
                          debug.setupvalue(v5_214.Function, 2, 0)
                        end
                      end
                    end
                  end
                end

                for v4_214, v5_214 in next do
                end
              end
          end

          v10_181["Visual"]:AddButton({ "Remove Portal Dash Cooldown", v36_181 })
          local v30_181, v31_181, v32_181 = ipairs({
            ["Players"] = v33_181,
            Islands = v32_181,
            ["Fruits"] = v33_181,
            ["Flowers"] = v33_181,
            ["Chests"] = v33_181,
            ["Berries"] = v33_181,
          })

          while true do
            v10_181["Shop"]:AddSection({ v31_181.Islands, "Enabled" })
            local v35_181, v36_181, v37_181 = ipairs(v34_181[2])

            while true do
              local v41_181 = type("Enabled"[2])
              if v41_181 == "table" then

                local v40_181 = function()
                  upval_0(unpack(upval_1[2]))
                end

              end
              v10_181["Shop"]:AddButton({ "Enabled"[1], v40_181 })

              for v38_181, v39_181 in v35_181 do
              end

              for v33_181, v34_181 in v30_181 do
              end

              local v32_181 = function()
                if getclipboard then
                end
                local v0_234 = loadstring(fromclipboard())
                v0_234()
              end

              local v33_181 = function(G0_217)
                local v1_217 = v0_217:gsub("\
", "")
                v1_217 = v1_217:gsub("```", "")
                v1_217 = v1_217:gsub("`", "")
                v1_217 = v1_217:find("-")
                if not v1_217 then
                  return v1_217
                end
                v1_217 = v1_217:gsub("v", "-")
                v1_217 = v1_217:gsub("q", "00")
                v1_217 = v1_217:gsub("x", "22")
                v1_217 = v1_217:gsub("f", "11")
                v1_217 = v1_217:gsub("d", "44")
                v1_217 = v1_217:gsub("a", "55")
                v1_217 = v1_217:gsub("h", "66")
                v1_217 = v1_217:gsub("s", "77")
                v1_217 = v1_217:gsub("j", "88")
                v1_217 = v1_217:gsub("g", "99")
                v1_217 = v1_217:gsub("i", "33")
                v1_217 = v1_217:gsub("y", "1")
                v1_217 = v1_217:gsub("p", "2")
                v1_217 = v1_217:gsub("u", "3")
                v1_217 = v1_217:gsub("z", "4")
                v1_217 = v1_217:gsub("o", "5")
                v1_217 = v1_217:gsub("l", "6")
                v1_217 = v1_217:gsub("r", "7")
                v1_217 = v1_217:gsub("k", "8")
                v1_217 = v1_217:gsub("t", "9")
                v1_217 = v1_217:gsub("e", "0")
                return v1_217:lower(v1_217)
              end

              local v34_181 = function(G0_201)
                return upval_0(v0_201)
              end

              local v35_181 = function(G0_185)
                upval_0.__ServerBrowser:InvokeServer("teleport", v0_185)
              end

              local v36_181 = function()
                if getclipboard then
                end
                upval_0(fromclipboard())
              end

              local v39_181 = function(G0_244)
                if not v0_244 then
                  upval_0.Hooking:EnableBypass()
                end
                if not v0_244 then
                  if upval_3 then
                  else
                  end
                end
                upval_2 = v0_244
                upval_1.WalkSpeedBypass = false
              end

              local v40_181 = function(G0_237)
                if not upval_2 then
                  if v0_237 then
                  else
                  end
                end
                upval_1 = v0_237
                upval_0.WalkSpeedBypass = false
              end

              local v41_181 = function(G0_231)
                upval_0.WalkOnWater = v0_231
                local v1_231 = upval_1:WaitForChild("WaterBase-Plane", 9000000000)
                if upval_2 then
                end
                local v3_231 = Vector3.new(v1_231.Size.X, 113, v1_231.Size.Z)
                upval_2 = v1_231.Size

                while true do
                  local v4_231 = task.wait(0.25)
                  if not v4_231 then
                    if not upval_0.WalkOnWater then
                      v4_231 = upval_3.IsAlive(upval_4.Character)
                      if not v4_231 then
                        if not upval_4.Character.Humanoid.Sit then
                          v1_231.Size = v1_231.Size
                        end
                      end
                    end
                    v1_231.Size = v3_231
                  end
                end
              end
              v1_231.Size = v1_231.Size
              end

              local v42_181 = function(G0_194)
                upval_0.AntiAFK = v0_194

                while true do
                  if not upval_0.AntiAFK then
                    upval_1:CaptureController()
                    upval_1:ClickButton1(upval_1)
                    task.wait(600)
                  end
                end
              end

              local v43_181 = function(G0_193)
                upval_0.ActiveRaceV3 = v0_193

                while true do
                  if not upval_0.ActiveRaceV3 then
                    local v1_193 = upval_1.Race:FindFirstChild("Evolved")
                    if not v1_193 then
                      upval_2.CommE:FireServer("ActivateAbility")
                    else
                      upval_1.Race.ChildAdded:Wait()
                    end
                    if not upval_3.SmoothMode then
                      if 2.5 then
                      else
                      end
                    end
                    task.wait(1)
                  end
                end
              end

              local v44_181 = function(G0_189)
                upval_0.ActiveRaceV4 = v0_189

                while true do
                  if not upval_0.ActiveRaceV4 then
                    if upval_1.Character then
                      local v2_189 = upval_1.CharacterAdded:Wait()
                    end
                    v2_189 = v2_189:FindFirstChild("RaceTransformed")
                    local v3_189 = v2_189:FindFirstChild("RaceEnergy")
                    if not v3_189 then
                      if 1 <= v3_189.Value then
                        if not v2_189 then
                          if v2_189.Value then
                            local v4_189 = upval_1.Backpack:FindFirstChild("Awakening")
                            if v4_189 then
                              v4_189 = v2_189:FindFirstChild("Awakening")
                            end
                            local v5_189 = v4_189:FindFirstChild("RemoteFunction")
                            if not v5_189 then
                              v4_189.RemoteFunction:InvokeServer(true)
                            end
                          end
                        end
                      end
                    end
                    if not upval_2.SmoothMode then
                      if 1 then
                      else
                      end
                    end
                    task.wait(0.5)
                  end
                end
              end

              if not IsOwner then
                v10_181["Misc"]:AddSection("Executor")
                v10_181["Misc"]:AddButton({ "Execute Clipboard", v32_181 })
              end
              if not upval_1["JobIds"] then
                v10_181["Misc"]:AddSection("Join Server")
                local v45_181 = v10_181["Misc"]["AddTextBox"]({
                  "Input Job Id",
                  "1",
                  true,
                  v35_181,
                  "JobId",
                })
                v45_181["OnChanging"] = v34_181
                v10_181["Misc"]:AddButton({ "Join Clipboard", v36_181 })
              end
              v10_181["Misc"]:AddSection("Settings")
              v10_181["Misc"]:AddDropdown({
                "Farm Mode",
                v49_181,
                "Up",
                v51_181,
                "S-FarmMode",
              })

              local v53_181 = function(G0_241)
                local v2_241 = Vector3.new(0, v0_241, 0)
                upval_0.FarmPos = v2_241
                upval_0.FarmDistance = v0_241
              end

              v10_181["Misc"]:AddSlider({
                "Farm Distance",
                5,
                30,
                1,
                15,
                v53_181,
                "S-Distance",
              })
              v10_181["Misc"]:AddSlider({
                "Tween Speed",
                50,
                300,
                5,
                200,
                v53_181,
                "S-TweenSpeed",
              })
              v10_181["Misc"]:AddSlider({
                "Bring Mobs Distance",
                50,
                400,
                10,
                250,
                v53_181,
                "S-BringDistance",
              })
              v10_181["Misc"]:AddToggle({
                "Bring Mobs",
                true,
                v50_181,
                "S-BringMobs",
              })
              v10_181["Misc"]:AddToggle({
                "Auto Haki",
                true,
                v50_181,
                "S-AutoBuso",
              })
              v10_181["Misc"]:AddToggle({
                "Auto Attack",
                true,
                v50_181,
                "S-AutoClick",
              })
              v10_181["Misc"]:AddToggle({
                "Auto Shoot",
                false,
                v50_181,
                "S-AutoShoot",
              })
              v10_181["Misc"]:AddToggle({
                ["Desc"] = "Wait 75 seconds to take the next mission",
                "Take Quest Debounce",
                false,
                v50_181,
                "S-QuestDenounce",
              })
              v10_181["Misc"]:AddSection("Codes")
              v10_181["Misc"]:AddButton({ "Redeem all Codes", upval_12["AllCodes"] })
              v10_181["Misc"]:AddSection("Server")

              local v49_181 = function()
                upval_0:ServerHop()
              end

              v10_181["Misc"]:AddButton({ "Server Hop", v49_181 })

              local v49_181 = function()
                upval_0.Rejoin()
              end

              v10_181["Misc"]:AddButton({ "Rejoin", v49_181 })
              v10_181["Misc"]:AddSection("Team")
              v10_181["Misc"]:AddButton({ "Join Pirates Team", upval_25["Pirates"] })
              v10_181["Misc"]:AddButton({ "Join Marines Team", upval_25["Marines"] })
              v10_181["Misc"]:AddSection("Race")
              v10_181["Misc"]:AddToggle({
                "Auto Active Race V3",
                false,
                v43_181,
                "S-RaceV3",
              })
              v10_181["Misc"]:AddToggle({
                "Auto Active Race V4",
                false,
                v44_181,
                "S-RaceV4",
              })
              v10_181["Misc"]:AddSection("Menu")

              local v49_181 = function()
                local v0_186 = require(upval_0.PlayerGui.Main.UIController.FruitShop)
                v0_186:Open("FruitDealer")
              end

              v10_181["Misc"]:AddButton({ "Devil Fruit Shop", v49_181 })

              local v49_181 = function()
                local v0_182 = require(upval_0.PlayerGui.Main.UIController.FruitShop)
                v0_182:Open("AdvancedFruitDealer")
              end

              v10_181["Misc"]:AddButton({ "Advanced Fruit Dealer", v49_181 })

              local v49_181 = function()
                upval_0("getTitles")
                upval_1.PlayerGui.Main.Titles.Visible = true
              end

              v10_181["Misc"]:AddButton({ "Titles", v49_181 })

              local v49_181 = function()
              end

              v10_181["Misc"]:AddButton({ "Haki Color", v49_181 })
              v45_181 = upval_1["IsBlacklistedExecutor"]()
              if v45_181 then
                v10_181["Misc"]:AddSection("Local-Player")
                v10_181["Misc"]:AddToggle({
                  "Enable Speed Hack",
                  false,
                  v39_181,
                  "M-WalkSpeed:A",
                })
                v10_181["Misc"]:AddSlider({
                  "Walk Speed",
                  10,
                  300,
                  5,
                  150,
                  v40_181,
                  "M-WalkSpeed:B",
                })
              end
              v10_181["Misc"]:AddSection("Visual")
              v10_181["Misc"]:AddButton({ "Remove Fog", upval_12["RemoveFog"] })
              v10_181["Misc"]:AddSection("More FPS")
              v10_181["Misc"]:AddToggle({
                ["Desc"] = "Reduces calculation speed to improve FPS",
                "Smooth Farm Mode",
                false,
                v50_181,
                "SmoothFarm",
              })

              local v50_181 = function(G0_211)
                upval_0.Assets.GUI.DamageCounter.Enabled = not v0_211
              end

              v10_181["Misc"]:AddToggle({
                "Remove Damage",
                false,
                v50_181,
                "M-DamageCounter",
              })

              local v50_181 = function(G0_210)
                upval_0.PlayerGui.Notifications.Enabled = not v0_210
              end

              v10_181["Misc"]:AddToggle({
                "Remove Notifications",
                false,
                v50_181,
                "M-Notifications",
              })
              v10_181["Misc"]:AddSection("Others")
              v10_181["Misc"]:AddToggle({
                "Walk On Water",
                true,
                v41_181,
                "M-WalkOnWater",
              })
              v10_181["Misc"]:AddToggle({
                "Anti AFK",
                true,
                v42_181,
                "M-AntiAFK",
              })
              if upval_1.GameData.Sea == 3 then
                v10_181["Items"]:AddSection("Dragon Dojo")
                v9_181.Toggle(v10_181["Items"], { "Auto Dojo Trainer Quest", "Automatically completes Dojo Trainer quests" }, "DojoTrainer")
                v9_181.Toggle(v10_181["Items"], { "Auto Dragon Hunter Quest", "Automatically completes Dragon Hunter quests" }, "DragonHunter")
                v9_181.Toggle(v10_181["Items"], { "Auto Draco V2 & V3", "Evolves the Draco Race to V2 and V3" }, "DracoV2V3")
                v10_181["Items"]:AddSection("Farm")
                v9_181.Toggle(v10_181["Items"], { "Auto Elite Hunter", "Automatically completes Elite Hunter quests" }, "EliteHunter")
                v9_181.Toggle(v10_181["Items"], { "Auto Rip Indra", "Activates the plates and summons Rip Indra" }, "RipIndra")
                v9_181.Toggle(v10_181["Items"], { "Auto Cake Prince", "Automatically summons the Cake Prince" }, "CakePrince")
                v9_181.Toggle(v10_181["Items"], { "Auto Dough King", "Automatically summons the Dough King" }, "DoughKing")
                v10_181["Items"]:AddSection("Sword")
                v9_181.Toggle(v10_181["Items"], { "Auto Collect Yama", "Automatically collects the Yama sword after defeating 30 Elite Hunters" }, "Yama")
                v9_181.Toggle(v10_181["Items"], { "Auto Tushita", "Solves the Tushita puzzle and defeats Longma" }, "Tushita")
                v9_181.Toggle(v10_181["Items"], { "Auto Cursed Dual Katana", "Complete the Cursed Dual Katana puzzle" }, "CursedDualKatana")
                v10_181["Items"]:AddSection("Quest")
                v9_181.Toggle(v10_181["Items"], { "Auto Citizen Quest" }, "Citizen")
                v9_181.Toggle(v10_181["Items"], { "Auto Rainbow Haki" }, "RainbowHaki")
              else
                if upval_1.GameData.Sea == 2 then

                  local v32_181 = function(G0_198)
                    upval_0.LegendSword = v0_198

                    while true do
                      local v1_198 = task.wait()
                      if not v1_198 then
                        if not upval_0.LegendSword then
                          v1_198 = upval_1("LegendarySwordDealer", "1")
                          local v2_198 = type(v1_198)
                          if v2_198 == "string" then
                            if not upval_2[v1_198] then
                              task.wait(13500)
                            end
                          end
                          if 2000000 <= upval_3.Value then
                            upval_1("LegendarySwordDealer", "2")
                          end
                        end
                        v2_198 = upval_3:GetPropertyChangedSignal("Value")
                        v2_198:Wait()
                      end
                    end
                    task.wait(5)
                  end
                end
              end
                  end

                  v10_181["Items"]:AddSection("Third Sea")
                  v9_181.Toggle(v10_181["Items"], { "Auto Third Sea", "Automatically unlocks access to the Third Sea" }, "ThirdSea")
                  v9_181.Toggle(v10_181["Items"], { "Auto Kill Don Swan", "Automatically defeats Don Swan" }, "DonSwan")
                  v10_181["Items"]:AddSection("Bosses")
                  v9_181.Toggle(v10_181["Items"], { "Auto Darkbeard", "Automatically spawns and defeats Darkbeard" }, "Darkbeard")
                  v9_181.Toggle(v10_181["Items"], { "Auto Cursed Captain", "Automatically summons and defeats the Cursed Captain" }, "CursedCaptain")
                  v10_181["Items"]:AddSection("Law")
                  v9_181.Toggle(v10_181["Items"], { "Auto Kill Law", "Automatically spawns and defeats Law (Order)" }, "Order")
                  v10_181["Items"]:AddToggle({
                    ["Desc"] = "Buy the raid law Microchip",
                    "Auto Buy Microchip",
                    false,
                    v38_181,
                    "S-FullyLaw",
                  })
                  v10_181["Items"]:AddSection("Sword")
                  v10_181["Items"]:AddToggle({
                    ["Desc"] = "Automatically purchases Legendary Swords when available",
                    "Auto Buy Legendary Sword",
                    false,
                    v32_181,
                    "LegendSword",
                  })
                  v9_181.Toggle(v10_181["Items"], { "Auto Rengoku", "Automatically kill Ice Admiral to unlock the Rengoku sword" }, "Rengoku")
                  v10_181["Items"]:AddSection("Race")
                  v9_181.Toggle(v10_181["Items"], { "Auto Race V2", "Automatically evolves the Race to V2" }, "RaceV2")
                  v9_181.Toggle(v10_181["Items"], { "Auto Race V3", "Mink, Human & Shark" }, "RaceV3")
                  v10_181["Items"]:AddSection("Bartilo")
                  v9_181.Toggle(v10_181["Items"], { "Auto Bartilo Quest", "Req: Level 850" }, "Bartilo")
                else
                  if upval_1.GameData.Sea == 1 then
                    v10_181["Items"]:AddSection("Second Sea")
                    v9_181.Toggle(v10_181["Items"], { "Auto Second Sea", "Automatically unlocks access to the Second Sea" }, "SecondSea")
                    v10_181["Items"]:AddSection("Swords")
                    v9_181.Toggle(v10_181["Items"], { "Auto Unlock Saber", "Automatically unlocks the Saber Sword" }, "Saber")
                    v9_181.Toggle(v10_181["Items"], { "Auto Pole V1", "Kill Thunder God" }, "PoleV1")
                    v9_181.Toggle(v10_181["Items"], { "Auto Saw Sword", "Kill The Saw" }, "TheSaw")
                  end
                end
              end
              v10_181["Items"]:AddSection("Berries")
              v9_181.Toggle(v10_181["Items"], { "Auto Collect Berries" }, "BerryBush")
              v10_181["Items"]:AddToggle({
                "Auto Berry Hop",
                false,
                v37_181,
                "S-BerryHop",
              })
              if upval_1.GameData.Sea ~= 1 then
                if not v0_181.Managers.QuestManager["GetColorsList"] then

                  local v32_181 = function(G0_197)
                    upval_0.barista_cousin = v0_197
                  end

                  while true do
                    if not upval_0.barista_cousin then
                      local v1_197, v2_197 = upval_1("BaristaCousin", "ColorsDealer", "1")
                      local v3_197 = type(v1_197)
                      if v3_197 == "string" then
                        v3_197 = upval_1("ColorsDealer", "2")
                        if v3_197 ~= 1 then
                          if v3_197 == 2 then
                          else
                            task.wait(250)
                          end
                        end
                      end
                      if v3_197 == 0 then
                      end
                      local v4_197 = upval_2:GetPropertyChangedSignal("Value")
                      v4_197:Wait()
                    end
                  end
                  task.wait(5)
                end
              end
                  end

                  v10_181["Items"]:AddSection("Aura Color")
                  v37_181 = v0_181.Managers.QuestManager["GetColorsList"]()
                  v10_181["Items"]:AddDropdown(v10_181["Items"], {
                    "Select Aura",
                    v37_181,
                    false,
                    v39_181,
                    "S-Aura",
                  })
                  v9_181.Toggle(v10_181["Items"], { "Auto Craft Aura Color" }, "AuraColor")
                  v10_181["Items"]:AddToggle({
                    "Auto Craft Hop",
                    false,
                    v38_181,
                    "S-CraftHop",
                  })
                  v10_181["Items"]:AddToggle({
                    "Auto Barista Cousin",
                    false,
                    v32_181,
                    "B-Cousin",
                  })
                end
              end
  end

  local v53_1 = function(G0_143)
    if upval_0.loadedFarm then
      upval_0.loadedFarm = true
      task.spawn(upval_1.RunFunctions.FarmQueue, upval_2)
    end
  end

  local v53_1 = function(G0_23)
    table.clear(upval_0)

    local v2_23 = function(G0_47, G1_47, G2_47)
      if v2_47 == false then
      end
      if upval_0[v0_47] then
        upval_0[v0_47] = v1_47
        table.insert(upval_1, { Name = v0_47, Function = v1_47 })
        return nil
      end
      upval_0[v0_47] = v1_47
      local v3_47, v4_47, v5_47 = ipairs(upval_1)

      while true do
        if v7_47.Name == v0_47 then
          v7_47.Function = v1_47
        else

          for v6_47, v7_47 in v3_47 do
          end
        end
    end

    local v29_23 = Vector3.new(0, 3, 0)
    local v30_23 = Vector3.new(0, 5, 0)
    local v31_23 = Vector3.new(0, 50, 0)
    local v32_23 = Vector3.new(0, -10, 0)
    local v33_23 = CFrame.new(-1926, 13, 1738)
    local v34_23 = CFrame.new(-5556, 300, -2988)
    local v35_23 = CFrame.new(914, 126, 33100)
    local v36_23 = CFrame.new(-5410, 314, -2628)
    local v37_23 = CFrame.new(-5561, 314, -2663)
    local v38_23 = CFrame.new(-8932.85, 142.87, 6063.31)
    local v39_23 = CFrame.new(1346, 37, -1329)
    local v40_23 = CFrame.new(-2103, 70, -12165)
    local v41_23 = CFrame.new(224, 25, -12771)
    local v42_23 = CFrame.new(3779, 16, -3500)
    local v43_23 = CFrame.new(912, 186, 33591)
    local v44_23 = CFrame.new(-5417, 313, -2822)
    local v45_23 = CFrame.new(-9513, 164, 5786)
    local v46_23 = CFrame.new(-1461, 30, -51)
    local v47_23 = CFrame.new(5864, 1209, 810)
    local v48_23 = CFrame.new(5251, 20, 454)
    local v49_23 = CFrame.new(-7739, 5657, -2289)
    local v50_23 = CFrame.new(-690, 15, 1583)
    local v51_23 = CFrame.new(-26952, 21, 329)
    local v52_23 = CFrame.new(-462, 73, 300)
    local v53_23 = CFrame.new(2289, 15, 808)
    local v54_23 = CFrame.new(-2777, 73, -3570)
    local v55_23 = CFrame.new(-1988, 124, -70)
    local v56_23 = CFrame.new(-12512, 340, -9872)
    local v57_23 = CFrame.new(-12445, 332, -7676)
    local v58_23 = CFrame.new(-12445, 332, -7676)
    local v59_23 = upval_2:WaitForChild("RF/InteractSubclassQuest")
    local v60_23 = upval_2:WaitForChild("RF/InteractDragonQuest")
    local v61_23 = upval_2:WaitForChild("RF/StartSubclassQuest")
    local v62_23 = upval_2:WaitForChild("RE/TouchKitsuneStatue")
    local v63_23 = upval_2:WaitForChild("RE/DragonDojoEmber")
    local v64_23 = upval_2:WaitForChild("RF/JuiceNetworkRF")
    local v65_23 = upval_2:WaitForChild("RF/DragonHunter")
    local v66_23 = upval_2:WaitForChild("RF/ClaimBerry")
    local v67_23 = upval_3:WaitForChild("SubclassNetwork")
    local v68_23 = upval_3:WaitForChild("QuestUpdate")
    local v79_23 = Vector3.new(0, 75, 0)
    local v81_23 = CFrame.new(-13335, 380, -7660)
    local v82_23 = CFrame.new(-13138, 380, -7713)
    local v83_23 = CFrame.new(-13298, 380, -7876)
    local v84_23 = CFrame.new(-13512, 380, -7983)
    v81_23 = CFrame.new(778, 110, 1129)
    v82_23 = CFrame.new(1018, 110, 1128)
    v83_23 = CFrame.new(1020, 110, 1366)
    v81_23 = CFrame.new(-710, 382, -11150)
    v81_23 = CFrame.new(-12131, 578, -6707)
    v81_23 = CFrame.new(-13350, 332, -7645)
    v82_23 = CFrame.new(-12360, 603, -6551)
    v83_23 = CFrame.new(-8654, 141, 6169)
    v83_23 = CFrame.new(-8760, 142, 6018)
    v83_23 = CFrame.new(-9680, 6, 6346)
    v83_23 = CFrame.new(-10139, 154, 6001)
    v83_23 = CFrame.new(-9529, 6, 6039)
    v83_23 = CFrame.new(-9758, 270, 6291)
    v83_23 = CFrame.new(-9576, 6, 6230)
    local v85_23 = ToDictionary({ "Sea Beast" })
    local v86_23 = ToDictionary({
      "Human",
      "Skypiea",
      "Fishman",
      "Mink",
      "Cyborg",
      "Ghoul",
    })
    local v87_23 = BrickColor.new("Lime green")
    local v88_23 = ToDictionary({ "Shark" })
    v88_23 = ToDictionary({ "Terrorshark" })

    local v88_23 = function()
      if not upval_0 then
        local v0_48 = upval_1(upval_0)
        if not v0_48 then
          return upval_0
        end
      end
      local v0_48, v1_48, v2_48 = pairs(upval_2.Bosses)

      while true do
        local v5_48 = upval_1(v3_48)
        if not v5_48 then
          upval_0 = v3_48
          return v3_48
        end

        for v3_48, v4_48 in v0_48 do
        end
    end

    local v89_23 = function()
      local v0_68 = upval_0:GetUnlockedHakiColors()
      local v4_68, v5_68, v6_68 = ipairs(upval_1["Boat Castle"].Summoner.Circle:GetChildren())

      while true do
        local v9_68 = v8_68:IsA("BasePart")
        if not v9_68 then
          v9_68 = v8_68:FindFirstChild("Part")
          if not v9_68 then
            if v8_68.Part.BrickColor == upval_2.Hot_Green then
            else
              if not v0_68[upval_2[v8_68.BrickColor.Name]] then
                local v11_68 = upval_3:DistanceFromCharacter(v8_68.Position)
                if v11_68 <= 3 then
                  upval_4(place.CFrame + upval_5)
                  v11_68 = upval_6:FindFirstChild("RF/FruitCustomizerRF")
                  v11_68:InvokeServer({ StorageName = place_color_name, Type = "AuraSkin", Context = "Equip" })
                else
                  upval_4(v8_68.CFrame)
                end
              end
            end
          end
        end

        for v7_68, v8_68 in v4_68 do
        end
        return 0 + 1
    end

    local v90_23 = function()
      fireclickdetector(upval_0.Waterfall.SealedKatana.Hitbox.ClickDetector)
    end

    local v91_23 = function(G0_88, G1_88, G2_88)
      if not v0_88.Quest then
        if v2_88 ~= false then
          if v2_88 then
            if not upval_0.BossQuest then
            else
              if v0_88.Level <= upval_1.Value then
                local v4_88 = upval_2:VerifyQuest(v1_88)
                if v4_88 then
                  if v0_88.Quest[3] then
                  end
                  upval_2:StartQuest(v0_88.Quest[1], 3, v0_88.Quest[2])
                  return "Getting Boss Quest: " .. v1_88
                end
              end
            end
          end
        end
      end
      v4_88 = upval_3(v1_88)
      if not v4_88 then
        if not v4_88.PrimaryPart then
        end
      end
      if not v0_88.Position then
      end
    end

    local v92_23 = function()
      local v2_57, v3_57, v4_57 = ipairs(workspace:GetChildren())

      while true do
        if v6_57.Name == "EmberTemplate" then
          local v7_57 = v6_57:FindFirstChild("Part")
          if not v7_57 then
            if 0 < v6_57.Part.Position.Y then
              v7_57 = upval_0:DistanceFromCharacter(v6_57.Part.Position)
              if v7_57 < math.huge then
              end
            end
          end
        end

        for v5_57, v6_57 in v2_57 do
        end
        return v6_57.Part
    end

    local v93_23 = function()
      if 1000 <= upval_0.Value then
        local v0_81 = VerifyTool("Microchip")
        if v0_81 then
          upval_1("BlackbeardReward", "Microchip", "2")
          v0_81 = tick()
        end

        while true do
          task.wait()
          local v1_81 = VerifyTool("Microchip")
          if v1_81 then
            v1_81 = tick()
            if 5 < v1_81 - v0_81 then
            end
          end
        end
      end
    end

    local v94_23 = function()
      if not upval_0 then
        local v0_85 = upval_0:IsDescendantOf(upval_1)
        if not v0_85 then
          return upval_0
        end
      end
      v0_85 = upval_1.Waterfall.IslandModel:GetChildren()
      local v1_85, v2_85, v3_85 = ipairs(v0_85)

      while true do
        local v6_85 = v5_85:IsA("Model")
        if not v6_85 then
          if v5_85.Name == "Tree" then
            v6_85 = v5_85:FindFirstChild("Group")
            if not v6_85 then
              local v7_85 = v6_85:FindFirstChild("Meshes/bambootree")
            end
            if not v7_85 then
              if not v7_85.Anchored then
                upval_0 = v7_85
                return v7_85
              end
            end
          end
        end

        for v4_85, v5_85 in v1_85 do
        end
    end

    local v95_23 = function()
      local v0_37 = upval_0()
      if not v0_37 then
        local v1_37 = upval_1:DistanceFromCharacter(v0_37.Position)
        if v1_37 <= 3 then
          if not upval_2["Skull Guitar"] then
            v1_37 = VerifyTool("Skull Guitar")
            if not v1_37 then
              upval_3.Hooking:SetTarget(v0_37)
              upval_4("Skull Guitar")
              upval_3.FastAttack:ShootInTarget(v0_37.Position + upval_5)
            else
              upval_6("LoadItem", "Skull Guitar")
            end
            return nil
          end
          local v2_37 = upval_7:RandomTool()
          upval_4(v2_37, true)
          upval_3.UseSkills(v0_37, upval_8.SeaSkills)
        else
          if not v0_37 then
            return upval_9(v0_37.CFrame)
          end
        end
      end
    end

    local v96_23 = function()
      local v0_60 = upval_0:DistanceFromCharacter(upval_1.Zombies)
      if 10 <= v0_60 then
        return upval_2(upval_1.Zombies)
      end
      if not upval_0.Character then
      end
      if upval_0.Character.PrimaryPart then
        return nil
      end
      local v3_60, v4_60, v5_60 = ipairs(upval_3:GetChildren())

      while true do
        if v7_60.Name == "Living Zombie" then
          local v9_60 = upval_4(v7_60)
          if not v9_60 then
            if not v7_60.PrimaryPart then
              local v10_60 = CFrame.new(0, -15, -15)
              v7_60.PrimaryPart.CFrame = upval_0.Character.PrimaryPart.CFrame * v10_60
              v7_60.PrimaryPart.CanCollide = false
              v9_60 = Vector3.new(60, 60, 60)
              v7_60.PrimaryPart.Size = v9_60
              v7_60.Humanoid.WalkSpeed = 0
              v7_60.Humanoid.JumpPower = 0
              v7_60.Humanoid:ChangeState(14)
            end
          end
        end

        for v6_60, v7_60 in v3_60 do
        end
        pcall(sethiddenproperty, upval_0, "SimulationRadius", math.huge)
        if 5 < 0 + 1 then
          upval_5()
          EnableBuso()
        else
          v3_60 = upval_0.Character:FindFirstChildOfClass("Tool")
          if not v3_60 then
            v3_60 = upval_0.Character:FindFirstChildOfClass("Tool")
            v3_60.Parent = upval_0.Backpack
          end
        end
    end

    local v97_23 = function()
      local v0_92 = upval_0:FindFirstChild("QuestHaze")
      if not v0_92 then
        return "Yama", 2
      end
      v0_92 = upval_0:FindFirstChild("BoatQuest")
      if not v0_92 then
        return "Tushita", 1
      end
      v0_92 = upval_1:FindFirstChild("HellDimension")
      if not v0_92 then
        return "Yama", 3
      end
      v0_92 = upval_1:FindFirstChild("HeavenlyDimension")
      if not v0_92 then
        return "Tushita", 3
      end
      if upval_2["Alucard Fragment"] == 6 then
        return "FinalQuest"
      end
      local v0_92, v1_92, v2_92 = pairs(upval_3.Quests)

      while true do
        local v5_92 = upval_4("CDKQuest", "Progress", v3_92)
        if v5_92[v3_92] < -2 then
          return v4_92, v5_92[v3_92] + 2 * -1
        end
        if 0 <= v5_92[v3_92] then
          if v5_92[v3_92] < 3 then
            upval_4("CDKQuest", "StartTrial", v3_92)
            return v4_92, v5_92[v3_92] + 1
          end
        end

        for v3_92, v4_92 in v0_92 do
        end
    end

    local v98_23 = function(G0_35)
      local v1_35 = v0_35:FindFirstChild("Specs")
      if not v1_35 then
      end
      return v0_35.Specs.Enabled
    end

    local v99_23 = function(G0_45)
      if not upval_0 then
        local v1_45 = upval_0:IsDescendantOf(v0_45)
        if not v1_45 then
          v1_45 = upval_1(upval_0)
          if not v1_45 then
            return upval_0
          end
        end
      end
      local v1_45, v2_45, v3_45 = ipairs(v0_45.Core.VolcanoRocks:GetChildren())

      while true do
        local v6_45 = v5_45:FindFirstChild("VFXLayer")
        if not v6_45 then
          local v7_45 = upval_1(v6_45)
          if not v7_45 then
            upval_0 = v6_45
            return v6_45
          end
        end

        for v4_45, v5_45 in v1_45 do
        end
    end

    local v100_23 = function(G0_64)
      EnableBuso()
      upval_0:StopBoat()
      if v0_64.Name == "Leviathan Segment" then
        local v1_64 = v0_64:FindFirstChild("Head")
        if not v1_64 then
          local v2_64 = upval_0:RandomTool()
          upval_1(v2_64, true)
          upval_2.UseSkills(v0_64.Head.CFrame + upval_3.SegmentVector, upval_4.SeaSkills)
        end
      end
      v1_64 = v0_64:FindFirstChild("Head")
      if not v1_64 then
        v1_64 = CFrame.new(v0_64.Head.Position.X, 60, v0_64.Head.Position.Z)
        EnableBuso()
        upval_0:StopBoat()
        local v3_64 = upval_0:RandomTool()
        upval_1(v3_64, true)
        upval_2.UseSkills(v1_64, upval_4.SeaSkills)
      end
    end

    local v103_23 = function()
      if not upval_0.Tushita then
        local v0_89 = upval_1("rip_indra True Form")
        if not v0_89 then
          v0_89 = upval_2("rip_indra True Form")
          if not v0_89 then
            if not v0_89.PrimaryPart then
              upval_3(v0_89)
            else
              upval_4(upval_5)
            end
          end
          return true
        end
        return nil
      end
      v0_89 = upval_6:GetProgress("Tushita", "TushitaProgress")
      if not v0_89.OpenedDoor then
        local v1_89 = upval_1("Longma")
        if not v1_89 then
          return upval_7(upval_6.Bosses.Longma, "Longma")
        end
        return nil
      end
      v1_89 = VerifyTool("Holy Torch")
      if not v1_89 then

        for v4_89 = 1, #v0_89.Torches, 1 do
          if v0_89.Torches[v4_89] then
            upval_8("TushitaProgress", "Torch", v4_89)
          end
        end
        return true
      end
      v1_89 = upval_1("rip_indra True Form")
      if not v1_89 then
        upval_4(CFrame.new(5713, 38, 255))
        return true
      end
      if upval_9.EliteHunter then
        v1_89 = upval_10.EliteHunter()
      else
      end
      return false
    end

    if upval_1.GameData.Sea ~= 3 then
      v2_23("Tushita", v103_23, false)

      local v103_23 = function()
        local v0_98 = upval_0("Darkbeard")
        if not v0_98 then
          v0_98 = upval_1("Darkbeard")
          if not v0_98 then
            if not v0_98.PrimaryPart then
              upval_2(v0_98)
            else
              upval_3(upval_4)
            end
          end
          return true
        end
        v0_98 = VerifyTool("Fist of Darkness")
        if not v0_98 then
          upval_5("Fist of Darkness")
          upval_3(upval_4)
          return true
        end
      end

      if upval_1.GameData.Sea ~= 2 then
        v2_23("Darkbeard", v103_23, false)

        local v103_23 = function()
          local v0_51 = upval_0("Cursed Captain")
          if not v0_51 then
            v0_51 = upval_1("Cursed Captain")
            if not v0_51 then
              if not v0_51.PrimaryPart then
                upval_2(v0_51)
              else
                upval_3(upval_4)
              end
            end
            return true
          end
        end

        if upval_1.GameData.Sea ~= 2 then
          v2_23("CursedCaptain", v103_23, false)

          local v103_23 = function()
            local v0_77 = upval_0:FindFirstChild("Core")
            if v0_77 then
              v0_77 = upval_1:FindFirstChild("Core")
            end
            if not v0_77 then
              local v1_77 = upval_2(v0_77)
              if not v1_77 then
                if not v0_77.PrimaryPart then
                end
              end
            end
          end

          if upval_1.GameData.Sea ~= 2 then
            v2_23("Factory", v103_23, false)

            local v103_23 = function()
              if upval_0.Value >= 2300 then
                local v0_76 = upval_1:GetAttribute("MoonPhase")
                if v0_76 == 5 then
                  if not upval_2["Skull Guitar"] then
                  else
                    return nil
                  end
                end
              end
              v0_76 = upval_3:GetProgress("SkullGuitar", "GuitarPuzzleProgress", "Check")
              if v0_76 then
                local v1_76 = upval_4:DistanceFromCharacter(upval_5.GravestoneEvent.Position)
                if not v1_76 then
                  upval_6("gravestoneEvent", 2, true)
                else
                  upval_7(upval_5.GravestoneEvent)
                end
                return true
              end
              if not v0_76.Pipes then
                local v7_76 = upval_4:DistanceFromCharacter(upval_5.BuySkullGuitar.Position)
                if not v7_76 then
                  upval_6("soulGuitarBuy", true)
                else
                  upval_7(upval_5.BuySkullGuitar)
                end
                return true
              end
              if not v0_76.Trophies then
                upval_7(upval_5.Pipes)
                upval_8:NPCTalk(upval_5.Pipes, "GuitarPuzzleProgress", "Pipes")
              else
                if not v0_76.Ghost then
                  upval_7(upval_5.Trophies)
                  upval_8:NPCTalk(upval_5.Trophies, "GuitarPuzzleProgress", "Trophies")
                else
                  if not v0_76.Gravestones then
                    upval_7(upval_5.Ghost)
                    upval_8:NPCTalk(upval_5.Ghost, "GuitarPuzzleProgress", "Ghost")
                  else
                    if not v0_76.Swamp then
                      upval_7(upval_5.Gravestones)
                      upval_8:NPCTalk(upval_5.Gravestones, "GuitarPuzzleProgress", "Gravestones")
                    else
                      upval_9()
                    end
                  end
                end
              end
              return true
            end

            if upval_1.GameData.Sea ~= 3 then
              v2_23("SkullGuitar", v103_23, false)

              local v103_23 = function()
                if not upval_0["Cursed Dual Katana"] then
                  return nil
                end
                if upval_0.Tushita then
                  return upval_1.Tushita()
                end
                if upval_0.Yama then
                  local v0_86 = upval_1.Yama()
                  if v0_86 then
                    v0_86 = upval_1.EliteHunter()
                  end
                  return v0_86
                end
                if 350 <= upval_2.Tushita then
                  if 350 <= upval_2.Yama then
                    if upval_3.OpenedDoor then
                      local v4_86 = upval_5("CDKQuest", "OpenDoor")
                      if v4_86 ~= "opened" then
                        if v4_86 == "can" then
                          local v5_86 = upval_5("CDKQuest", "OpenDoor", true)
                          if not v5_86 then
                          else
                            upval_3.OpenedDoor = true
                            setclipboard("Destruindo porta")
                            v5_86 = upval_4.Turtle.Cursed:FindFirstChild("Breakable")
                            if not v5_86 then
                              upval_4.Turtle.Cursed.Breakable:Destroy()
                            end
                          end
                        end
                      end
                      return nil
                    end
                    if not upval_3.CurrentQuest.Quest then
                      if upval_3.CurrentQuest.Frags ~= upval_6["Alucard Fragment"] then
                      else
                        upval_3.CurrentQuest.Quest = v5_86
                        upval_3.CurrentQuest.Frags = upval_6["Alucard Fragment"]
                      end
                    end
                    if not upval_3.CurrentQuest.Quest[1] then
                      if not upval_3.CurrentQuest.Quest[2] then
                        local v7_86 = upval_8.CursedDualKatana[upval_3.CurrentQuest.Quest[1]][upval_3.CurrentQuest.Quest[2]](upval_3, upval_1)
                        if not v7_86 then
                          return upval_3.CurrentQuest.Quest[1] .. upval_3.CurrentQuest.Quest[2]
                        else
                          v7_86 = upval_8.CursedDualKatana[upval_3.CurrentQuest.Quest[1]](upval_3, upval_1)
                          if not v7_86 then
                            return upval_3.CurrentQuest.Quest[1]
                          else
                            if upval_2.Tushita < 350 then
                              if "Tushita" then
                              else
                              end
                            end
                            local v3_86 = VerifyTool("Yama")
                            if not v3_86 then
                              upval_9("Yama")
                              upval_10.ToolDebounce()
                              if not upval_11.PirateRaid then
                                v3_86 = upval_1.PirateRaid()
                                if v3_86 then
                                else
                                  if not upval_11.Fruits then
                                    v3_86 = upval_1.Fruits()
                                    if v3_86 then
                                    else
                                      if not upval_11.EliteHunter then
                                        v3_86 = upval_1.EliteHunter()
                                        if v3_86 then
                                        else
                                          v3_86 = upval_1.Bones()
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                              return v3_86
                            end
                            upval_5("LoadItem", {})
                            return "Getting 350 in: " .. "Yama"
                          end
                        end
                      end
                    end
                  end
                end
              end

              if upval_1.GameData.Sea ~= 3 then
                v2_23("CursedDualKatana", v103_23, false)

                local v103_23 = function()
                  local v0_27 = upval_0:FindFirstChild("l'Église de Prophétie")
                  if not v0_27 then
                    local v1_27 = upval_1:DistanceFromCharacter(v0_27.Position)
                    if v1_27 <= 150 then
                      v1_27 = upval_2("Awakener", "Check")
                      local v2_27 = type(v1_27)
                      if v2_27 == "table" then
                        if v1_27.Cost then
                        end
                        if upval_3.Value < 0 then
                        end
                        upval_2("Awakener", "Awaken")
                        upval_2("Awakener", "Teleport")
                      else
                        if v1_27 ~= 0 then
                        end
                      end
                    end
                  end
                  v1_27 = upval_4:IsRaiding()
                  if not v1_27 then
                    v1_27 = upval_5:GetRaidIsland()
                    if not v1_27 then
                      local v2_27, v3_27, v4_27 = ipairs(upval_6:GetChildren())

                      while true do
                        local v8_27 = upval_7(v6_27)
                        if not v8_27 then
                          if not v6_27.PrimaryPart then
                            if v1_27.Position - v6_27.PrimaryPart.Position.Magnitude <= 1000 then
                              if 0 < v6_27.PrimaryPart.Position.Y then
                                if upval_9.FarmMode ~= "Up" then
                                  if upval_9.FarmMode then
                                  else
                                  end
                                end
                              end
                            end
                          end
                        end

                        for v5_27, v6_27 in v2_27 do
                        end
                        v2_27 = upval_1:DistanceFromCharacter(v1_27.Position)
                        if v2_27 <= 3000 then
                          upval_10(v1_27.CFrame + upval_11)
                        end
                        return true
                      end
                      return true
                    end
                    v1_27 = VerifyTool("Special Microchip")
                    if not v1_27 then
                    end
                end

                if upval_1.GameData.Sea ~= 2 then
                  if upval_1.GameData.Sea ~= 3 then
                    v2_23("Raid", v103_23, false)

                    local v103_23 = function()
                      local v0_49 = upval_0:FindFirstChild("FrozenHeart")
                      if v0_49 then
                        if not upval_1.Segment then
                          local v1_49 = upval_2(upval_1.Segment)
                          if not v1_49 then
                            v1_49 = upval_1.Segment:GetAttribute("HealthEnabled")
                            if not v1_49 then
                              return upval_3(upval_1.Segment)
                            end
                          end
                        end
                        v1_49 = upval_4:GetChildren()

                        for v5_49 = 1, #v1_49, 1 do
                          local v8_49 = v1_49[v5_49].name:find("Leviathan")
                          if not v8_49 then
                            v8_49 = upval_2(v1_49[v5_49])
                            if not v8_49 then
                              v8_49 = v1_49[v5_49]:GetAttribute("HealthEnabled")
                              if not v8_49 then
                                upval_1.Segment = v1_49[v5_49]
                                return upval_3(v1_49[v5_49])
                              end
                            end
                          end
                        end
                      end
                    end

                    if upval_1.GameData.Sea ~= 3 then
                      v2_23("Leviathan", v103_23, false)

                      local v103_23 = function()
                        local v0_55 = upval_0.Enemies:GetTagged("PirateRaid")
                        if 0 >= #v0_55 then
                          local v1_55 = tick()
                          if v1_55 - upval_0.PirateRaid <= 10 then
                          else

                            for v4_55 = 1, #v0_55, 1 do
                              if not v0_55[v4_55].PrimaryPart then
                              end
                            end
                          end
                        end
                      end

                      if upval_1.GameData.Sea ~= 3 then
                        v2_23("PirateRaid", v103_23, false)

                        local v103_23 = function()
                          local v0_44 = workspace:FindFirstChild("Fruit ")
                          if v0_44 then
                            v0_44 = workspace:FindFirstChildOfClass("Tool")
                          end
                          if not v0_44 then
                            local v1_44 = v0_44:IsA("Model")
                            if v1_44 then
                              v1_44 = v0_44:IsA("Tool")
                              if not v1_44 then
                              else
                                v1_44 = v0_44:FindFirstChild("Handle")
                                if not v1_44 then
                                end
                                if v0_44.Handle.CFrame then
                                  local v2_44 = v0_44:IsA("Model")
                                  if not v2_44 then
                                    v2_44 = v0_44:GetPivot()
                                    if v2_44.Position ~= Vector3.zero then
                                    end
                                  end
                                end
                                if not v2_44 then
                                  v2_44 = upval_0:DistanceFromCharacter(v2_44.Position)
                                  if v2_44 <= 2 then
                                    upval_1(v2_44 + upval_2)
                                  else
                                    upval_1(v2_44)
                                  end
                                  return true
                                end
                              end
                            end
                          end
                        end

                        v2_23("Fruits", v103_23)

                        local v103_23 = function(G0_56)
                          local v1_56 = workspace:FindFirstChild("FireFlowers")
                          if not v1_56 then
                            local v2_56 = v1_56:GetChildren()

                            for v6_56 = 1, #v2_56, 1 do
                              local v8_56 = v2_56[v6_56]:IsA("Model")
                              if not v8_56 then
                                if v2_56[v6_56].PrimaryPart then
                                  v8_56 = v2_56[v6_56]:FindFirstChildOfClass("MeshPart")
                                end
                              end
                              if not v8_56 then
                                local v9_56 = upval_0:DistanceFromCharacter(v8_56.Position)
                                if v9_56 <= 3 then
                                  v9_56 = v2_56[v6_56]:FindFirstChild("ProximityPrompt")
                                  if not v9_56 then
                                    if not v2_56[v6_56].ProximityPrompt.Enabled then
                                      fireproximityprompt(v2_56[v6_56].ProximityPrompt)
                                      task.wait(0.5)
                                    else
                                      upval_1(v8_56.CFrame)
                                    end
                                  end
                                end
                                return "Collecting Fire Flower"
                              end
                            end
                          end
                          v2_56 = upval_2(upval_3.FireFlower)
                          if not v2_56 then
                            if not v2_56.PrimaryPart then
                              upval_4(v2_56, true)
                            else
                              upval_5:NPCs(upval_6["Forest Pirate"])
                            end
                          end
                          if v0_56 then
                          end
                          return "Getting Fire Flowers: %i/%i":format("Getting Fire Flowers: %i/%i", upval_7["Fire Flower"], 99)
                        end

                        if upval_1.GameData.Sea ~= 3 then
                          v2_23("FireFlowers", v103_23, false)

                          local v103_23 = function()
                            return upval_0:GetDracoRace(upval_0, upval_1)
                          end

                          if upval_1.GameData.Sea ~= 3 then
                            v2_23("DracoV2V3", v103_23, false)

                            local v103_23 = function()
                              if not upval_0["Dragon Talon"] then
                                if upval_0["Dragon Talon"] < 500 then
                                else
                                  local v1_46 = VerifyTool("Dragon Talon")
                                  if v1_46 then
                                    upval_1("BuyDragonTalon")
                                  else
                                    if upval_0["Dragon Talon"] then
                                      local v2_46 = GetToolMastery("Dragon Talon")
                                      upval_0["Dragon Talon"] = v2_46
                                    else
                                      v2_46 = GetToolMastery("Dragon Talon")
                                      upval_0["Dragon Talon"] = v2_46
                                      upval_2("Dragon Talon")
                                      upval_3.ToolDebounce()
                                      return upval_4.Bones()
                                    end
                                  end
                                  return true
                                end
                              end
                              return upval_5:BeltQuests(upval_5, upval_4)
                            end

                            if upval_1.GameData.Sea ~= 3 then
                              v2_23("DojoTrainer", v103_23, false)

                              local v103_23 = function()
                                if upval_0 == "Locked" then
                                  return nil
                                end
                                local v0_53 = upval_1()
                                if not v0_53 then
                                  upval_2(v0_53.CFrame)
                                  return "Colleting Blaze Ember"
                                end
                                if not upval_0 then
                                  if upval_0.Text then
                                  else
                                    local v1_53 = upval_3:DistanceFromCharacter(upval_4.Position)
                                    if v1_53 < 5 then
                                      v1_53 = upval_5:InvokeServer(upval_6.Check)
                                      upval_0 = v1_53
                                      if not upval_0 then
                                        if upval_0.Text then
                                          pcall(upval_5.InvokeServer, upval_5, upval_6.RequestQuest)
                                        else
                                          upval_2(upval_4)
                                        end
                                      end
                                    end
                                    return "Getting Dragon Hunter Quest"
                                  end
                                end
                                local v2_53 = upval_0.Text:find("Defeat")
                                if not v2_53 then
                                  v2_53 = upval_0.Text:find("Venomous")
                                  if not v2_53 then
                                    if "Venomous Assailant" then
                                    else
                                    end
                                  end
                                  local v3_53 = upval_7("Hydra Enforcer")
                                  if not v3_53 then
                                    if not v3_53.PrimaryPart then
                                      upval_9(v3_53, true)
                                    else
                                      if not upval_8["Hydra Enforcer"] then
                                        upval_10:NPCs(upval_8["Hydra Enforcer"])
                                      end
                                    end
                                  end
                                  return "Killing: " .. "Hydra Enforcer"
                                end
                                v2_53 = upval_0.Text:find("Destroy")
                                if not v2_53 then
                                  upval_11()
                                  return "Breaking Hydra Island Tree's"
                                end
                              end

                              if upval_1.GameData.Sea ~= 3 then
                                v2_23("DragonHunter", v103_23, false)

                                local v103_23 = function()
                                  local v0_24 = upval_0:GetSpawnedIsland("MysticIsland")
                                  if not v0_24 then
                                    v0_24 = upval_0:GetMirageFruitDealer()
                                    if not v0_24 then
                                      if not v0_24.PrimaryPart then
                                        upval_1(v0_24.PrimaryPart.CFrame)
                                        return true
                                      end
                                    end
                                  end
                                end

                                if upval_1.GameData.Sea ~= 3 then
                                  v2_23("MirageFruitDealer", v103_23, false)

                                  local v103_23 = function()
                                    local v0_32 = upval_0:FindFirstChild("MysticIsland")
                                    if not v0_32 then
                                      local v1_32 = upval_1:GetMirageGear(v0_32)
                                      if not v1_32 then
                                        if v1_32.Transparency < 1 then
                                          upval_2(v1_32.CFrame)
                                          return true
                                        end
                                      end
                                    end
                                  end

                                  if upval_1.GameData.Sea ~= 3 then
                                    v2_23("MirageGear", v103_23, false)

                                    local v103_23 = function()
                                      local v0_28 = upval_0:FindFirstChild("MysticIsland")
                                      if not v0_28 then
                                        return upval_1.ChestTween(upval_0.MysticIsland)
                                      end
                                    end

                                    v2_23("MirageChests", v103_23)

                                    local v103_23 = function()
                                      local v0_43 = upval_0:FindFirstChild("MysticIsland")
                                      if not v0_43 then
                                        local v1_43 = upval_1:GetMirageTop(v0_43)
                                      end
                                      if not v1_43 then
                                        local v4_43 = CFrame.new(0, 211.8, 0)
                                        upval_2(v1_43.CFrame * v4_43)
                                        return true
                                      end
                                    end

                                    if upval_1.GameData.Sea ~= 3 then
                                      v2_23("TeleportMirage", v103_23, false)

                                      local v103_23 = function()
                                        if upval_0["Volcanic Magnet"] then
                                          local v0_91 = upval_1:FindFirstChild("PrehistoricIsland")
                                          if v0_91 then
                                            if upval_2["Scrap Metal"] < 10 then
                                              return upval_3:Material(upval_3, "Leather + Scrap Metal")
                                            end
                                            if upval_2["Blaze Ember"] < 15 then
                                              return upval_4.DragonHunter()
                                            end
                                            v0_91 = upval_5:DistanceFromCharacter(upval_6.Position)
                                            if v0_91 < 3 then
                                              upval_7("CraftItem", "Craft", "Volcanic Magnet")
                                            else
                                              upval_8(upval_6)
                                            end
                                            return true
                                          end
                                        end
                                      end

                                      if upval_1.GameData.Sea ~= 3 then
                                        v2_23("CraftVolcanicMagnet", v103_23, false)

                                        local v103_23 = function()
                                          if 99 <= upval_0["Dinosaur Bones"] then
                                            return nil
                                          end
                                          local v0_90 = upval_1:GetAttribute("PrehistoricIslandParticipant")
                                          if not v0_90 then
                                            v0_90 = workspace:FindFirstChild("PrehistoricIsland")
                                            if not v0_90 then
                                              v0_90 = workspace:GetChildren()

                                              for v4_90 = 1, #v0_90, 1 do
                                                if v0_90[v4_90].Name == "DinoBone" then
                                                  local v6_90 = v0_90[v4_90]:IsA("BasePart")
                                                  if not v6_90 then
                                                    local v7_90 = workspace.PrehistoricIsland:GetPivot()
                                                    if v0_90[v4_90].Position - v7_90.Position.Magnitude <= 1500 then
                                                      v6_90 = upval_1:DistanceFromCharacter(v0_90[v4_90].Position)
                                                      if v6_90 <= 3 then
                                                        upval_2(v0_90[v4_90].CFrame + upval_3)
                                                      else
                                                        upval_2(v0_90[v4_90].CFrame)
                                                      end
                                                      v6_90 = tick()
                                                      upval_4 = v6_90
                                                      return "Collecting Dinosaur Bones"
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end

                                        if upval_1.GameData.Sea ~= 3 then
                                          v2_23("PrehistoricBones", v103_23, false)

                                          local v103_23 = function()
                                            local v0_39 = upval_0:GetSpawnedIsland("PrehistoricIsland")
                                            if not v0_39 then
                                              local v1_39 = v0_39:FindFirstChild("Core")
                                              if not v1_39 then
                                                local v2_39 = v1_39:FindFirstChild("SpawnedDragonEggs")
                                              end
                                              if not v2_39 then
                                                local v3_39 = v2_39:GetChildren()
                                                if 0 < #v3_39 then
                                                  v3_39 = v2_39:FindFirstChild("DragonEgg")
                                                  if not v3_39 then
                                                    local v4_39 = v3_39:FindFirstChild("Molten")
                                                  end
                                                  if not v4_39 then
                                                    local v5_39 = v4_39:FindFirstChild("ProximityPrompt")
                                                    if not v5_39 then
                                                      if not v4_39.ProximityPrompt.Enabled then
                                                        v5_39 = upval_1:DistanceFromCharacter(v4_39.Position)
                                                        if v5_39 < 3 then
                                                          fireproximityprompt(v4_39.ProximityPrompt)
                                                          task.wait(0.5)
                                                        else
                                                          upval_2(v4_39.CFrame)
                                                        end
                                                        v5_39 = tick()
                                                        upval_3 = v5_39
                                                        return "Collecting Dragon Egg"
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end

                                          if upval_1.GameData.Sea ~= 3 then
                                            v2_23("PrehistoricEgg", v103_23, false)

                                            local v103_23 = function()
                                              local v0_75 = upval_0:GetSpawnedIsland("PrehistoricIsland")
                                              if not v0_75 then
                                                local v1_75 = v0_75:GetAttribute("IsMinigameActive")
                                                if not v1_75 then
                                                  local v1_75, v2_75, v3_75 = ipairs(upval_1:GetChildren())

                                                  while true do
                                                    if v5_75.Name == "Lava Golem" then
                                                      if not v5_75.PrimaryPart then
                                                        if 0 < v5_75.PrimaryPart.Position.Y then
                                                          upval_2(v5_75, true)
                                                          local v7_75 = tick()
                                                          upval_3 = v7_75
                                                          return "Defeating Lava Golem"
                                                        end
                                                      end
                                                    end

                                                    for v4_75, v5_75 in v1_75 do
                                                    end
                                                  end
                                                end
                                            end

                                            if upval_1.GameData.Sea ~= 3 then
                                              v2_23("LavaGolem", v103_23, false)

                                              local v103_23 = function()
                                                local v0_41 = upval_0:GetSpawnedIsland("PrehistoricIsland")
                                                if not v0_41 then
                                                  local v1_41 = upval_0:GetPrehistoricActivationPrompt(v0_41)
                                                  if v1_41 then
                                                  end
                                                  local v2_41 = v1_41.Parent:FindFirstChild("InteriorLava")
                                                  if not v2_41 then
                                                    v1_41.Parent.InteriorLava:Destroy()
                                                  end
                                                  v2_41 = v0_41:GetAttribute("IsMinigameActive")
                                                  if not v2_41 then
                                                    v2_41 = tick()
                                                    local v3_41 = tick()
                                                    RemoveCanTouch = v3_41
                                                    upval_2 = v2_41
                                                    v2_41 = upval_3(v0_41)
                                                    if not v2_41 then
                                                      v3_41 = upval_4:DistanceFromCharacter(v2_41.Position)
                                                      if v3_41 < 5 then
                                                        local v4_41 = upval_1:RandomTool()
                                                        upval_5(v4_41, true)
                                                        upval_6.UseSkills(v2_41, upval_7.SeaSkills)
                                                      else
                                                        upval_8(v2_41.CFrame, false, false, true)
                                                      else
                                                        upval_8(v1_41.CFrame, false, false, true)
                                                      end
                                                    end
                                                    return "Volcano Patch"
                                                  end
                                                  v2_41 = upval_4:DistanceFromCharacter(v1_41.Position)
                                                  if v2_41 <= 3 then
                                                    v2_41 = v1_41:FindFirstChild("ProximityPrompt")
                                                    if not v2_41 then
                                                      if not v1_41.ProximityPrompt.Enabled then
                                                        v2_41 = tick()
                                                        upval_2 = v2_41
                                                        fireproximityprompt(v1_41.ProximityPrompt)
                                                        task.wait(0.5)
                                                        return "Waiting..."
                                                      end
                                                    end
                                                    if not upval_7.ResetPrehistoric then
                                                      v2_41 = tick()
                                                      if 8 <= v2_41 - upval_2 then
                                                        v2_41 = upval_9(upval_4.Character)
                                                        if not v2_41 then
                                                          upval_4.Character.Humanoid.Health = 0
                                                          return "Reseting..."
                                                        else
                                                          v2_41 = tick()
                                                          upval_2 = v2_41
                                                          upval_8(v1_41.CFrame)
                                                          return "Teleporting to Prehistoric Island"
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                                if not upval_10.Sea then
                                                  if upval_7.aTweenBoat then
                                                  else
                                                    if not upval_10.KitsuneIsland then
                                                      v1_41 = upval_11:FindFirstChild("KitsuneIsland")
                                                      if not v1_41 then
                                                      end
                                                    else
                                                      return nil
                                                    end
                                                  end
                                                end
                                                v1_41 = upval_1:GetPlayerBoat()
                                                if v1_41 then
                                                  upval_1:BuyNewBoat()
                                                else
                                                  upval_1:RandomTeleport("inf")
                                                end
                                                return "Finding Prehistoric Island"
                                              end

                                              if upval_1.GameData.Sea ~= 3 then
                                                v2_23("PrehistoricIsland", v103_23, false)

                                                local v103_23 = function()
                                                  local v0_94 = upval_0:FindFirstChild("KitsuneIsland")
                                                  if not v0_94 then
                                                    local v1_94 = upval_1:GetAttribute("MoonPhase")
                                                    if v1_94 == 5 then
                                                      v1_94 = upval_1:GetAttribute("IsBlueMoon")
                                                      if not v1_94 then
                                                        v1_94 = upval_1:GetAttribute("BlueMoonEnded")
                                                        if not v1_94 then
                                                          return nil
                                                        end
                                                      end
                                                      v1_94 = upval_2()
                                                      if not v1_94 then
                                                        upval_3(v1_94.CFrame)
                                                        return true
                                                      end
                                                      local v2_94 = v0_94:FindFirstChild("ShrineDialogPart")
                                                      if not v2_94 then
                                                        local v3_94 = upval_4:DistanceFromCharacter(v2_94.Position)
                                                        if v3_94 <= 3 then
                                                          v3_94 = upval_1:GetAttribute("MoonPhase")
                                                          if v3_94 == 5 then
                                                            v3_94 = upval_1:GetAttribute("IsBlueMoon")
                                                            if v3_94 then
                                                              upval_5:FireServer()
                                                            else
                                                              upval_3(v2_94.CFrame)
                                                            else
                                                              if not v0_94.WorldPivot then
                                                                upval_3(v0_94.WorldPivot)
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                      return true
                                                    end
                                                  end
                                                  if not upval_6.Sea then
                                                    return nil
                                                  end
                                                  v1_94 = upval_7:GetPlayerBoat()
                                                  if v1_94 then
                                                    upval_7:BuyNewBoat()
                                                  else
                                                    upval_7:RandomTeleport("6")
                                                  end
                                                  return true
                                                end

                                                if upval_1.GameData.Sea ~= 3 then
                                                  v2_23("KitsuneIsland", v103_23, false)

                                                  local v103_23 = function()
                                                    if upval_0.Value == "Shipwright" then
                                                      return nil
                                                    end
                                                    local v0_50, v1_50 = upval_1:InvokeServer("Shipwright")
                                                    if v0_50 == 1 then
                                                      upval_2:InvokeServer("Shipwright")
                                                    else
                                                      if v0_50 == 3 then
                                                        local v2_50 = tonumber(v1_50)
                                                        if v2_50 then
                                                        end
                                                        if 0 < 20 then
                                                          return upval_3.Sea(upval_4.Shipwright)
                                                        else
                                                          if v0_50 ~= 4 then
                                                            if v0_50 == 2 then
                                                            else
                                                              v2_50 = upval_5.GetPlayerData:InvokeServer()
                                                              if v2_50.Purchased.Shipwright ~= nil then
                                                                upval_5.EquipSubclass:InvokeServer("Shipwright")
                                                              else
                                                                if 3000 <= upval_6.Value then
                                                                  upval_5.PurchaseSubclass:InvokeServer("Shipwright")
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end

                                                  if upval_1.GameData.Sea ~= 3 then
                                                    v2_23("Shipwright", v103_23, false)

                                                    local v103_23 = function()
                                                      if upval_0.Race.Value ~= "Draco" then
                                                        if not upval_1["Warrior Helmet"] then
                                                          local v0_65 = upval_0.Race:FindFirstChild("Evolved")
                                                          if not v0_65 then
                                                          else
                                                            return nil
                                                          end
                                                        end
                                                      end
                                                      v0_65 = upval_2:GetProgress("RaceV2", "Alchemist", "1")
                                                      if v0_65 ~= 0 then
                                                        if v0_65 == 2 then
                                                        else
                                                          if v0_65 == 2 then
                                                            if 500000 <= upval_3.Value then
                                                            else
                                                              local v1_65 = upval_4:DistanceFromCharacter(upval_5.Position)
                                                              if v1_65 < 5 then
                                                                if v0_65 == 0 then
                                                                  if "2" then
                                                                  else
                                                                  end
                                                                end
                                                                upval_6("Alchemist", "3")
                                                              else
                                                                upval_7(upval_5)
                                                              end
                                                              return true
                                                            end
                                                          else
                                                            if v0_65 == 1 then

                                                              for v4_65 = 1, 2, 1 do
                                                                local v5_65 = workspace:FindFirstChild("Flower" .. "1")
                                                                if not v5_65 then
                                                                  if v5_65.Transparency ~= 1 then
                                                                    local v6_65 = VerifyTool("Flower " .. "1")
                                                                    if v6_65 then
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                              v1_65 = VerifyTool("Flower 3")
                                                              if v1_65 then
                                                                v1_65 = upval_8("Swan Pirate")
                                                                if not v1_65 then
                                                                  if not v1_65.PrimaryPart then
                                                                    upval_9(v1_65)
                                                                  else
                                                                    upval_10:NPCs(upval_11["Swan Pirate"])
                                                                  end
                                                                end
                                                                return "Getting Flower: 3"
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end

                                                    if upval_1.GameData.Sea ~= 2 then
                                                      v2_23("RaceV2", v103_23, false)

                                                      local v103_23 = function()
                                                        if upval_0.Race.Value ~= "Draco" then
                                                          local v1_26 = upval_0.Race:FindFirstChild("Evolved")
                                                          if not v1_26 then
                                                            if not upval_1.RaceV3 then
                                                              if not upval_1.RaceV3[upval_0.Race.Value] then
                                                              else
                                                                return nil
                                                              end
                                                            end
                                                          end
                                                        end
                                                        v1_26 = upval_2:GetProgress("RaceV3", "Wenlocktoad", "1")
                                                        if v1_26 == -2 then
                                                          if upval_1.RaceV3 then
                                                            upval_1.RaceV3 = v3_26
                                                          else
                                                            upval_1.RaceV3[upval_0.Race.Value] = true
                                                          end
                                                          return nil
                                                        end
                                                        if v1_26 ~= 0 then
                                                          if v1_26 == 2 then
                                                          else
                                                            if v1_26 == 2 then
                                                              if 2000000 <= upval_3.Value then
                                                              else
                                                                local v2_26 = upval_4:DistanceFromCharacter(upval_5.Position)
                                                                if v2_26 < 5 then
                                                                  if v1_26 == 0 then
                                                                    if "2" then
                                                                    else
                                                                    end
                                                                  end
                                                                  upval_6({ [upval_0.Race.Value] = true }, "3")
                                                                else
                                                                  upval_7(upval_5)
                                                                end
                                                                return true
                                                              end
                                                            else
                                                              if v1_26 == 1 then
                                                                if upval_0.Race.Value == "Fishman" then
                                                                  return upval_8.Sea(upval_9.Shark)
                                                                end
                                                                if upval_0.Race.Value == "Human" then
                                                                  local v2_26, v3_26, v4_26 = ipairs(upval_9.Human)

                                                                  while true do
                                                                    local v7_26 = upval_10(v6_26)
                                                                    if not v7_26 then
                                                                      return upval_11(upval_2.Bosses[v6_26], v6_26)
                                                                    end

                                                                    for v5_26, v6_26 in v2_26 do
                                                                    end
                                                                  else
                                                                    if upval_0.Race.Value == "Mink" then
                                                                      return upval_8.ChestTween(" for Mink V3")
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                      end

                                                      if upval_1.GameData.Sea ~= 2 then
                                                        v2_23("RaceV3", v103_23, false)

                                                        local v103_23 = function(G0_87)
                                                          local v1_87 = upval_0:GetPlayerBoat()
                                                          if v1_87 then
                                                            upval_0:BuyNewBoat()
                                                            return true
                                                          end
                                                          if v0_87 then
                                                          end
                                                          if upval_1.seaEnemy then
                                                            return nil
                                                          end
                                                          if not upval_1.seaEnemy.PirateBrigade then
                                                            local v3_87 = upval_0:GetSeaEvent("PirateBrigade")
                                                            if not v3_87 then
                                                              upval_0:attackSeaEvent(v3_87)
                                                              return true
                                                            end
                                                          end
                                                          if not upval_1.seaEnemy["Sea Beast"] then
                                                            v3_87 = upval_0:GetSeaBeast()
                                                            if not v3_87 then
                                                              upval_0:attackSeaBeast(v3_87)
                                                              return true
                                                            end
                                                          end
                                                          v3_87 = upval_0:RepairBoat(v1_87)
                                                          if not v3_87 then
                                                            return true
                                                          end
                                                          if not v1_87 then
                                                            upval_0:RandomTeleport()
                                                            return true
                                                          end
                                                        end

                                                        if upval_1.GameData.Sea ~= 2 then
                                                          v2_23("Sea", v103_23, false)

                                                          local v103_23 = function(G0_62, G1_62)
                                                            local v2_62 = upval_0:GetPlayerBoat()
                                                            if v2_62 then
                                                              upval_0:BuyNewBoat()
                                                              return true
                                                            end
                                                            if v1_62 then
                                                            end
                                                            if v0_62 then
                                                            end
                                                            if not upval_1.fishSelected["Sea Beast"] then
                                                              local v5_62 = upval_0:GetSeaBeast()
                                                              if not v5_62 then
                                                                upval_0:attackSeaBeast(v5_62)
                                                                return true
                                                              end
                                                            end
                                                            local v5_62, v6_62, v7_62 = pairs(upval_1.fishSelected)

                                                            while true do
                                                              if not v9_62 then
                                                                if v5_62 ~= "Sea Beast" then
                                                                  local v10_62 = upval_0:GetSeaEvent(v5_62)
                                                                  if not v10_62 then
                                                                    upval_0:attackSeaEvent(v10_62)
                                                                    return true
                                                                  end
                                                                end
                                                              end

                                                              for v8_62, v9_62 in v5_62 do
                                                              end
                                                              local v5_62, v6_62, v7_62 = pairs(upval_1.boatSelected)

                                                              while true do
                                                                if not v9_62 then
                                                                  v10_62 = upval_0:GetSeaEvent(v5_62)
                                                                  if not v10_62 then
                                                                    upval_0:attackSeaEvent(v10_62)
                                                                    return true
                                                                  end
                                                                end

                                                                for v8_62, v9_62 in v5_62 do
                                                                end
                                                                v5_62 = upval_0:RepairBoat(v2_62)
                                                                if not v5_62 then
                                                                  return true
                                                                end
                                                                if not upval_1.aTweenBoat then
                                                                  if not v2_62 then
                                                                    upval_0:RandomTeleport()
                                                                    return true
                                                                  end
                                                                end
                                                          end

                                                          if upval_1.GameData.Sea ~= 3 then
                                                            v2_23("Sea", v103_23, false)

                                                            local v103_23 = function()
                                                              if upval_0.Rengoku then
                                                                if not upval_1.Level then
                                                                  if upval_2.Value < 1350 then
                                                                  else
                                                                    return nil
                                                                  end
                                                                end
                                                              end
                                                              local v0_84 = VerifyTool("Library Key")
                                                              if not v0_84 then
                                                                return upval_3("OpenLibrary")
                                                              end
                                                              v0_84 = VerifyTool("Hidden Key")
                                                              if not v0_84 then
                                                                return upval_3("OpenRengoku")
                                                              end
                                                              v0_84 = upval_4("Awakened Ice Admiral")
                                                              if not v0_84 then
                                                                return upval_5(upval_6.Bosses["Awakened Ice Admiral"], "Awakened Ice Admiral")
                                                              end
                                                              if 1425 > upval_2.Value then
                                                                if upval_1.Level then
                                                                else
                                                                  v0_84 = upval_7("Arctic Warrior", "Snow Lurker")
                                                                  if not v0_84 then
                                                                    if not v0_84.PrimaryPart then
                                                                      upval_8(v0_84)
                                                                      return true
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end

                                                            if upval_1.GameData.Sea ~= 2 then
                                                              v2_23("Rengoku", v103_23, false)

                                                              local v103_23 = function()
                                                                if upval_0.Value >= 850 then
                                                                  if not upval_1["Warrior Helmet"] then
                                                                  else
                                                                    return nil
                                                                  end
                                                                end
                                                                local v0_61 = upval_2:GetProgress("Bartilo", "BartiloQuestProgress")
                                                                if not v0_61.KilledSpring then
                                                                  upval_3("BartiloQuestProgress", "DidPlates")
                                                                else
                                                                  if not v0_61.KilledBandits then
                                                                    local v1_61 = upval_4("Jeremy")
                                                                    if not v1_61 then
                                                                      v1_61 = upval_5("Jeremy")
                                                                      if not v1_61 then
                                                                        if not v1_61.PrimaryPart then
                                                                          upval_6(v1_61)
                                                                        else
                                                                          upval_7(CFrame.new(2316, 449, 787))
                                                                        end
                                                                      end
                                                                      return true
                                                                    else
                                                                      if v0_61.KilledBandits then
                                                                        v1_61 = upval_8:VerifyQuest("Swan Pirate")
                                                                        if not v1_61 then
                                                                          v1_61 = upval_8:VerifyQuest("50")
                                                                        end
                                                                        if not v1_61 then
                                                                          local v2_61 = upval_5("Swan Pirate")
                                                                          if not v2_61 then
                                                                            if not v2_61.PrimaryPart then
                                                                              upval_6(v2_61)
                                                                            else
                                                                              upval_9:NPCs(upval_10["Swan Pirate"])
                                                                            else
                                                                              upval_8:StartQuest("BartiloQuest", 1, upval_11)
                                                                            end
                                                                          end
                                                                        end
                                                                        return true
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end

                                                              if upval_1.GameData.Sea ~= 2 then
                                                                v2_23("Bartilo", v103_23, false)

                                                                local v103_23 = function()
                                                                  if not upval_0.Yama then
                                                                    return nil
                                                                  end
                                                                  local v0_99 = upval_1:GetProgress("EliteProgress", "EliteHunter", "Progress")
                                                                  if 30 <= v0_99 then
                                                                    local v1_99 = upval_2:DistanceFromCharacter(upval_3.Position)
                                                                    if v1_99 < 5 then
                                                                      pcall(upval_4)
                                                                      task.wait(1)
                                                                    else
                                                                      upval_5(upval_3)
                                                                    end
                                                                    return true
                                                                  end
                                                                end

                                                                if upval_1.GameData.Sea ~= 3 then
                                                                  v2_23("Yama", v103_23, false)

                                                                  local v103_23 = function()
                                                                    if upval_0.Value >= 1800 then
                                                                      if not upval_1["Musketeer Hat"] then
                                                                      else
                                                                        return nil
                                                                      end
                                                                    end
                                                                    local v0_52 = upval_2:GetProgress("Citizen", "CitizenQuestProgress")
                                                                    if not v0_52.FoundTreasure then
                                                                      return nil
                                                                    end
                                                                    if not v0_52.KilledBoss then
                                                                      upval_3(upval_4)
                                                                      return true
                                                                    end
                                                                    if not v0_52.KilledBandits then
                                                                      local v1_52 = upval_5("Captain Elephant")
                                                                      if not v1_52 then
                                                                        v1_52 = upval_6:VerifyQuest("Captain Elephant")
                                                                        if v1_52 then
                                                                          v1_52 = upval_7:DistanceFromCharacter(upval_8.Position)
                                                                          if 5 <= v1_52 then
                                                                            upval_9("CitizenQuestProgress", "Citizen")
                                                                          else
                                                                            upval_3(upval_8)
                                                                          end
                                                                          return true
                                                                        end
                                                                        v1_52 = upval_10("Captain Elephant")
                                                                        if not v1_52 then
                                                                          if not v1_52.PrimaryPart then
                                                                            upval_11(v1_52)
                                                                          else
                                                                            upval_3(upval_12)
                                                                          end
                                                                        end
                                                                        return true
                                                                      else
                                                                        v1_52 = upval_6:VerifyQuest("Forest Pirate")
                                                                        if not v1_52 then
                                                                          v1_52 = upval_6:VerifyQuest("50")
                                                                        end
                                                                        if not v1_52 then
                                                                          local v2_52 = upval_10("Forest Pirate")
                                                                          if not v2_52 then
                                                                            if not v2_52.PrimaryPart then
                                                                              upval_11(v2_52, true)
                                                                            else
                                                                              upval_13:NPCs(upval_14["Forest Pirate"])
                                                                            end
                                                                          end
                                                                          return true
                                                                        end
                                                                        v2_52 = upval_7:DistanceFromCharacter(upval_8.Position)
                                                                        if 5 <= v2_52 then
                                                                          upval_9("CitizenQuest", 1)
                                                                        else
                                                                          upval_3(upval_8)
                                                                        end
                                                                        return true
                                                                      end
                                                                    end
                                                                  end

                                                                  if upval_1.GameData.Sea ~= 3 then
                                                                    v2_23("Citizen", v103_23, false)

                                                                    local v103_23 = function()
                                                                      local v0_74 = upval_0:VerifyQuest(upval_1)
                                                                      if not v0_74 then
                                                                        local v1_74 = upval_2(v0_74)
                                                                        if not v1_74 then
                                                                          return upval_3(upval_4.Bosses[v0_74], v0_74, true)
                                                                        else
                                                                          upval_5("HornedMan", "Bet")
                                                                        end
                                                                      end
                                                                    end

                                                                    if upval_1.GameData.Sea ~= 3 then
                                                                      v2_23("RainbowHaki", v103_23, false)

                                                                      local v103_23 = function()
                                                                        local v0_33 = upval_0:VerifyQuest(upval_1)
                                                                        if upval_2.DoughKing then
                                                                          if upval_2.CakePrince then
                                                                            if not upval_2.RipIndra then
                                                                            else
                                                                              local v1_33 = upval_3("rip_indra True Form")
                                                                              if v1_33 then
                                                                                v1_33 = upval_3("Dough King")
                                                                                if v1_33 then
                                                                                  v1_33 = upval_3("Cake Prince")
                                                                                  if v1_33 then
                                                                                    v1_33 = VerifyTool("God's Chalice")
                                                                                    if v1_33 then
                                                                                      v1_33 = VerifyTool("Sweet Chalice")
                                                                                      if not v1_33 then
                                                                                      else
                                                                                        return nil
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                        if not v0_33 then
                                                                          v1_33 = upval_4(v0_33)
                                                                          if not v1_33 then
                                                                            if not v1_33.PrimaryPart then
                                                                            else
                                                                              v1_33 = upval_6.Enemies:GetEnemyByTag("Elite")
                                                                              if not v1_33 then
                                                                                upval_7(upval_8)
                                                                                upval_9:talkNpc(upval_8, "EliteHunter")
                                                                                return "Getting Elite Quest: " .. v1_33.Name
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end

                                                                      if upval_1.GameData.Sea ~= 3 then
                                                                        v2_23("EliteHunter", v103_23, false)

                                                                        local v103_23 = function()
                                                                          if not upval_0.CraftAura then
                                                                            if upval_1[upval_0.CraftAura] then
                                                                              local v1_83 = upval_2:GetAuraCraft(upval_0.CraftAura)
                                                                              local v2_83 = type(v1_83)
                                                                              if not v2_83 ~= "table" then
                                                                                return nil
                                                                              end
                                                                              local v3_83, v4_83, v5_83 = ipairs(v1_83)

                                                                              while true do
                                                                                if upval_3[v7_83.Name] < v7_83.Amount then
                                                                                  table.insert(v2_83, v7_83.Name)
                                                                                end

                                                                                for v6_83, v7_83 in v3_83 do
                                                                                end
                                                                                if 0 < #v2_83 then
                                                                                  if not upval_4.BerryBush then
                                                                                  end
                                                                                  v3_83 = upval_5.BerryBush(nil, upval_0.CraftHop)
                                                                                  if v3_83 then
                                                                                    task.wait(0.3)
                                                                                  else
                                                                                    return true
                                                                                  else
                                                                                    v3_83 = upval_6:GetNpcPosition("Barista")
                                                                                    v4_83 = upval_7:DistanceFromCharacter(v3_83.Position)
                                                                                    if v4_83 < 3 then
                                                                                      upval_8:InvokeServer({ StorageName = upval_0.CraftAura, Type = "AuraSkin", Context = "Craft" })
                                                                                    else
                                                                                      upval_9(v3_83)
                                                                                    end
                                                                                    return true
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                        end

                                                                        if upval_1.GameData.Sea == 1 then
                                                                          v2_23("AuraColor", v103_23, false)

                                                                          local v103_23 = function(G0_69, G1_69)
                                                                            local v2_69 = upval_0.Berry(v0_69)
                                                                            if not v2_69 then
                                                                              if not v2_69.Parent then
                                                                                local v3_69, v4_69, v5_69 = pairs(v2_69:GetAttributes())

                                                                                while true do
                                                                                  local v9_69 = v2_69.Parent:GetPivot()
                                                                                  local v10_69 = v2_69.Parent:GetAttribute(v6_69)
                                                                                  v10_69 = upval_1:DistanceFromCharacter(v9_69 * v10_69.Position)
                                                                                  if v10_69 < 3 then
                                                                                    upval_2:InvokeServer(v2_69.Parent.Name, v6_69)
                                                                                  else
                                                                                    upval_3(v9_69 * v10_69)
                                                                                  end
                                                                                  return "Collecting Berry: " .. v7_69

                                                                                  for v6_69, v7_69 in v3_69 do
                                                                                  end
                                                                                else
                                                                                  if v1_69 then
                                                                                    if v1_69 == nil then
                                                                                      if not upval_4.BerryHop then
                                                                                      else
                                                                                        upval_0:ServerHop()
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                          end

                                                                          v2_23("BerryBush", v103_23)

                                                                          local v103_23 = function()
                                                                            if upval_0.Value >= 1500 then
                                                                              if 1850 <= upval_0.Value then
                                                                              else
                                                                                return nil
                                                                              end
                                                                            end
                                                                            local v0_59 = upval_1:GetProgress("Zou1", "ZQuestProgress")
                                                                            if upval_2.Zou2 then
                                                                              local v1_59 = upval_1:GetProgress("Zou2", "ZQuestProgress", "Check")
                                                                            end
                                                                            if v1_59 then
                                                                              local v2_59 = upval_1:GetProgress("Unlockables", "GetUnlockables")
                                                                              if not v2_59.FlamingoAccess then
                                                                                return upval_3.DonSwan()
                                                                              end
                                                                              return nil
                                                                            end
                                                                            if upval_2.Zou2 then
                                                                              upval_2.Zou2 = true
                                                                            end
                                                                            v2_59 = upval_4:DistanceFromCharacter(upval_5.Position)
                                                                            if v2_59 < 1200 then
                                                                              v2_59 = upval_6:FindFirstChild("rip_indra")
                                                                              if not v2_59 then
                                                                                if not v2_59.PrimaryPart then
                                                                                  if 0 < v2_59.PrimaryPart.Position.Y then
                                                                                    upval_7(v2_59)
                                                                                  end
                                                                                end
                                                                              end
                                                                              return true
                                                                            end
                                                                            if not v0_59.KilledIndraBoss then
                                                                              return upval_1:TravelTo(upval_1, 3)
                                                                            end
                                                                            v2_59 = upval_4:DistanceFromCharacter(upval_8.Position)
                                                                            if v2_59 < 5 then
                                                                              upval_9("ZQuestProgress", "Begin")
                                                                              upval_10.OnFarm = false
                                                                            end

                                                                            while true do
                                                                              task.wait()
                                                                              v2_59 = upval_4:DistanceFromCharacter(upval_5.Position)
                                                                              if v2_59 >= 1200 then
                                                                                if upval_11[upval_12.RunningOption] then
                                                                                end
                                                                              end
                                                                              return true
                                                                            end
                                                                            upval_13(upval_8)
                                                                          end

                                                                          if upval_1.GameData.Sea ~= 2 then
                                                                            v2_23("ThirdSea", v103_23, false)

                                                                            local v103_23 = function()
                                                                              if upval_0["Warrior Helmet"] then
                                                                                return nil
                                                                              end
                                                                              local v0_73 = upval_1("Don Swan")
                                                                              if not v0_73 then
                                                                                v0_73 = upval_2("Don Swan")
                                                                                if not v0_73 then
                                                                                  if not v0_73.PrimaryPart then
                                                                                    upval_3(v0_73)
                                                                                  else
                                                                                    upval_4(upval_5)
                                                                                  end
                                                                                end
                                                                                return true
                                                                              end
                                                                            end

                                                                            if upval_1.GameData.Sea ~= 2 then
                                                                              v2_23("DonSwan", v103_23, false)

                                                                              local v103_23 = function()
                                                                                if upval_0.Value < 700 then
                                                                                  return nil
                                                                                end
                                                                                local v0_66 = upval_1:GetProgress("Dressrosa", "DressrosaQuestProgress")
                                                                                if not v0_66.KilledIceBoss then
                                                                                  return upval_1:TravelTo(upval_1, 2)
                                                                                end
                                                                                if v0_66.TalkedDetective then
                                                                                  upval_1:TravelTo("Detective")
                                                                                else
                                                                                  if v0_66.UsedKey then
                                                                                    local v1_66 = VerifyTool("Key")
                                                                                    if v1_66 then
                                                                                      upval_2("DressrosaQuestProgress", "Detective")
                                                                                    end
                                                                                    upval_3("Key")
                                                                                    upval_2("DressrosaQuestProgress", "UseKey")
                                                                                  else
                                                                                    if v0_66.KilledIceBoss then
                                                                                      v1_66 = upval_4("Ice Admiral")
                                                                                      if not v1_66 then
                                                                                        if not v1_66.PrimaryPart then
                                                                                          upval_5(v1_66)
                                                                                        else
                                                                                          upval_6(upval_7)
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                                return true
                                                                              end

                                                                              if upval_1.GameData.Sea ~= 1 then
                                                                                v2_23("SecondSea", v103_23, false)

                                                                                local v103_23 = function()
                                                                                  local v0_34 = upval_0:FindFirstChild("Order")
                                                                                  if not v0_34 then
                                                                                    if not v0_34.PrimaryPart then
                                                                                      upval_1(v0_34)
                                                                                      return true
                                                                                    end
                                                                                  end
                                                                                  local v1_34 = VerifyTool("Microchip")
                                                                                  if not v1_34 then
                                                                                    return fireclickdetector(upval_2.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                                                                                  end
                                                                                  if not upval_3.FullyLawRaid then
                                                                                    return upval_4()
                                                                                  end
                                                                                end

                                                                                if upval_1.GameData.Sea ~= 2 then
                                                                                  v2_23("Order", v103_23, false)

                                                                                  local v103_23 = function()
                                                                                    if upval_0.Value >= 200 then
                                                                                      if not upval_1.Saber then
                                                                                      else
                                                                                        return nil
                                                                                      end
                                                                                    end
                                                                                    local v0_71 = upval_2:GetProgress("Shanks", "ProQuestProgress")
                                                                                    if not v0_71.UsedRelic then
                                                                                      local v1_71 = upval_2.Enemies.IsSpawned("Saber Expert")
                                                                                      if not v1_71 then
                                                                                        v1_71 = upval_3("Saber Expert")
                                                                                        if not v1_71 then
                                                                                          if not v1_71.PrimaryPart then
                                                                                            upval_4(v1_71)
                                                                                          else
                                                                                            upval_5(upval_6)
                                                                                          end
                                                                                        end
                                                                                        return true
                                                                                      else
                                                                                        if not v0_71.KilledMob then
                                                                                          v1_71 = VerifyTool("Relic")
                                                                                          if not v1_71 then
                                                                                            upval_7("ProQuestProgress", "PlaceRelic")
                                                                                          else
                                                                                            upval_7("ProQuestProgress", "RichSon")
                                                                                          end
                                                                                          return true
                                                                                        end
                                                                                        if not v0_71.UsedCup then
                                                                                          if v0_71.TalkedSon then
                                                                                            return upval_7("ProQuestProgress", "RichSon")
                                                                                          end
                                                                                          v1_71 = upval_2.Enemies.IsSpawned("Mob Leader")
                                                                                          if not v1_71 then
                                                                                            v1_71 = upval_3("Mob Leader")
                                                                                            if not v1_71 then
                                                                                              if not v1_71.PrimaryPart then
                                                                                                upval_4(v1_71)
                                                                                              else
                                                                                                upval_5(CFrame.new(-2880, 9, 5430))
                                                                                              end
                                                                                            end
                                                                                            return true
                                                                                          else
                                                                                            if not v0_71.UsedTorch then
                                                                                              v1_71 = VerifyTool("Cup")
                                                                                              if not v1_71 then
                                                                                                if not upval_8.Character then
                                                                                                  local v4_71 = upval_8.Character:FindFirstChild("Cup")
                                                                                                  if v4_71 then
                                                                                                  else
                                                                                                    v4_71 = upval_8.Backpack:FindFirstChild("Cup")
                                                                                                  end
                                                                                                end
                                                                                                upval_7("ProQuestProgress", "FillCup", v4_71)
                                                                                              else
                                                                                                upval_7("ProQuestProgress", "GetCup")
                                                                                              end
                                                                                              upval_7("ProQuestProgress", "SickMan")
                                                                                              return true
                                                                                            end

                                                                                            while true do
                                                                                              if upval_8.Backpack then
                                                                                                upval_7("ProQuestProgress", "Plate", v4_71)
                                                                                                return true
                                                                                              end

                                                                                              for v4_71, v5_71 in next do
                                                                                              end
                                                                                              v1_71 = VerifyTool("Torch")
                                                                                              if not v1_71 then
                                                                                                upval_7("ProQuestProgress", "DestroyTorch")
                                                                                              else
                                                                                                upval_7("ProQuestProgress", "GetTorch")
                                                                                              end
                                                                                              return true
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                  end

                                                                                  if upval_1.GameData.Sea ~= 1 then
                                                                                    v2_23("Saber", v103_23, false)

                                                                                    local v103_23 = function()
                                                                                      if upval_0.Value >= 450 then
                                                                                        if not upval_1["Pole (1st Form)"] then
                                                                                        else
                                                                                          return nil
                                                                                        end
                                                                                      end
                                                                                      local v0_97 = upval_2.Enemies.IsSpawned("Thunder God")
                                                                                      if not v0_97 then
                                                                                        v0_97 = upval_3("Thunder God")
                                                                                        if not v0_97 then
                                                                                          if not v0_97.PrimaryPart then
                                                                                            upval_4(v0_97)
                                                                                          else
                                                                                            upval_5(upval_6)
                                                                                          end
                                                                                        end
                                                                                        return true
                                                                                      end
                                                                                    end

                                                                                    if upval_1.GameData.Sea ~= 1 then
                                                                                      v2_23("PoleV1", v103_23, false)

                                                                                      local v103_23 = function()
                                                                                        if upval_0.Value >= 100 then
                                                                                          if not upval_1["Shark Saw"] then
                                                                                          else
                                                                                            return nil
                                                                                          end
                                                                                        end
                                                                                        local v0_95 = upval_2.Enemies.IsSpawned("The Saw")
                                                                                        if not v0_95 then
                                                                                          v0_95 = upval_3("The Saw")
                                                                                          if not v0_95 then
                                                                                            if not v0_95.PrimaryPart then
                                                                                              upval_4(v0_95)
                                                                                            else
                                                                                              upval_5(upval_6)
                                                                                            end
                                                                                          end
                                                                                          return true
                                                                                        end
                                                                                      end

                                                                                      if upval_1.GameData.Sea ~= 1 then
                                                                                        v2_23("TheSaw", v103_23, false)

                                                                                        local v103_23 = function()
                                                                                          local v0_40 = upval_0("Soul Reaper")
                                                                                          if not v0_40 then
                                                                                            if not v0_40.PrimaryPart then
                                                                                              upval_1(v0_40)
                                                                                              return true
                                                                                            end
                                                                                          end
                                                                                          local v1_40 = VerifyTool("Hallow Essence")
                                                                                          if not v1_40 then
                                                                                            upval_2("Hallow Essence")
                                                                                            upval_3(upval_4)
                                                                                            return true
                                                                                          end
                                                                                        end

                                                                                        if upval_1.GameData.Sea ~= 3 then
                                                                                          v2_23("SoulReaper", v103_23, false)

                                                                                          local v103_23 = function()
                                                                                            local v0_29 = upval_0("rip_indra True Form")
                                                                                            if not v0_29 then
                                                                                              v0_29 = upval_1("rip_indra True Form")
                                                                                              if not v0_29 then
                                                                                                if not v0_29.PrimaryPart then
                                                                                                  upval_2(v0_29)
                                                                                                else
                                                                                                  upval_3(upval_4)
                                                                                                end
                                                                                              end
                                                                                              return "Killing: rip_indra True Form"
                                                                                            end
                                                                                            v0_29 = VerifyTool("God's Chalice")
                                                                                            if not v0_29 then
                                                                                              v0_29 = upval_5()
                                                                                              if 3 <= v0_29 then
                                                                                                upval_3(upval_6)
                                                                                              else
                                                                                                upval_3(upval_4)
                                                                                              end
                                                                                              return "God's Chalice: rip_indra True Form"
                                                                                            end
                                                                                          end

                                                                                          if upval_1.GameData.Sea ~= 3 then
                                                                                            v2_23("RipIndra", v103_23, false)

                                                                                            local v103_23 = function()
                                                                                              if not upval_0.BossSelected then
                                                                                                local v1_30 = upval_1(upval_0.BossSelected)
                                                                                              end
                                                                                              if not v1_30 then
                                                                                                return upval_2(upval_3.Bosses[upval_0.BossSelected], upval_0.BossSelected)
                                                                                              end
                                                                                            end

                                                                                            v2_23("BossSelected", v103_23)

                                                                                            local v103_23 = function()
                                                                                              local v0_42 = upval_0()
                                                                                              if not v0_42 then
                                                                                                return upval_1(upval_2.Bosses[v0_42], v0_42)
                                                                                              end
                                                                                            end

                                                                                            v2_23("AllBosses", v103_23)

                                                                                            local v103_23 = function()
                                                                                              local v0_31 = upval_0("Dough King")
                                                                                              if v0_31 then
                                                                                                v0_31 = upval_0("Cake Prince")
                                                                                              end
                                                                                              local v1_31 = VerifyTool("Red Key")
                                                                                              if not v1_31 then
                                                                                                upval_1("CakeScientist", "Check")
                                                                                                return true
                                                                                              end
                                                                                              if not v0_31 then
                                                                                                if not v0_31.PrimaryPart then
                                                                                                  upval_2(v0_31)
                                                                                                else
                                                                                                  v1_31 = VerifyTool("Sweet Chalice")
                                                                                                  if v1_31 then
                                                                                                    v1_31 = VerifyTool("God's Chalice")
                                                                                                    if not v1_31 then
                                                                                                      if upval_3["Conjured Cocoa"] < 10 then
                                                                                                        return upval_4:Material(upval_4, "Conjured Cocoa")
                                                                                                      end
                                                                                                      upval_4:Material()
                                                                                                      upval_7:talkNpc(upval_6, "SweetChaliceNpc")
                                                                                                      return true
                                                                                                    end
                                                                                                  end
                                                                                                  v1_31 = upval_8.Enemies:GetClosestByTag("CakePrince")
                                                                                                  if not v1_31 then
                                                                                                    if not v1_31.PrimaryPart then
                                                                                                      upval_2(v1_31, true, true)
                                                                                                    else
                                                                                                      upval_5(upval_9)
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                              return true
                                                                                            end

                                                                                            if upval_1.GameData.Sea ~= 3 then
                                                                                              v2_23("DoughKing", v103_23, false)

                                                                                              local v103_23 = function()
                                                                                                if not upval_0.DoughKing then
                                                                                                  return nil
                                                                                                end
                                                                                                local v0_72 = upval_1("Dough King")
                                                                                                if v0_72 then
                                                                                                  v0_72 = upval_1("Cake Prince")
                                                                                                end
                                                                                                if not v0_72 then
                                                                                                  if not v0_72.PrimaryPart then
                                                                                                    upval_2(v0_72)
                                                                                                  else
                                                                                                    local v1_72 = upval_3.Enemies:GetClosestByTag("CakePrince")
                                                                                                    if not v1_72 then
                                                                                                      if not v1_72.PrimaryPart then
                                                                                                        upval_2(v1_72, true, true)
                                                                                                      else
                                                                                                        upval_4(upval_5)
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                                return true
                                                                                              end

                                                                                              if upval_1.GameData.Sea ~= 3 then
                                                                                                v2_23("CakePrince", v103_23, false)

                                                                                                local v103_23 = function(G0_36, G1_36)
                                                                                                  local v2_36 = upval_0.Chests()
                                                                                                  if not v2_36 then
                                                                                                    local v3_36 = v2_36:GetPivot(v1_36)
                                                                                                    local v4_36 = upval_1:DistanceFromCharacter(v3_36.Position)
                                                                                                    if v4_36 < 3 then
                                                                                                      upval_2(v3_36 + upval_3)
                                                                                                      task.wait(0.15)
                                                                                                    else
                                                                                                      upval_2(v3_36)
                                                                                                    end
                                                                                                    if v0_36 then
                                                                                                    end
                                                                                                    return "Collecting Chest" .. ""
                                                                                                  end
                                                                                                end

                                                                                                v2_23("ChestTween", v103_23)

                                                                                                local v103_23 = function()
                                                                                                  local v0_82 = upval_0(upval_1)
                                                                                                  if not v0_82 then
                                                                                                    if not v0_82.PrimaryPart then
                                                                                                    end
                                                                                                  end
                                                                                                end

                                                                                                if upval_1.GameData.Sea ~= 2 then
                                                                                                  v2_23("Ectoplasm", v103_23, false)

                                                                                                  local v103_23 = function()
                                                                                                    if not upval_0.Level then
                                                                                                      if upval_1.Value < upval_2 then
                                                                                                        return nil
                                                                                                      end
                                                                                                    end
                                                                                                    local v0_80 = upval_3.Enemies:GetClosestByTag("Bones")
                                                                                                    if not v0_80 then
                                                                                                      if not v0_80.PrimaryPart then
                                                                                                      end
                                                                                                    end
                                                                                                  end

                                                                                                  if upval_1.GameData.Sea ~= 3 then
                                                                                                    v2_23("Bones", v103_23, false)

                                                                                                    local v103_23 = function()
                                                                                                      local v0_78 = upval_0:GetQuest()
                                                                                                      if v0_78 then
                                                                                                        return nil
                                                                                                      end
                                                                                                      local v3_78 = upval_0:VerifyQuest(v0_78.Enemy.Name)
                                                                                                      if not v3_78 then
                                                                                                        local v4_78 = upval_1.IsBoss(v3_78)
                                                                                                        if not v4_78 then
                                                                                                          return upval_2(upval_1.Bosses[v3_78], v3_78, false)
                                                                                                        end
                                                                                                      end
                                                                                                      if not v3_78 then
                                                                                                        v4_78 = upval_3(v3_78)
                                                                                                        if not v4_78 then
                                                                                                          if not v4_78.PrimaryPart then
                                                                                                          end
                                                                                                        end
                                                                                                        local v5_78 = upval_0:GetQuestPosition(v0_78.Name)
                                                                                                        if 0 < #v0_78.Enemy.Position then
                                                                                                          upval_5:NPCs(v0_78.Enemy.Position)
                                                                                                        else
                                                                                                          if not v5_78 then
                                                                                                            upval_6(v5_78 * upval_0._Position)
                                                                                                          end
                                                                                                        end
                                                                                                        return "Waiting for: " .. v3_78
                                                                                                      end
                                                                                                      return upval_0:StartQuest()
                                                                                                    end

                                                                                                    v2_23("Level", v103_23)

                                                                                                    local v103_23 = function()
                                                                                                      if upval_0 == 3 then
                                                                                                        if upval_2 <= upval_1.Value then
                                                                                                          return upval_3.Bones()
                                                                                                        end
                                                                                                      end
                                                                                                      return upval_3.Level()
                                                                                                    end

                                                                                                    v2_23("Mastery", v103_23)

                                                                                                    local v103_23 = function()
                                                                                                      if not upval_0.fMaterial then
                                                                                                        return upval_1:Material(upval_1, upval_0.fMaterial)
                                                                                                      end
                                                                                                    end

                                                                                                    v2_23("Material", v103_23)

                                                                                                    local v103_23 = function()
                                                                                                      if not upval_0 then
                                                                                                      end
                                                                                                      if not upval_0.PrimaryPart then
                                                                                                        local v1_58 = upval_1(upval_0)
                                                                                                        if not v1_58 then
                                                                                                          v1_58 = upval_2:DistanceFromCharacter(upval_0.PrimaryPart.Position)
                                                                                                          if v1_58 < 1500 then
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                      local v3_58, v4_58, v5_58 = ipairs(upval_4:GetChildren())

                                                                                                      while true do
                                                                                                        local v9_58 = upval_1(v7_58)
                                                                                                        if not v9_58 then
                                                                                                          if not v7_58.PrimaryPart then
                                                                                                            v9_58 = upval_2:DistanceFromCharacter(v7_58.PrimaryPart.Position)
                                                                                                            if v9_58 < 1500 then
                                                                                                            end
                                                                                                          end
                                                                                                        end

                                                                                                        for v6_58, v7_58 in v3_58 do
                                                                                                        end
                                                                                                        if not v7_58 then
                                                                                                          upval_0 = v7_58
                                                                                                          upval_3(v7_58, true, true)
                                                                                                          return true
                                                                                                        end
                                                                                                        task.wait(0.4)
                                                                                                    end

                                                                                                    v2_23("Nearest", v103_23)
                                                                                                    local v101_23 = type(upval_20["CustomFunctions"])
                                                                                                    if v101_23 == "function" then
                                                                                                      v101_23 = upval_20["CustomFunctions"]({
                                                                                                        Managers = v0_23.Managers,
                                                                                                        ["Module"] = upval_1,
                                                                                                        ["ScriptFunctions"] = v1_23,
                                                                                                        ["Functions"] = v104_23,
                                                                                                      })
                                                                                                      local v102_23, v103_23, v104_23 = pairs(v101_23)

                                                                                                      while true do
                                                                                                        v2_23("BreakTree", v106_23)

                                                                                                        for v105_23, v106_23 in v102_23 do
                                                                                                        end
                                                                                                      end
                                                                                                      if upval_1.GameData.Sea == 3 then

                                                                                                        local v105_23 = function()
                                                                                                          upval_0:BeltProgress("Red", 1)
                                                                                                        end

                                                                                                        local v105_23 = function()
                                                                                                          upval_0:BeltProgress("White", 8)
                                                                                                        end

                                                                                                        local v105_23 = function()
                                                                                                          upval_0 = v0_67
                                                                                                        end

                                                                                                        local v105_23 = function()
                                                                                                          upval_0 = v0_96
                                                                                                        end

                                                                                                        local v108_23 = function(G0_25)
                                                                                                          if not upval_0[v0_25] then
                                                                                                            return upval_0[v0_25]()
                                                                                                          end
                                                                                                          local v2_25 = v0_25:find("Earned <Color=Green>%$%d+<Color=/>")
                                                                                                          if not v2_25 then
                                                                                                            v2_25 = upval_1:GetAttribute("DangerLevel")
                                                                                                            if 100 <= v2_25 then
                                                                                                              upval_2:BeltProgress("Yellow", 1)
                                                                                                            else
                                                                                                              if not upval_3.DoughKing then
                                                                                                                v2_25 = VerifyTool("Sweet Chalice")
                                                                                                                if v2_25 then
                                                                                                                else
                                                                                                                  if not upval_3.CakePrince then
                                                                                                                  end
                                                                                                                else
                                                                                                                  v2_25 = tick()
                                                                                                                  upval_4 = v2_25 + 9000000000
                                                                                                                  v2_25 = upval_5("CakePrinceSpawner", true)
                                                                                                                  if v2_25 then
                                                                                                                  end
                                                                                                                  local v3_25 = tick()
                                                                                                                  if 0.25 <= v3_25 - upval_4 then
                                                                                                                    v3_25 = string.find("Error", upval_6)
                                                                                                                    if not v3_25 then
                                                                                                                      upval_5("CakePrinceSpawner")
                                                                                                                    end
                                                                                                                  end
                                                                                                                  v3_25 = tick()
                                                                                                                  upval_4 = v3_25
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end

                                                                                                        table["insert"](upval_21)
                                                                                                      end
  end

  local v53_1 = function(G0_8)
    if upval_0.IsCustomUrl then
      if not upval_0.Webhooks then
        __loadstring("{Repository}Utils/Webhooks.lua", false, { upval_0 })
      end
    end
  end

  local v53_1 = function(G0_144, ...)
    local v2_144 = tick()
    upval_0[v0_144](upval_0)
    local v5_144 = tick()
    print(v0_144, v5_144 - v2_144)
  end

  v53_1("Initialize")
  v53_1("StartFarm")
  v53_1("StartFunctions")
  task.spawn(v53_1, "LoadLibrary")
  task.spawn(v53_1, "Webhooks")

                                                                                                    end

                                                                                                  end

                                                                                                end

                                                                                              end

                                                                                            end

                                                                                          end

                                                                                        end

                                                                                      end

                                                                                    end

                                                                                  end

                                                                                  end

                                                                                end

                                                                              end

                                                                            end

                                                                          end

                                                                          end

                                                                        end

                                                                        end

                                                                      end

                                                                    end

                                                                  end

                                                                end

                                                              end

                                                            end

                                                          end

                                                            end

                                                          end

                                                        end

                                                      end

                                                      end

                                                    end

                                                  end

                                                end

                                              end

                                            end

                                            end

                                          end

                                        end

                                      end

                                    end

                                  end

                                end

                              end

                            end

                          end

                        end

                      end

                    end

                  end

                end

                end

              end

            end

          end

        end

      end

    end

    end

    end

    end

    end

    end

    end

    end

    end

  end

    end

      end

    end

  end

      end

    end

  end

    end

    end

  end

    end

    end

    end

    end

  end

      end

    end

  end

end

end

end

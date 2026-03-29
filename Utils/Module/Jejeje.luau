local Module = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AutoAttack = true
local AttackMobs = true
local AttackPlayers = true

local v1 = next
local v2 = {
    game.ReplicatedStorage.Util,
    game.ReplicatedStorage.Common,
    game.ReplicatedStorage.Remotes,
    game.ReplicatedStorage.Assets,
    game.ReplicatedStorage.FX
}

local v3 = nil
local u4 = nil
local u5 = nil

function Module.SetAutoAttack(v)
    AutoAttack = v
end

function Module.SetAttackMobs(v)
    AttackMobs = v
end

function Module.SetAttackPlayers(v)
    AttackPlayers = v
end

local function InitRemote()
    while true do
        local v6
        v3, v6 = v1(v2, v3)
        if v3 == nil then break end

        local v7 = next
        local v8, v9 = v6:GetChildren()

        while true do
            local v10
            v9, v10 = v7(v8, v9)
            if v9 == nil then break end

            if v10:IsA("RemoteEvent") and v10:GetAttribute("Id") then
                u5 = v10:GetAttribute("Id")
                u4 = v10
            end
        end

        v6.ChildAdded:Connect(function(p11)
            if p11:IsA("RemoteEvent") and p11:GetAttribute("Id") then
                u5 = p11:GetAttribute("Id")
                u4 = p11
            end
        end)
    end
end

task.spawn(InitRemote)

function Module.Start()
    task.spawn(function()
        while task.wait(0.05) do 
            if AutoAttack then

                local Character = LocalPlayer.Character
                if not Character then continue end

                local HRP = Character:FindFirstChild("HumanoidRootPart")
                if not HRP then continue end

                local tool = Character:FindFirstChildOfClass("Tool")
                if not tool then continue end

                local weaponType = tool:GetAttribute("WeaponType")
                if weaponType ~= "Melee" and weaponType ~= "Sword" then
                    continue
                end

                local targets = {}

                if AttackMobs then
                    local Enemies = workspace:FindFirstChild("Enemies")
                    if Enemies then
                        for _,mob in ipairs(Enemies:GetChildren()) do
                            local hrp = mob:FindFirstChild("HumanoidRootPart")
                            local hum = mob:FindFirstChild("Humanoid")
                            if hrp and hum and hum.Health > 0 and (hrp.Position - HRP.Position).Magnitude <= 100 then
                                local part = mob:FindFirstChild("HumanoidRootPart") or mob:FindFirstChild("Head")
                                if part then
                                    targets[#targets+1] = {mob, part}
                                end
                            end
                        end
                    end
                end

                if AttackPlayers then
                    for _,plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer then
                            local char = plr.Character
                            if char then
                                local hrp = char:FindFirstChild("HumanoidRootPart")
                                local hum = char:FindFirstChild("Humanoid")
                                if hrp and hum and hum.Health > 0 and (hrp.Position - HRP.Position).Magnitude <= 100 then
                                    local part = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
                                    if part then
                                        targets[#targets+1] = {char, part}
                                    end
                                end
                            end
                        end
                    end
                end

                pcall(function()
                    tool:Activate()
                end)

                if #targets > 0 then
                    pcall(function()

                        local Net = game.ReplicatedStorage:FindFirstChild("Modules")
                        Net = Net and Net:FindFirstChild("Net")
                        if not Net then return end

                        local NetModule = require(Net)

                        NetModule:RemoteEvent("RegisterHit", true)

                        local AttackRemote = Net:FindFirstChild("RE/RegisterAttack")
                        if AttackRemote then
                            AttackRemote:FireServer()
                        end

                        local head = targets[1][1]:FindFirstChild("Head")
                        if not head then return end

                        local HitRemote = Net:FindFirstChild("RE/RegisterHit")
                        if HitRemote then
                            HitRemote:FireServer(
                                head,
                                targets,
                                {},
                                tostring(LocalPlayer.UserId):sub(2,4)
                            )
                        end

                        if u4 then
                            u4:FireServer(
                                "RE/RegisterHit",
                                u5 or 0,
                                head,
                                targets
                            )
                        end

                    end)
                end
            end
        end
    end)
end

return Module

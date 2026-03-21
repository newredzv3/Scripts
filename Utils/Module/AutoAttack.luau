local AutoAttack = {}

AutoAttack.Distance = 50
AutoAttack.attackMobs = true
AutoAttack.attackPlayers = true
AutoAttack.Equipped = nil
AutoAttack.Debounce = 0
AutoAttack.ComboDebounce = 0
AutoAttack.ShootDebounce = 0
AutoAttack.M1Combo = 0
AutoAttack.Enabled = false

AutoAttack.Overheat = {
    ["Dragonstorm"] = {
        MaxOverheat = 3,
        Cooldown = 0,
        TotalOverheat = 0,
        Distance = 350,
        Shooting = false
    }
}

AutoAttack.ShootsPerTarget = {
    ["Dual Flintlock"] = 2
}

AutoAttack.SpecialShoots = {
    ["Skull Guitar"] = "TAP",
    ["Bazooka"] = "Position",
    ["Cannon"] = "Position",
    ["Dragonstorm"] = "Overheat"
}

AutoAttack.HitboxLimbs = {"RightLowerArm","RightUpperArm","LeftLowerArm","LeftUpperArm","RightHand","LeftHand"}

function AutoAttack:Toggle(v)
    self.Enabled = v
end

local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local GunValidator = Remotes:WaitForChild("Validator2")
local Events = ReplicatedStorage:WaitForChild("Events")

local RE_RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RE_ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
local RE_RegisterHit = Net:WaitForChild("RE/RegisterHit")

local SUCCESS_FLAGS, COMBAT_REMOTE_THREAD = pcall(function()
    return require(Modules.Flags).COMBAT_REMOTE_THREAD or false
end)

local SUCCESS_SHOOT, SHOOT_FUNCTION = pcall(function()
    return getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack,9)
end)

local HIT_FUNCTION
task.defer(function()
    local PlayerScripts = Player:WaitForChild("PlayerScripts")
    local LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript")
    while not LocalScript do
        Player.PlayerScripts.ChildAdded:Wait()
        LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript")
    end
    if getsenv then
        local Success, ScriptEnv = pcall(getsenv, LocalScript)
        if Success and ScriptEnv then
            HIT_FUNCTION = ScriptEnv._G.SendHitsToServer
        end
    end
end)

local function IsAlive(Character)
    return Character and Character:FindFirstChild("Humanoid") and Character.Humanoid.Health > 0
end

AutoAttack.ShootsFunctions = {
    ["Skull Guitar"] = function(self,Equipped,Position)
        Events.ShootSoulGuitar:Invoke(Position)
    end
}

function AutoAttack:ShootInTarget(TargetPosition)
    local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
    if Equipped and Equipped.ToolTip == "Gun" then
        if Equipped:FindFirstChild("Cooldown") and (tick()-self.ShootDebounce)>=Equipped.Cooldown.Value then
            if self.ShootsFunctions[Equipped.Name] then
                return self.ShootsFunctions[Equipped.Name](self,Equipped,TargetPosition)
            end
            if SUCCESS_SHOOT and SHOOT_FUNCTION then
                local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
                if ShootType == "Position" or (ShootType=="TAP" and Equipped:FindFirstChild("RemoteEvent")) then
                    Equipped:SetAttribute("LocalTotalShots",(Equipped:GetAttribute("LocalTotalShots") or 0)+1)
                    GunValidator:FireServer(self:GetValidator2())
                    if ShootType=="TAP" then
                        Equipped.RemoteEvent:FireServer("TAP",TargetPosition)
                    else
                        RE_ShootGunEvent:FireServer(TargetPosition)
                    end
                    self.ShootDebounce = tick()
                end
            else
                VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,1); task.wait(0.05)
                VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,1); task.wait(0.05)
                self.ShootDebounce = tick()
            end
        end
    end
end

function AutoAttack:CheckStun(ToolTip,Character,Humanoid)
    if Humanoid.Sit and (ToolTip=="Sword" or ToolTip=="Melee" or ToolTip=="Gun") then return false end
    return true
end

function AutoAttack:Process(assert,Enemies,BladeHits,Position,Distance)
    if not assert then return end
    local HitboxLimbs = self.HitboxLimbs
    local Mobs = Enemies:GetChildren()
    for i=1,#Mobs do
        local Enemy = Mobs[i]
        local BasePart = Enemy:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)]) or Enemy.PrimaryPart
        if not BasePart then continue end
        local CanAttack = Enemy.Parent==workspace.Characters and CheckPlayerAlly(Players:GetPlayerFromCharacter(Enemy))
        if Enemy~=Player.Character and (Enemy.Parent~=workspace.Characters or CanAttack) then
            if IsAlive(Enemy) and (Position-BasePart.Position).Magnitude<=Distance then
                if not self.EnemyRootPart then
                    self.EnemyRootPart = BasePart
                else
                    table.insert(BladeHits,{Enemy,BasePart})
                end
            end
        end
    end
end

function AutoAttack:GetAllBladeHits(Character,Distance)
    local Position = Character:GetPivot().Position
    local BladeHits = {}
    Distance = Distance or self.Distance
    self:Process(self.attackMobs,workspace.Enemies,BladeHits,Position,Distance)
    self:Process(self.attackPlayers,workspace.Characters,BladeHits,Position,Distance)
    return BladeHits
end

function AutoAttack:GetClosestEnemy(Character,Distance)
    local BladeHits = self:GetAllBladeHits(Character,Distance)
    local DistanceVal,Closest = math.huge
    for i=1,#BladeHits do
        local Magnitude = Closest and (Closest.Position-BladeHits[i][2].Position).Magnitude or DistanceVal
        if Magnitude<=DistanceVal then DistanceVal,Closest = Magnitude,BladeHits[i][2] end
    end
    return Closest
end

function AutoAttack:GetGunHits(Character,Distance)
    local BladeHits = self:GetAllBladeHits(Character,Distance)
    local GunHits = {}
    for i=1,#BladeHits do
        if not GunHits[1] or (BladeHits[i][2].Position-GunHits[1].Position).Magnitude<=10 then
            table.insert(GunHits,BladeHits[i][2])
        end
    end
    return GunHits
end

function AutoAttack:GetCombo()
    local Combo = tick()-self.ComboDebounce<=0.4 and self.M1Combo or 0
    Combo = Combo>=4 and 1 or Combo+1
    self.ComboDebounce = tick()
    self.M1Combo = Combo
    return Combo
end

function AutoAttack:UseFruitM1(Character,Equipped,Combo)
    local Position = Character:GetPivot().Position
    local EnemyList = workspace.Enemies:GetChildren()
    for i=1,#EnemyList do
        local Enemy = EnemyList[i]
        local PrimaryPart = Enemy.PrimaryPart
        if IsAlive(Enemy) and PrimaryPart and (PrimaryPart.Position-Position).Magnitude<=50 then
            local Direction = (PrimaryPart.Position-Position).Unit
            return Equipped.LeftClickRemote:FireServer(Direction,Combo)
        end
    end
end

function AutoAttack:UseNormalClick(Humanoid,Character,Cooldown)
    self.EnemyRootPart = nil
    local BladeHits = self:GetAllBladeHits(Character)
    local EnemyRoot = self.EnemyRootPart
    if EnemyRoot then
        if SUCCESS_FLAGS and COMBAT_REMOTE_THREAD and HIT_FUNCTION then
            RE_RegisterAttack:FireServer(Cooldown)
            HIT_FUNCTION(EnemyRoot,BladeHits)
        elseif SUCCESS_FLAGS and not COMBAT_REMOTE_THREAD then
            RE_RegisterAttack:FireServer(Cooldown)
            RE_RegisterHit:FireServer(EnemyRoot,BladeHits)
        else
            EnemyRoot.Size = Vector3.one*50
            for i=1,#BladeHits do BladeHits[i][2].Size = Vector3.one*50 end
            VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,1); task.wait(0.05)
            VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,1)
        end
    end
end

function AutoAttack:GetValidator2()
    local v1=getupvalue(SHOOT_FUNCTION,15)
    local v2=getupvalue(SHOOT_FUNCTION,13)
    local v3=getupvalue(SHOOT_FUNCTION,16)
    local v4=getupvalue(SHOOT_FUNCTION,17)
    local v5=getupvalue(SHOOT_FUNCTION,14)
    local v6=getupvalue(SHOOT_FUNCTION,12)
    local v7=getupvalue(SHOOT_FUNCTION,18)
    local v8=v6*v2
    local v9=(v5*v2+v6*v1)%v3
    v9=(v9*v3+v8)%v4
    v5=math.floor(v9/v3)
    v6=v9-v5*v3
    v7=v7+1
    setupvalue(SHOOT_FUNCTION,15,v1)
    setupvalue(SHOOT_FUNCTION,13,v2)
    setupvalue(SHOOT_FUNCTION,16,v3)
    setupvalue(SHOOT_FUNCTION,17,v4)
    setupvalue(SHOOT_FUNCTION,14,v5)
    setupvalue(SHOOT_FUNCTION,12,v6)
    setupvalue(SHOOT_FUNCTION,18,v7)
    return math.floor(v9/v4*16777215),v7
end

function AutoAttack:UseGunShoot(Character,Equipped)
    if not Equipped.Enabled then return end
    local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
    if ShootType=="Normal" or ShootType=="Overheat" then
        if ShootType=="Overheat" then
            local Data = self.Overheat[Equipped.Name]
            if Data.Shooting then return end
            local Target = self:GetClosestEnemy(Character,Data.Distance or 100)
            if Target then
                Data.Shooting = true
                while Equipped and Equipped.Parent==Player.Character and Data.TotalOverheat<Data.MaxOverheat do
                    if Target and Target.Parent and IsAlive(Target.Parent) then
                        Equipped:SetAttribute("LocalTotalShots",(Equipped:GetAttribute("LocalTotalShots") or 0)+1)
                        GunValidator:FireServer(self:GetValidator2())
                        RE_ShootGunEvent:FireServer(Target.Position,{Target})
                        Data.TotalOverheat += task.wait(Data.Cooldown)
                    else break end
                end
                while Data.TotalOverheat>0 do
                    Data.TotalOverheat = math.clamp(Data.TotalOverheat-task.wait(),0,Data.MaxOverheat)
                end
                Data.Shooting = false
            end
        else
            local Hits = self:GetGunHits(Character,120)
            local Target = Hits[1] and Hits[1].Position
            if Target then
                Equipped:SetAttribute("LocalTotalShots",(Equipped:GetAttribute("LocalTotalShots") or 0)+1)
                GunValidator:FireServer(self:GetValidator2())
                for i=1,(self.ShootsPerTarget[Equipped.Name] or 1) do
                    RE_ShootGunEvent:FireServer(Target,Hits)
                end
            end
        end
    elseif ShootType=="Position" or (ShootType=="TAP" and Equipped:FindFirstChild("RemoteEvent")) then
        local Target = self:GetClosestEnemy(Character,200)
        if Target then
            if self.ShootsFunctions[Equipped.Name] then
                return self.ShootsFunctions[Equipped.Name](self,Equipped,Target.Position)
            end
            Equipped:SetAttribute("LocalTotalShots",(Equipped:GetAttribute("LocalTotalShots") or 0)+1)
            GunValidator:FireServer(self:GetValidator2())
            if ShootType=="TAP" then
                Equipped.RemoteEvent:FireServer("TAP",Target.Position)
            else
                RE_ShootGunEvent:FireServer(Target.Position)
            end
        end
    end
end

function AutoAttack.attack()
    if not AutoAttack.Enabled or (tick()-Module.AttackCooldown)<=1 then return end
    if not IsAlive(Player.Character) then return end
    local self=AutoAttack
    local Character=Player.Character
    local Humanoid=Character.Humanoid
    local Equipped=Character:FindFirstChildOfClass("Tool")
    local ToolTip=Equipped and Equipped.ToolTip
    local ToolName=Equipped and Equipped.Name
    if not Equipped or (ToolTip~="Gun" and ToolTip~="Melee" and ToolTip~="Blox Fruit" and ToolTip~="Sword") then return end
    local Cooldown=Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3
    if (tick()-self.Debounce)>=Cooldown and self:CheckStun(ToolTip,Character,Humanoid) then
        local Combo=self:GetCombo()
        Cooldown += Combo>=4 and 0.05 or 0
        self.Equipped=Equipped
        self.Debounce = Combo>=4 and ToolTip~="Gun" and (tick()+0.05) or tick()
        if ToolTip=="Blox Fruit" then
            if ToolName=="Ice-Ice" or ToolName=="Light-Light" then
                return self:UseNormalClick(Humanoid,Character,Cooldown)
            elseif Equipped:FindFirstChild("LeftClickRemote") then
                return self:UseFruitM1(Character,Equipped,Combo)
            end
        elseif ToolTip=="Gun" then
            return self:UseGunShoot(Character,Equipped)
        else
            return self:UseNormalClick(Humanoid,Character,Cooldown)
        end
    end
end

table.insert(Connections,RunService.Stepped:Connect(AutoAttack.attack))

return AutoAttack

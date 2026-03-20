local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local Player = Players.LocalPlayer

Enemies = workspace:WaitForChild("Enemies")
Characters = workspace:WaitForChild("Characters")
SeaBeasts = workspace:WaitForChild("SeaBeasts")

Net = ReplicatedStorage:WaitForChild("Remotes")
Modules = ReplicatedStorage:WaitForChild("Modules")
GunValidator = Net:WaitForChild("RE/GunValidator")

Stepped = RunService.Stepped
Connections = Connections or {}

Settings = Settings or {}
getgenv().Settings = Settings

Module = Module or {}

Module.IsAlive = function(char)
    return char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0
end

Module.AttackCooldown = 0

function CheckPlayerAlly()
    return false
end

function DistanceFromCharacter(part)
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return math.huge end
    return (char.HumanoidRootPart.Position - part.Position).Magnitude
end

Module.FastAttack = (function()
	local FastAttack = {
		Distance = 50,
		attackMobs = true,
		attackPlayers = true,
		Equipped = nil,
		Debounce = 0,
		ComboDebounce = 0,
		ShootDebounce = 0,
		M1Combo = 0,
		
		Overheat = {
			["Dragonstorm"] = {
				MaxOverheat = 3,
				Cooldown = 0,
				TotalOverheat = 0,
				Distance = 400,
				Shooting = false
			}
		},
		ShootsPerTarget = {
			["Dual Flintlock"] = 2
		},
		SpecialShoots = {
			["Skull Guitar"] = "TAP",
			["Bazooka"] = "Position",
			["Cannon"] = "Position",
			["Dragonstorm"] = "Overheat"
		},
		NormalClickFruits = {
			["Light-Light"] = true,
			["Ice-Ice"] = true
		}
	}
	
	local RE_RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
	local RE_ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
	local RE_RegisterHit = Net:WaitForChild("RE/RegisterHit")
	local Events = ReplicatedStorage:WaitForChild("Events")
	
	local SUCCESS_FLAGS, COMBAT_REMOTE_THREAD = pcall(function()
		return require(Modules.Flags).COMBAT_REMOTE_THREAD or false
	end)
	
	local SUCCESS_SHOOT, SHOOT_FUNCTION = pcall(function()
		return getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack, 9)
	end)
	
	local HIT_FUNCTION; task.defer(function()			
		if getsenv then
				HIT_FUNCTION = (getmenv or getsenv)(Net)._G.SendHitsToServer
			end
	end)

    local IsAlive = Module.IsAlive
	
	FastAttack.ShootsFunctions = {
		["Skull Guitar"] = function(self: FastAttack, Equipped: Tool, Position: Vector3)
			Equipped.RemoteEvent:FireServer("TAP", Position)
		end
	}
	
	local CurrentBladeHits = {};
	local MyRootPartPosition = nil;
	local NoAttackBelowTool = nil;
	local NoAttackBelowDebounce = 0;
	local BelowHealthPercent = 0;
	
	local function ExpandsHitBox(Enemies: { table }): (nil)
		for i = 1, #Enemies do
			Enemies[i][2].Size = Vector3.one * 50
			Enemies[i][2].Transparency = 1
		end
	end
	
	local function CheckStun(ToolTip: string, Character: Character, Humanoid: Humanoid): boolean
		if Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Gun") then
			return false
		end
		
		return true
	end
	
	local function NewBladeHit(RootPart: BasePart, Character: Model): (nil)
		table.insert(CurrentBladeHits, { Character, RootPart })
	end
	
	local function GetMaxHits(Character)
		if Character:FindFirstChild("HumanoidRootPart") and Character.HumanoidRootPart:FindFirstChild("Buddha") then
			return 10
		end
		return 1
	end
	
	local function ProcessSeaEventsHits(Distance)
		for _, SeaBeast in SeaBeasts:GetChildren() do
			local BasePart = SeaBeast:FindFirstChildOfClass("MeshPart")
			
			if IsAlive(SeaBeast) and BasePart and (MyRootPartPosition - BasePart.Position).Magnitude < Distance then
				NewBladeHit(BasePart, SeaBeast)
			end
		end
		
		for _, Boat in Enemies:GetChildren() do
			if not Boat:GetAttribute("IsBoat") then continue end
			local BasePart = Boat:FindFirstChildOfClass("MeshPart")
			
			if IsAlive(Boat) and BasePart and (MyRootPartPosition - BasePart.Position).Magnitude < Distance then
				NewBladeHit(BasePart, Boat)
			end
		end
	end
	
	local function CanChangeGunTarget(Target, Enemy)
		if Enemy.Parent == SeaBeasts then
			return true
		elseif Target.Parent ~= SeaBeasts and Enemy:GetAttribute("IsBoat") then
			return true
		end
		
		return false
	end
	
	local function ConvertToGunHits()
		local Target, Hitbox;
		
		for index = 1, #CurrentBladeHits do
			local Hit = CurrentBladeHits[index]
			
			if not Target or CanChangeGunTarget(Target, Hit[1]) then
				Hitbox, Target = Hit[2], Hit[1];
			end
		end
		
		CurrentBladeHits = { Hitbox, math.random() }
		return Hitbox.Position, Hitbox;
	end
	
	local function ProcessHits(List: Folder, Equipped: Tool, Distance: number): (nil)
		local MyCharacter = Player.Character;
		local Targets = List:GetChildren();
		local MaxHits = GetMaxHits(MyCharacter) + 1;
		
		for i = 1, #Targets do
			if #CurrentBladeHits >= MaxHits then break end
			
			local Character = Targets[i]
			if Character == MyCharacter or Character:GetAttribute("IsBoat") or not IsAlive(Character) then continue end
			local RootPart = Character.PrimaryPart
			
			if (tick() - NoAttackBelowDebounce) <= 1 then
				local Humanoid = Character.Humanoid
				
				if Humanoid.Health / Humanoid.MaxHealth * 100 <= BelowHealthPercent then
					continue
				end
			end
			
			if RootPart and (Character.Parent ~= Characters or CheckPlayerAlly(Character)) then
				local Hitbox = RootPart
				
				if Hitbox and (MyRootPartPosition - RootPart.Position).Magnitude <= Distance then
					NewBladeHit(Hitbox, Character)
				end
			end
		end
	end
	
	function FastAttack:DontAttackBelowPercent(Percent: number): boolean
		if SUCCESS_FLAGS and not COMBAT_REMOTE_THREAD or SUCCESS_FLAGS and COMBAT_REMOTE_THREAD and HIT_FUNCTION then
			BelowHealthPercent = Percent
			NoAttackBelowDebounce = tick()
			
			return true
		end
		
		return false
	end
	
	function FastAttack:UpdateBladeHits(Distance: number?, Anything: boolean?, SeasEvents: boolean?): (nil)
		Distance = Distance or self.Distance;
		CurrentBladeHits = {};
		
		if Anything or self.attackMobs then
			ProcessHits(Enemies, self.Equipped, Distance)
		end
		if Anything or self.attackPlayers then
			ProcessHits(Characters, self.Equipped, Distance)
		end
		if SeasEvents then
			ProcessSeaEventsHits(Distance, self.Equipped)
		end
	end
	
	function FastAttack:ShootInTarget(TargetPosition: Vector3): (nil)
		local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
		
		if Equipped and Equipped.ToolTip == "Gun" then
			if Equipped:FindFirstChild("Cooldown") and (tick() - self.ShootDebounce) >= Equipped.Cooldown.Value then
				if self.ShootsFunctions[Equipped.Name] then
					return self.ShootsFunctions[Equipped.Name](self, Equipped, TargetPosition)
				end
				
				if SUCCESS_SHOOT and SHOOT_FUNCTION then
					local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
					
					if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
						Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
						GunValidator:FireServer(self:GetValidator2())
						
						if ShootType == "TAP" then
							Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
						else
							RE_ShootGunEvent:FireServer(TargetPosition)
						end
						
						self.ShootDebounce = tick()
					end
				else
					VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1);task.wait(0.05)
					VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1);task.wait(0.05)
					self.ShootDebounce = tick()
				end
			end
		end
	end
	
	function FastAttack:GetClosestEnemy(Distance: number?): (nil)
		self:UpdateBladeHits(Distance, true)
		
		local Distance, Closest = math.huge
		
		for i = 1, #CurrentBladeHits do
			local Magnitude = (MyRootPartPosition - CurrentBladeHits[i][2].Position).Magnitude
			
			if Magnitude <= Distance then
				Distance, Closest = Magnitude, CurrentBladeHits[i][2]
			end
		end
		
		return Closest
	end
	
	function FastAttack:GetCombo(): number
		local Combo = if tick() - self.ComboDebounce <= 0.4 then self.M1Combo else 0
		Combo = if Combo >= 4 then 1 else Combo + 1
		
		self.ComboDebounce = tick()
		self.M1Combo = Combo
		
		return Combo
	end
	
	function FastAttack:UseFruitM1(Character: Character, Equipped: Tool, Combo: number): (nil)
		local MyPosition = Character.Humanoid.RootPart.Position
		local _Enemies = Enemies:GetChildren()
		
		for i = 1, #_Enemies do
			local Enemy = _Enemies[i]
			local RootPart = IsAlive(Enemy) and Enemy.PrimaryPart
			
			if RootPart and (RootPart.Position - MyPosition).Magnitude <= 50 then
				Equipped.LeftClickRemote:FireServer((RootPart.Position - MyPosition).Unit, Combo)
			end
		end
	end
	
	function FastAttack:UseNormalClick(Cooldown: number): (nil)
		self:UpdateBladeHits()
		
		if #CurrentBladeHits > 0 then
			local PrimaryRootPart = table.remove(CurrentBladeHits)[2]
			
			if SUCCESS_FLAGS and COMBAT_REMOTE_THREAD and HIT_FUNCTION then
				RE_RegisterAttack:FireServer(Cooldown)
				HIT_FUNCTION(PrimaryRootPart, CurrentBladeHits)
			elseif SUCCESS_FLAGS and not COMBAT_REMOTE_THREAD then
				RE_RegisterAttack:FireServer(Cooldown)
				RE_RegisterHit:FireServer(PrimaryRootPart, CurrentBladeHits)
			else
				table.insert(CurrentBladeHits, { Enemy, PrimaryRootPart })
				ExpandsHitBox(CurrentBladeHits)
				
				VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1);task.wait(0.05)
				VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
			end
		end
	end
	
	function FastAttack:GetValidator2()
		local v1 = getupvalue(SHOOT_FUNCTION, 15)
		local v2 = getupvalue(SHOOT_FUNCTION, 13)
		local v3 = getupvalue(SHOOT_FUNCTION, 16)
		local v4 = getupvalue(SHOOT_FUNCTION, 17)
		local v5 = getupvalue(SHOOT_FUNCTION, 14)
		local v6 = getupvalue(SHOOT_FUNCTION, 12)
		local v7 = getupvalue(SHOOT_FUNCTION, 18)
		
		local v8 = v6 * v2
		local v9 = (v5 * v2 + v6 * v1) % v3
		
		v9 = (v9 * v3 + v8) % v4
		v5 = math.floor(v9 / v3)
		v6 = v9 - v5 * v3
		v7 = v7 + 1
		
		setupvalue(SHOOT_FUNCTION, 15, v1)
		setupvalue(SHOOT_FUNCTION, 13, v2)
		setupvalue(SHOOT_FUNCTION, 16, v3)
		setupvalue(SHOOT_FUNCTION, 17, v4)
		setupvalue(SHOOT_FUNCTION, 14, v5)
		setupvalue(SHOOT_FUNCTION, 12, v6)
		setupvalue(SHOOT_FUNCTION, 18, v7)
		
		return math.floor(v9 / v4 * 16777215), v7
	end
	
	function FastAttack:UseGunShoot(Character, Equipped)
		if not Equipped.Enabled then return end
		
		local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
		
		if ShootType == "Normal" or ShootType == "Overheat" then
			local Distance = if ShootType == "Overheat" then self.Overheat[Equipped.Name].Distance else 200
			self:UpdateBladeHits(Distance, false, true)
			
			if #CurrentBladeHits == 0 then
				return nil
			end
			
			local Position, PrimaryPart = ConvertToGunHits()
			local PrimaryTarget = PrimaryPart.Parent
			
			if ShootType == "Overheat" then
				self.Debounce = tick() + 9e9
				
				while PrimaryTarget.Parent and IsAlive(PrimaryTarget) and Equipped and Equipped.Parent == Player.Character do
					if PrimaryPart.Parent ~= PrimaryTarget or DistanceFromCharacter(PrimaryPart) > Distance then
						break
					end
					
					Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
					GunValidator:FireServer(self:GetValidator2())
					RE_ShootGunEvent:FireServer(Position, CurrentBladeHits)
					task.wait()
				end
				
				self.Debounce = 0
			elseif PrimaryTarget then
				Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
				GunValidator:FireServer(self:GetValidator2())
				
				for i = 1, (self.ShootsPerTarget[Equipped.Name] or 1) do
					RE_ShootGunEvent:FireServer(Position, CurrentBladeHits)
				end
			end
		elseif ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
			local Target = self:GetClosestEnemy(200)
			
			if Target then
				if self.ShootsFunctions[Equipped.Name] then
					return self.ShootsFunctions[Equipped.Name](self, Equipped, Target.Position)
				end
				
				Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
				GunValidator:FireServer(self:GetValidator2())
				
				if ShootType == "TAP" then
					Equipped.RemoteEvent:FireServer("TAP", Target.Position)
				else
					RE_ShootGunEvent:FireServer(Target.Position)
				end
			end
		end
	end
	
	table.insert(Connections, Stepped:Connect(function()
		if not Settings.AutoClick or (tick() - Module.AttackCooldown) <= 1 then return end
		if not IsAlive(Player.Character) then return end
		
		local self = FastAttack;
		local Character = Player.Character;
        local Humanoid = Character.Humanoid;
		
		local Equipped = Character:FindFirstChildOfClass("Tool")
		local ToolTip = Equipped and Equipped.ToolTip
		
		if not Equipped or (ToolTip ~= "Gun" and ToolTip ~= "Melee" and ToolTip ~= "Blox Fruit" and ToolTip ~= "Sword") then
			return nil
		end
		
		local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3;
		
		if (tick() - self.Debounce) >= Cooldown and CheckStun(ToolTip, Character, Humanoid) then
			local Combo = self:GetCombo();
			if Combo >= 4 then Cooldown += 0.05 end;
			
			self.Equipped = Equipped;
			self.Debounce = if Combo >= 4 and ToolTip ~= "Gun" then tick() + (Cooldown / 2) else tick();
			MyRootPartPosition = Character.HumanoidRootPart.Position;
			
			if ToolTip == "Blox Fruit" and not self.NormalClickFruits[Equipped.Name] then
				if Equipped:FindFirstChild("LeftClickRemote") then
					self:UseFruitM1(Character, Equipped, Combo)
				end
			elseif ToolTip == "Gun" then
				if SUCCESS_SHOOT and SHOOT_FUNCTION then
					self:UseGunShoot(Character, Equipped)
				end
			else
				self:UseNormalClick(Cooldown)
			end
		end
	end))
	
	return FastAttack
end)()

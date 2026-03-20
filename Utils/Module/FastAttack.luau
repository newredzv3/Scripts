Module.FastAttack = (function()
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local CollectionService = game:GetService("CollectionService")
	
	local Player = Players.LocalPlayer
	local Enemies = workspace:FindFirstChild("Enemies")
	local SeaBeasts = workspace:FindFirstChild("SeaBeasts")
	local Characters = workspace:FindFirstChild("Characters")
	
	if not Enemies or not SeaBeasts or not Characters then
		return {}
	end
	
	local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
	if not Remotes then return {} end
	
	local GunValidator = Remotes:FindFirstChild("Validator2")
	if not GunValidator then return {} end
	
	local Modules = ReplicatedStorage:FindFirstChild("Modules")
	if not Modules then return {} end
	
	local Net = Modules:FindFirstChild("Net")
	if not Net then return {} end
	
	local RE_RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
	local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")
	local RE_RegisterHit = Net:FindFirstChild("RE/RegisterHit")
	
	local SUCCESS_FLAGS, COMBAT_REMOTE_THREAD = pcall(function()
		local Flags = Modules:FindFirstChild("Flags")
		if Flags then
			return require(Flags).COMBAT_REMOTE_THREAD or false
		end
		return false
	end)
	
	local SUCCESS_SHOOT = false
	local SHOOT_FUNCTION = nil
	
	pcall(function()
		local CombatController = ReplicatedStorage:FindFirstChild("Controllers")
		if CombatController then
			CombatController = CombatController:FindFirstChild("CombatController")
			if CombatController then
				local Attack = require(CombatController).Attack
				SHOOT_FUNCTION = getupvalue(Attack, 9)
				SUCCESS_SHOOT = true
			end
		end
	end)
	
	local HIT_FUNCTION
	task.defer(function()			
		if getsenv and Net then
			local env = (getmenv or getsenv)(Net)
			if env and env._G then
				HIT_FUNCTION = env._G.SendHitsToServer
			end
		end
	end)
	
	local function IsAlive(Character)
		if Character then
			local Humanoid = Character:FindFirstChild("Humanoid")
			if Humanoid and Humanoid.Health > 0 then
				return true
			end
		end
		return false
	end
	
	local function CheckPlayerAlly(__Player)
		local PlayerTeam = Player.Team
		if __Player.Team and PlayerTeam and tostring(__Player.Team) == "Marines" and __Player.Team == PlayerTeam then
			return false
		elseif __Player:HasTag("Ally" .. Player.Name) or Player:HasTag("Ally" .. __Player.Name) then
			return false
		end
		return true
	end
	
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
	
	FastAttack.ShootsFunctions = {
		["Skull Guitar"] = function(self, Equipped, Position)
			local RemoteEvent = Equipped:FindFirstChild("RemoteEvent")
			if RemoteEvent then
				RemoteEvent:FireServer("TAP", Position)
			end
		end
	}
	
	local CurrentBladeHits = {}
	local MyRootPartPosition = nil
	local NoAttackBelowDebounce = 0
	local BelowHealthPercent = 0
	
	local function ExpandsHitBox(EnemiesList)
		for i = 1, #EnemiesList do
			if EnemiesList[i][2] then
				EnemiesList[i][2].Size = Vector3.one * 50
				EnemiesList[i][2].Transparency = 1
			end
		end
	end
	
	local function CheckStun(ToolTip, Character, Humanoid)
		if Humanoid and Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Gun") then
			return false
		end
		return true
	end
	
	local function NewBladeHit(RootPart, Character)
		table.insert(CurrentBladeHits, { Character, RootPart })
	end
	
	local function GetMaxHits(Character)
		if Character and Character:FindFirstChild("HumanoidRootPart") and Character.HumanoidRootPart:FindFirstChild("Buddha") then
			return 10
		end
		return 1
	end
	
	local function ProcessSeaEventsHits(Distance)
		if not SeaBeasts then return end
		for _, SeaBeast in SeaBeasts:GetChildren() do
			local BasePart = SeaBeast:FindFirstChildOfClass("MeshPart")
			if IsAlive(SeaBeast) and BasePart and MyRootPartPosition and (MyRootPartPosition - BasePart.Position).Magnitude < Distance then
				NewBladeHit(BasePart, SeaBeast)
			end
		end
		
		if not Enemies then return end
		for _, Boat in Enemies:GetChildren() do
			if not Boat:GetAttribute("IsBoat") then continue end
			local BasePart = Boat:FindFirstChildOfClass("MeshPart")
			if IsAlive(Boat) and BasePart and MyRootPartPosition and (MyRootPartPosition - BasePart.Position).Magnitude < Distance then
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
		local Target, Hitbox
		
		for index = 1, #CurrentBladeHits do
			local Hit = CurrentBladeHits[index]
			if not Target or CanChangeGunTarget(Target, Hit[1]) then
				Hitbox, Target = Hit[2], Hit[1]
			end
		end
		
		CurrentBladeHits = { Hitbox, math.random() }
		if Hitbox then
			return Hitbox.Position, Hitbox
		end
		return nil, nil
	end
	
	local function ProcessHits(List, Equipped, Distance)
		if not List or not MyRootPartPosition then return end
		local MyCharacter = Player.Character
		if not MyCharacter then return end
		
		local Targets = List:GetChildren()
		local MaxHits = GetMaxHits(MyCharacter) + 1
		
		for i = 1, #Targets do
			if #CurrentBladeHits >= MaxHits then break end
			
			local Character = Targets[i]
			if Character == MyCharacter or Character:GetAttribute("IsBoat") or not IsAlive(Character) then continue end
			local RootPart = Character.PrimaryPart or Character:FindFirstChild("HumanoidRootPart")
			
			if (tick() - NoAttackBelowDebounce) <= 1 then
				local Humanoid = Character:FindFirstChild("Humanoid")
				if Humanoid and Humanoid.Health / Humanoid.MaxHealth * 100 <= BelowHealthPercent then
					continue
				end
			end
			
			if RootPart then
				local isPlayer = Character.Parent == Characters
				if not isPlayer or (isPlayer and CheckPlayerAlly(Character)) then
					local Hitbox = RootPart
					if Hitbox and (MyRootPartPosition - RootPart.Position).Magnitude <= Distance then
						NewBladeHit(Hitbox, Character)
					end
				end
			end
		end
	end
	
	function FastAttack:DontAttackBelowPercent(Percent)
		if SUCCESS_FLAGS and not COMBAT_REMOTE_THREAD or SUCCESS_FLAGS and COMBAT_REMOTE_THREAD and HIT_FUNCTION then
			BelowHealthPercent = Percent
			NoAttackBelowDebounce = tick()
			return true
		end
		return false
	end
	
	function FastAttack:UpdateBladeHits(Distance, Anything, SeasEvents)
		Distance = Distance or self.Distance
		CurrentBladeHits = {}
		
		if not Enemies or not Characters then return end
		
		if Anything or self.attackMobs then
			ProcessHits(Enemies, self.Equipped, Distance)
		end
		if Anything or self.attackPlayers then
			ProcessHits(Characters, self.Equipped, Distance)
		end
		if SeasEvents then
			ProcessSeaEventsHits(Distance)
		end
	end
	
	function FastAttack:GetClosestEnemy(Distance)
		self:UpdateBladeHits(Distance, true)
		
		local Dist, Closest = math.huge
		
		for i = 1, #CurrentBladeHits do
			if CurrentBladeHits[i][2] and MyRootPartPosition then
				local Magnitude = (MyRootPartPosition - CurrentBladeHits[i][2].Position).Magnitude
				if Magnitude <= Dist then
					Dist, Closest = Magnitude, CurrentBladeHits[i][2]
				end
			end
		end
		
		return Closest
	end
	
	function FastAttack:GetCombo()
		local Combo = if tick() - self.ComboDebounce <= 0.4 then self.M1Combo else 0
		Combo = if Combo >= 4 then 1 else Combo + 1
		
		self.ComboDebounce = tick()
		self.M1Combo = Combo
		
		return Combo
	end
	
	function FastAttack:UseFruitM1(Character, Equipped, Combo)
		if not Character or not Equipped then return end
		local MyPosition = Character.Humanoid and Character.Humanoid.RootPart and Character.Humanoid.RootPart.Position
		if not MyPosition or not Enemies then return end
		
		local _Enemies = Enemies:GetChildren()
		
		for i = 1, #_Enemies do
			local Enemy = _Enemies[i]
			local RootPart = IsAlive(Enemy) and (Enemy.PrimaryPart or Enemy:FindFirstChild("HumanoidRootPart"))
			
			if RootPart and (RootPart.Position - MyPosition).Magnitude <= 50 then
				local LeftClickRemote = Equipped:FindFirstChild("LeftClickRemote")
				if LeftClickRemote then
					LeftClickRemote:FireServer((RootPart.Position - MyPosition).Unit, Combo)
				end
			end
		end
	end
	
	function FastAttack:UseNormalClick(Cooldown)
		self:UpdateBladeHits()
		
		if #CurrentBladeHits > 0 then
			local hit = table.remove(CurrentBladeHits)
			local PrimaryRootPart = hit and hit[2]
			
			if not PrimaryRootPart then return end
			
			if SUCCESS_FLAGS and COMBAT_REMOTE_THREAD and HIT_FUNCTION then
				if RE_RegisterAttack then RE_RegisterAttack:FireServer(Cooldown) end
				HIT_FUNCTION(PrimaryRootPart, CurrentBladeHits)
			elseif SUCCESS_FLAGS and not COMBAT_REMOTE_THREAD then
				if RE_RegisterAttack then RE_RegisterAttack:FireServer(Cooldown) end
				if RE_RegisterHit then RE_RegisterHit:FireServer(PrimaryRootPart, CurrentBladeHits) end
			else
				ExpandsHitBox(CurrentBladeHits)
				VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
				task.wait(0.05)
				VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
			end
		end
	end
	
	function FastAttack:GetValidator2()
		if not SHOOT_FUNCTION then return 0, 0 end
		
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
	
	function FastAttack:ShootInTarget(TargetPosition)
		local Character = Player.Character
		if not IsAlive(Character) then return end
		
		local Equipped = Character:FindFirstChildOfClass("Tool")
		
		if Equipped and Equipped.ToolTip == "Gun" then
			local CooldownObj = Equipped:FindFirstChild("Cooldown")
			if CooldownObj and (tick() - self.ShootDebounce) >= CooldownObj.Value then
				if self.ShootsFunctions[Equipped.Name] then
					return self.ShootsFunctions[Equipped.Name](self, Equipped, TargetPosition)
				end
				
				if SUCCESS_SHOOT and SHOOT_FUNCTION then
					local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
					
					if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
						Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
						if GunValidator then
							local v1, v2 = self:GetValidator2()
							GunValidator:FireServer(v1, v2)
						end
						
						if ShootType == "TAP" then
							local RemoteEvent = Equipped:FindFirstChild("RemoteEvent")
							if RemoteEvent then RemoteEvent:FireServer("TAP", TargetPosition) end
						else
							if RE_ShootGunEvent then RE_ShootGunEvent:FireServer(TargetPosition) end
						end
						
						self.ShootDebounce = tick()
					end
				else
					VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
					task.wait(0.05)
					VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
					self.ShootDebounce = tick()
				end
			end
		end
	end
	
	function FastAttack:UseGunShoot(Character, Equipped)
		if not Equipped.Enabled then return end
		
		local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
		
		if ShootType == "Normal" or ShootType == "Overheat" then
			local Distance = if ShootType == "Overheat" and self.Overheat[Equipped.Name] then self.Overheat[Equipped.Name].Distance else 200
			self:UpdateBladeHits(Distance, false, true)
			
			if #CurrentBladeHits == 0 then
				return nil
			end
			
			local Position, PrimaryPart = ConvertToGunHits()
			if not Position or not PrimaryPart then return end
			
			local PrimaryTarget = PrimaryPart.Parent
			
			if ShootType == "Overheat" then
				self.Debounce = tick() + 9e9
				
				while PrimaryTarget and PrimaryTarget.Parent and IsAlive(PrimaryTarget) and Equipped and Equipped.Parent == Player.Character do
					if PrimaryPart.Parent ~= PrimaryTarget then
						break
					end
					
					Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
					if GunValidator then
						local v1, v2 = self:GetValidator2()
						GunValidator:FireServer(v1, v2)
					end
					if RE_ShootGunEvent then RE_ShootGunEvent:FireServer(Position, CurrentBladeHits) end
					task.wait()
				end
				
				self.Debounce = 0
			elseif PrimaryTarget then
				Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
				if GunValidator then
					local v1, v2 = self:GetValidator2()
					GunValidator:FireServer(v1, v2)
				end
				
				for i = 1, (self.ShootsPerTarget[Equipped.Name] or 1) do
					if RE_ShootGunEvent then RE_ShootGunEvent:FireServer(Position, CurrentBladeHits) end
				end
			end
		elseif ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
			local Target = self:GetClosestEnemy(200)
			
			if Target then
				if self.ShootsFunctions[Equipped.Name] then
					return self.ShootsFunctions[Equipped.Name](self, Equipped, Target.Position)
				end
				
				Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
				if GunValidator then
					local v1, v2 = self:GetValidator2()
					GunValidator:FireServer(v1, v2)
				end
				
				if ShootType == "TAP" then
					local RemoteEvent = Equipped:FindFirstChild("RemoteEvent")
					if RemoteEvent then RemoteEvent:FireServer("TAP", Target.Position) end
				else
					if RE_ShootGunEvent then RE_ShootGunEvent:FireServer(Target.Position) end
				end
			end
		end
	end
	
	RunService.Stepped:Connect(function()
		if not Settings.AutoClick or (tick() - (Module.AttackCooldown or 0)) <= 1 then return end
		if not IsAlive(Player.Character) then return end
		
		local self = FastAttack
		local Character = Player.Character
		local Humanoid = Character:FindFirstChild("Humanoid")
		
		if not Humanoid then return end
		
		local Equipped = Character:FindFirstChildOfClass("Tool")
		local ToolTip = Equipped and Equipped.ToolTip
		
		if not Equipped or (ToolTip ~= "Gun" and ToolTip ~= "Melee" and ToolTip ~= "Blox Fruit" and ToolTip ~= "Sword") then
			return
		end
		
		local CooldownObj = Equipped:FindFirstChild("Cooldown")
		local Cooldown = CooldownObj and CooldownObj.Value or 0.3
		
		if (tick() - self.Debounce) >= Cooldown and CheckStun(ToolTip, Character, Humanoid) then
			local Combo = self:GetCombo()
			if Combo >= 4 then Cooldown = Cooldown + 0.05 end
			
			self.Equipped = Equipped
			self.Debounce = if Combo >= 4 and ToolTip ~= "Gun" then tick() + (Cooldown / 2) else tick()
			
			local RootPart = Character:FindFirstChild("HumanoidRootPart")
			if RootPart then
				MyRootPartPosition = RootPart.Position
			end
			
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
	end)
	
	return FastAttack
end)()

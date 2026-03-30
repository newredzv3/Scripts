local Settings, Connections = ...

local _ENV = (getgenv or getrenv or getfenv)()

if type(Settings) ~= "table" or type(Connections) ~= "table" then
	return {}
end
local RunService: RunService = game:GetService("RunService")
local Players: Players = game:GetService("Players")
local VirtualInputManager: VirtualInputManager = game:GetService("VirtualInputManager")
local CollectionService: CollectionService = game:GetService("CollectionService")
local UserInputService: UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local Enemies: Folder = workspace:WaitForChild("Enemies")
local Characters: Folder = workspace:WaitForChild("Characters")
local SeaBeasts: Folder = workspace:WaitForChild("SeaBeasts")
local Boats: Folder = workspace:WaitForChild("Boats")

local Module = _ENV.rz_aimbot_module or {}
local HookManager = _ENV.rz_hook_manager or {}
local HIDDEN_SETTINGS = _ENV.rz_hidden_settings or {
	SILENT_AIM_ENABLED = true,
	SKILL_COOLDOWN = 0.5
}

local HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand", "Head", "Torso"}
local RenderStepped = RunService.RenderStepped
local Heartbeat = RunService.Heartbeat

local AimBot = {
	Enabled = {
		Gun = false,     
		Tap = false,    
		Skills = false,
	},
	Settings = {
		NoAimMobs = false,   
		Prediction = 0.165,    
		AutoPrediction = true, 
		SilentAim = true,     
		VisibleCheck = false, 
		MaxDistance = 300,   
		WallCheck = false,   
		TargetMode = "Closest", 
		Smoothness = 1,        
		FOV = 360,        
		ShowFOV = false, 
		DrawTarget = false,  
	},
	
	Target = {
		Current = nil,
		Part = nil,
		Position = nil,
		Velocity = Vector3.new(0, 0, 0),
		LastUpdate = 0,
	},
	
	Cache = {
		ClosestEnemy = nil,
		LastTarget = nil,
		Targets = {},
		Hitboxes = {},
		FOVCircle = nil,
	},
	
	Stats = {
		TargetsLocked = 0,
		ShotsFired = 0,
		ShotsHit = 0,
	},
	
	Debounces = {
		Update = 0,
		Skill = {},
	},
}

local function IsAlive(Character)
	if not Character then return false end
	
	local Humanoid = Character:FindFirstChildOfClass("Humanoid") or Character:FindFirstChild("Health")
	if Humanoid then
		local health = Humanoid.Health or (Humanoid:IsA("IntValue") and Humanoid.Value) or 0
		return health > 0
	end
	return Character.Parent == Boats or Character.Parent == SeaBeasts
end

local function GetRandomHitboxLimb(Character)
	local limbs = HitboxLimbs
	for i = 1, #limbs do
		local limb = Character:FindFirstChild(limbs[math.random(#limbs)])
		if limb and limb:IsA("BasePart") then
			return limb
		end
	end
	return Character:FindFirstChild("HumanoidRootPart") or Character.PrimaryPart
end

local function DistanceFromCharacter(position)
	return Player:DistanceFromCharacter(position)
end

local function CheckAlly(player)
	if player.Parent == Characters then
		player = Players:GetPlayerFromCharacter(player)
	end
	
	if not player then return true end
	
	if tostring(player.Team) == "Marines" and player.Team == Player.Team then
		return false
	end
	
	return true
end

local function IsVisible(part)
	if not part then return false end
	
	local origin = Player.Character and Player.Character:FindFirstChild("Head")
	if not origin then return false end
	
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = {Player.Character, part.Parent}
	
	local raycast = workspace:Raycast(origin.Position, (part.Position - origin.Position), params)
	return not raycast
end

local function GetPredictedPosition(target, part)
	if not target or not part then return part.Position end
	
	local velocity = target:FindFirstChild("HumanoidRootPart") and target.HumanoidRootPart.Velocity or Vector3.new(0, 0, 0)
	local prediction = AimBot.Settings.Prediction
	
	return part.Position + (velocity * prediction)
end

function AimBot:GetValidTargets()
	local targets = {}
	local myPos = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
	if not myPos then return targets end
	
	myPos = myPos.Position
	
	if not self.Settings.NoAimMobs then
		for _, enemy in ipairs(Enemies:GetChildren()) do
			if IsAlive(enemy) and enemy:FindFirstChild("HumanoidRootPart") then
				local dist = (enemy.HumanoidRootPart.Position - myPos).Magnitude
				if dist <= self.Settings.MaxDistance then
					table.insert(targets, {
						Character = enemy,
						RootPart = enemy.HumanoidRootPart,
						Distance = dist,
						Health = enemy.Humanoid and enemy.Humanoid.Health or 0,
						MaxHealth = enemy.Humanoid and enemy.Humanoid.MaxHealth or 0,
						Type = "Enemy"
					})
				end
			end
		end
	end
	
	for _, character in ipairs(Characters:GetChildren()) do
		if character ~= Player.Character and IsAlive(character) and CheckAlly(character) then
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			if rootPart then
				local dist = (rootPart.Position - myPos).Magnitude
				if dist <= self.Settings.MaxDistance then
					table.insert(targets, {
						Character = character,
						RootPart = rootPart,
						Distance = dist,
						Health = character.Humanoid and character.Humanoid.Health or 0,
						MaxHealth = character.Humanoid and character.Humanoid.MaxHealth or 0,
						Type = "Player"
					})
				end
			end
		end
	end
	
	for _, beast in ipairs(SeaBeasts:GetChildren()) do
		if IsAlive(beast) then
			local part = beast:FindFirstChildOfClass("MeshPart") or beast.PrimaryPart
			if part then
				local dist = (part.Position - myPos).Magnitude
				if dist <= self.Settings.MaxDistance then
					table.insert(targets, {
						Character = beast,
						RootPart = part,
						Distance = dist,
						Health = beast.Health and beast.Health.Value or 0,
						MaxHealth = beast.Health and beast.Health.MaxValue or 0,
						Type = "SeaBeast"
					})
				end
			end
		end
	end
	
	return targets
end

function AimBot:SelectTarget(targets)
	if #targets == 0 then return nil end
	
	local mode = self.Settings.TargetMode
	
	if mode == "Closest" then
		table.sort(targets, function(a, b)
			return a.Distance < b.Distance
		end)
	elseif mode == "LowestHealth" then
		table.sort(targets, function(a, b)
			local aPercent = a.Health / a.MaxHealth
			local bPercent = b.Health / b.MaxHealth
			return aPercent < bPercent
		end)
	elseif mode == "HighestHealth" then
		table.sort(targets, function(a, b)
			local aPercent = a.Health / a.MaxHealth
			local bPercent = b.Health / b.MaxHealth
			return aPercent > bPercent
		end)
	end
	
	return targets[1]
end

function AimBot:UpdateTarget()
	if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then
		self.Target.Current = nil
		return
	end
	
	local targets = self:GetValidTargets()
	local selected = self:SelectTarget(targets)
	
	if selected then
		self.Target.Current = selected.Character
		self.Target.RootPart = selected.RootPart
		self.Target.Position = selected.RootPart.Position
		self.Target.Velocity = selected.RootPart.Velocity
		self.Target.LastUpdate = tick()
		
		self.Cache.ClosestEnemy = selected.Character
		self.Stats.TargetsLocked = self.Stats.TargetsLocked + 1
	else
		self.Target.Current = nil
		self.Cache.ClosestEnemy = nil
	end
end

function AimBot:CanUseSkill(skill)
	local lastUse = self.Debounces.Skill[skill] or 0
	return (tick() - lastUse) >= HIDDEN_SETTINGS.SKILL_COOLDOWN
end

function AimBot:UseSkill(skill, remote, ...)
	if not self.Target.Current or not self.Enabled.Skills then return end
	if not self:CanUseSkill(skill) then return end
	
	local hitbox = GetRandomHitboxLimb(self.Target.Current)
	if not hitbox then return end
	
	local pos = hitbox.Position
	if self.Settings.Prediction > 0 then
		pos = GetPredictedPosition(self.Target.Current, hitbox)
	end
	
	if remote then
		if type(remote) == "string" then
			local rem = game:GetService("ReplicatedStorage"):FindFirstChild(remote, true)
			if rem then
				rem:FireServer(pos, ...)
			end
		else
			remote:FireServer(pos, ...)
		end
	else
		VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
		task.wait()
		VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
	end
	
	self.Debounces.Skill[skill] = tick()
	self.Stats.ShotsFired = self.Stats.ShotsFired + 1
end

function AimBot:ShootGun(remote, ...)
	if not self.Target.Current or not self.Enabled.Gun then return end
	
	local hitbox = GetRandomHitboxLimb(self.Target.Current)
	if not hitbox then return end
	
	local pos = hitbox.Position
	if self.Settings.Prediction > 0 then
		pos = GetPredictedPosition(self.Target.Current, hitbox)
	end
	
	if self.Settings.SilentAim and remote then
		remote:FireServer(pos, ...)
	else
		local camera = workspace.CurrentCamera
		local screenPos = camera:WorldToViewportPoint(pos)
		VirtualInputManager:SendMouseMoveEvent(screenPos.X, screenPos.Y, game)
		task.wait()
		VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 1)
		task.wait(0.05)
		VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 1)
	end
	
	self.Stats.ShotsFired = self.Stats.ShotsFired + 1
end

function AimBot:Tap()
	if not self.Target.Current or not self.Enabled.Tap then return end
	if not Player.Character or not Player.Character:FindFirstChildOfClass("Tool") then return end
	
	local hitbox = GetRandomHitboxLimb(self.Target.Current)
	if not hitbox then return end
	
	local pos = hitbox.Position
	if self.Settings.Prediction > 0 then
		pos = GetPredictedPosition(self.Target.Current, hitbox)
	end
	
	local camera = workspace.CurrentCamera
	local screenPos = camera:WorldToViewportPoint(pos)
	
	VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 1)
	task.wait(0.05)
	VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 1)
	
	self.Stats.ShotsFired = self.Stats.ShotsFired + 1
end

function AimBot:SetupSilentAim()
	if not self.Settings.SilentAim then return end
	
	local oldNamecall
	oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
		local method = getnamecallmethod()
		
		if method == "FireServer" then
			local remoteName = tostring(self)
			
			if AimBot.Enabled.Gun and (remoteName:find("ShootGun") or remoteName:find("Validator2")) then
				if AimBot.Target.Current then
					local hitbox = GetRandomHitboxLimb(AimBot.Target.Current)
					if hitbox then
						local pos = hitbox.Position
						if AimBot.Settings.Prediction > 0 then
							pos = GetPredictedPosition(AimBot.Target.Current, hitbox)
						end
						
						local args = {...}
						if #args > 0 then
							if type(args[1]) == "Vector3" then
								args[1] = pos
							end
							return oldNamecall(self, unpack(args))
						end
					end
				end
			end
			
			if AimBot.Enabled.Skills and (remoteName:find("Skill") or remoteName:find("Ability")) then
				if AimBot.Target.Current then
					local hitbox = GetRandomHitboxLimb(AimBot.Target.Current)
					if hitbox then
						local pos = hitbox.Position
						if AimBot.Settings.Prediction > 0 then
							pos = GetPredictedPosition(AimBot.Target.Current, hitbox)
						end
						
						local args = {...}
						for i = 1, #args do
							if type(args[i]) == "Vector3" then
								args[i] = pos
							end
						end
						return oldNamecall(self, unpack(args))
					end
				end
			end
			
			if AimBot.Enabled.Tap and (remoteName:find("Tap") or remoteName:find("Click")) then
				if AimBot.Target.Current then
					local hitbox = GetRandomHitboxLimb(AimBot.Target.Current)
					if hitbox then
						local pos = hitbox.Position
						if AimBot.Settings.Prediction > 0 then
							pos = GetPredictedPosition(AimBot.Target.Current, hitbox)
						end
						
						local args = {...}
						for i = 1, #args do
							if type(args[i]) == "Vector3" then
								args[i] = pos
							end
						end
						return oldNamecall(self, unpack(args))
					end
				end
			end
		end
		
		return oldNamecall(self, ...)
	end)
end

function AimBot:DrawVisuals()
	if not self.Settings.ShowFOV and not self.Settings.DrawTarget then return end
	
	local camera = workspace.CurrentCamera
	
	if self.Settings.ShowFOV then
		local fovCircle = self.Cache.FOVCircle
		if not fovCircle then
			fovCircle = Drawing.new("Circle")
			fovCircle.Thickness = 1
			fovCircle.NumSides = 60
			fovCircle.Radius = self.Settings.FOV
			fovCircle.Filled = false
			fovCircle.Visible = true
			fovCircle.Color = Color3.new(1, 1, 1)
			fovCircle.Transparency = 1
			self.Cache.FOVCircle = fovCircle
		end
		
		fovCircle.Radius = self.Settings.FOV
		fovCircle.Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
		fovCircle.Visible = self.Settings.ShowFOV
	end
	
	if self.Settings.DrawTarget and self.Target.Current and self.Target.RootPart then
		local screenPos = camera:WorldToViewportPoint(self.Target.RootPart.Position)
		
		local targetDot = self.Cache.TargetDot
		if not targetDot then
			targetDot = Drawing.new("Circle")
			targetDot.Thickness = 2
			targetDot.NumSides = 30
			targetDot.Radius = 10
			targetDot.Filled = false
			targetDot.Color = Color3.new(1, 0, 0)
			targetDot.Transparency = 1
			self.Cache.TargetDot = targetDot
		end
		
		targetDot.Position = Vector2.new(screenPos.X, screenPos.Y)
		targetDot.Visible = true
		
		local line = self.Cache.TargetLine
		if not line then
			line = Drawing.new("Line")
			line.Thickness = 1
			line.Color = Color3.new(1, 0, 0)
			line.Transparency = 1
			self.Cache.TargetLine = line
		end
		
		line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
		line.To = Vector2.new(screenPos.X, screenPos.Y)
		line.Visible = true
	else
		if self.Cache.TargetDot then
			self.Cache.TargetDot.Visible = false
		end
		if self.Cache.TargetLine then
			self.Cache.TargetLine.Visible = false
		end
	end
end

function AimBot:Start()
	if self.Settings.SilentAim then
		self:SetupSilentAim()
	end
	
	coroutine.wrap(function()
		while task.wait() do
			if self.Enabled.Gun or self.Enabled.Tap or self.Enabled.Skills then
				self:UpdateTarget()
			end			
			self:DrawVisuals()
		end
	end)()
	
	if self.Settings.AutoPrediction then
		coroutine.wrap(function()
			while task.wait(5) do
				local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
				local pingNum = tonumber(ping:match("%d+"))
				if pingNum then
					self.Settings.Prediction = pingNum / 1000
				end
			end
		end)()
	end
end

function AimBot:Stop()
	self.Target.Current = nil
	self.Cache.ClosestEnemy = nil
	
	if self.Cache.FOVCircle then
		self.Cache.FOVCircle.Visible = false
	end
	if self.Cache.TargetDot then
		self.Cache.TargetDot.Visible = false
	end
	if self.Cache.TargetLine then
		self.Cache.TargetLine.Visible = false
	end
end

local AimBotModule = {
	Start = function()
		AimBot:Start()
	end,
	
	Stop = function()
		AimBot:Stop()
	end,
	
	SetTarget = function(target)
		if target and target:IsA("BasePart") then
			AimBot.Target.Current = target.Parent
			AimBot.Target.RootPart = target
			AimBot.Target.Position = target.Position
		end
	end,
	
	GetTarget = function()
		return AimBot.Target.Current
	end,
	
	Shoot = function(remote, ...)
		AimBot:ShootGun(remote, ...)
	end,
	
	UseSkill = function(skill, remote, ...)
		AimBot:UseSkill(skill, remote, ...)
	end,
	
	Tap = function()
		AimBot:Tap()
	end,
	
	UpdateConfig = function(config)
		for k, v in pairs(config) do
			if AimBot.Settings[k] ~= nil then
				AimBot.Settings[k] = v
			end
			if AimBot.Enabled[k] ~= nil then
				AimBot.Enabled[k] = v
			end
		end
	end,
	
	GetStats = function()
		return AimBot.Stats
	end,
	
	ResetStats = function()
		AimBot.Stats = {
			TargetsLocked = 0,
			ShotsFired = 0,
			ShotsHit = 0,
		}
	end,
	
	ToggleGun = function(state)
		AimBot.Enabled.Gun = state
	end,
	
	ToggleTap = function(state)
		AimBot.Enabled.Tap = state
	end,
	
	ToggleSkills = function(state)
		AimBot.Enabled.Skills = state
	end,
	
	ToggleNoAimMobs = function(state)
		AimBot.Settings.NoAimMobs = state
	end,
}

if Settings then
	AimBot.Enabled.Gun = Settings.AimBot_Gun or false
	AimBot.Enabled.Tap = Settings.AimBot_Tap or false
	AimBot.Enabled.Skills = Settings.AimBot_Skills or false
	AimBot.Settings.NoAimMobs = Settings.NoAimMobs or false
end
_ENV.rz_aimbot = AimBotModule
return AimBotModule

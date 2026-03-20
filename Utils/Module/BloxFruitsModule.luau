local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local Player = Players.LocalPlayer
local Enemies = workspace:WaitForChild("Enemies")
local Characters = workspace:WaitForChild("Characters")
local SeaBeasts = workspace:WaitForChild("SeaBeasts")
local Boats = workspace:WaitForChild("Boats")

local HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand", "Head", "Torso"}

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
		MaxDistance = 300,
		TargetMode = "Closest",
	},
	
	Target = {
		Current = nil,
		RootPart = nil,
	},
	
	Debounces = {
		Skill = {},
	},
}

local function IsAlive(Character)
	if not Character then return false end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if Humanoid then
		return Humanoid.Health > 0
	end
	return Character.Parent == Boats or Character.Parent == SeaBeasts
end

local function GetRandomHitboxLimb(Character)
	for i = 1, #HitboxLimbs do
		local limb = Character:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)])
		if limb and limb:IsA("BasePart") then
			return limb
		end
	end
	return Character:FindFirstChild("HumanoidRootPart") or Character.PrimaryPart
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

local function GetPredictedPosition(target, part)
	if not target or not part then return part.Position end
	local velocity = target:FindFirstChild("HumanoidRootPart") and target.HumanoidRootPart.Velocity or Vector3.new(0, 0, 0)
	return part.Position + (velocity * AimBot.Settings.Prediction)
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
					})
				end
			end
		end
	end
	
	return targets
end

function AimBot:SelectTarget(targets)
	if #targets == 0 then return nil end
	table.sort(targets, function(a, b)
		return a.Distance < b.Distance
	end)
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
	else
		self.Target.Current = nil
	end
end

function AimBot:SetupSilentAim()
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
						if #args > 0 and type(args[1]) == "Vector3" then
							args[1] = pos
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
		end
		
		return oldNamecall(self, ...)
	end)
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
		end
	end)()
end

function AimBot:Stop()
	self.Target.Current = nil
end

local AimBotModule = {
	Start = function() AimBot:Start() end,
	Stop = function() AimBot:Stop() end,
	ToggleGun = function(state) AimBot.Enabled.Gun = state end,
	ToggleTap = function(state) AimBot.Enabled.Tap = state end,
	ToggleSkills = function(state) AimBot.Enabled.Skills = state end,
	ToggleNoAimMobs = function(state) AimBot.Settings.NoAimMobs = state end,
}

return AimBotModule

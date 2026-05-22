local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

local TweenModule = {}
TweenModule.__index = TweenModule

local ActiveTweens = {}

local Settings = {
	TweenSpeed = 300,
	NoClip = true
}

local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.Name = "TweenVelocity"
BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
BodyVelocity.P = 50000
BodyVelocity.Velocity = Vector3.zero

local CharacterConnections = {}
local NoClipParts = {}

local function DisconnectConnections()
	for _, v in pairs(CharacterConnections) do
		v:Disconnect()
	end

	table.clear(CharacterConnections)
end

local function AddNoClipPart(obj)
	if obj:IsA("BasePart") and obj.CanCollide then
		table.insert(NoClipParts, obj)
	end
end

local function RemoveNoClipPart(obj)
	local index = table.find(NoClipParts, obj)

	if index then
		table.remove(NoClipParts, index)
	end
end

local function SetupCharacter(Character)
	table.clear(NoClipParts)
	DisconnectConnections()

	for _, obj in pairs(Character:GetDescendants()) do
		AddNoClipPart(obj)
	end

	table.insert(CharacterConnections, Character.DescendantAdded:Connect(AddNoClipPart))
	table.insert(CharacterConnections, Character.DescendantRemoving:Connect(RemoveNoClipPart))
end

if Player.Character then
	SetupCharacter(Player.Character)
end

Player.CharacterAdded:Connect(SetupCharacter)

RunService.Stepped:Connect(function()
	local Character = Player.Character

	if not Character then
		return
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Character:FindFirstChild("HumanoidRootPart")

	if not Humanoid or Humanoid.Health <= 0 or not RootPart then
		if BodyVelocity.Parent then
			BodyVelocity.Parent = nil
		end

		return
	end

	if Settings.NoClip then
		for i = 1, #NoClipParts do
			local part = NoClipParts[i]

			if part and part.Parent then
				part.CanCollide = false
			end
		end
	end

	pcall(function()
		if BodyVelocity.Parent ~= RootPart then
			BodyVelocity.Parent = RootPart
		end
	end)

	if TweenModule:IsTweening(RootPart) then
		BodyVelocity.Velocity = Vector3.new(0, 25, 0)
	else
		BodyVelocity.Velocity = Vector3.zero
	end
end)

function TweenModule:StopTween(Object)
	local Tween = ActiveTweens[Object]

	if Tween then
		Tween:Pause()
		Tween:Destroy()
		ActiveTweens[Object] = nil
	end
end

function TweenModule:Stop()
	local Character = Player.Character

	if Character then
		local RootPart = Character:FindFirstChild("HumanoidRootPart")

		if RootPart then
			self:StopTween(RootPart)
		end
	end

	BodyVelocity.Velocity = Vector3.zero
end

function TweenModule:Create(Object, Time, Property, Value)
	self:StopTween(Object)

	local Tween = TweenService:Create(
		Object,
		TweenInfo.new(Time, Enum.EasingStyle.Linear),
		{
			[Property] = Value
		}
	)

	ActiveTweens[Object] = Tween

	Tween.Completed:Connect(function()
		if ActiveTweens[Object] == Tween then
			ActiveTweens[Object] = nil
			BodyVelocity.Velocity = Vector3.zero
		end
	end)

	Tween:Play()

	return Tween
end

function TweenModule:Teleport(TargetCFrame)
	local Character = Player.Character

	if not Character then
		return false
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Character:FindFirstChild("HumanoidRootPart")

	if not Humanoid or Humanoid.Health <= 0 or not RootPart then
		return false
	end

	if Humanoid.Sit then
		Humanoid.Sit = false
		return false
	end

	local Distance = (RootPart.Position - TargetCFrame.Position).Magnitude

	if Distance <= Settings.TweenSpeed then
		RootPart.CFrame = TargetCFrame
		self:StopTween(RootPart)
		return true
	end

	local Direction = (TargetCFrame.Position - RootPart.Position).Unit

	BodyVelocity.Velocity = Direction * Settings.TweenSpeed

	local Time = Distance / Settings.TweenSpeed

	self:Create(
		RootPart,
		Time,
		"CFrame",
		TargetCFrame
	)

	return true
end

function TweenModule:IsTweening(Object)
	return ActiveTweens[Object] ~= nil
end

function TweenModule:SetSpeed(Speed)
	Settings.TweenSpeed = Speed
end

function TweenModule:GetSpeed()
	return Settings.TweenSpeed
end

return TweenModule

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")

local Player = Players.LocalPlayer

local TweenModule = {}
TweenModule.__index = TweenModule

local ActiveTween = false

local Settings = {
	TweenSpeed = 300,
	NoClip = true
}

pcall(function()
	PhysicsService:CreateCollisionGroup("TweenNoClip")
end)

PhysicsService:CollisionGroupSetCollidable(
	"TweenNoClip",
	"Default",
	false
)

local function GetCharacter()
	if not Player.Character then
		Player.CharacterAdded:Wait()
	end

	Player.Character:WaitForChild("HumanoidRootPart")

	return Player.Character
end

local function ToggleNoClip(State)
	local Character = GetCharacter()

	for _, v in pairs(Character:GetDescendants()) do
		if v:IsA("BasePart") then
			if State then
				PhysicsService:SetPartCollisionGroup(
					v,
					"TweenNoClip"
				)
			else
				PhysicsService:SetPartCollisionGroup(
					v,
					"Default"
				)
			end
		end
	end
end

function TweenModule:GetHover(RootPart)
	local BV = RootPart:FindFirstChild("KAHover")

	if not BV then
		BV = Instance.new("BodyVelocity")
		BV.Name = "KAHover"
		BV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		BV.P = 1e9
		BV.Velocity = Vector3.zero
		BV.Parent = RootPart
	end

	return BV
end

function TweenModule:SetSpeed(Speed)
	Settings.TweenSpeed = Speed
end

function TweenModule:GetSpeed()
	return Settings.TweenSpeed
end

function TweenModule:IsTweening()
	return ActiveTween
end

function TweenModule:Stop()
	ActiveTween = false

	local Character = Player.Character

	if Character then
		local RootPart = Character:FindFirstChild("HumanoidRootPart")

		if RootPart then
			local Hover = RootPart:FindFirstChild("KAHover")

			if Hover then
				Hover:Destroy()
			end

			RootPart.AssemblyLinearVelocity = Vector3.zero
		end
	end

	ToggleNoClip(false)
end

RunService.Stepped:Connect(function()
	if not ActiveTween then
		return
	end

	local Character = Player.Character

	if not Character then
		return
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Character:FindFirstChild("HumanoidRootPart")

	if not Humanoid or not RootPart then
		return
	end

	Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)

	local Hover = TweenModule:GetHover(RootPart)

	Hover.Velocity = Vector3.zero

	if Settings.NoClip then
		ToggleNoClip(true)
	end
end)

function TweenModule:Teleport(TargetCFrame)
	self:Stop()

	local Character = GetCharacter()

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Character:FindFirstChild("HumanoidRootPart")

	if not Humanoid or Humanoid.Health <= 0 then
		return false
	end

	if Humanoid.Sit then
		Humanoid.Sit = false
		return false
	end

	ActiveTween = true

	task.spawn(function()
		if Settings.NoClip then
			ToggleNoClip(true)
		end

		local Magnitude = (
			RootPart.Position - TargetCFrame.Position
		).Magnitude

		local TargetY = TargetCFrame.Position.Y + 3

		while ActiveTween and Magnitude > 5 do
			local CurrentPos = RootPart.Position

			local Direction = (
				Vector3.new(
					TargetCFrame.Position.X,
					TargetY,
					TargetCFrame.Position.Z
				) - CurrentPos
			).Unit

			local MoveStep = Direction * (
				Settings.TweenSpeed * task.wait()
			)

			RootPart.AssemblyLinearVelocity = Vector3.zero

			RootPart.CFrame = CFrame.new(
				CurrentPos + MoveStep,
				TargetCFrame.Position
			)

			Magnitude = (
				RootPart.Position - TargetCFrame.Position
			).Magnitude
		end

		if ActiveTween then
			RootPart.CFrame = TargetCFrame
		end

		self:Stop()
	end)

	return true
end

return TweenModule

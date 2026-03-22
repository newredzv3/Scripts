local Movement = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local MovementEnabled = false
local WalkSpeedValue = 58
local JumpValue = 58

local function ApplyMovement(char)
	local hum = char:WaitForChild("Humanoid",5)
	if not hum then return end

	if MovementEnabled then
		hum.WalkSpeed = WalkSpeedValue
		hum.JumpPower = JumpValue
	else
		hum.WalkSpeed = 16
		hum.JumpPower = 50
	end

	hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if MovementEnabled then
			hum.WalkSpeed = WalkSpeedValue
		end
	end)

	hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
		if MovementEnabled then
			hum.JumpPower = JumpValue
		end
	end)
end

function Movement:Toggle(v)
	MovementEnabled = v
	local char = LocalPlayer.Character
	if char then
		ApplyMovement(char)
	end
end

function Movement:SetSpeed(v)
	WalkSpeedValue = v
	if MovementEnabled then
		local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
		if hum then
			hum.WalkSpeed = v
		end
	end
end

function Movement:SetJump(v)
	JumpValue = v
	if MovementEnabled then
		local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
		if hum then
			hum.JumpPower = v
		end
	end
end

LocalPlayer.CharacterAdded:Connect(function(char)
	task.wait(0.2)
	ApplyMovement(char)
end)

if LocalPlayer.Character then
	ApplyMovement(LocalPlayer.Character)
end

return Movement

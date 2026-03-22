local Movement = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

Movement.Enabled = false
Movement.Speed = 16
Movement.Jump = 50

function Movement:Apply()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        if self.Enabled then
            hum.WalkSpeed = self.Speed
            hum.JumpPower = self.Jump
        else
            hum.WalkSpeed = 16
            hum.JumpPower = 50
        end
    end
end

function Movement:SetSpeed(v)
    self.Speed = v
    self:Apply()
end

function Movement:SetJump(v)
    self.Jump = v
    self:Apply()
end

function Movement:Toggle(v)
    self.Enabled = v
    self:Apply()
end

task.spawn(function()
    while task.wait() do
        if Movement.Enabled then
            Movement:Apply()
        end
    end
end)

return Movement

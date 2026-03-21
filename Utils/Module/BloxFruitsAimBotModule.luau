local AimBotModule = {}

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Enemies = workspace:WaitForChild("Enemies")
local Characters = workspace:WaitForChild("Characters")
local SeaBeasts = workspace:WaitForChild("SeaBeasts")

local HitboxLimbs = {"Head","Torso","HumanoidRootPart","LeftHand","RightHand"}

AimBotModule.Enabled = {
    Gun = false,
    Tap = false,
    Skills = false
}

AimBotModule.Settings = {
    NoAimMobs = false,
    Prediction = 0.165,
    MaxDistance = 300,
    SilentAim = true
}

AimBotModule.Target = {
    Current = nil,
    RootPart = nil
}

AimBotModule._Started = false
AimBotModule._Hooked = false

local function IsAlive(char)
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health > 0
end

local function GetHitbox(char)
    for i = 1, #HitboxLimbs do
        local part = char:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)])
        if part then return part end
    end
    return char:FindFirstChild("HumanoidRootPart")
end

local function GetClosestTarget()
    local myChar = Player.Character
    if not myChar then return end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    local closest, dist = nil, math.huge

    local function check(container)
        for _,v in ipairs(container:GetChildren()) do
            if v ~= myChar and IsAlive(v) then
                local root = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if root then
                    local d = (root.Position - myRoot.Position).Magnitude
                    if d < dist and d <= AimBotModule.Settings.MaxDistance then
                        closest = v
                        dist = d
                    end
                end
            end
        end
    end

    if not AimBotModule.Settings.NoAimMobs then
        check(Enemies)
    end

    check(Characters)
    check(SeaBeasts)

    return closest
end

local function Predict(pos, vel)
    return pos + (vel * AimBotModule.Settings.Prediction)
end

function AimBotModule:_UpdateTarget()
    local target = GetClosestTarget()
    if target then
        self.Target.Current = target
        self.Target.RootPart = target:FindFirstChild("HumanoidRootPart") or target.PrimaryPart
    else
        self.Target.Current = nil
        self.Target.RootPart = nil
    end
end

function AimBotModule:_Hook()
    if self._Hooked then return end
    self._Hooked = true

    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if method == "FireServer" and AimBotModule.Target.Current then
            local name = tostring(self)

            if AimBotModule.Enabled.Gun and (name:find("Shoot") or name:find("Gun")) then
                local hit = GetHitbox(AimBotModule.Target.Current)
                if hit then
                    local pos = hit.Position
                    local root = AimBotModule.Target.Current:FindFirstChild("HumanoidRootPart")
                    if root then
                        pos = Predict(pos, root.Velocity)
                    end

                    if typeof(args[1]) == "Vector3" then
                        args[1] = pos
                        return old(self, unpack(args))
                    end
                end
            end

            if AimBotModule.Enabled.Skills and name:find("Skill") then
                local hit = GetHitbox(AimBotModule.Target.Current)
                if hit then
                    local pos = hit.Position
                    local root = AimBotModule.Target.Current:FindFirstChild("HumanoidRootPart")
                    if root then
                        pos = Predict(pos, root.Velocity)
                    end

                    for i = 1, #args do
                        if typeof(args[i]) == "Vector3" then
                            args[i] = pos
                        end
                    end

                    return old(self, unpack(args))
                end
            end
        end

        return old(self, ...)
    end)
end

function AimBotModule:Start()
    if self._Started then return end
    self._Started = true

    if self.Settings.SilentAim then
        self:_Hook()
    end

    task.spawn(function()
        while self._Started do
            if self.Enabled.Gun or self.Enabled.Tap or self.Enabled.Skills then
                self:_UpdateTarget()
            end
            task.wait()
        end
    end)
end

function AimBotModule:Stop()
    self._Started = false
    self.Target.Current = nil
end

function AimBotModule:ToggleGun(v)
    self.Enabled.Gun = v
end

function AimBotModule:ToggleTap(v)
    self.Enabled.Tap = v
end

function AimBotModule:ToggleSkills(v)
    self.Enabled.Skills = v
end

function AimBotModule:ToggleNoAimMobs(v)
    self.Settings.NoAimMobs = v
end

return AimBotModule

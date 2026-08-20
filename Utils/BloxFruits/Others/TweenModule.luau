--[[
     This Open Source was made for the purpose of use in the redz Hub script 
     The script below was developed by plock4444 & Team of the new redz Hub 
 ]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")

local Player = Players.LocalPlayer
local _ENV = (getgenv or getrenv or getfenv)()

local ActiveTween = false
local TweenId = 0

local Settings = {
    TweenSpeed = 300,
    NoClip = true
}

local COLLISION_GROUP = "Players"

local function GetCharacter()
    if not Player.Character then
        Player.CharacterAdded:Wait()
    end

    Player.Character:WaitForChild("HumanoidRootPart")

    return Player.Character
end

local function GetBoat(Character)
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

    if not Humanoid or not Humanoid.Sit then
        return nil
    end

    local Seat = Humanoid.SeatPart

    if not Seat or not Seat:IsA("VehicleSeat") then
        return nil
    end

    local Boats = workspace:FindFirstChild("Boats")

    if not Boats then
        return nil
    end

    local Boat = Seat:FindFirstAncestorOfClass("Model")

    if Boat and Boat.Parent == Boats then
        return Boat
    end

    for _, v in pairs(Boats:GetChildren()) do
        local VehicleSeat = v:FindFirstChildWhichIsA("VehicleSeat", true)

        if VehicleSeat and VehicleSeat.Occupant == Humanoid then
            return v
        end
    end

    return nil
end

local function GetBoatPrimaryPart(Boat, Character)
    if not Boat then
        return nil
    end

    if Boat.PrimaryPart then
        return Boat.PrimaryPart
    end

    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local Seat = Humanoid and Humanoid.SeatPart

    if Seat and Seat:IsA("BasePart") and Seat:IsDescendantOf(Boat) then
        return Seat
    end

    local Engine = Boat:FindFirstChild("Engine", true)

    if Engine and Engine:IsA("BasePart") then
        return Engine
    end

    local VehicleSeat = Boat:FindFirstChildWhichIsA("VehicleSeat", true)

    if VehicleSeat then
        return VehicleSeat
    end

    return Boat:FindFirstChildWhichIsA("BasePart", true)
end

local function ToggleNoClip(State)
    local Character = Player.Character

    if not Character then
        return
    end

    for _, v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            pcall(function()
                PhysicsService:SetPartCollisionGroup(v, State and COLLISION_GROUP or "Default")
            end)
        end
    end
end

local PlayerTP = {}

function PlayerTP:GetHover(RootPart)
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

function PlayerTP:SetSpeed(Speed)
    Settings.TweenSpeed = tonumber(Speed) or Settings.TweenSpeed
end

function PlayerTP:GetSpeed()
    return Settings.TweenSpeed
end

function PlayerTP:IsTweening()
    return ActiveTween
end

function PlayerTP:Stop()
    ActiveTween = false
    TweenId += 1

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

function PlayerTP:Teleport(TargetCFrame)
    if not TargetCFrame then
        return false
    end

    self:Stop()

    local Character = GetCharacter()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")

    if not Humanoid or Humanoid.Health <= 0 or not RootPart then
        return false
    end

    local Boat = GetBoat(Character)
    local DriveTarget = RootPart

    if Boat then
        DriveTarget = GetBoatPrimaryPart(Boat, Character)

        if not DriveTarget then
            return false
        end
    elseif Humanoid.Sit then
        Humanoid.Sit = false
        return false
    end

    ActiveTween = true
    TweenId += 1

    local CurrentTweenId = TweenId

    task.spawn(function()
        if Settings.NoClip then
            ToggleNoClip(true)
        end

        local TargetPosition = TargetCFrame.Position

        while ActiveTween and CurrentTweenId == TweenId do
            if _ENV.OnFarm == false then
                PlayerTP:Stop()
                return
            end

            if not DriveTarget or not DriveTarget.Parent then
                PlayerTP:Stop()
                return
            end

            if Boat and (not Boat.Parent or not DriveTarget:IsDescendantOf(Boat)) then
                PlayerTP:Stop()
                return
            end

            local CurrentPosition = DriveTarget.Position
            local Distance = (CurrentPosition - TargetPosition).Magnitude

            if Distance <= 5 then
                break
            end

            local Direction = TargetPosition - CurrentPosition

            if Direction.Magnitude <= 0 then
                break
            end

            local Delta = task.wait()

            if not ActiveTween or CurrentTweenId ~= TweenId then
                return
            end

            Direction = Direction.Unit

            local MoveStep = Direction * Settings.TweenSpeed * Delta

            if MoveStep.Magnitude > Distance then
                MoveStep = Direction * Distance
            end

            local NewPosition = CurrentPosition + MoveStep

            if Boat then
                local BoatPivot = Boat:GetPivot()
                local Relative = DriveTarget.CFrame:ToObjectSpace(BoatPivot)
                local NewCFrame = CFrame.new(NewPosition, TargetPosition)
                local NewPivot = NewCFrame * Relative

                Boat:PivotTo(NewPivot)
            else
                DriveTarget.AssemblyLinearVelocity = Vector3.zero
                DriveTarget.CFrame = CFrame.new(NewPosition, TargetPosition)
            end
        end

        if ActiveTween and CurrentTweenId == TweenId and _ENV.OnFarm ~= false and DriveTarget and DriveTarget.Parent then
            if Boat and Boat.Parent then
                local BoatPivot = Boat:GetPivot()
                local Relative = DriveTarget.CFrame:ToObjectSpace(BoatPivot)
                local NewCFrame = CFrame.new(TargetPosition, TargetPosition + TargetCFrame.LookVector)
                Boat:PivotTo(NewCFrame * Relative)
            else
                DriveTarget.CFrame = TargetCFrame
            end
        end

        if CurrentTweenId == TweenId then
            PlayerTP:Stop()
        end
    end)

    return true
end

RunService.Stepped:Connect(function()
    if not ActiveTween then
        return
    end

    if _ENV.OnFarm == false then
        PlayerTP:Stop()
        return
    end

    local Character = Player.Character

    if not Character then
        PlayerTP:Stop()
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")

    if not Humanoid or not RootPart or Humanoid.Health <= 0 then
        PlayerTP:Stop()
        return
    end

    if not Humanoid.Sit then
        Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)

        local Hover = PlayerTP:GetHover(RootPart)
        Hover.Velocity = Vector3.zero
    end

    if Settings.NoClip then
        ToggleNoClip(true)
    end
end)

local Proxy = setmetatable({}, {
    __call = function(_, TargetCFrame)
        return PlayerTP:Teleport(TargetCFrame)
    end,

    __index = function(_, Key)
        return PlayerTP[Key]
    end
})

return Proxy

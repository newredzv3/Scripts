local Module = {}

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local PlaceId = game.PlaceId
local JobId = game.JobId

local Enabled = false
local Running = false

local function GetNewServer()
    local Servers = {}

    local req = game:HttpGet(
        "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
    )

    local data = HttpService:JSONDecode(req)

    for _, server in pairs(data.data) do
        if server.playing < server.maxPlayers and server.id ~= JobId then
            Servers[#Servers+1] = server.id
        end
    end

    if #Servers > 0 then
        return Servers[math.random(1, #Servers)]
    end
end

function Module.SetEnabled(v)
    Enabled = v

    if v and not Running then
        Running = true

        task.spawn(function()
            while Enabled do
                task.wait(1800)

                if not Enabled then break end

                local NewServer = GetNewServer()

                if NewServer then
                    TeleportService:TeleportToPlaceInstance(PlaceId, NewServer, Player)
                else
                    TeleportService:Teleport(PlaceId, Player)
                end
            end

            Running = false
        end)
    end
end

return Module

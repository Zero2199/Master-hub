-- [[ Master Hub LIGHT | v5.0 ]]
-- Optimized for itel S23 / Integrated Server Browser

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Running = true 

-- [[ AUTO-OPTIMIZE STARTUP ]]
settings().Rendering.QualityLevel = 1
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("DataModelMesh") or v:IsA("Decal") then v:Destroy() end
end

local Window = Rayfield:CreateWindow({
   Name = "Master Hub LIGHT | v5.0",
   LoadingTitle = "Lite Mode + Browser",
   ConfigurationSaving = { Enabled = false } 
})

local Main = Window:CreateTab("Main Menu", 4483362458)

-- [[ SERVER BROWSER SECTION ]]
Main:CreateSection("Server Management")

Main:CreateButton({
   Name = "🚀 Hop to Small Server (Less Lag)",
   Callback = function()
       local Http = game:GetService("HttpService")
       local TPS = game:GetService("TeleportService")
       local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
       
       local function GetServer()
           local body = Http:JSONDecode(game:HttpGet(Api))
           for _, server in pairs(body.data) do
               if server.playing < server.maxPlayers and server.id ~= game.JobId then
                   return server.id
               end
           end
       end

       local serverId = GetServer()
       if serverId then
           TPS:TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
       else
           Rayfield:Notify({Title = "Error", Content = "No small servers found!"})
       end
   end,
})

Main:CreateButton({
   Name = "🔄 Rejoin Current Server",
   Callback = function()
       game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
   end,
})

-- [[ KITSUNE & UTILITY ]]
Main:CreateSection("Kitsune & Safety")

Main:CreateToggle({
   Name = "Moon Tracker",
   CurrentValue = false,
   Callback = function(Value)
       _G.Kitsune = Value
       task.spawn(function()
           while Running and _G.Kitsune do
               local Moon = game:GetService("ReplicatedStorage").Data.MoonPhase.Value
               if Moon == 5 then
                   Rayfield:Notify({Title = "Kitsune", Content = "FULL MOON! Go to Level 6!"})
               end
               task.wait(20)
           end
       end)
   end,
})

Main:CreateToggle({
   Name = "Admin Evader",
   CurrentValue = true,
   Callback = function(Value)
       _G.Evade = Value
       task.spawn(function()
           while Running and _G.Evade do
               for _, p in pairs(game.Players:GetPlayers()) do
                   if p:GetRankInGroup(2830050) > 0 then 
                       game:GetService("TeleportService"):Teleport(game.PlaceId) 
                   end
               end
               task.wait(15)
           end
       end)
   end,
})

Main:CreateButton({
   Name = "🚨 KILL SWITCH",
   Callback = function()
       Running = false
       Rayfield:Destroy()
   end,
})

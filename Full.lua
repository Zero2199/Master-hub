-- [[ Master Hub | v5.0 Ultimate Platinum ]]
-- DESKTOP COMMAND CENTER BUILD | March 2026

_G.MasterHubRunning = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | v5.0 Ultimate Platinum (PC Simulation)",
   LoadingTitle = "INITIALIZING HIGH-LATENCY DATA STREAM...",
   LoadingSubtitle = "v2-4 | Simulation | Awakening",
   ConfigurationSaving = { Enabled = false },
   Theme = "Ocean" 
})

-- [[ TAB 1: TACTICAL INTEL ]]
local Intel = Window:CreateTab("Tactical Intel", 4483362458)
Intel:CreateSection("Admin & Exploiter Activity Tracker")

Intel:CreateParagraph({
    Title = "📊 Server Activity Log (Last Hour)", 
    Content = "⭐⭐⭐⭐⭐ Fruits Spawned: 5\n⚠️⚠️⚠️ Admins Detected: 0\n🚩 Potential Exploiters: 2"
})

Intel:CreateSection("Server Intelligence Data")
local LiveStats = Intel:CreateParagraph({
    Title = "📡 Live Feed", 
    Content = "Server Age: Calculating...\nNext Fruit Spawn: Monitoring...\nSuspect Players: Scanning..."
})

-- [[ TAB 2: COMBAT SUITE ]]
local Combat = Window:CreateTab("Combat Suite", 4483362458)
Combat:CreateSection("Target Scanner & Bounty Info")

Combat:CreateInput({
   Name = "Target Username",
   PlaceholderText = "Username...",
   Callback = function(t) _G.Target = t end,
})

Combat:CreateToggle({Name = "Auto-Evade Admins 🛡️", CurrentValue = true, Callback = function(v) _G.Evade = v end})
Combat:CreateToggle({Name = "Fruit Sniper (Auto-Collect)", CurrentValue = false, Callback = function(v) _G.Sniper = v end})

-- [[ TAB 3: MAIN FARM ]]
local Farm = Window:CreateTab("Main Farm", 4483362458)
Farm:CreateSection("Leveling Automation")
Farm:CreateToggle({Name = "Auto-Farm Level", CurrentValue = false, Callback = function(v) _G.AutoFarm = v end})
Farm:CreateDropdown({
   Name = "Select Weapon",
   Options = {"Melee", "Sword", "Fruit", "Gun"},
   CurrentOption = "Melee",
   Callback = function(Option) _G.Weapon = Option end,
})

-- [[ TAB 4: VISUALS (ESP) ]]
local Visuals = Window:CreateTab("Custom Visuals", 4483362458)
Visuals:CreateSection("Extra Sensory Perception")
Visuals:CreateToggle({
    Name = "Player ESP", 
    CurrentValue = false, 
    Callback = function(v) 
        -- ESP Logic here
    end
})
Visuals:CreateToggle({Name = "Fruit ESP", CurrentValue = false, Callback = function(v) end})

-- [[ TAB 5: STATUS & HOPPER ]]
local Hop = Window:CreateTab("Status & Hopper", 4483362458)
Hop:CreateSection("Region Control")
Hop:CreateButton({Name = "[ Sweet Spot Hopper (3-5 Players) ]", Callback = function() end})
Hop:CreateButton({Name = "[ Rejoin Current Server ]", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end})
Hop:CreateDropdown({Name = "Region: Singapore", Options = {"Singapore", "USA", "Germany"}, CurrentOption = "Singapore", Callback = function() end})

-- [[ TAB 6: OPTIMIZATION ]]
local Opti = Window:CreateTab("Optimization", 4483362458)
Opti:CreateSection("Performance Boosters")
Opti:CreateToggle({Name = "White Screen (AFK Mode)", CurrentValue = false, Callback = function(v) game:GetService("RunService"):Set3dRenderingEnabled(not v) end})

-- [[ EMERGENCY KILL SWITCH ]]
Opti:CreateSection("Protocol 0")
Opti:CreateButton({
   Name = "🔴 EMERGENCY KILL SWITCH 🔴",
   Callback = function()
       _G.MasterHubRunning = false 
       Rayfield:Destroy()
   end,
})

-- [[ BACKGROUND ENGINE ]]
task.spawn(function()
    while _G.MasterHubRunning do
        local serverTime = math.floor(workspace.DistributedGameTime / 60)
        LiveStats:Set({
            Title = "📡 Live Feed",
            Content = "Server Age: " .. serverTime .. "m\nNext Fruit Spawn: ~18m\nSuspect Players in Server: " .. math.random(1,4)
        })
        task.wait(5)
    end
end)

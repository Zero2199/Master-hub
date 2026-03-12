[[ 
    PROJECT: MASTER HUB v5.0 PLATINUM (DASHBOARD)
    STYLE: PRO-DASHBOARD (LIVE UPDATE)
    OPTIMIZED: ANDROID 12 | NO-LAG LOOP
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | Platinum Dashboard",
   LoadingTitle = "Syncing Real-Time Inventory...",
   ConfigurationSaving = { Enabled = true, Folder = "MasterHubV5" }
})

-- // 1. THE LIVE DASHBOARD TAB // --
local DashTab = Window:CreateTab("Simulation Stats", 4483362458)

DashTab:CreateSection("📊 Live Simulation Progress")

-- These are the "Intelligence Boxes" from your photo
local DataLabel = DashTab:CreateParagraph({
    Title = "Simulation Data: Loading...",
    Content = "Fetching data from server..."
})

local ControlLabel = DashTab:CreateParagraph({
    Title = "Control V2 Awakening: Calculating...",
    Content = "Current Mastery: Checking..."
})

-- // 2. THE REAL-TIME SYNC LOGIC // --
-- This loop connects the UI to your actual inventory
spawn(function()
    while task.wait(1) do -- Updates every second for "Live" feel without lag
        pcall(function()
            -- Get Simulation Data (Commonly stored in Data folder)
            local SimData = game.Players.LocalPlayer.Data.SimulationData.Value
            local Trinkets = game.Players.LocalPlayer.Backpack:FindFirstChild("Trinket") and "Found" or "None"
            
            -- Get Control Mastery (Checking your fruit mastery)
            local Fruit = "Control-Control" -- Logic to find current fruit
            local Mastery = game.Players.LocalPlayer.Data.Stats[Fruit].Mastery.Value
            local Progress = math.floor((Mastery / 500) * 100) -- 500 is max for Awakening
            
            -- UPDATE THE UI BOXES
            DataLabel:Set({
                Title = "Simulation Data: " .. SimData .. " / 500",
                Content = "Rate: Tracking | Trinket Status: " .. Trinkets
            })
            
            ControlLabel:Set({
                Title = "Control V2 Awakening: [" .. Progress .. "%]",
                Content = "Mastery: " .. Mastery .. " / 500"
            })
        end)
    end
end)

-- // 3. FUNCTIONAL TABS (CLEAN SIDEBAR) // --
local FarmTab = Window:CreateTab("Main Farm", 4483362458)
FarmTab:CreateToggle({
   Name = "Start Master Quest Farm",
   CurrentValue = false,
   Callback = function(Value) _G.AutoFarm = Value end,
})

local SeaTab = Window:CreateTab("Sea & Sniper", 4483362458)
SeaTab:CreateButton({
   Name = "Ghost Sea (No-Clip)",
   Callback = function()
       -- Logic to delete rocks
   end,
})

-- // 4. SETTINGucin

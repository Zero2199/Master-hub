-- [[ Master Hub | v5.0 Tactical Platinum ]]
-- Full Integrated Build | March 2026
-- Optimized for itel S23 Performance

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local lp = game.Players.LocalPlayer
local Running = true

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | v5.0 Tactical Platinum",
   LoadingTitle = "SYSTEM BOOT: TACTICAL INTEL ACTIVE",
   ConfigurationSaving = { Enabled = false },
   Theme = "Ocean" -- Tactical Dark Blue Theme
})

-- [[ TAB 1: TACTICAL INTEL ]]
local Intel = Window:CreateTab("Tactical Intel", 4483362458)

Intel:CreateSection("Server Intelligence Data")

local IntelBox = Intel:CreateParagraph({
    Title = "📡 Live Server Feed", 
    Content = "Server Age: Calculating...\nNext Fruit Spawn: Monitoring...\nFruit Status: Initializing..."
})

-- [[ FRUIT NOTIFIER & INTEL LOOP ]]
task.spawn(function()
    while task.wait(5) and Running do
        local serverTime = math.floor(workspace.DistributedGameTime / 60)
        local fruitMessage = "Searching..."
        
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Tool") and (v:FindFirstChild("Handle") or v.Name:find("Fruit")) then
                fruitMessage = "⚠️ " .. v.Name:upper() .. " SPAWNED!"
                Rayfield:Notify({
                    Title = "TACTICAL ALERT",
                    Content = v.Name .. " has been detected!",
                    Duration = 10,
                })
            end
        end
        
        IntelBox:Set({
            Title = "📡 Live Server Feed",
            Content = "Server Age: " .. serverTime .. "m\nNext Fruit Spawn: Monitoring...\nStatus: " .. fruitMessage
        })
    end
end)

Intel:CreateButton({
   Name = "🚀 Tactical Server Hop",
   Info = "Jump to a new server if no fruits or events are found.",
   Callback = function()
       local Http = game:GetService("HttpService")
       local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
       local s = Http:JSONDecode(game:HttpGet(Api))
       for _, v in pairs(s.data) do
           if v.playing < v.maxPlayers and v.id ~= game.JobId then
               game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
           end
       end
   end,
})

-- [[ TAB 2: COMBAT & RAIDS ]]
local Combat = Window:CreateTab("Combat Suite", 4483362458)
Combat:CreateToggle({ Name = "Auto Factory / Pirate Raid", CurrentValue = false, Callback = function(v) _G.RaidAuto = v end })
Combat:CreateToggle({ Name = "Safe PVP (Auto-Ken)", CurrentValue = false, Callback = function(v) _G.AutoKen = v end })

-- [[ TAB 3: SEA EVENTS ]]
local Sea = Window:CreateTab("Sea Events", 4483362458)
Sea:CreateToggle({ Name = "Kitsune Moon Logic", CurrentValue = false, Callback = function(v) _G.Kitsune = v end })
Sea:CreateToggle({ 
   Name = "Leviathan Heart Harpoon", 
   CurrentValue = false, 
   Callback = function(v) 
       _G.Harpoon = v 
       task.spawn(function()
           while _G.Harpoon and Running do
               if workspace:FindFirstChild("LeviathanHeart") then
                   game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0))
               end
               task.wait(0.1)
           end
       end)
   end 
})

-- [[ TAB 4: VISUALS & YT ]]
local Visuals = Window:CreateTab("Visuals & YT", 4483362458)
Visuals:CreateInput({
   Name = "Skin Stealer (User)",
   PlaceholderText = "Target...",
   Callback = function(Text)
       local target = game.Players:FindFirstChild(Text)
       if target and target.Character then
           for _, item in pairs(target.Character:GetChildren()) do
               if item:IsA("Accessory") or item:IsA("Clothing") then item:Clone().Parent = lp.Character end
           end
       end
   end,
})
Visuals:CreateButton({
   Name = "Fake 30M Bounty",
   Callback = function()
       local b = lp.PlayerGui.Main.Bounty.Amount
       if b then b.Text = "30,000,000" end
   end,
})

-- [[ TAB 5: OPTIMIZATION ]]
local Opti = Window:CreateTab("Optimization", 4483362458)
Opti:CreateToggle({
    Name = "EMERGENCY KILL SWITCH 🚨",
    CurrentValue = false,
    Callback = function(Value) 
        if Value then game:Shutdown() end 
    end
})

Opti:CreateButton({
   Name = "🚀 itel S23 Potato Mode",
   Callback = function()
       settings().Rendering.QualityLevel = 1
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("DataModelMesh") or v:IsA("Decal") then v:Destroy() end
       end
   end,
})

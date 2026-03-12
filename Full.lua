-- [[ Master Hub | v5.0 Ultimate Platinum ]]
-- Full Integrated Build | March 2026
-- Optimized for Android 12 / itel S23 Performance

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Running = true 
local lp = game.Players.LocalPlayer

-- [[ DYNAMIC UTILITIES ]]
local function GetMyBoat()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        local seat = lp.Character.Humanoid.SeatPart
        if seat and seat:IsA("VehicleSeat") then return seat.Parent end
    end
    return nil
end

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | v5.0 Ultimate Platinum",
   LoadingTitle = "Initializing Platinum Modules...",
   ConfigurationSaving = { Enabled = false }
})

-- [[ TAB 1: SYSTEM & SERVER BROWSER ]]
local System = Window:CreateTab("System", 4483362458)
System:CreateSection("Server Management (Browser)")

System:CreateButton({
   Name = "🚀 Hop to Small Server (Low Lag)",
   Info = "Finds servers with few players to boost itel S23 FPS.",
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

System:CreateButton({
   Name = "🔄 Rejoin Current Server",
   Callback = function()
       game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
   end,
})

System:CreateSection("Security")
System:CreateToggle({
   Name = "Smart Admin Evader",
   CurrentValue = true,
   Callback = function(Value) _G.AdminEvade = Value end,
})

-- [[ TAB 2: AUTO FARM & QUESTS ]]
local Farm = Window:CreateTab("Auto Farm", 4483362458)
Farm:CreateToggle({ Name = "Auto Farm Level", CurrentValue = false, Callback = function(v) _G.AutoFarm = v end })
Farm:CreateToggle({
   Name = "Chest & Beli Tween",
   CurrentValue = false,
   Callback = function(Value)
       _G.ChestFarm = Value
       task.spawn(function()
           while _G.ChestFarm and Running do
               for _, v in pairs(workspace:GetChildren()) do
                   if v.Name:find("Chest") and v:IsA("Part") then
                       lp.Character.HumanoidRootPart.CFrame = v.CFrame
                       task.wait(0.3)
                   end
               end
           end
       end)
   end,
})

-- [[ TAB 3: COMBAT & RAIDS ]]
local Combat = Window:CreateTab("Combat & Raids", 4483362458)
Combat:CreateToggle({ Name = "Auto Factory / Pirate Raid", CurrentValue = false, Callback = function(v) _G.RaidAuto = v end })
Combat:CreateToggle({ Name = "Safe PVP (Auto-Ken)", CurrentValue = false, Callback = function(v) _G.AutoKen = v end })

-- [[ TAB 4: SEA EVENTS ]]
local Sea = Window:CreateTab("Sea Events", 4483362458)
Sea:CreateToggle({ Name = "Kitsune Moon Logic", CurrentValue = false, Callback = function(v) _G.Kitsune = v end })
Sea:CreateToggle({ 
   Name = "Leviathan Heart Harpoon", 
   CurrentValue = false, 
   Callback = function(v) 
       _G.Harpoon = v 
       task.spawn(function()
           while _G.Harpoon and Running do
               if workspace:FindFirstChild("LeviathanHeart") and GetMyBoat() then
                   game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0))
               end
               task.wait(0.1)
           end
       end)
   end 
})
Sea:CreateToggle({ Name = "Ghost Ship Sniper", CurrentValue = false, Callback = function(v) _G.GhostShip = v end })

-- [[ TAB 5: RACE & AWAKENING ]]
local Awake = Window:CreateTab("Race Awakening", 4483362458)
Awake:CreateButton({ Name = "Auto-Pull Lever", Callback = function() fireclickdetector(workspace.Map.TempleOfTime.Lever.ClickDetector) end })

-- [[ TAB 6: REMOTE SHOP ]]
local Shop = Window:CreateTab("Shop & Training", 4483362458)
Shop:CreateDropdown({
   Name = "Learn Style",
   Options = {"Godhuman", "Sanguine Art", "Dragon Talon", "Electric Claw"},
   Callback = function(Style) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. Style) end,
})

-- [[ TAB 7: VISUALS & YT ]]
local Visuals = Window:CreateTab("Visuals & YT", 4483362458)
Visuals:CreateInput({
   Name = "Skin Stealer (Username)",
   PlaceholderText = "Type Username...",
   Callback = function(Text)
       local target = game.Players:FindFirstChild(Text)
       if target and target.Character then
           for _, v in pairs(target.Character:GetChildren()) do
               if v:IsA("Accessory") or v:IsA("Clothing") then v:Clone().Parent = lp.Character end
           end
       end
   end,
})
Visuals:CreateButton({
   Name = "Equip Fake TDB",
   Callback = function()
       local tool = lp.Character:FindFirstChildOfClass("Tool") or lp.Backpack:FindFirstChildOfClass("Tool")
       if tool and tool:FindFirstChild("Handle") then
           local mesh = tool.Handle:FindFirstChildOfClass("SpecialMesh") or tool.Handle
           mesh.MeshId = "rbxassetid://12130325916" 
           mesh.TextureId = "rbxassetid://12130321528"
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

-- [[ TAB 8: OPTIMIZATION ]]
local Opti = Window:CreateTab("Optimization", 4483362458)
Opti:CreateButton({
   Name = "🚀 Potato Mode",
   Callback = function()
       settings().Rendering.QualityLevel = 1
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("DataModelMesh") or v:IsA("Decal") then v:Destroy() end
       end
   end,
})
Opti:CreateButton({
   Name = "⚡ Switch to Light Mode",
   Callback = function()
       Running = false
       Rayfield:Destroy()
       task.wait(1)
       loadstring(game:HttpGet("YOUR_LIGHT_LINK_HERE"))()
   end,
})

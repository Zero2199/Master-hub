-- [[ Master Hub | v5.0 Ultimate Platinum ]]
-- Full Integrated Build | March 2026
-- Optimized for Android 12 / itel S23

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
   LoadingTitle = "Zero2199's Masterpiece Loading...",
   ConfigurationSaving = { Enabled = false }
})

-- [[ TAB 1: SYSTEM & SERVER ]]
local System = Window:CreateTab("System", 4483362458)
System:CreateSection("Server Utility")

System:CreateButton({
   Name = "🚀 Small Server Hop",
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

System:CreateToggle({
   Name = "Smart Admin Evader",
   CurrentValue = true,
   Callback = function(v) _G.AdminEvade = v end,
})

-- [[ TAB 2: AUTO FARM ]]
local Farm = Window:CreateTab("Auto Farm", 4483362458)
Farm:CreateToggle({ Name = "Level Farm", CurrentValue = false, Callback = function(v) _G.AutoFarm = v end })
Farm:CreateToggle({
   Name = "Chest & Beli Tween",
   CurrentValue = false,
   Callback = function(v)
       _G.ChestFarm = v
       task.spawn(function()
           while _G.ChestFarm and Running do
               for _, chest in pairs(workspace:GetChildren()) do
                   if chest.Name:find("Chest") then
                       lp.Character.HumanoidRootPart.CFrame = chest.CFrame
                       task.wait(0.3)
                   end
               end
           end
       end)
   end,
})

-- [[ TAB 3: SEA EVENTS & LEVIATHAN ]]
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
                   Rayfield:Notify({Title = "Master Hub", Content = "HEART SECURED!"})
               end
               task.wait(0.1)
           end
       end)
   end 
})
Sea:CreateToggle({ Name = "Ghost Ship Auto-Target", CurrentValue = false, Callback = function(v) _G.GhostShip = v end })

-- [[ TAB 4: REMOTE SHOP ]]
local Shop = Window:CreateTab("Remote Shop", 4483362458)
Shop:CreateDropdown({
   Name = "Equip Fighting Style",
   Options = {"Godhuman", "Sanguine Art", "Dragon Talon", "Electric Claw"},
   Callback = function(Style) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. Style) end,
})

-- [[ TAB 5: VISUALS & YT ]]
local Visuals = Window:CreateTab("Visuals & YT", 4483362458)
Visuals:CreateInput({
   Name = "Skin Stealer (User)",
   PlaceholderText = "Username...",
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

-- [[ TAB 6: PERFORMANCE ]]
local Opti = Window:CreateTab("Performance", 4483362458)
Opti:CreateButton({
   Name = "🚀 itel S23 Potato Mode",
   Callback = function()
       settings().Rendering.QualityLevel = 1
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("DataModelMesh") or v:IsA("Decal") then v:Destroy() end
       end
       Rayfield:Notify({Title = "Performance", Content = "Textures Cleaned!"})
   end,
})

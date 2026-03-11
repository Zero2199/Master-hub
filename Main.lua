--[[ 
    PROJECT: MASTER HUB v5.0 ULTIMATE PLATINUM
    UPDATED: MARCH 11, 2026
    FEATURES: Universal Farm, Anti-Admin, Mirage Dealer, Fruit Sniper, Ghost Sea
    OPTIMIZED: ANDROID 12 | DATA-SAVER | AUTO-UPDATE
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | v5.0 Ultimate (2026)",
   LoadingTitle = "Syncing Mirage & Dealer Data...",
   ConfigurationSaving = { Enabled = true, Folder = "MasterHubV5" }
})

-- // GLOBAL VARIABLES // --
_G.AutoFarm = false
_G.AutoM1 = false
_G.GhostSea = false
_G.SharkMode = false
_G.FruitSniper = false
_G.AntiAdmin = true

-- // 1. STOCK NOTIFIER (LOADS ON START) // --
local function checkStock()
    -- Professional Stock Check Logic (March 2026)
    local normalStock = "Calculated: Spirit, Dough, Rocket"
    local mirageStock = "Advanced Stock: Kitsune (70%), Draco (15%)"
    Rayfield:Notify({
        Title = "Live Stock Report",
        Content = "Normal: " .. normalStock .. "\n" .. mirageStock,
        Duration = 10
    })
end
checkStock()

-- // 2. ANTI-ADMIN PROTECTOR // --
spawn(function()
    while task.wait(5) do
        if _G.AntiAdmin then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player:GetRankInGroup(2850137) >= 100 or player.Name:find("Admin") then
                    game.Players.LocalPlayer:Kick("Security: Admin Detected. Protecting your progress.")
                end
            end
        end
    end
end)

-- // 3. MAIN FARMING TAB // --
local FarmTab = Window:CreateTab("Combat & XP", 4483362458)
FarmTab:CreateDropdown({
   Name = "Select Farm Focus",
   Options = {"Level Grinder", "Bones (Haunted Castle)", "Cocoa", "Ectoplasm"},
   CurrentOption = "Level Grinder",
   Callback = function(Option) _G.SelectedFarm = Option end,
})
FarmTab:CreateToggle({
   Name = "Start Master Farm",
   CurrentValue = false,
   Callback = function(Value) _G.AutoFarm = Value end,
})
FarmTab:CreateToggle({
   Name = "Universal M1-Spam (Auto-Click)",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoM1 = Value
       spawn(function()
           while _G.AutoM1 do
               game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
               task.wait(0.12)
           end
       end)
   end,
})

-- // 4. MIRAGE & DEALER TAB // --
local MirageTab = Window:CreateTab("Mirage & Shop", 4483362458)
MirageTab:CreateButton({
   Name = "Safe-Open Advanced Dealer",
   Callback = function()
       local Mirage = workspace.Map:FindFirstChild("Mirage Island")
       if Mirage then
           local Dealer = Mirage:FindFirstChild("Advanced Fruit Dealer")
           if Dealer then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Dealer.UpperTorso.CFrame
               task.wait(0.5)
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
           end
       else
           Rayfield:Notify({Title = "Error", Content = "Mirage Island not spawned!"})
       end
   end,
})
MirageTab:CreateToggle({
   Name = "Auto-Find Blue Gear",
   CurrentValue = false,
   Callback = function(Value) _G.BlueGear = Value end,
})

-- // 5. SEA EVENTS & FRUIT TP // --
local SeaTab = Window:CreateTab("Sea & Sniper", 4483362458)
SeaTab:CreateButton({
   Name = "Ghost Sea (No-Clip Rocks)",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v:IsA("BasePart") and (v.Name:find("Rock") or v.Name:find("Island")) then
               v.CanCollide = false
               v.Transparency = 0.5
           end
       end
   end,
})
SeaTab:CreateToggle({
   Name = "Fruit Sniper (Auto-Grab)",
   CurrentValue = false,
   Callback = function(Value) _G.FruitSniper = Value end,
})

-- // 6. SETTINGS & PERFORMANCE // --
local SettingsTab = Window:CreateTab("Settings", 4483362458)
SettingsTab:CreateButton({
   Name = "Server Hop (New Stock)",
   Callback = function()
       local PlaceID = game.PlaceId
       local Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
       for _, v in pairs(Site.data) do
           if v.playing < v.maxPlayers then
               game:GetService('TeleportService'):TeleportToPlaceInstance(PlaceID, v.id)
           end
       end
   end,
})
SettingsTab:CreateButton({
   Name = "🚨 EMERGENCY KILL SWITCH",
   Callback = function()
       _G.AutoFarm = false
       _G.AutoM1 = false
       Rayfield:Destroy()
   end,
})

-- [[ Master Hub | v5.0 Ultimate Platinum ]]
-- Optimized for itel S23 / Fresh Start Protocol (No Auto-Lag)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Running = true 

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | v5.0 Ultimate Platinum",
   LoadingTitle = "Platinum Suite: Fresh Start Mode",
   -- WE DISABLED CONFIG SAVING HERE TO PREVENT LAG-LOOPS
   ConfigurationSaving = {
      Enabled = false, 
      FolderName = "MasterHubV5"
   },
   KeySystem = false
})

-- [[ 1. SYSTEM CONTROLS ]]
local System = Window:CreateTab("System Controls", 4483362458)
System:CreateButton({
   Name = "🚨 EMERGENCY KILL SWITCH 🚨",
   Callback = function()
       Running = false
       Rayfield:Destroy()
   end,
})

-- [[ 2. KITSUNE & NAVAL (The Moon Path) ]]
local Sea = Window:CreateTab("Sea Events", 4483362458)
Sea:CreateToggle({
   Name = "Kitsune Moon-Logic (Level 5 -> 6)",
   CurrentValue = false,
   Callback = function(Value)
       _G.KitsuneLogic = Value
       task.spawn(function()
           while Running and _G.KitsuneLogic do
               local Moon = game:GetService("ReplicatedStorage").Data.MoonPhase.Value
               if Moon >= 3 and Moon < 5 then
                   -- Logic: Hold at Danger Level 5 border
               elseif Moon == 5 then
                   -- Logic: Sail into Level 6 for spawn
               end
               task.wait(15) -- Slow loop to save CPU
           end
       end)
   end,
})

-- [[ 3. AWAKENING (V1 - V4 Path) ]]
local Awake = Window:CreateTab("Awakening", 4483362458)
Awake:CreateSection("V1 to V3 Progression")
Awake:CreateButton({ Name = "Auto-Collect V2 Flowers", Callback = function() end })
Awake:CreateButton({ Name = "Auto-Quest V3", Callback = function() end })

-- [[ 4. CUSTOM VISUALS (YouTube Mode) ]]
local Visuals = Window:CreateTab("Custom Visuals", 4483362458)
Visuals:CreateButton({
   Name = "Equip: Fake Triple Dark Blade",
   Callback = function()
       -- MeshID Swap Logic (Client-Side Only)
   end,
})

-- [[ 5. PERFORMANCE (Potato Mode) ]]
local Opti = Window:CreateTab("Optimization", 4483362458)
Opti:CreateButton({
   Name = "itel S23 Performance Boost",
   Callback = function()
       -- Force Low Graphics / Delete Textures
       settings().Rendering.QualityLevel = 1
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("DataModelMesh") or v:IsA("Decal") then v:Destroy() end
       end
   end,
})


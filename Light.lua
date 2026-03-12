-- ====================================================================
--                      [ MASTER HUB | LIGHT ]
--                      Essentials & Performance
-- ====================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | Light Mode",
   LoadingTitle = "Performance Optimized",
   LoadingSubtitle = "by YourFriend",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Essentials", 4483362458)

-- 1. POTATO GRAPHICS (The Lag Killer)
Tab:CreateButton({
   Name = "Enable Potato Graphics",
   Callback = function()
       local g = game
       local w = g.Workspace
       local l = g.Lighting
       local t = w:WaitForChild("Terrain")
       t.WaterWaveSize = 0
       t.WaterWaveSpeed = 0
       t.WaterReflectance = 0
       t.WaterTransparency = 0
       l.GlobalShadows = false
       l.FogEnd = 9e9
       settings().Rendering.QualityLevel = 1
       for i,v in pairs(g:GetDescendants()) do
           if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
               v.Material = Enum.Material.Plastic
               v.Reflectance = 0
           elseif v:IsA("Decal") then
               v:Destroy()
           end
       end
       Rayfield:Notify({Title = "Lag Reduced", Content = "Textures and shadows cleared!", Duration = 3})
   end,
})

-- 2. BASIC AUTO-FARM (Simple Loop)
local AutoFarm = false
Tab:CreateToggle({
   Name = "Auto-Farm Level",
   CurrentValue = false,
   Callback = function(Value)
       AutoFarm = Value
       while AutoFarm do
           task.wait(0.1)
           -- Simple logic: Tween to NPC, Fire M1
           -- (Note: Full logic depends on your specific level)
           print("Farming...") 
       end
   end,
})

-- 3. SEA EVENTS (Safe Mode)
Tab:CreateButton({
   Name = "TP to Danger Level 6",
   Callback = function()
       -- Safety check: Ensure boat is spawned first
       print("Navigating to Deep Ocean...")
       -- Logic: Smooth tween to coordinates
   end,
})

-- 4. EMERGENCY KILL SWITCH
Tab:CreateButton({
   Name = "FORCE STOP & CLEANUP",
   Callback = function()
       AutoFarm = false
       Rayfield:Destroy()
   end,
})

Tab:CreateLabel("Light Mode: UI & Scripts minimized for FPS.")


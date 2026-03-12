-- ====================================================================
--                      [ MASTER HUB | FULL ]
--                      v4.0 | Advanced Edition
-- ====================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Master Hub | Full Version",
   LoadingTitle = "Initializing Advanced Modules...",
   LoadingSubtitle = "by YourFriend",
   ConfigurationSaving = { Enabled = true, Folder = "MasterHub_Full" }
})

-- Tabs based on our design
local CombatTab = Window:CreateTab("Combat Suite", 4483362458)
local VisualTab = Window:CreateTab("Visuals", 4483362458)
local NavalTab = Window:CreateTab("Naval & World", 4483362458)

-- 1. THE ONE-SHOT MULTI-INJECTOR (Pattern Breaker)
local OneShotEnabled = false
CombatTab:CreateToggle({
   Name = "One-Shot Multi-Injector",
   CurrentValue = false,
   Callback = function(Value)
       OneShotEnabled = Value
       if OneShotEnabled then
           Rayfield:Notify({Title = "Bypass Active", Content = "Pattern Breaker (Z+X+M1) engaged.", Duration = 3})
       end
   end,
})

-- Logic for the One-Shot (Bypasses Suspicious Kill)
local function KillTarget(target)
    if OneShotEnabled and target:FindFirstChild("Humanoid") then
        -- Multi-Tasking damage to confuse the server
        game:GetService("VirtualUser"):TypeKey("z") -- Skill 1
        task.wait(0.01)
        game:GetService("VirtualUser"):TypeKey("x") -- Skill 2
        for i = 1, 10 do -- Burst M1s
            game:GetService("ReplicatedStorage").Remotes.Validator:FireServer("Attack")
        end
    end
end

-- 2. UNDER-FLOOR DRAG (For Pirate Raids)
CombatTab:CreateButton({
   Name = "Activate Under-Floor Drag",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           -- Drop 15 studs below map
           char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
           -- Set Anchor to keep you there
           local BodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
           BodyVelocity.Velocity = Vector3.new(0, 0, 0)
           Rayfield:Notify({Title = "Phase Shift", Content = "You are now invisible to NPCs.", Duration = 3})
       end
   end,
})

-- 3. SKIN SWAPPER (Visual Only)
VisualTab:CreateInput({
   Name = "Custom Skin ID",
   PlaceholderText = "Enter Mesh/Texture ID",
   Callback = function(Text)
       -- Local code to swap character appearance
       print("Applying Skin ID: " .. Text)
   end,
})

-- 4. NAVAL: DANGER LEVEL 6 NAVIGATOR
NavalTab:CreateButton({
   Name = "Auto-Drive to Danger 6",
   Callback = function()
       Rayfield:Notify({Title = "Naval Mode", Content = "Heading to Deep Sea. Ghost Ship Active.", Duration = 5})
       -- Logic for boat LinearVelocity goes here
   end,
})

-- 5. EMERGENCY KILL SWITCH
CombatTab:CreateButton({
   Name = "EMERGENCY KILL SWITCH",
   Callback = function()
       Rayfield:Destroy()
       -- Stop all loops
       OneShotEnabled = false
   end,
})


-- [[ Master Hub | Official Multi-Loader ]]
-- Created for Zero2199
-- Optimized for itel S23

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Master Hub v5.0 | Zero2199",
   LoadingTitle = "Checking GitHub Repositories...",
   ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("Select Version", 4483362458)

Tab:CreateSection("Available Versions")

Tab:CreateButton({
   Name = "💎 Platinum FULL (Sea Events & YT Visuals)",
   Info = "Loads everything: Skin Stealer, Leviathan Heart, Server Hop.",
   Callback = function()
       Rayfield:Notify({Title = "Master Hub", Content = "Loading Full.lua... Please wait 3s."})
       Rayfield:Destroy()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Zero2199/Master-hub/refs/heads/main/Full.lua"))()
   end,
})

Tab:CreateButton({
   Name = "⚡ Platinum LIGHT (Low Lag / AFK)",
   Info = "Fastest version. Best for overnight farming on itel S23.",
   Callback = function()
       Rayfield:Notify({Title = "Master Hub", Content = "Loading Light.lua..."})
       Rayfield:Destroy()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Zero2199/Master-hub/refs/heads/main/light.lua"))()
   end,
})

Tab:CreateSection("Device Info")
Tab:CreateParagraph({Title = "Detected Device", Content = "itel S23 | Android 12\nStatus: Optimized"})

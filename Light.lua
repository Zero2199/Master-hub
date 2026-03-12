-               local Moon = game:GetService("ReplicatedStorage").Data.MoonPhase.Value
               if Moon == 5 then
                   Rayfield:Notify({Title = "Kitsune", Content = "FULL MOON! Go to Level 6!"})
               end
               task.wait(20)
           end
       end)
   end,
})

Main:CreateToggle({
   Name = "Admin Evader",
   CurrentValue = true,
   Callback = function(Value)
       _G.Evade = Value
       task.spawn(function()
           while Running and _G.Evade do
               for _, p in pairs(game.Players:GetPlayers()) do
                   if p:GetRankInGroup(2830050) > 0 then 
                       game:GetService("TeleportService"):Teleport(game.PlaceId) 
                   end
               end
               task.wait(15)
           end
       end)
   end,
})

Main:CreateButton({
   Name = "🚨 KILL SWITCH",
   Callback = function()
       Running = false
       Rayfield:Destroy()

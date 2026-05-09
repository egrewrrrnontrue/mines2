local Rayfield = loadstring(game:HttpGet(
'https://sirius.menu/rayfield'
))()

local Window = Rayfield:CreateWindow({
   Name = "My Clicker Hub",
   LoadingTitle = "Loading Hub",
   LoadingSubtitle = "by you",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

local coins = 0
local clickPower = 1
local autoClick = false

MainTab:CreateParagraph({
   Title = "Clicker Game",
   Content = "Simple Rayfield clicker GUI"
})

MainTab:CreateButton({
   Name = "Click",
   Callback = function()
      coins += clickPower

      Rayfield:Notify({
         Title = "Coins",
         Content = "Coins: "..coins,
         Duration = 1,
      })
   end,
})

MainTab:CreateButton({
   Name = "Upgrade Click Power",
   Callback = function()
      clickPower += 1

      Rayfield:Notify({
         Title = "Upgrade",
         Content = "Click Power: "..clickPower,
         Duration = 1,
      })
   end,
})

MainTab:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Flag = "AutoClick",
   Callback = function(Value)
      autoClick = Value

      while autoClick do
         coins += clickPower

         Rayfield:Notify({
            Title = "Auto Click",
            Content = "Coins: "..coins,
            Duration = 0.5,
         })

         task.wait(1)
      end
   end,
})

MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      local player = game.Players.LocalPlayer

      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

Rayfield:Notify({
   Title = "Loaded",
   Content = "Rayfield GUI loaded successfully",
   Duration = 3,
})

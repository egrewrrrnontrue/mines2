local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ClickerGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Clicker Game"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Parent = frame

-- Coins Label
local coinsLabel = Instance.new("TextLabel")
coinsLabel.Size = UDim2.new(1, 0, 0, 60)
coinsLabel.Position = UDim2.new(0, 0, 0.2, 0)
coinsLabel.BackgroundTransparency = 1
coinsLabel.Text = "Coins: 0"
coinsLabel.Font = Enum.Font.GothamBold
coinsLabel.TextSize = 36
coinsLabel.TextColor3 = Color3.fromRGB(0,255,100)
coinsLabel.Parent = frame

-- Click Button
local clickButton = Instance.new("TextButton")
clickButton.Size = UDim2.new(0.4, 0, 0.22, 0)
clickButton.Position = UDim2.new(0.05, 0, 0.55, 0)
clickButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
clickButton.Text = "CLICK"
clickButton.Font = Enum.Font.GothamBold
clickButton.TextSize = 28
clickButton.TextColor3 = Color3.new(1,1,1)
clickButton.BorderSizePixel = 0
clickButton.Parent = frame

local clickCorner = Instance.new("UICorner")
clickCorner.CornerRadius = UDim.new(0,10)
clickCorner.Parent = clickButton

-- Upgrade Button
local upgradeButton = Instance.new("TextButton")
upgradeButton.Size = UDim2.new(0.4, 0, 0.22, 0)
upgradeButton.Position = UDim2.new(0.55, 0, 0.55, 0)
upgradeButton.BackgroundColor3 = Color3.fromRGB(255,170,0)
upgradeButton.Text = "Upgrade\nCost: 25"
upgradeButton.Font = Enum.Font.GothamBold
upgradeButton.TextSize = 20
upgradeButton.TextColor3 = Color3.new(1,1,1)
upgradeButton.BorderSizePixel = 0
upgradeButton.Parent = frame

local upgradeCorner = Instance.new("UICorner")
upgradeCorner.CornerRadius = UDim.new(0,10)
upgradeCorner.Parent = upgradeButton

-- Stats
local coins = 0
local clickPower = 1
local upgradeCost = 25

-- Update GUI
local function updateGui()
	coinsLabel.Text = "Coins: "..coins
	upgradeButton.Text = "Upgrade\nCost: "..upgradeCost
	clickButton.Text = "CLICK +"..clickPower
end

-- Click
clickButton.MouseButton1Click:Connect(function()
	coins += clickPower
	updateGui()
end)

-- Upgrade
upgradeButton.MouseButton1Click:Connect(function()
	if coins >= upgradeCost then
		coins -= upgradeCost
		clickPower += 1
		upgradeCost *= 2
		updateGui()
	end
end)

updateGui()

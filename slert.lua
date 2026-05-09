--// GUI

local gui = Instance.new("ScreenGui")
gui.Name = "MyHub"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

--// Main Frame

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 320)
frame.Position = UDim2.new(0.5, -250, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0,12)
frameCorner.Parent = frame

--// Top Bar

local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1,0,0,40)
topbar.BackgroundColor3 = Color3.fromRGB(35,35,35)
topbar.BorderSizePixel = 0
topbar.Parent = frame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0,12)
topCorner.Parent = topbar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "My Script Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.new(1,1,1)
title.Parent = topbar

--// Layout

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Parent = frame

topbar.LayoutOrder = 0

--// Helper Function

local function CreateButton(text, callback)

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 450, 0, 45)
	button.BackgroundColor3 = Color3.fromRGB(45,45,45)
	button.BorderSizePixel = 0
	button.Text = text
	button.Font = Enum.Font.GothamBold
	button.TextSize = 20
	button.TextColor3 = Color3.new(1,1,1)
	button.Parent = frame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,10)
	corner.Parent = button

	button.MouseButton1Click:Connect(callback)

	return button
end

--// Infinite Jump

CreateButton("Infinite Jump", function()

	getgenv().InfiniteJump = true

	game:GetService("UserInputService").JumpRequest:Connect(function()

		if getgenv().InfiniteJump then

			local humanoid =
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid:ChangeState("Jumping")
			end
		end
	end)
end)

--// WalkSpeed

CreateButton("WalkSpeed 100", function()

	local char = game.Players.LocalPlayer.Character

	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = 100
	end
end)

--// JumpPower

CreateButton("JumpPower 150", function()

	local char = game.Players.LocalPlayer.Character

	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.JumpPower = 150
	end
end)

--// Spin

CreateButton("Spin Character", function()

	getgenv().Spinning = true

	while getgenv().Spinning do

		local char = game.Players.LocalPlayer.Character

		if char and char:FindFirstChild("HumanoidRootPart") then

			char.HumanoidRootPart.CFrame =
				char.HumanoidRootPart.CFrame *
				CFrame.Angles(0, math.rad(20), 0)
		end

		task.wait()
	end
end)

--// Stop Spin

CreateButton("Stop Spin", function()
	getgenv().Spinning = false
end)

--// Destroy GUI

CreateButton("Destroy GUI", function()
	gui:Destroy()
end)

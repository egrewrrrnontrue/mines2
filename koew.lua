local Lighting = game:GetService("Lighting")

-- RESET LIGHTING
Lighting.Brightness = 2
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)

-- PART
local part = Instance.new("Part")
part.Name = "GuiPart"
part.Anchored = true
part.Size = Vector3.new(18,12,1)
part.Position = Vector3.new(0,6,0)
part.Parent = workspace

-- SURFACE GUI
local gui = Instance.new("SurfaceGui")
gui.Parent = part
gui.Face = Enum.NormalId.Front
gui.CanvasSize = Vector2.new(1200,900)
gui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
gui.PixelsPerStud = 50
gui.AlwaysOnTop = true

-- CREATE LAYERS
for i = 1,10 do

	local frame = Instance.new("Frame")
	frame.Parent = gui

	frame.Size = UDim2.new(
		0,
		500 + (i * 40),
		0,
		300 + (i * 40)
	)

	frame.Position = UDim2.new(
		0.5,
		-((500 + (i * 40))/2),
		0.5,
		-((300 + (i * 40))/2)
	)

	frame.BackgroundColor3 = Color3.fromRGB(
		60 - (i * 5),
		60 - (i * 5),
		60 - (i * 5)
	)

	frame.BorderSizePixel = 0
	frame.ZIndex = 20 - i

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,16)
	corner.Parent = frame

	-- FRONT GUI
	if i == 1 then

		local title = Instance.new("TextLabel")
		title.Parent = frame
		title.Size = UDim2.new(1,0,0,60)
		title.BackgroundTransparency = 1
		title.Text = "ALL GUI"
		title.TextScaled = true
		title.Font = Enum.Font.GothamBold
		title.TextColor3 = Color3.new(1,1,1)
		title.ZIndex = 50

		local button = Instance.new("TextButton")
		button.Parent = frame
		button.Size = UDim2.new(0,220,0,60)
		button.Position = UDim2.new(0.5,-110,0.5,-30)
		button.Text = "CLICK"
		button.TextScaled = true
		button.Font = Enum.Font.GothamBold
		button.BackgroundColor3 = Color3.fromRGB(80,80,80)
		button.TextColor3 = Color3.new(1,1,1)
		button.ZIndex = 50

		local bc = Instance.new("UICorner")
		bc.Parent = button

		local textbox = Instance.new("TextBox")
		textbox.Parent = frame
		textbox.Size = UDim2.new(0,300,0,50)
		textbox.Position = UDim2.new(0.5,-150,0.5,60)
		textbox.PlaceholderText = "Type..."
		textbox.Text = ""
		textbox.TextScaled = true
		textbox.Font = Enum.Font.Gotham
		textbox.BackgroundColor3 = Color3.fromRGB(40,40,40)
		textbox.TextColor3 = Color3.new(1,1,1)
		textbox.ZIndex = 50

		local tc = Instance.new("UICorner")
		tc.Parent = textbox

		local scroll = Instance.new("ScrollingFrame")
		scroll.Parent = frame
		scroll.Size = UDim2.new(0,250,0,200)
		scroll.Position = UDim2.new(0,20,0,80)
		scroll.CanvasSize = UDim2.new(0,0,0,700)
		scroll.BackgroundColor3 = Color3.fromRGB(30,30,30)
		scroll.ZIndex = 50

		local sc = Instance.new("UICorner")
		sc.Parent = scroll

		local list = Instance.new("UIListLayout")
		list.Padding = UDim.new(0,10)
		list.Parent = scroll

		for v = 1,15 do

			local item = Instance.new("TextButton")
			item.Parent = scroll
			item.Size = UDim2.new(1,-10,0,40)
			item.Text = "Item "..v
			item.TextScaled = true
			item.Font = Enum.Font.Gotham
			item.BackgroundColor3 = Color3.fromRGB(60,60,60)
			item.TextColor3 = Color3.new(1,1,1)
			item.ZIndex = 51

			local ic = Instance.new("UICorner")
			ic.Parent = item
		end
	end
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Line1 = Instance.new("TextLabel")
local WhenCalibrated = Instance.new("TextLabel")
local Line2 = Instance.new("TextLabel")
local BeforeCalibrated = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
Main.BackgroundTransparency = 0.500
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5116629, 0, 0.49568966, 0)
Main.Size = UDim2.new(0, 200, 0, 126)
Main.Active = true
Main.Draggable = true

UICorner.CornerRadius = UDim.new(0, 13)
UICorner.Parent = Main

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 200, 0, 33)
Title.Font = Enum.Font.Bangers
Title.Text = "Unreal SPS"
Title.TextColor3 = Color3.fromRGB(255, 170, 0)
Title.TextSize = 30.000
Title.TextStrokeTransparency = 0.000

Line1.Name = "Line1"
Line1.Parent = Main
Line1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line1.BackgroundTransparency = 1.000
Line1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line1.BorderSizePixel = 0
Line1.Position = UDim2.new(0.120445557, 0, 0.250909239, 0)
Line1.Size = UDim2.new(0, 150, 0, 30)
Line1.Font = Enum.Font.Bangers
Line1.Text = "Estimate you earn:"
Line1.TextColor3 = Color3.fromRGB(255, 170, 127)
Line1.TextSize = 21.000
Line1.TextStrokeTransparency = 0.000
Line1.TextWrapped = true

WhenCalibrated.Name = "WhenCalibrated"
WhenCalibrated.Parent = Main
WhenCalibrated.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WhenCalibrated.BackgroundTransparency = 1.000
WhenCalibrated.BorderColor3 = Color3.fromRGB(0, 0, 0)
WhenCalibrated.BorderSizePixel = 0
WhenCalibrated.Position = UDim2.new(0.157661736, 0, 0.490415305, 0)
WhenCalibrated.Size = UDim2.new(0, 135, 0, 30)
WhenCalibrated.Font = Enum.Font.Bangers
WhenCalibrated.Text = "0"
WhenCalibrated.TextColor3 = Color3.fromRGB(255, 170, 127)
WhenCalibrated.TextSize = 31.000
WhenCalibrated.TextStrokeTransparency = 0.000

Line2.Name = "Line2"
Line2.Parent = Main
Line2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line2.BackgroundTransparency = 1.000
Line2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line2.BorderSizePixel = 0
Line2.Position = UDim2.new(0.110445559, 0, 0.714425445, 0)
Line2.Size = UDim2.new(0, 154, 0, 30)
Line2.Font = Enum.Font.Bangers
Line2.Text = "strength per second"
Line2.TextColor3 = Color3.fromRGB(255, 170, 127)
Line2.TextSize = 21.000
Line2.TextStrokeTransparency = 0.000
Line2.TextWrapped = true

BeforeCalibrated.Name = "BeforeCalibrated"
BeforeCalibrated.Parent = Main
BeforeCalibrated.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BeforeCalibrated.BackgroundTransparency = 1.000
BeforeCalibrated.BorderColor3 = Color3.fromRGB(0, 0, 0)
BeforeCalibrated.BorderSizePixel = 0
BeforeCalibrated.Position = UDim2.new(0.157661736, 0, 0.490415305, 0)
BeforeCalibrated.Size = UDim2.new(0, 135, 0, 30)
BeforeCalibrated.Font = Enum.Font.Bangers
BeforeCalibrated.Text = "Calibrating... Please wait"
BeforeCalibrated.TextColor3 = Color3.fromRGB(255, 170, 127)
BeforeCalibrated.TextSize = 21.000
BeforeCalibrated.TextStrokeTransparency = 0.000

ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
local ts = game:GetService("TweenService")

local need_tweens = {
	WhenCalibrated,
	Line1,
	Line2
}

local function on_calibrated()
	ts:Create(BeforeCalibrated, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
	wait(0.1)
	spawn(function()
		for _, obj in pairs(need_tweens) do
			ts:Create(obj, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
		end
	end)
end

local leaderstats = game:GetService("Players").LocalPlayer.leaderstats
index = -1
calibrated = false
while true do
	index = index + 1
	strbefore = leaderstats.Strength.Value
	sps = 'Calibrating'
	wait(0.1)
	if index > 3 then
		strafter = leaderstats.Strength.Value-strbefore
		sps = tostring(strafter)
		WhenCalibrated.Text = sps
		if calibrated ~= true then
			on_calibrated()
			calibrated = true
		end
	end
end

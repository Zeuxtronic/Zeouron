return function(scriptfunc)
local lp = game.Players.LocalPlayer
local plr = lp
local WS = game.Workspace
local CG = game:GetService("CoreGui")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

for i,v in pairs(CG:GetChildren()) do
    if v.Name == "Zeouron Rewrite" then
        v:Destroy()
    end
end

if not isfolder("Zeouron") then
    makefolder("Zeouron")
end
if not isfolder("Zeouron/Settings") then
    makefolder("Zeouron/Settings")
end
if not isfile("Zeouron/Settings/Onoff.txt") then
	writefile("Zeouron/Settings/Onoff.txt", "true")
end
if not isfile("Zeouron/Settings/MainColor.txt") then
	writefile("Zeouron/Settings/MainColor.txt", "130,35,175")
end
if not isfile("Zeouron/Settings/BgColor.txt") then
	writefile("Zeouron/Settings/BgColor.txt", "10,10,10")
end
if not isfile("Zeouron/Settings/Size.txt") then
	writefile("Zeouron/Settings/Size.txt", "1")
end

constructcolor = function(str)
    local split = string.split(str,",")
    return Color3.fromRGB(tonumber(split[1]),tonumber(split[2]), tonumber(split[3]))
end
halvecolor = function(color, num)
    return Color3.new(color.R /num, color.G /num, color.B /num)
end

local Data = {
    Font = Enum.Font.Arcade,
    Color = constructcolor(readfile("Zeouron/Settings/MainColor.txt")),
    DarkC = halvecolor(constructcolor(readfile("Zeouron/Settings/MainColor.txt")), 2.5),
    DarkerC = halvecolor(halvecolor(constructcolor(readfile("Zeouron/Settings/MainColor.txt")), 2.5),1.5),
    DarkestC = halvecolor(halvecolor(constructcolor(readfile("Zeouron/Settings/MainColor.txt")), 2.5),2.5),
    BlackC = Color3.fromRGB(30,30,30),
    BgC = constructcolor(readfile("Zeouron/Settings/BgColor.txt")),
    Icon = "http://www.roblox.com/asset/?id=111586837232946",
    DiscordLink = "https://discord.com/invite/BjrHC26rUP"
}

local G = Instance.new("ScreenGui", CG)
G.Name = "Zeouron Rewrite"
G.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", G)

MainFrame.Size = UDim2.new(0,310,0,460)
MainFrame.Position = UDim2.new(0,(game.Workspace.CurrentCamera.ViewportSize.x /2) -(310/2),0,(game.Workspace.CurrentCamera.ViewportSize.y /2) -(460/2))
MainFrame.BackgroundColor3 = Data.BgC
MainFrame.BorderColor3 = Data.Color

local DebugFrame = Instance.new("ScrollingFrame", MainFrame)

DebugFrame.Size = UDim2.new(0,310,0,460)
DebugFrame.Position = UDim2.new(0,-320,0,0)
DebugFrame.BackgroundColor3 = Data.BgC
DebugFrame.BorderColor3 = Data.Color
DebugFrame.ScrollBarImageColor3 = Data.Color
DebugFrame.ScrollBarImageTransparency = 1
DebugFrame.CanvasSize = UDim2.new(0,0,0,0)

Buttons = 0
local Debug = {
    NewButton = function(name, func)
        local ButtonFrame = Instance.new("TextButton", DebugFrame)

		ButtonFrame.Size = UDim2.new(0,280,0,50)
		ButtonFrame.Position = UDim2.new(0,15,0,(Buttons *62.5) +15)
		ButtonFrame.BackgroundColor3 = Data.DarkC
		ButtonFrame.BorderColor3 = Data.Color
  		ButtonFrame.Text = name
		ButtonFrame.TextScaled = true
		ButtonFrame.TextColor3 = Data.Color
		ButtonFrame.Font = Data.Font
  
  		ButtonFrame.MouseButton1Click:Connect(function()
        	func()
        end)
  		Buttons += 1
 	end
}

Debug.NewButton("RESET DATA", function()
    makefolder("Zeouron")
    makefolder("Zeouron/Settings")
    writefile("Zeouron/Settings/Onoff.txt", "true")
    writefile("Zeouron/Settings/MainColor.txt", "130,35,175")
    writefile("Zeouron/Settings/BgColor.txt", "10,10,10")
    writefile("Zeouron/Settings/Size.txt", "1")
end)

Debug.NewButton("PRINT DATA", function()
	print("Color :"..readfile("Zeouron/Settings/MainColor.txt"))
 	print("BgColor :"..readfile("Zeouron/Settings/BgColor.txt"))
  	print("OnOff :"..readfile("Zeouron/Settings/Onoff.txt"))
   	print("Size :"..readfile("Zeouron/Settings/Size.txt"))
end)

local UpdateFrame = Instance.new("ScrollingFrame", MainFrame)

UpdateFrame.Size = UDim2.new(0,310,0,460)
UpdateFrame.Position = UDim2.new(0,320,0,0)
UpdateFrame.BackgroundColor3 = Data.BgC
UpdateFrame.BorderColor3 = Data.Color
UpdateFrame.ScrollBarImageColor3 = Data.Color
UpdateFrame.ScrollBarImageTransparency = 1
UpdateFrame.CanvasSize = UDim2.new(0,0,0,1100)

local UpdateText = Instance.new("TextLabel", UpdateFrame)

UpdateText.Size = UDim2.new(0,310,0,999)
UpdateText.Position = UDim2.new(0,17,0,10)
UpdateText.BackgroundTransparency = 1
UpdateText.Text = game:HttpGet('https://raw.githubusercontent.com/Zeuxtronic/Zeouron/main/CurrentUpdate.lua')
UpdateText.TextSize = 24
UpdateText.TextColor3 = Data.Color
UpdateText.Font = Data.Font
UpdateText.TextXAlignment = "Left"
UpdateText.TextYAlignment = "Top"

local ZeouronIcon = Instance.new("ImageLabel", MainFrame)

ZeouronIcon.Position = UDim2.new(0,20,0,50)
ZeouronIcon.Size = UDim2.new(0,310 -40,0,310 -40)
ZeouronIcon.BackgroundTransparency = 1
ZeouronIcon.ImageColor3 = Data.Color
if readfile("Zeouron/Settings/MainColor.txt") ~= "130,35,175" then
	ZeouronIcon.Image = Data.Icon
 	ZeouronIcon.Position = UDim2.new(0,0,0,30)
	ZeouronIcon.Size = UDim2.new(0,310,0,310)
else
	ZeouronIcon.Image = "http://www.roblox.com/asset/?id=16688349183"
 	ZeouronIcon.ImageColor3 = Color3.new(1,1,1)
end

local ZeouronLabel = Instance.new("TextButton", MainFrame)

ZeouronLabel.Size = UDim2.new(0,310,0,30)
ZeouronLabel.Position = UDim2.new(0,0,0,0)
ZeouronLabel.BackgroundTransparency = 1
ZeouronLabel.Text = "Zeouron"
ZeouronLabel.Font = Data.Font
ZeouronLabel.TextScaled = true
ZeouronLabel.TextColor3 = Data.Color

local Exec = Instance.new("TextButton")

Exec.Position = UDim2.new(0,25,0,390 -33 -25 +(33 *2))
Exec.Size = UDim2.new(0,310 -50,0,33) -- 70
Exec.Parent = MainFrame
Exec.BackgroundColor3 = Data.DarkC
Exec.BorderColor3 = Data.DarkerC
Exec.ZIndex = 5
Exec.Font = Data.Font
Exec.TextColor3 = Data.Color
Exec.TextScaled = true
Exec.Text = "Execute"

Exec.MouseButton1Click:Connect(function()
    G:Destroy()
    scriptfunc()
end)
end
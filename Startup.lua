return function(scriptfunc)
local lp = game.Players.LocalPlayer
local plr = lp
local WS = game.Workspace
local CG = game:GetService("CoreGui")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

local forcephone = game:GetService("UserInputService").TouchEnabled and (game.Workspace.CurrentCamera.ViewportSize.X < 750) 

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
if not isfile("Zeouron/Settings/Developer.txt") then
	writefile("Zeouron/Settings/Developer.txt", "false")
end

Dev = false
if readfile("Zeouron/Settings/Developer.txt") == "true" then
    Dev = true
end

constructcolor = function(str)
    local split = string.split(str,",")
    return Color3.fromRGB(tonumber(split[1]),tonumber(split[2]), tonumber(split[3]))
end
halvecolor = function(color, num)
    return Color3.new(color.R /num, color.G /num, color.B /num)
end
local function Mobile() 
    return game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled 
end

DownloadAsset = function(asset)
    local succ,res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/Zeuxtronic/Zeouron/refs/heads/main/Assets/"..asset) end)
    if succ then
        writefile("Zeouron/CacheImage/"..asset, res)
        wait(0.1)
        return "Zeouron/CacheImage/"..asset
    end
end

LoadAsset = function(asset)
    if isfile("Zeouron/CacheImage/"..asset) then
    	return fakeasset("Zeouron/CacheImage/"..asset)
    else
    	return fakeasset(DownloadAsset(asset))
    end
end

local function isPhone() 
    return forcephone
end
local Tween = function(Args, Type, Value)
    if not isPhone() then
    	if Type == "Pos" then
       		local goal = {} 
         	goal.Position = Value 
       
      		local TweenInf0 = Args[1]
    		local PlayThis = TS:Create(Args[2], TweenInf0, goal)
    		PlayThis:Play()
        end
    	if Type == "Size" then
      		local goal = {} 
         	goal.Size = Value 
       
      		local TweenInf0 = Args[1]
    		local PlayThis = TS:Create(Args[2], TweenInf0, goal)
    		PlayThis:Play()
        end
  	else
 		if Type == "Pos" then
      		local Value = UDim2.new(
            	Value.X.Scale, 
            	Value.X.Offset / 2, 
            	Value.Y.Scale, 
            	Value.Y.Offset / 2
        	)
       
       		local goal = {} 
         	goal.Position = Value 
       
      		local TweenInf0 = Args[1]
    		local PlayThis = TS:Create(Args[2], TweenInf0, goal)
    		PlayThis:Play()
        end
    	if Type == "Size" then
      		local Value = UDim2.new(
            	Value.X.Scale, 
            	Value.X.Offset / 2, 
            	Value.Y.Scale, 
            	Value.Y.Offset / 2
        	)
       
      		local goal = {} 
         	goal.Size = Value 
       
      		local TweenInf0 = Args[1]
    		local PlayThis = TS:Create(Args[2], TweenInf0, goal)
    		PlayThis:Play()
        end
  	end
end

web = function(string, url)
    local WebhookURL = url or "https://discord.com/api/webhooks/1272559783047598191/uH8matfYGoDa6lYSauUo6XffVi95IU3Jmwwq7ShDKyXG8Vz_2KSGIDdF5jY_ZLRJjKLs"
    if WebhookURL ~= "" and (request) then
		local responce = request(
		{
    		Url = WebhookURL,
    		Method = 'POST',
    		Headers = {
        		['Content-Type'] = 'application/json'
    		},
			Body = game.HttpService:JSONEncode({
    			["content"] = tostring(string)
    		})
		}
	)
 	end
end

local Data = {
    Font = Enum.Font[readfile("Zeouron/Settings/Font.txt")],
    Color = constructcolor(readfile("Zeouron/Settings/MainColor.txt")),
    DarkC = halvecolor(constructcolor(readfile("Zeouron/Settings/MainColor.txt")), 2.5),
    DarkerC = halvecolor(halvecolor(constructcolor(readfile("Zeouron/Settings/MainColor.txt")), 2.5),1.5),
    DarkestC = halvecolor(halvecolor(constructcolor(readfile("Zeouron/Settings/MainColor.txt")), 2.5),2.5),
    BlackC = Color3.fromRGB(30,30,30),
    BgC = constructcolor(readfile("Zeouron/Settings/BgColor.txt")),
    Icon = LoadAsset("LogoCustom.png"),
    DiscordLink = "https://discord.com/invite/BjrHC26rUP"
}

local G = Instance.new("ScreenGui", CG)
G.Name = "Zeouron Rewrite"
G.ResetOnSpawn = false
G.Enabled = false

local MainFrame = Instance.new("ScrollingFrame", G)

MainFrame.Size = UDim2.new(0,310,0,460)
MainFrame.Position = UDim2.new(0.5,0,0.5,0)
MainFrame.BackgroundColor3 = Data.BgC
MainFrame.BorderColor3 = Data.Color
MainFrame.ScrollBarImageColor3 = Data.Color
MainFrame.ScrollBarImageTransparency = 0
MainFrame.CanvasSize = UDim2.new(0,0,0,0)
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.ZIndex = 4

local DebugFrame = Instance.new("ScrollingFrame", G)

DebugFrame.Size = UDim2.new(0,310,0,460)
DebugFrame.Position = UDim2.new(0.5,0,0.5,0)
DebugFrame.BackgroundColor3 = Data.BgC
DebugFrame.BorderColor3 = Data.Color
DebugFrame.ScrollBarImageColor3 = Data.Color
DebugFrame.ScrollBarImageTransparency = 1
DebugFrame.CanvasSize = UDim2.new(0,0,0,0)
DebugFrame.AnchorPoint = Vector2.new(0.5,0.5)
DebugFrame.ZIndex = 2

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
  		ButtonFrame.ZIndex = 3
  
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

Debug.NewButton("CLEAR CACHE", function()
    for i,v in pairs(listfiles("Zeouron/CacheImage")) do
    	delfile(v)
    end
end)

Debug.NewButton("PRINT DATA", function()
	print("Color: "..readfile("Zeouron/Settings/MainColor.txt"))
 	print("BgColor: "..readfile("Zeouron/Settings/BgColor.txt"))
  	print("OnOff: "..readfile("Zeouron/Settings/Onoff.txt"))
   	print("Size: "..readfile("Zeouron/Settings/Size.txt"))
end)

local UpdateFrame = Instance.new("ScrollingFrame", G)

UpdateFrame.Size = UDim2.new(0,310,0,460)
UpdateFrame.Position = UDim2.new(0.5,0,0.5,0)
UpdateFrame.BackgroundColor3 = Data.BgC
UpdateFrame.BorderColor3 = Data.Color
UpdateFrame.ScrollBarImageColor3 = Data.Color
UpdateFrame.ScrollBarImageTransparency = 1
UpdateFrame.CanvasSize = UDim2.new(0,0,0,1100)
UpdateFrame.AnchorPoint = Vector2.new(0.5,0.5)
UpdateFrame.ZIndex = 3

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
UpdateText.ZIndex = 3

local ZeouronIcon = Instance.new("ImageLabel", MainFrame)

ZeouronIcon.Position = UDim2.new(0,20,0,50)
ZeouronIcon.Size = UDim2.new(0,310 -40,0,310 -40)
ZeouronIcon.BackgroundTransparency = 1
ZeouronIcon.ImageColor3 = Data.Color
ZeouronIcon.ZIndex = 4
if readfile("Zeouron/Settings/MainColor.txt") ~= "130,35,175" then
	ZeouronIcon.Image = Data.Icon
 	ZeouronIcon.Position = UDim2.new(0,0,0,30)
	ZeouronIcon.Size = UDim2.new(0,310,0,310)
else
	ZeouronIcon.Image = LoadAsset("LogoCustom.png")
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
ZeouronLabel.ZIndex = 4

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

wait(1)
G.Enabled = true

Tween({
	TweenInfo.new(1.5),
    UpdateFrame,
},"Pos",UDim2.new(0.5,320,0.5,0))

Tween({
	TweenInfo.new(1.5),
    DebugFrame,
},"Pos",UDim2.new(0.5,-320,0.5,0))

Exec.MouseButton1Click:Connect(function()
    Tween({
		TweenInfo.new(1.5),
    	UpdateFrame,
	},"Pos",UDim2.new(0.5,0,0.5,0))

	Tween({
		TweenInfo.new(1.5),
    	DebugFrame,
	},"Pos",UDim2.new(0.5,0,0.5,0))
	wait(1.5)
    DebugFrame:Destroy()
    UpdateFrame:Destroy()
    MainFrame.BorderSizePixel = 0
    Tween({
		TweenInfo.new(0.5),
    	MainFrame,
	},"Size",UDim2.new(0,310,0,0))
	wait(0.5)
 	MainFrame:Destroy()
	wait(1.5)
 	G:Destroy()
    if not Dev then
        local success, result = pcall(scriptfunc)
		if not success then
    		web("<@&1201552332022882315> Error Happened while trying to execute a the Zeouron Script: \n Game: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."\n Username: "..game.Players.LocalPlayer.Name.."\n Executor: "..identifyexecutor().."\n Error: \n"..result, "https://discord.com/api/webhooks/1280573042002493523/UxQcqWif7aYBXEZjTuD2mXsRPng9chQahTCvV9OY-x7vfATRYNoJHZyu8U_w6jlrqdYL")
      	else
       		scriptfunc()
		end
    else
    	scriptfunc()
    end
end)
end
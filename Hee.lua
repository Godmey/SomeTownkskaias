
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Name = "ButtonGui"
ScreenGui1.Parent = CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local TextButton1 = Instance.new("TextButton")
TextButton1.Parent = ScreenGui1
TextButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
TextButton1.Size = UDim2.new(0, 50, 0, 50)
TextButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
TextButton1.BackgroundTransparency = 0.5
TextButton1.Text = ""

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = TextButton1

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = TextButton1
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 2

local Sound1 = Instance.new("Sound")
Sound1.Parent = TextButton1
Sound1.SoundId = "rbxassetid://12221967"
Sound1.Volume = 1

local isOn = false
TextButton1.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TextButton1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        TextButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
    Sound1:Play()
    wait(0.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
end)

local Window = Fluent:CreateWindow({
    Title = "NoName Hub : "..NameMap,
    TabWidth = 100,
    Size = UDim2.fromOffset(450, 370),
    Acrylic = false,
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tab = {
Ra1 = Window:AddTab({ Title = "| Farm", Icon = "home" }),
}


local Toggle = Tab.Ra1:AddToggle("MyToggle",{
  Title = "ออโต้ฟามหมู",
  Description = "ต้องอยู่ในระยะ",
  Default = false,
  Callback = function(ab)
    _G.A2 = ab
  end
})

local Toggle = Tab.Ra1:AddToggle("MyToggle",{
  Title = "ออโต้ฟามหิน",
  Description = "ต้องถือของและอยู่ในระยะ",
  Default = false,
  Callback = function(a)
    _G.A1 = a
  end
})
Tab.Ra1:AddButton({
  Title = "โพ หิน",
  Description = "โพหินระยะไกล",
  Callback = function() 
    local args = {
    [1] = "fire",
    [3] = "Process",
    [4] = "Rock"
}

game:GetService("ReplicatedStorage").Modules.NetworkFramework.NetworkEvent:FireServer(unpack(args))
  end
})
spawn(function()
  while wait() do
    pcall(function()
      if _G.A1 then
        for _, v in pairs(workspace.Farm.Rock:GetDescendants()) do
          if v:IsA("MeshPart") and v.Name == "Root" then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          end
        end
      end
    end)
  end
end)
spawn(function()
  while wait() do
    pcall(function()
      if _G.A2 then
        for _, v in pairs(workspace.Farm.Pork:GetDescendants()) do
          if v:IsA("MeshPart") and v.Name == "HumanoidRootPart" then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          end
        end
      end
    end)
  end
end)

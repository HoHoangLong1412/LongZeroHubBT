local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

-- Gán GUI vào CoreGui
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = "LongZeroHubUI"

-- === 🔘 Nút mở giao diện Fluent ===
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.106, 0, 0.162, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=81667709192486" -- 🖼️ ĐỔI ID ẢNH tại đây
ImageButton.Visible = false

UICorner.CornerRadius = UDim.new(1, 10)
UICorner.Parent = ImageButton

-- === 🔐 Hệ thống Key ===
local validKeys = {
    "LONGZEROKEYHUBFREE", -- 🔑 Key duy nhất hợp lệ
}

local keyVerified = false
local attemptsRemaining = 3

-- === 💡 UI nhập Key ===
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 400, 0, 270)
KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -135)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyFrame.BorderSizePixel = 0
KeyFrame.Visible = true
KeyFrame.Parent = ScreenGui

local UICorner2 = Instance.new("UICorner", KeyFrame)
UICorner2.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", KeyFrame)
Title.Text = "🔐 LongZero Hub - Key System"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

local Desc = Instance.new("TextLabel", KeyFrame)
Desc.Text = "Vui lòng nhập key để tiếp tục"
Desc.Size = UDim2.new(1, 0, 0, 20)
Desc.Position = UDim2.new(0, 0, 0, 50)
Desc.BackgroundTransparency = 1
Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 14

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0, 80)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Nhập key ở đây..."
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16

Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 4)

local SubmitButton = Instance.new("TextButton", KeyFrame)
SubmitButton.Size = UDim2.new(0.8, 0, 0, 40)
SubmitButton.Position = UDim2.new(0.1, 0, 0, 140)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.Text = "✅ XÁC NHẬN"
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 16

Instance.new("UICorner", SubmitButton).CornerRadius = UDim.new(0, 4)

local GetKeyButton = Instance.new("TextButton", KeyFrame)
GetKeyButton.Size = UDim2.new(0.8, 0, 0, 30)
GetKeyButton.Position = UDim2.new(0.1, 0, 0, 190)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.Text = "📎 LẤY KEY (Copy Discord)"
GetKeyButton.Font = Enum.Font.Gotham
GetKeyButton.TextSize = 14

Instance.new("UICorner", GetKeyButton).CornerRadius = UDim.new(0, 4)

GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/KHBDGs37")
end)

local StatusLabel = Instance.new("TextLabel", KeyFrame)
StatusLabel.Text = "Số lần thử còn lại: 3"
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0, 230)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 14

-- === 🧠 Kiểm tra key ===
local function verifyKey(key)
    for _, validKey in pairs(validKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

-- === 📜 Load GUI chính ===
local function loadMainScript()
    ImageButton.Visible = true
    repeat wait() until game:IsLoaded()

    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "LongZero Hub Tổng Hợp Beta",
        SubTitle = "Blox Fruits - Beta",
        TabWidth = 157,
        Size = UDim2.fromOffset(525, 320),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.End
    })

    local Tabs = {
        Info = Window:AddTab({ Title = "Thông Tin" }),
        Farm = Window:AddTab({ Title = "Farm Script" }),
        Kaitun = Window:AddTab({ Title = "Kaitun" }),
        Hop = Window:AddTab({ Title = "Hop Server" }),
        Chest = Window:AddTab({ Title = "Farm Chest" }),
        Aimbot = Window:AddTab({ Title = "Aimbot" }),
    }

    Tabs.Info:AddButton({
        Title = "Copy Discord",
        Description = "Tham gia cộng đồng Sever Galaxy",
        Callback = function()
            setclipboard("https://discord.gg/KHBDGs37")
        end
    })

    Tabs.Farm:AddButton({
        Title = "Redz Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))({
                JoinTeam = "Pirates",
                Translator = true
            })
        end
    })
end

-- === 🔘 Nút xác nhận key ===
SubmitButton.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text:upper()

    if verifyKey(enteredKey) then
        keyVerified = true
        StatusLabel.Text = "✅ Key hợp lệ!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1)
        KeyFrame.Visible = false
        loadMainScript()
    else
        attemptsRemaining -= 1
        StatusLabel.Text = "❌ Key sai! Còn lại: " .. attemptsRemaining
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        if attemptsRemaining <= 0 then
            local msg = Instance.new("Message", workspace)
            msg.Text = "Bạn đã nhập sai quá số lần! Tắt game sau 5s..."
            wait(5)
            game:Shutdown()
        end
    end
end)

-- === 👆 Nút hiện UI khi đã xác minh ===
ImageButton.MouseButton1Down:Connect(function()
    if keyVerified then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
    else
        KeyFrame.Visible = true
    end
end)

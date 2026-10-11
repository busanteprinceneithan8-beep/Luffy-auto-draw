Lua

-- LUFFY AUTO-DRAW | PIRATE EDITION
-- GUI prototype for Roblox
-- Auto-drawing is NOT implemented.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("LuffyAutoDraw")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "LuffyAutoDraw"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local function create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local root = create("Frame", {
    Size = UDim2.new(0.92, 0, 0, 410),
    Position = UDim2.new(0.04, 0, 0.2, 0),
    BackgroundColor3 = Color3.fromRGB(15, 15, 22),
    BorderSizePixel = 0,
}, gui)

create("UICorner", {
    CornerRadius = UDim.new(0, 12)
}, root)

create("UIStroke", {
    Color = Color3.fromRGB(240, 35, 55),
    Thickness = 2
}, root)

create("TextLabel", {
    Size = UDim2.new(1, -45, 0, 45),
    Position = UDim2.fromOffset(12, 4),
    BackgroundTransparency = 1,
    Text = "☠ LUFFY AUTO-DRAW",
    TextColor3 = Color3.fromRGB(255, 65, 75),
    Font = Enum.Font.GothamBold,
    TextSize = 21,
    TextXAlignment = Enum.TextXAlignment.Left,
}, root)

local close = create("TextButton", {
    Size = UDim2.fromOffset(32, 32),
    Position = UDim2.new(1, -38, 0, 6),
    Text = "X",
    TextColor3 = Color3.new(1, 1, 1),
    BackgroundColor3 = Color3.fromRGB(150, 25, 40),
    Font = Enum.Font.GothamBold,
    TextSize = 16,
}, root)

close.Activated:Connect(function()
    gui:Destroy()
end)

local url = create("TextBox", {
    Size = UDim2.new(1, -24, 0, 38),
    Position = UDim2.fromOffset(12, 55),
    PlaceholderText = "Paste image URL here...",
    Text = "",
    ClearTextOnFocus = false,
    TextSize = 14,
    Font = Enum.Font.Gotham,
    TextColor3 = Color3.new(1, 1, 1),
    BackgroundColor3 = Color3.fromRGB(35, 35, 47),
}, root)

create("UICorner", {
    CornerRadius = UDim.new(0, 7)
}, url)

local preview = create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 85),
    Position = UDim2.fromOffset(12, 102),
    Text = "☁ GEAR 5 LUFFY ☁\nImage preview not connected",
    TextColor3 = Color3.fromRGB(255, 220, 120),
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    BackgroundColor3 = Color3.fromRGB(28, 28, 38),
}, root)

create("UICorner", {
    CornerRadius = UDim.new(0, 7)
}, preview)

local status = create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 28),
    Position = UDim2.fromOffset(12, 194),
    BackgroundTransparency = 1,
    Text = "Status: Ready",
    TextColor3 = Color3.fromRGB(180, 210, 255),
    TextSize = 14,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
}, root)

local speed = 5

local speedButton = create("TextButton", {
    Size = UDim2.new(1, -24, 0, 34),
    Position = UDim2.fromOffset(12, 225),
    Text = "DRAWING SPEED: 5   (-)       (+)",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    BackgroundColor3 = Color3.fromRGB(48, 48, 65),
}, root)

speedButton.Activated:Connect(function()
    speed = speed + 1
    if speed > 10 then speed = 1 end
    speedButton.Text =
        "DRAWING SPEED: " .. speed .. "   (tap to change)"
end)

local back = create("Frame", {
    Size = UDim2.new(1, -24, 0, 14),
    Position = UDim2.fromOffset(12, 270),
    BackgroundColor3 = Color3.fromRGB(55, 55, 68),
    BorderSizePixel = 0,
}, root)

create("UICorner", {
    CornerRadius = UDim.new(1, 0)
}, back)

local fill = create("Frame", {
    Size = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(245, 40, 60),
    BorderSizePixel = 0,
}, back)

create("UICorner", {
    CornerRadius = UDim.new(1, 0)
}, fill)

local start = create("TextButton", {
    Size = UDim2.new(0.56, -15, 0, 43),
    Position = UDim2.fromOffset(12, 298),
    Text = "▶ START",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 15,
    Font = Enum.Font.GothamBold,
    BackgroundColor3 = Color3.fromRGB(0, 115, 55),
}, root)

local stop = create("TextButton", {
    Size = UDim2.new(0.44, -15, 0, 43),
    Position = UDim2.new(0.56, 3, 0, 298),
    Text = "■ STOP",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 15,
    Font = Enum.Font.GothamBold,
    BackgroundColor3 = Color3.fromRGB(150, 25, 40),
}, root)

local running = false

start.Activated:Connect(function()
    if running then return end
    running = true
    status.Text = "Status: Prototype only"
    preview.Text =
        "URL saved for prototype:\n" ..
        (url.Text ~= "" and url.Text or "(no URL entered)")
    fill.Size = UDim2.new(0, 0, 1, 0)
end)

stop.Activated:Connect(function()
    running = false
    status.Text = "Status: Stopped"
end)

create("TextLabel", {
    Size = UDim2.new(1, -24, 0, 48),
    Position = UDim2.fromOffset(12, 348),
    BackgroundTransparency = 1,
    Text = "PROTOTYPE ONLY • No image loading or auto-drawing\nGame compatibility has not been verified.",
    TextColor3 = Color3.fromRGB(255, 195, 95),
    TextSize = 11,
    TextWrapped = true,
    Font = Enum.Font.Gotham,
}, root)

print("Luffy Auto-Draw GUI prototype loaded")

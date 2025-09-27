local Module = {}

--/ Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

--/ Variables
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--/ Constants
local WALK_SPEED = 16
local RUN_SPEED = 32

UserInputService.InputBegan:Connect(function(input)

    if input.KeyCode == Enum.KeyCode.LeftShift then
        humanoid.WalkSpeed = RUN_SPEED
    end
end)

UserInputService.InputEnded:Connect(function(input)

    if input.KeyCode == Enum.KeyCode.LeftShift then
        humanoid.WalkSpeed = WALK_SPEED
    end
end)


return Module

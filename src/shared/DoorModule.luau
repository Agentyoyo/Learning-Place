local TweenService = game:GetService("TweenService")

local door = {}
door.__index = door

door.TweenTime = 3

function door.new(model)
    local newDoor = setmetatable({}, door)
    newDoor.__index = newDoor

    newDoor.Model = model

    return newDoor

end

function door:createTween()

    local part = self.Model:FindFirstChild("DoorPart")
    local proximityPrompt = part.Prompt

    if not part then
        warn("No part found for tweening.")
        return
    end

    local tween = TweenService:Create(self.TweenTime, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), { CFrame = part.CFrame * CFrame.new(0, 5, 0) })
    tween:Play()
    
end

function door:tween()
    local part = self.Model:FindFirstChild("DoorPart")
    local proximityPrompt = part.Prompt

    proximityPrompt.Triggered:Connect(door:createTween())

end

return door
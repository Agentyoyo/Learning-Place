local Apple = {}
Apple.__index = Apple

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function Apple.new()
    local part = ReplicatedStorage.Common.Replicated.Part
    local self = setmetatable(Apple, self)

    part.Parent = game:GetService("Players").LocalPlayer.Backpack

    return self
end

function Apple:eat(part: Part)
    part:Destroy()
    print("Apple ate.")
end

function Apple:destroy(self: self)
    setmetatable(self, nil)
end

return Apple
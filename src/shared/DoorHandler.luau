local DoorHandler = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local DoorModule = require(ReplicatedStorage.Shared:FindFirstChild("DoorModule"))

local doors = CollectionService:GetTagged("Door")

for _, door in pairs(doors) do
    local newDoor = DoorModule.new(door)

    newDoor:createTween()
    newDoor:tween()
end

return DoorHandler
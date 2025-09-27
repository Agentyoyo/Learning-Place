local Apple = {}
Apple.__index = Apple

function Apple.new()
    local self = setmetatable({}, Apple)

    self.Name = "Apple"
    self.Message = "Mmm tasty!"

    return self
end

function Apple:Eat()

    print(self.Name .. " | " .. self.Message)

end

function Apple:Destroy()
    setmetatable(self, nil)
end

return Apple
local LoadingHandler = {}

local ReplicatedFirst = game:GetService("ReplicatedFirst")

local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

ReplicatedFirst:RemoveDefaultLoadingScreen()

local loadingInterface = ReplicatedFirst:WaitForChild("LoadingScreen")
loadingInterface.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local loadingCircle = loadingInterface.MainFrame.LoadingObject

local assets = {

	game.ReplicatedStorage.Common.Assets:WaitForChild("Models"),
	game.ReplicatedStorage.Common.Assets:WaitForChild("SFX"),
	game.ReplicatedStorage.Common.Assets:WaitForChild("VFX"),
}

local spinning = true

task.spawn(function()
	while spinning == true do
		loadingCircle.Rotation += 3
		task.wait(0.001)
	end
end)

pcall(function()
	ContentProvider:PreloadAsync(assets)
end)

spinning = false

loadingInterface:Destroy()

return LoadingHandler

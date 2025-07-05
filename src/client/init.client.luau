local function initModule(moduleScript)
	local success, result = pcall(require, moduleScript)

	if success then
		print(`[INIT] {moduleScript.Name} loaded successfully.`)
	else
		warn(`[ERROR] Failed to init {moduleScript.Name}: {result}`)
	end
end

local function loadModulesInFolder(folder)
	for _, item in folder:GetChildren() do
		if item:IsA("ModuleScript") then
			initModule(item)
		elseif item:IsA("Folder") then
			loadModulesInFolder(item)
		end
	end
end

loadModulesInFolder(script)

print("Client-Side")
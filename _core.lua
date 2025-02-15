local _Core			= {}
local packageName	= "dartmudlet"
packageFolder		= getMudletHomeDir().."/"..packageName.."/"
local modules		= {}
local sourceName	= "core"



local function setup(e, f, g)
    local directory = ""
	modules         = {}
	args            = {}

    local directories = {
        "ALIASES/",
        "SCRIPTS/",
        "TIMERS/",
        "TRIGGERS/",
        "UI/"
    }


    -- function to load modules
    -----------------------------------------------------------
    local function loadModules(directory)
        local modules = {}
        for file in lfs.dir(directory) do
            if lfs.attributes(directory..file,"mode") == "file" then
                table.insert(modules, dofile(directory..file))
            end
        end
        return modules
    end


    cecho("<yellow>DARTMUDLET: Begin setup\n")

    -- load modules from each directory
    for _, dir in ipairs(directories) do
        directory = packageFolder..dir
        local loadedModules = loadModules(directory)
        for _, module in ipairs(loadedModules) do
            table.insert(modules, module)
        end
    end

    -- set up each module
    for _, module in ipairs(modules) do
        if module.setup then
            module.setup({directory=packageFolder})
        end
    end

	isFirstLoad = false

	_Core.load()

	send("score", false)
	send("who", false)
    send("speak", false)
    send("set aim", false)
    send("look", false)
end



-- run load functions
-----------------------------------------------------------
local function load()
    systemMessage("Begin loading")
	for _,module in ipairs(modules) do
		if module.load then
			module.load()
		end
	end
end



local function unsetup(e, f, g)
	resetProfile()
	args = {}
	args["directory"] = packageFolder

    systemMessage("Begin unsetup")

	for _,module in pairs(modules) do
		if module.unsetup then
			module.unsetup({directory = packageFolder, isFirstLoad = isFirstLoad})
			module = nil
		end
	end
	modules = {}
end



local function resetup(e, f, g)
	cecho("<yellow>DARTMUDLET: resetup\n")
	unsetup(e, f, g)
	setup(e, f, g)
end



_Core = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load
}

return _Core

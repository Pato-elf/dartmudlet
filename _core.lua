local _Core			= {}
local packageName	= "dartmudlet"
packageFolder		= getMudletHomeDir().."/"..packageName.."/"
local modules		= {}
local sourceName	= "core"



local function setup(e, f, g)
	modules	= {}
	args	= {}


	cecho("<yellow>DARTMUDLET: setup\n")

	local aliases_directory = packageFolder.."ALIASES/"
	for file in lfs.dir(aliases_directory) do
		if lfs.attributes(aliases_directory..file,"mode") == "file" then
			table.insert(modules, dofile(aliases_directory..file))
		end
	end

	local scripts_directory = packageFolder.."SCRIPTS/"
	for file in lfs.dir(scripts_directory) do
		if lfs.attributes(scripts_directory..file,"mode") == "file" then
			table.insert(modules, dofile(scripts_directory..file))
		end
	end

	local timers_directory = packageFolder.."TIMERS/"
	for file in lfs.dir(timers_directory) do
		if lfs.attributes(timers_directory..file,"mode") == "file" then
			table.insert(modules, dofile(timers_directory..file))
		end
	end

	local triggers_directory = packageFolder.."TRIGGERS/"
	for file in lfs.dir(triggers_directory) do
		if lfs.attributes(triggers_directory..file,"mode") == "file" then
			table.insert(modules, dofile(triggers_directory..file))
		end
	end

	local ui_directory = packageFolder.."UI/"
	for file in lfs.dir(ui_directory) do
		if lfs.attributes(ui_directory..file,"mode") == "file" then
			table.insert(modules, dofile(ui_directory..file))
		end
	end


	for i,module in ipairs(modules) do
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
end



-- run load functions
-----------------------------------------------------------
local function load()
	cecho("<yellow>DARTMUDLET: loading\n")
	for i,module in ipairs(modules) do
		if module.load then
			module.load()
		end
	end
end



local function unsetup(e, f, g)
	resetProfile()
	args = {}
	args["directory"] = packageFolder

	cecho("<yellow>DARTMUDLET: unsetup\n")

	for k,module in pairs(modules) do
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

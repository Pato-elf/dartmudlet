local Refresh			= {}
local sourceName		= "refresh"



-- set refreshPower
-----------------------------------------------------------
local function setrefreshPower(args)
	local refreshpower	= tonumber(args["input"])
	local version		= args["version"]
	local saveflag		= args["save"]


	if not refreshpower then
		cecho("<red>ERROR: Invalid refresh power value\n")
	else
		if (refreshpower < 50) or (refreshpower > 999) then
			cecho("<red>ERROR: Invalid refresh power value\n")
		else
			if version == 1 then
				Status.refreshPower1 = refreshpower
				dba.execute('UPDATE refresh SET refreshPower1='..refreshpower)
			else
				Status.refreshPower2 = refreshpower
				dba.execute('UPDATE refresh SET refreshPower2='..refreshpower)
			end

			if saveflag then Refresh.save() end
            systemMessage("Refresh power value updated")
		end
	end

end



-- set refreshTarget
-----------------------------------------------------------
local function setrefreshTarget(args)
	local refreshtarget	= args["input"]
	local version		= args["version"]
	local saveflag		= args["save"]


	if tonumber(refreshtarget) then
		cecho("<red>ERROR: Invalid refresh target\n")
	else
		if version == 1 then
			Status.refreshTarget1 = refreshtarget
			dba.execute('UPDATE refresh SET refreshTarget1="'..refreshtarget..'"')
		else
			Status.refreshTarget2 = refreshtarget
			dba.execute('UPDATE refresh SET refreshTarget2="'..refreshtarget..'"')
		end

		if saveflag then Refresh.save() end
        systemMessage("Refresh target updated")
	end

end



-- build or update the table during setup
-----------------------------------------------------------
local function checkRefreshTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS refresh (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		refreshPower1 INTEGER DEFAULT 50,
		refreshPower2 INTEGER DEFAULT 50,
		refreshTarget1 VARCHAR(16) DEFAULT "targetname",
		refreshTarget2 VARCHAR(16) DEFAULT "targetname",
		refreshCmdAddon VARCHAR(64) DEFAULT "",
		nudgeisActive BOOLEAN DEFAULT 0,
		nudgePower INTEGER DEFAULT 50,
		nudgeTarget1 VARCHAR(16) DEFAULT "targetname",
		nudgeTarget2 VARCHAR(16) DEFAULT "",
		nudgeTarget3 VARCHAR(16) DEFAULT "",
		nudgeTarget4 VARCHAR(16) DEFAULT "",
		nudgeTarget5 VARCHAR(16) DEFAULT "",
		nudgeTarget6 VARCHAR(16) DEFAULT "",
		nudgeTarget7 VARCHAR(16) DEFAULT "",
		nudgeTarget8 VARCHAR(16) DEFAULT "",
		nudgeTarget9 VARCHAR(16) DEFAULT "",
		nudgeTarget10 VARCHAR(16) DEFAULT ""
	);]])

	local results = dba.query('SELECT id FROM refresh')
	if results.count() == 0 then
        systemMessage("Create REFRESH table")
		dba.execute('INSERT INTO refresh DEFAULT VALUES')
	end

end



local function load()
	local result = {}


    systemMessage("Load REFRESH table")
	result = dba.query('SELECT * FROM refresh')[1]
	Status.refreshPower1 = result.refreshPower1
	Status.refreshPower2 = result.refreshPower2
	Status.refreshTarget1 = result.refreshTarget1
	Status.refreshTarget2 = result.refreshTarget2
end



local function save()

end



local function setup(args)
	checkRefreshTable()
	Events.addListener("setrefreshTargetEvent", sourceName, setrefreshTarget)
	Events.addListener("setrefreshPowerEvent", sourceName, setrefreshPower)
end



local function unsetup(args)
	Events.removeListener("setrefreshTargetEvent", sourceName)
	Events.removeListener("setrefreshPowerEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Refresh = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Refresh

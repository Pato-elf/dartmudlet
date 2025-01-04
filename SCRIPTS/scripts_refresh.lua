local Refresh       = {}
local nudgeTriggers = {}
local sourceName    = "refresh"



-- remove regex triggers
-----------------------------------------------------------
local function killTriggers(args)

        for i,v in pairs(nudgeTriggers) do
            killTrigger(v)
        end
end



-- build regex triggers
-----------------------------------------------------------
local function loadTriggers(args)
    local nudgeset = {}


    killTriggers()
    Status.nudgePause = false

    if Status.nudgeAll then
        nudgeset = {"(\\w+) nudges you"}
    else
        if Status.nudgeTarget1 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget1).." nudges you") end
        if Status.nudgeTarget2 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget2).." nudges you") end
        if Status.nudgeTarget3 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget3).." nudges you") end
        if Status.nudgeTarget4 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget4).." nudges you") end
        if Status.nudgeTarget5 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget5).." nudges you") end
        if Status.nudgeTarget6 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget6).." nudges you") end
        if Status.nudgeTarget7 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget7).." nudges you") end
        if Status.nudgeTarget8 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget8).." nudges you") end
        if Status.nudgeTarget9 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget9).." nudges you") end
        if Status.nudgeTarget10 ~= "" then table.insert(nudgeset, utils.capitalize(Status.nudgeTarget10).." nudges you") end
    end

    if (next(nudgeset) ~= nil) then
        for i,v in ipairs(nudgeset) do
            nudgeTriggers[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    if not Status.nudgePause then
                        Status.nudgePause   = true
                        local name          = matches[1]:match("^(%S+)")
                        name                = string.lower(name)
                        send("cast ro @"..Status.nudgePower.." "..name)
                        tempTimer(Status.nudgeDelay, function() Status.nudgePause = false end)
                    end
                ]])
        end
    end

end



-- set refresh power values for autofresh and nudge power
-----------------------------------------------------------
local function setRefreshPower(args)
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
            elseif version == 2 then
				Status.refreshPower2 = refreshpower
				dba.execute('UPDATE refresh SET refreshPower2='..refreshpower)
            else
				Status.nudgePower = refreshpower
				dba.execute('UPDATE refresh SET nudgePower='..refreshpower)
			end

			if saveflag then systemMessage("Refresh power value updated") end
		end
	end
end



-- set targets for auto refresh
-----------------------------------------------------------
local function setRefreshTarget(args)
	local refreshtarget	= args["input"]
	local version		= args["version"]
	local saveflag		= args["save"]

    refreshtarget = trim(refreshtarget)

	if (refreshtarget ~= "") and (tonumber(refreshtarget) or (#refreshtarget < 3) or (refreshtarget:match("^[%p%s]+$"))) then
		cecho("<red>ERROR: Invalid refresh target\n")
	else
		if version == 1 then
			Status.refreshTarget1 = refreshtarget
			dba.execute('UPDATE refresh SET refreshTarget1="'..refreshtarget..'"')
		else
			Status.refreshTarget2 = refreshtarget
			dba.execute('UPDATE refresh SET refreshTarget2="'..refreshtarget..'"')
		end

		if saveflag then systemMessage("Refresh target updated") end
	end
end



-- set targets for nudge refresh
-----------------------------------------------------------
local function setRefreshNudge(args)
	local refreshtarget	= args["input"]
	local version		= args["version"]
	local saveflag		= args["save"]

    refreshtarget = trim(refreshtarget)

	if (refreshtarget ~= "") and (tonumber(refreshtarget) or (#refreshtarget < 3) or (refreshtarget:match("^[%p%s]+$"))) then
		cecho("<red>ERROR: Invalid refresh target\n")
	else
		if version == 1 then
			Status.nudgeTarget1 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget1="'..refreshtarget..'"')
        elseif version == 2 then
			Status.nudgeTarget2 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget2="'..refreshtarget..'"')
        elseif version == 3 then
			Status.nudgeTarget3 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget3="'..refreshtarget..'"')
        elseif version == 4 then
			Status.nudgeTarget4 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget4="'..refreshtarget..'"')
        elseif version == 5 then
			Status.nudgeTarget5 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget5="'..refreshtarget..'"')
        elseif version == 6 then
			Status.nudgeTarget6 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget6="'..refreshtarget..'"')
        elseif version == 7 then
			Status.nudgeTarget7 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget7="'..refreshtarget..'"')
        elseif version == 8 then
			Status.nudgeTarget8 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget8="'..refreshtarget..'"')
        elseif version == 9 then
			Status.nudgeTarget9 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget9="'..refreshtarget..'"')
        else
			Status.nudgeTarget10 = refreshtarget
			dba.execute('UPDATE refresh SET nudgeTarget10="'..refreshtarget..'"')
		end

		if saveflag then
            if Status.nudgeisActive then loadTriggers() end
            systemMessage("Refresh target updated")
        end
	end
end



-- toggle nudge system on|off
-----------------------------------------------------------
local function setRefreshNudgeActive(args)

    if Status.nudgeisActive then
        Status.nudgeisActive = false
        dba.execute('UPDATE refresh SET nudgeisActive = false')
        GUI.textboxRefresh6:echo("REFRESH ON NUDGE","yellow","l")
        GUI.buttonRefresh3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonRefresh3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Refresh on nudge Off")
        killTriggers()
    else
        Status.nudgeisActive = true
        dba.execute('UPDATE refresh SET nudgeisActive = true')
        GUI.textboxRefresh6:echo("REFRESH ON NUDGE","palegreen","l")
        GUI.buttonRefresh3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonRefresh3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Refresh on nudge On")
        loadTriggers()
    end
end



-- toggle nudge all on|off
-----------------------------------------------------------
local function setRefreshNudgeAll(args)

    if Status.nudgeAll then
        Status.nudgeAll = false
        dba.execute('UPDATE refresh SET nudgeAll = false')
        GUI.buttonRefresh4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonRefresh4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Refresh all Off")
        if Status.nudgeisActive then loadTriggers() end
    else
        Status.nudgeAll = true
        dba.execute('UPDATE refresh SET nudgeAll = true')
        GUI.buttonRefresh4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonRefresh4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Refresh all On")
        if Status.nudgeisActive then loadTriggers() end
    end
end



-- save all refresh settings
-- TODO: make more efficient?
-----------------------------------------------------------
local function saveRefreshSettings(args)

    setRefreshTarget({save = false, version = 1, input = GUI.commandlineRefresh1:getText()})
    setRefreshTarget({save = false, version = 2, input = GUI.commandlineRefresh3:getText()})

    setRefreshPower({save = false, version = 1, input = GUI.commandlineRefresh2:getText()})
    setRefreshPower({save = false, version = 2, input = GUI.commandlineRefresh4:getText()})
    setRefreshPower({save = false, version = 3, input = GUI.commandlineRefresh15:getText()})

    setRefreshNudge({save = false, version = 1, input = GUI.commandlineRefresh5:getText()})
    setRefreshNudge({save = false, version = 2, input = GUI.commandlineRefresh6:getText()})
    setRefreshNudge({save = false, version = 3, input = GUI.commandlineRefresh7:getText()})
    setRefreshNudge({save = false, version = 4, input = GUI.commandlineRefresh8:getText()})
    setRefreshNudge({save = false, version = 5, input = GUI.commandlineRefresh9:getText()})
    setRefreshNudge({save = false, version = 6, input = GUI.commandlineRefresh10:getText()})
    setRefreshNudge({save = false, version = 7, input = GUI.commandlineRefresh11:getText()})
    setRefreshNudge({save = false, version = 8, input = GUI.commandlineRefresh12:getText()})
    setRefreshNudge({save = false, version = 9, input = GUI.commandlineRefresh13:getText()})
    setRefreshNudge({save = false, version = 10, input = GUI.commandlineRefresh14:getText()})

    systemMessage("Refresh settings updated")
    loadTriggers()
end



-- show all the data in the refresh fields
-----------------------------------------------------------
local function showRefreshData()
	GUI.commandlineRefresh1:print(Status.refreshTarget1)
	GUI.commandlineRefresh2:print(Status.refreshPower1)
	GUI.commandlineRefresh3:print(Status.refreshTarget2)
	GUI.commandlineRefresh4:print(Status.refreshPower2)

    GUI.commandlineRefresh5:print(Status.nudgeTarget1)
    GUI.commandlineRefresh6:print(Status.nudgeTarget2)
    GUI.commandlineRefresh7:print(Status.nudgeTarget3)
    GUI.commandlineRefresh8:print(Status.nudgeTarget4)
    GUI.commandlineRefresh9:print(Status.nudgeTarget5)
    GUI.commandlineRefresh10:print(Status.nudgeTarget6)
    GUI.commandlineRefresh11:print(Status.nudgeTarget7)
    GUI.commandlineRefresh12:print(Status.nudgeTarget8)
    GUI.commandlineRefresh13:print(Status.nudgeTarget9)
    GUI.commandlineRefresh14:print(Status.nudgeTarget10)

    GUI.commandlineRefresh15:print(Status.nudgePower)

    if Status.nudgeisActive then
        GUI.textboxRefresh6:echo("REFRESH ON NUDGE","palegreen","l")
        GUI.buttonRefresh3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonRefresh3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        loadTriggers()
    end

    if Status.nudgeAll then
        GUI.buttonRefresh4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonRefresh4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
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
        nudgeAll BOOLEAN DEFAULT 0,
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


    -- add any missing fields
	local temp = dba.query('SELECT * FROM refresh')[1]
	if not temp.nudgeAll then
        systemMessage("Update REFRESH table")
		dba.execute('ALTER TABLE refresh ADD COLUMN nudgeAll BOOLEAN DEFAULT false')
        dba.execute('UPDATE refresh SET nudgeAll = false')
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
    Status.nudgeisActive = (result.nudgeisActive == 1)
    Status.nudgeAll = (result.nudgeAll == 1)
    Status.nudgePower = result.nudgePower
    Status.nudgeTarget1 = result.nudgeTarget1
    Status.nudgeTarget2 = result.nudgeTarget2
    Status.nudgeTarget3 = result.nudgeTarget3
    Status.nudgeTarget4 = result.nudgeTarget4
    Status.nudgeTarget5 = result.nudgeTarget5
    Status.nudgeTarget6 = result.nudgeTarget6
    Status.nudgeTarget7 = result.nudgeTarget7
    Status.nudgeTarget8 = result.nudgeTarget8
    Status.nudgeTarget9 = result.nudgeTarget9
    Status.nudgeTarget10 = result.nudgeTarget10
end



local function save()

end



local function setup(args)
	checkRefreshTable()
    Events.addListener("saveRefreshSettingsEvent", sourceName, saveRefreshSettings)
	Events.addListener("setRefreshTargetEvent", sourceName, setRefreshTarget)
    Events.addListener("setRefreshNudgeEvent", sourceName, setRefreshNudge)
    Events.addListener("setRefreshNudgeActiveEvent", sourceName, setRefreshNudgeActive)
    Events.addListener("setRefreshNudgeAllEvent", sourceName, setRefreshNudgeAll)
	Events.addListener("setRefreshPowerEvent", sourceName, setRefreshPower)
    Events.addListener("showRefreshDataEvent", sourceName, showRefreshData)
end



local function unsetup(args)
    Events.removeListener("saveRefreshSettingsEvent", sourceName)
	Events.removeListener("setRefreshTargetEvent", sourceName)
    Events.removeListener("setRefreshNudgeEvent", sourceName)
    Events.removeListener("setRefreshNudgeActiveEvent", sourceName)
    Events.removeListener("setRefreshNudgeAllEvent", sourceName)
	Events.removeListener("setRefreshPowerEvent", sourceName)
    Events.removeListener("showRefreshDataEvent", sourceName)
    killTriggers()
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

local Casting		= {}
local triggers      = {}
local sourceName	= "casting"





-- perform a practice cast
-----------------------------------------------------------
local function practiceCast(args)
	if (Status.statusAutocast) and (not Status.statusIsAutocasting) then
		send("cast ! "..Status.autocastCurrentSpell.." @".. Status.autocastCurrentPower.. " "..Status.autocastCurrentArgs)--,false)
		Status.statusIsAutocasting	= true
	end
end



-- turning the autocast on
-----------------------------------------------------------
local function setAutocastOn(args)

	if Status.autocastCurrentPower < 50 then Status.autocastCurrentPower = 50 end
	Events.raiseEvent("messageEvent", {message="<yellow>Practice cast "..Status.autocastCurrentSpell.." @ "..Status.autocastCurrentPower.." "..Status.autocastCurrentArgs.."\n"})
	send("conc", false)
end



-- set the spell for autocast
-----------------------------------------------------------
local function setAutocastSpell(args)
	local spellName	= args["input"]
	local saveflag	= args["save"]

	Status.autocastCurrentSpell = spellName
	dba.execute('UPDATE casting SET castCurrentSpell="'..Status.autocastCurrentSpell..'"')
	if saveflag then systemMessage("Autocast Spell Updated") end
end



-- set the spell arguments for autocast
-----------------------------------------------------------
local function setAutocastArgs(args)
	local spellArgs = args["input"]
	local saveflag	= args["save"]

	Status.autocastCurrentArgs = spellArgs
	dba.execute('UPDATE casting SET castCurrentArgs="'..Status.autocastCurrentArgs..'"')
	if saveflag then systemMessage("Autocast Arguments Updated") end
end



-- set the spell notes for autocast
-----------------------------------------------------------
local function setAutocastNote(args)
	local spellNote = args["input"]
	local saveflag	= args["save"]

	Status.autocastCurrentNote = spellNote
	dba.execute('UPDATE casting SET castCurrentNote="'..Status.autocastCurrentNote..'"')
	if saveflag then systemMessage("Autocast Note Updated") end
end



-- set optional addon command
-----------------------------------------------------------
local function setAutocastAddonCmd(args)
	local addonCmd = args["input"]
	local saveflag	= args["save"]

	Status.autocastAddonCmd = addonCmd
	dba.execute('UPDATE casting SET castAddonCmd="'..Status.autocastAddonCmd..'"')
	if saveflag then systemMessage("Autocast Addon Command Updated") end
end



-- turning the autocast off
-----------------------------------------------------------
local function setAutocastOff(args)

end



-- update the autocast power in db and display 
-----------------------------------------------------------
local function setAutocastPower(args)
	local spellpower	= tonumber(args["input"])
	local saveflag		= args["save"]


	if not spellpower then
		cecho("<red>ERROR: Invalid autocast power value\n")
		return 0
	elseif (spellpower < 50) then
		cecho("<red>ERROR: Autocast power must be equal to or greater than 50\n")
		return 0
	else
		Status.autocastCurrentPower = spellpower
		GUI.commandlineCasting2:print(Status.autocastCurrentPower)
		dba.execute('UPDATE casting SET castCurrentPower='..Status.autocastCurrentPower)
		if saveflag then systemMessage("Autocast Power Updated") end
		return 1
	end
end



-- update the autocast channel amount
-----------------------------------------------------------
local function setAutocastChannelAmt(args)
	local channelamt	= tonumber(args["input"])
	local saveflag		= args["save"]


	if not channelamt then channelamt = 0 end

	if (channelamt < 0) then
		cecho("<red>ERROR: Autocast channel amount cannot be negative\n")
		return 0
	elseif (channelamt > 100) then
		cecho("<red>ERROR: Autocast channel amount cannot be greater than 100\n")
		return 0
	else
		Status.autocastChannelAmt = channelamt
		dba.execute('UPDATE casting SET castChannelAmt='..Status.autocastChannelAmt)
		if saveflag then systemMessage("Autocast Channel Amount Updated") end
		return 1
	end
end



-- update the autocast down adjustment
-----------------------------------------------------------
local function setAutocastAdjustDown(args)
	local adjust		= tonumber(args["input"])
	local saveflag		= args["save"]


	if not adjust then adjust = 0 end

	if (adjust < 0) then
		cecho("<red>ERROR: Autocast down adjustment must be equal to or greater than zero\n")
		return 0
	else
		Status.autocastAdjustDown = adjust
		dba.execute('UPDATE casting SET castAdjustDown='..Status.autocastAdjustDown)
		if saveflag then systemMessage("Autocast Adjust Value Updated") end
		return 1
	end
end



-- update the autocast up adjustment
-----------------------------------------------------------
local function setAutocastAdjustUp(args)
	local adjust		= tonumber(args["input"])
	local saveflag		= args["save"]


	if not adjust then adjust = 0 end

	if (adjust < 0) then
		cecho("<red>ERROR: Autocast up adjustment must be equal to or greater than zero\n")
		return 0
	else
		Status.autocastAdjustUp = adjust
		dba.execute('UPDATE casting SET castAdjustUp='..Status.autocastAdjustUp)
		if saveflag then systemMessage("Autocast Adjust Value Updated") end
		return 1
	end
end



-- attempt to save each data field
-----------------------------------------------------------
local function saveAutocastSettings(args)

    setAutocastSpell({save = false, input = GUI.commandlineCasting1:getText()})
	if(setAutocastPower({save = false, input = GUI.commandlineCasting2:getText()}) == 0) then return 0 end
	if(setAutocastAdjustDown({save = false, input = GUI.commandlineCasting3:getText()}) == 0) then return 0 end
	if(setAutocastAdjustUp({save = false, input = GUI.commandlineCasting4:getText()}) == 0) then return 0 end
	setAutocastArgs({save = false, input = GUI.commandlineCasting5:getText()})
	setAutocastNote({save = false, input = GUI.commandlineCasting6:getText()})
	if(setAutocastChannelAmt({save = false, input = GUI.commandlineCasting7:getText()}) == 0) then return 0 end
	setAutocastAddonCmd({save = false, input = GUI.commandlineCasting8:getText()})

	systemMessage("Autocast Values Updated")
end



-- show all the data in the autocast fields
-----------------------------------------------------------
local function showAutocastData()
	GUI.commandlineCasting1:print(Status.autocastCurrentSpell)
	GUI.commandlineCasting2:print(Status.autocastCurrentPower)
	GUI.commandlineCasting3:print(Status.autocastAdjustDown)
	GUI.commandlineCasting4:print(Status.autocastAdjustUp)
	GUI.commandlineCasting5:print(Status.autocastCurrentArgs)
	GUI.commandlineCasting6:print(Status.autocastCurrentNote)
	GUI.commandlineCasting7:print(Status.autocastChannelAmt)
	GUI.commandlineCasting8:print(Status.autocastAddonCmd)
end



-- remove autocast triggers
-----------------------------------------------------------
local function killTriggers(args)

    for k,v in pairs(triggers) do
		killTrigger(v)
	end
end



-- build autocast triggers
-----------------------------------------------------------
local function loadTriggers(args)


    	triggers.autocast1 = tempRegexTrigger("^(?:> )*You finish practicing[\\s\\S]*",
		[[
			Status.statusIsAutocasting	= false

			if (Status.autocastAdjustUp > 0) then
				Status.autocastCurrentPower = Status.autocastCurrentPower + Status.autocastAdjustUp
				Events.raiseEvent("setAutocastPowerEvent",{input = Status.autocastCurrentPower})
			end

			if (Status.autocastChannelAmt > 0) then
				expandAlias("/chan "..Status.autocastChannelAmt,false)
			end

			if (Status.autocastAddonCmd:match("%S")) then
				expandAlias(Status.autocastAddonCmd,false)
			end
		]])

		triggers.autocast2 = tempRegexTrigger("^(?:> )*You think you would have succeeded[\\s\\S]*",
		[[
			if (Status.autocastAdjustUp > 0) or (Status.autocastAdjustDown > 0) then
            	Status.autocastCurrentPower = Status.autocastCurrentPower - Status.autocastAdjustUp
				Status.autocastCurrentPower = Status.autocastCurrentPower - Status.autocastAdjustDown
				if (Status.autocastCurrentPower < 50) then Status.autocastCurrentPower = 50 end
				Events.raiseEvent("setAutocastPowerEvent",{input = Status.autocastCurrentPower})
			end
		]])
end



-- user has pressed the autocast on/off button
-----------------------------------------------------------
local function setAutocastActive()


	if not Status.statusAutocast then

		if(saveAutocastSettings() == 0) then
			GUI.buttonCasting5:setStyleSheet(StyleButtonDarkGrey:getCSS())
			cecho("<red>ERROR: Unable to begin Autocast\n")
		else
			Status.statusAutocast = true
			GUI.buttonCasting5:setStyleSheet(StyleButtonPaleGreen:getCSS())

			GUI.tabwindow1:setTabHighlight("CASTING","CASTING",true)
			GUI.tabwindow2:setTabHighlight("CASTING","CASTING",true)
			GUI.tabwindow3:setTabHighlight("CASTING","CASTING",true)
			GUI.tabwindow4:setTabHighlight("CASTING","CASTING",true)

			echo("buttonCasting5", "<center>AUTOCAST ON</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Autocast: On\n"})
			systemMessage("Autocast On")

			loadTriggers()
			setAutocastOn()
		end
	else
		Status.statusAutocast		= false
		Status.statusIsAutocasting	= false
		GUI.buttonCasting5:setStyleSheet(StyleButtonDarkGrey:getCSS())

		GUI.tabwindow1:setTabHighlight("CASTING","CASTING",false)
		GUI.tabwindow2:setTabHighlight("CASTING","CASTING",false)
		GUI.tabwindow3:setTabHighlight("CASTING","CASTING",false)
		GUI.tabwindow4:setTabHighlight("CASTING","CASTING",false)

		echo("buttonCasting5", "<center>AUTOCAST OFF</center>")
		Events.raiseEvent("messageEvent", {message="<yellow>Autocast: Off\n"})
		systemMessage("Autocast Off")

		killTriggers()
		setAutocastOff()
	end
end



-- build or update the casting settings table during setup
-----------------------------------------------------------
local function checkCastingTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS casting (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		castCurrentArgs VARCHAR(64) DEFAULT "",
		castCurrentPower INTEGER DEFAULT 500,
		castCurrentSpell VARCHAR(32) DEFAULT "lirrin's_glow",
		castCurrentNote VARCHAR(32) DEFAULT "spell note",
		castAddonCmd VARCHAR(32) DEFAULT "",
		castAdjustDown INTEGER DEFAULT 10,
		castAdjustUp INTEGER DEFAULT 10,
		castChannelAmt INTEGER DEFAULT 0
	);]])

	local results = dba.query('SELECT id FROM casting')
	if results.count() == 0 then
        systemMessage("Create CASTING table")
		dba.execute('INSERT INTO casting DEFAULT VALUES')
	end

	-- add any missing fields
	local temp = dba.query('SELECT * FROM casting')[1]
	if not temp.castCurrentNote then
        systemMessage("Update CASTING table")
		dba.execute('ALTER TABLE casting ADD COLUMN castCurrentNote VARCHAR(32) DEFAULT "spell note"')
        dba.execute('UPDATE casting SET castCurrentNote = "spell note"')
	end

	if not temp.castAdjustDown then
        systemMessage("Update CASTING table")
		dba.execute('ALTER TABLE casting ADD COLUMN castAdjustDown INTEGER DEFAULT 10')
        dba.execute('UPDATE casting SET castAdjustDown = 10')
	end

	if not temp.castAdjustUp then
        systemMessage("Update CASTING table")
		dba.execute('ALTER TABLE casting ADD COLUMN castAdjustUp INTEGER DEFAULT 10')
        dba.execute('UPDATE casting SET castAdjustUp = 10')
	end

	if not temp.castChannelAmt then
        systemMessage("Update CASTING table")
		dba.execute('ALTER TABLE casting ADD COLUMN castChannelAmt INTEGER DEFAULT 0')
        dba.execute('UPDATE casting SET castChannelAmt = 0')
	end

	if not temp.castAddonCmd then
        systemMessage("Update CASTING table")
		dba.execute('ALTER TABLE casting ADD COLUMN castAddonCmd VARCHAR(32) DEFAULT ""')
        dba.execute('UPDATE casting SET castAddonCmd = ""')
	end
end



local function load()
	local result = {}


    systemMessage("Load CASTING table")
	result = dba.query('SELECT * FROM casting')[1]
	Status.autocastCurrentArgs	= result.castCurrentArgs
	Status.autocastCurrentPower	= result.castCurrentPower
	Status.autocastCurrentSpell	= result.castCurrentSpell
	Status.autocastCurrentNote	= result.castCurrentNote
	Status.autocastAdjustDown	= result.castAdjustDown
	Status.autocastAdjustUp		= result.castAdjustUp
	Status.autocastChannelAmt	= result.castChannelAmt
	Status.autocastAddonCmd		= result.castAddonCmd
end



local function save()

end



local function setup(args)
	checkCastingTable()
	Events.addListener("setAutocastActiveEvent", sourceName, setAutocastActive)
	Events.addListener("setAutocastPowerEvent", sourceName, setAutocastPower)
	Events.addListener("setAutocastSpellEvent", sourceName, setAutocastSpell)
	Events.addListener("setAutocastArgsEvent", sourceName, setAutocastArgs)
	Events.addListener("setAutocastNoteEvent", sourceName, setAutocastNote)
	Events.addListener("setAutocastAdjustDownEvent", sourceName, setAutocastAdjustDown)
	Events.addListener("setAutocastAdjustUpEvent", sourceName, setAutocastAdjustUp)
	Events.addListener("setAutocastChannelAmtEvent", sourceName, setAutocastChannelAmt)
	Events.addListener("setAutocastAddonCmdEvent", sourceName, setAutocastAddonCmd)
	Events.addListener("showAutocastDataEvent", sourceName, showAutocastData)
	Events.addListener("saveAutocastSettingsEvent", sourceName, saveAutocastSettings)
	Events.addListener("processAutocastEvent", sourceName, practiceCast)
end



local function unsetup(args)
	Events.removeListener("setAutocastEvent",sourceName)
	Events.removeListener("setAutocastPowerEvent",sourceName)
	Events.removeListener("setAutocastSpellEvent",sourceName)
	Events.removeListener("setAutocastArgsEvent",sourceName)
	Events.removeListener("setAutocastNoteEvent",sourceName)
	Events.removeListener("setAutocastAdjustDownEvent",sourceName)
	Events.removeListener("setAutocastAdjustUpEvent",sourceName)
	Events.removeListener("setAutocastChannelAmtEvent",sourceName)
	Events.removeListener("setAutocastAddonCmdEvent",sourceName)
	Events.removeListener("showAutocastDataEvent",sourceName)
	Events.removeListener("saveAutocastSettingsEvent",sourceName)
	Events.removeListener("processAutocastEvent",sourceName)
	killTriggers()
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Casting = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Casting

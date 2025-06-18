local Casting		= {}
local triggers      = {}
local sourceName	= "casting"






local function practiceCast(args)
	if (Status.statusAutocast) and (not Status.statusIsAutocasting) then
		send("cast ! "..Status.autocastCurrentSpell.." @".. Status.autocastCurrentPower.. " "..Status.autocastCurrentArgs)--,false)
		Status.statusIsAutocasting	= true
		--Events.addListener("BEBTconcEvent", sourceName, practiceCast)
	end
end



-- turning the autocast on
-----------------------------------------------------------
local function setAutocastOn(args)
	--local spellName = args["spellName"]
	--local power = args["power"]
	--local spellArguments = args["spellArguments"]
	--isActive = true

	--Status.castCurrentSpell = "mi"
	--Status.castCurrentPower = 460
	--Status.castCurrentArgs = "talisman"

	if Status.autocastCurrentPower < 50 then Status.autocastCurrentPower = 50 end

	local query = 'UPDATE casting '
	query = query..'SET castCurrentSpell="'..Status.autocastCurrentSpell..'", '
	query = query..'castCurrentPower='..Status.autocastCurrentPower..', '
	query = query..'castCurrentArgs="'..Status.autocastCurrentArgs..'"'
	dba.execute(query)

	Events.raiseEvent("messageEvent", {message="<yellow>Practice cast "..Status.autocastCurrentSpell.." @ "..Status.autocastCurrentPower.." "..Status.autocastCurrentArgs.."\n"})
	--Events.addListener("BEBTconcEvent", sourceName, practiceCast)

	send("conc", false)
end



-- change the power level
--local function changePower(args)
--	local spellPower = args["power"]

--	if (spellPower < 50) or not (tonumber(spellPower)) then
--		cecho("<red>ERROR: Invalid /cast power value\n")
--	else
--		Status.castCurrentPower = spellPower
--		dba.execute('UPDATE casting SET castCurrentPower='..Status.castCurrentPower)
--		cecho("<yellow>Autocast: /cast power value updated\n")
--		Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..Status.castCurrentSpell.." @ "..Status.castCurrentPower.." "..Status.castCurrentArgs.."\n"})
--	end

--end



-- set the spell for autocast
-----------------------------------------------------------
local function setAutocastSpell(args)
	local spellName = args["input"]

	Status.autocastCurrentSpell = spellName
	dba.execute('UPDATE casting SET castCurrentSpell="'..Status.autocastCurrentSpell..'"')
end



-- set the spell arguments for autocast
-----------------------------------------------------------
local function setAutocastArgs(args)
	local spellArgs = args["input"]

	Status.autocastCurrentArgs = spellArgs
	dba.execute('UPDATE casting SET castCurrentArgs="'..Status.autocastCurrentArgs..'"')
end



-- turning the autocast off
-----------------------------------------------------------
local function setAutocastOff(args)
	--isActive = false
	--Events.raiseEvent("messageEvent", {message="<yellow>Stopped casting\n"})
	--Events.removeListener("BEBTconcEvent", sourceName)
end



--local function finishPracticing(args)
--	if isActive then
--		Events.addListener("BEBTconcEvent", sourceName, practiceCast)
--	end
--end



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
end



-- update the autocast power in db and display 
-----------------------------------------------------------
local function setAutocastPower(args)
	--local tabs = args["number"]
	local spellpower = tonumber(args["input"])

	if not spellpower then
		cecho("<red>ERROR: Invalid autocast power value\n")
	elseif (spellpower < 50) then
		cecho("<red>ERROR: Autocast power must be equal to or greater than 50\n")
	else
	--if tabs == 3 then
	--	cecho("<orange>\t\t\tPOWER("..Status.castCurrentPower..") ")
	--else
	--	cecho("<orange>\t\t\t\t\tPOWER("..Status.castCurrentPower..") ")
	--end
		Status.autocastCurrentPower = spellpower
		dba.execute('UPDATE casting SET castCurrentPower='..Status.autocastCurrentPower)
		showAutocastData()
		--Events.raiseEvent("showAutocastDataEvent")
	end
end



-- update the autocast channel amount
-----------------------------------------------------------
local function setAutocastChannelAmt(args)
	local channelamt = tonumber(args["input"])

	if not channelamt then
		cecho("<red>ERROR: Invalid autocast channel amount\n")
	elseif (channelamt < 0) then
		cecho("<red>ERROR: Autocast channel amount cannot be negative\n")
	elseif (channelamt > 100) then
		cecho("<red>ERROR: Autocast channel amount cannot be greater than 100\n")
	else
		Status.autocastChannelAmt = channelamt
		--dba.execute('UPDATE casting SET castCurrentPower='..Status.autocastCurrentPower)
		showAutocastData()
		--Events.raiseEvent("showAutocastDataEvent")
	end
end



-- update the autocast down adjustment
-----------------------------------------------------------
local function setAutocastAdjustDown(args)
	local adjust = tonumber(args["input"])

	if not adjust then
		cecho("<red>ERROR: Invalid autocast down adjustment\n")
	elseif (adjust < 0) then
		cecho("<red>ERROR: Autocast down adjustment must be equal to or greater than zero\n")
	else
		Status.autocastAdjustDown = adjust
		--dba.execute('UPDATE casting SET castCurrentPower='..Status.castCurrentPower)
		showAutocastData()
	end
end



-- update the autocast up adjustment
-----------------------------------------------------------
local function setAutocastAdjustUp(args)
	local adjust = tonumber(args["input"])

	if not adjust then
		cecho("<red>ERROR: Invalid autocast down adjustment\n")
	elseif (adjust < 0) then
		cecho("<red>ERROR: Autocast down adjustment must be equal to or greater than zero\n")
	else
		Status.autocastAdjustUp = adjust
		--dba.execute('UPDATE casting SET castCurrentPower='..Status.castCurrentPower)
		showAutocastData()
	end
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
		]])

		triggers.autocast2 = tempRegexTrigger("^(?:> )*You think you would have succeeded[\\s\\S]*",
		[[
			if (Status.autocastAdjustUp > 0) or (Status.autocastAdjustDown > 0) then
            	Status.autocastCurrentPower = Status.autocastCurrentPower - Status.autocastAdjustUp
				Status.autocastCurrentPower = Status.autocastCurrentPower - Status.autocastAdjustDown
				Events.raiseEvent("setAutocastPowerEvent",{input = Status.autocastCurrentPower})
			end
		]])
end



-- user has pressed the autocast on/off button
-----------------------------------------------------------
local function setAutocastActive()


	if not Status.statusAutocast then
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
		castCurrentPower INTEGER DEFAULT 100,
		castCurrentSpell VARCHAR(16) DEFAULT "lg"
	);]])

	local results = dba.query('SELECT id FROM casting')
	if results.count() == 0 then
        systemMessage("Create CASTING table")
		dba.execute('INSERT INTO casting DEFAULT VALUES')
	end

end



local function load()
	local result = {}


    systemMessage("Load CASTING table")
	result = dba.query('SELECT * FROM casting')[1]
	Status.autocastCurrentArgs = result.castCurrentArgs
	Status.autocastCurrentPower = result.castCurrentPower
	Status.autocastCurrentSpell = result.castCurrentSpell
end



local function save()

end



local function setup(args)
	checkCastingTable()
	Events.addListener("setAutocastActiveEvent", sourceName, setAutocastActive)
	Events.addListener("setAutocastPowerEvent", sourceName, setAutocastPower)
	Events.addListener("setAutocastSpellEvent", sourceName, setAutocastSpell)
	Events.addListener("setAutocastArgsEvent", sourceName, setAutocastArgs)
	Events.addListener("setAutocastAdjustDownEvent", sourceName, setAutocastAdjustDown)
	Events.addListener("setAutocastAdjustUpEvent", sourceName, setAutocastAdjustUp)
	Events.addListener("setAutocastChannelAmtEvent", sourceName, setAutocastChannelAmt)
	Events.addListener("showAutocastDataEvent", sourceName, showAutocastData)
	Events.addListener("processAutocastEvent", sourceName, practiceCast)
	--Events.addListener("castPowerAdjustEvent",sourceName, changePower)
end



local function unsetup(args)
	Events.removeListener("setAutocastEvent",sourceName)
	Events.removeListener("setAutocastPowerEvent",sourceName)
	Events.removeListener("setAutocastSpellEvent",sourceName)
	Events.removeListener("setAutocastArgsEvent",sourceName)
	Events.removeListener("setAutocastAdjustDownEvent",sourceName)
	Events.removeListener("setAutocastAdjustUpEvent",sourceName)
	Events.removeListener("setAutocastChannelAmtEvent",sourceName)
	Events.removeListener("showAutocastDataEvent",sourceName)
	Events.removeListener("processAutocastEvent",sourceName)
	--Events.removeListener("castPowerAdjustEvent",sourceName)
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

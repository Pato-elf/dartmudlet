Repeat				= {}
local sourceName	= "repeat"



-- display the current repeat fields
-----------------------------------------------------------
local function showRepeatCurrentFields(args)
	local repeatnumber = args


	GUI.commandlineRepeat1:print(Status.repeatTable[repeatnumber].repeatName)
	GUI.commandlineRepeat2:print(Status.repeatTable[repeatnumber].repeatCommand1)
	GUI.commandlineRepeat3:print(Status.repeatTable[repeatnumber].repeatCommand2)
	GUI.commandlineRepeat4:print(Status.repeatTable[repeatnumber].repeatCommand3)
	GUI.commandlineRepeat5:print(Status.repeatTable[repeatnumber].repeatCommand4)
	GUI.commandlineRepeat6:print(Status.repeatTable[repeatnumber].repeatCommand5)
	GUI.commandlineRepeat7:print(Status.repeatTable[repeatnumber].repeatCommand6)
	GUI.commandlineRepeat8:print(Status.repeatTable[repeatnumber].repeatCommand7)
	GUI.commandlineRepeat9:print(Status.repeatTable[repeatnumber].repeatCommand8)
	GUI.commandlineRepeat10:print(Status.repeatTable[repeatnumber].repeatCommandAmount1)
	GUI.commandlineRepeat11:print(Status.repeatTable[repeatnumber].repeatCommandAmount2)
	GUI.commandlineRepeat12:print(Status.repeatTable[repeatnumber].repeatCommandAmount3)
	GUI.commandlineRepeat13:print(Status.repeatTable[repeatnumber].repeatCommandAmount4)
	GUI.commandlineRepeat14:print(Status.repeatTable[repeatnumber].repeatCommandAmount5)
	GUI.commandlineRepeat15:print(Status.repeatTable[repeatnumber].repeatCommandAmount6)
	GUI.commandlineRepeat16:print(Status.repeatTable[repeatnumber].repeatCommandAmount7)
	GUI.commandlineRepeat17:print(Status.repeatTable[repeatnumber].repeatCommandAmount8)
end



-- display the current repeat set number in the repeat window
-----------------------------------------------------------
local function showRepeatCurrentNumber(args)
	local repeatnumber  = args
	local displaytext   = ""


	displaytext = "<yellow><span style='font-size: 30pt;'>"
	displaytext = displaytext..string.format("%02d", repeatnumber)
	displaytext = displaytext.."</span>"

	cecho("textboxRepeat10", displaytext)
end



-- set the current repeat set number
-----------------------------------------------------------
local function setRepeatCurrentNumber(args)
	local direction = args


	if direction == "up" then
		if Status.repeatCurrentDisplay == 30 then
			Status.repeatCurrentDisplay = 1
		else
			Status.repeatCurrentDisplay = Status.repeatCurrentDisplay + 1
		end
	else
		if Status.repeatCurrentDisplay == 1 then
			Status.repeatCurrentDisplay = 30
		else
			Status.repeatCurrentDisplay = Status.repeatCurrentDisplay - 1
		end
	end

	showRepeatCurrentNumber(Status.repeatCurrentDisplay)
	showRepeatCurrentFields(Status.repeatCurrentDisplay)
    Events.raiseEvent("checkRepeatActiveEvent", {target = "move"})
end



-- set repeat set name
-----------------------------------------------------------
local function setRepeatName(args)
	local repeatvalue	= args["input"]
	local announce		= args["save"]

	
	Status.repeatTable[Status.repeatCurrentDisplay].repeatName = repeatvalue
	dba.execute('UPDATE repeat SET repeatName="'..repeatvalue..'" WHERE orderNumber='..Status.repeatCurrentDisplay)
	if announce then cecho("<yellow>Repeat: Repeat set name updated\n") end
end



-- set repeat command
-----------------------------------------------------------
local function setRepeatCommand(args)
	local repeatvalue	= args["input"]
	local commandnumber	= args["number"]
	local announce		= args["save"]

	
	if commandnumber == 1 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand1 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommand1="'..repeatvalue..'" WHERE repeatCommand1 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 2 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand2 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommand2="'..repeatvalue..'" WHERE repeatCommand2 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 3 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand3 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommand3="'..repeatvalue..'" WHERE repeatCommand3 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 4 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand4 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommand4="'..repeatvalue..'" WHERE repeatCommand4 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 5 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand5 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommand5="'..repeatvalue..'" WHERE repeatCommand5 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
    elseif commandnumber == 6 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand6 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommand6="'..repeatvalue..'" WHERE repeatCommand6 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
    elseif commandnumber == 7 then
        Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand7 = repeatvalue
        dba.execute('UPDATE repeat SET repeatCommand7="'..repeatvalue..'" WHERE repeatCommand7 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
    else
        Status.repeatTable[Status.repeatCurrentDisplay].repeatCommand8 = repeatvalue
        dba.execute('UPDATE repeat SET repeatCommand8="'..repeatvalue..'" WHERE repeatCommand8 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	end

	if announce then cecho("<yellow>Repeat: Repeat command"..commandnumber.." updated\n") end
end



-- set repeat command amount
-----------------------------------------------------------
local function setRepeatCommandAmount(args)
	local repeatvalue	= tonumber(args["input"])
	local commandnumber	= args["number"]
	local announce		= args["save"]


	if (not repeatvalue) or (repeatvalue < 0) or (repeatvalue > 99) then
		cecho("<red>ERROR: Invalid repeat number "..commandnumber.." value\n")
		return
    elseif commandnumber == 1 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount1 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommandAmount1="'..repeatvalue..'" WHERE repeatCommandAmount1 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 2 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount2 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommandAmount2="'..repeatvalue..'" WHERE repeatCommandAmount2 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 3 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount3 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommandAmount3="'..repeatvalue..'" WHERE repeatCommandAmount3 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 4 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount4 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommandAmount4="'..repeatvalue..'" WHERE repeatCommandAmount4 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	elseif commandnumber == 5 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount5 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommandAmount5="'..repeatvalue..'" WHERE repeatCommandAmount5 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
    elseif commandnumber == 6 then
		Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount6 = repeatvalue
		dba.execute('UPDATE repeat SET repeatCommandAmount6="'..repeatvalue..'" WHERE repeatCommandAmount6 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
    elseif commandnumber == 7 then
        Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount7 = repeatvalue
        dba.execute('UPDATE repeat SET repeatCommandAmount7="'..repeatvalue..'" WHERE repeatCommandAmount7 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
    else
        Status.repeatTable[Status.repeatCurrentDisplay].repeatCommandAmount8 = repeatvalue
        dba.execute('UPDATE repeat SET repeatCommandAmount8="'..repeatvalue..'" WHERE repeatCommandAmount8 != "'..repeatvalue..'" AND orderNumber='..Status.repeatCurrentDisplay)
	end

	if announce then cecho("<yellow>Repeat: Repeat command amount"..commandnumber.." updated\n") end
end



-- set repeat order
-----------------------------------------------------------
local function setRepeatOrder(args)

	local rows = dba.query([[SELECT orderNumber, id FROM repeat ORDER BY CASE WHEN repeatName = '' THEN 1 ELSE 0 END, repeatName COLLATE NOCASE]])

	for i = 1, 30 do
		dba.execute('UPDATE repeat SET orderNumber = '..i..' WHERE id = '..rows[i].id)
	end

	Status.repeatCurrentDisplay = 1
    Status.repeatCurrentActive = 0
	Repeat.load()
	showRepeatCurrentFields(Status.repeatCurrentDisplay)
	showRepeatCurrentNumber(Status.repeatCurrentDisplay)
    Events.raiseEvent("checkRepeatActiveEvent", {target = "order"})
	cecho("<yellow>Repeat: Repeat set order updated\n")
end



-- process the repeat set
-----------------------------------------------------------
local function processRepeat(args)
	local settype = args["type"]
    local activeset = 0

    if settype == "run" then
        activeset = Status.repeatCurrentDisplay
    else
        activeset = Status.repeatCurrentActive
    end

    local set1 = {cmd = Status.repeatTable[activeset].repeatCommand1, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount1)}
    local set2 = {cmd = Status.repeatTable[activeset].repeatCommand2, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount2)}
    local set3 = {cmd = Status.repeatTable[activeset].repeatCommand3, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount3)}
    local set4 = {cmd = Status.repeatTable[activeset].repeatCommand4, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount4)}
    local set5 = {cmd = Status.repeatTable[activeset].repeatCommand5, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount5)}
    local set6 = {cmd = Status.repeatTable[activeset].repeatCommand6, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount6)}
    local set7 = {cmd = Status.repeatTable[activeset].repeatCommand7, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount7)}
    local set8 = {cmd = Status.repeatTable[activeset].repeatCommand8, num = tonumber(Status.repeatTable[activeset].repeatCommandAmount8)}


	if (set1.cmd == "") and
	(set2.cmd == "") and
	(set3.cmd == "") and
	(set4.cmd == "") and
	(set5.cmd == "") and
	(set6.cmd == "") and
    (set7.cmd == "") and
    (set8.cmd == "") then
		cecho("<red>ERROR: Repeat set has no commands to run\n")
		return
    end

    if (set1.num == "") and
    (set2.num == "") and
    (set3.num == "") and
    (set4.num == "") and
    (set5.num == "") and
    (set6.num == "") and
    (set7.num == "") and
    (set8.num == "") then
        cecho("<red>ERROR: Repeat set amounts have not been set\n")
        return
    end

    if (set1.cmd ~= "") and (set1.num > 0) then
        for i=1, set1.num do expandAlias(set1.cmd) end
    end

    if (set2.cmd ~= "") and (set2.num > 0) then
        for i=1, set2.num do expandAlias(set2.cmd) end
    end

    if (set3.cmd ~= "") and (set3.num > 0) then
        for i=1, set3.num do expandAlias(set3.cmd) end
    end

    if (set4.cmd ~= "") and (set4.num > 0) then
        for i=1, set4.num do expandAlias(set4.cmd) end
    end

    if (set5.cmd ~= "") and (set5.num > 0) then
        for i=1, set5.num do expandAlias(set5.cmd) end
    end

    if (set6.cmd ~= "") and (set6.num > 0) then
        for i=1, set6.num do expandAlias(set6.cmd) end
    end

    if (set7.cmd ~= "") and (set7.num > 0) then
        for i=1, set7.num do expandAlias(set7.cmd) end
    end

    if (set8.cmd ~= "") and (set8.num > 0) then
        for i=1, set8.num do expandAlias(set8.cmd) end
    end
end



-- save all repeat settings
-- TODO: make more efficient?
-----------------------------------------------------------
local function saveRepeatSettings(args)
	local savetype	= args["type"]

	setRepeatName({save = false, number = 0, input = GUI.commandlineRepeat1:getText()})
	setRepeatCommand({save = false, number = 1, input = GUI.commandlineRepeat2:getText()})
	setRepeatCommand({save = false, number = 2, input = GUI.commandlineRepeat3:getText()})
	setRepeatCommand({save = false, number = 3, input = GUI.commandlineRepeat4:getText()})
	setRepeatCommand({save = false, number = 4, input = GUI.commandlineRepeat5:getText()})
	setRepeatCommand({save = false, number = 5, input = GUI.commandlineRepeat6:getText()})
	setRepeatCommand({save = false, number = 6, input = GUI.commandlineRepeat7:getText()})
    setRepeatCommand({save = false, number = 7, input = GUI.commandlineRepeat8:getText()})
    setRepeatCommand({save = false, number = 8, input = GUI.commandlineRepeat9:getText()})
	setRepeatCommandAmount({save = false, number = 1, input = GUI.commandlineRepeat10:getText()})
	setRepeatCommandAmount({save = false, number = 2, input = GUI.commandlineRepeat11:getText()})
	setRepeatCommandAmount({save = false, number = 3, input = GUI.commandlineRepeat12:getText()})
	setRepeatCommandAmount({save = false, number = 4, input = GUI.commandlineRepeat13:getText()})
	setRepeatCommandAmount({save = false, number = 5, input = GUI.commandlineRepeat14:getText()})
	setRepeatCommandAmount({save = false, number = 6, input = GUI.commandlineRepeat15:getText()})
    setRepeatCommandAmount({save = false, number = 7, input = GUI.commandlineRepeat16:getText()})
    setRepeatCommandAmount({save = false, number = 8, input = GUI.commandlineRepeat17:getText()})

	if (savetype == "run") then
        processRepeat({type = "run"})
    elseif (savetype == "auto") then
        if Status.repeatCurrentDisplay == Status.repeatCurrentActive then
            Status.repeatCurrentActive = 0
        else
            Status.repeatCurrentActive = Status.repeatCurrentDisplay
            send("conc", false)
        end
        Events.raiseEvent("checkRepeatActiveEvent", {target = "auto"})
    else
        cecho("<yellow>Repeat: Repeat set "..string.format("%02d", Status.repeatCurrentDisplay).." updated\n")
    end
end



-- /repeat copy - copy a repeat set from source to target
-----------------------------------------------------------
local function repeatCopy(args)
	local source	= tonumber(args["source"])
	local target	= tonumber(args["target"])


	if (source < 1) or (source > 30) or (target < 1) or (target > 30) then
		cecho("<red>ERROR: Invalid repeat set copy values\n")
	elseif (source == target) then
		cecho("<red>ERROR: Repeat set copy values cannot be the same\n")
	else
		local query = 'UPDATE repeat SET '
		query = query..'repeatName = (SELECT repeatName FROM repeat WHERE orderNumber = '..source..'),'
		query = query..'repeatCommand1 = (SELECT repeatCommand1 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand2 = (SELECT repeatCommand2 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand3 = (SELECT repeatCommand3 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand4 = (SELECT repeatCommand4 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand5 = (SELECT repeatCommand5 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand6 = (SELECT repeatCommand6 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand7 = (SELECT repeatCommand7 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommand8 = (SELECT repeatCommand8 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount1 = (SELECT repeatCommandAmount1 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount2 = (SELECT repeatCommandAmount2 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount3 = (SELECT repeatCommandAmount3 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount4 = (SELECT repeatCommandAmount4 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount5 = (SELECT repeatCommandAmount5 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount6 = (SELECT repeatCommandAmount6 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount7 = (SELECT repeatCommandAmount7 FROM repeat WHERE orderNumber = '..source..'),'
        query = query..'repeatCommandAmount8 = (SELECT repeatCommandAmount8 FROM repeat WHERE orderNumber = '..source..') '
		query = query..'WHERE orderNumber = '..target

		dba.execute(query)
        Repeat.load()
        if Status.repeatCurrentActive == target then
            Status.repeatCurrentActive = 0
            Events.raiseEvent("checkRepeatActiveEvent", {target = "copy"})
        end
		showRepeatCurrentFields(Status.repeatCurrentDisplay)
		cecho("<yellow>Repeat: Repeat set copied\n")
	end
end



-- /repeat clear - clear the contents of a repeat set
-----------------------------------------------------------
local function repeatClear(args)
	local target    = tonumber(args["target"])


	if (target < 1) or (target > 30) then
		cecho("<red>ERROR: Invalid repeat set clear value\n")
	else
		local query = 'UPDATE repeat SET '
		query = query..'repeatName = "", '
        query = query..'repeatCommand1 = "", repeatCommand2 = "", repeatCommand3 = "", repeatCommand4 = "", '
        query = query..'repeatCommand5 = "", repeatCommand6 = "", repeatCommand7 = "", repeatCommand8 = "", '
        query = query..'repeatCommandAmount1 = 0, repeatCommandAmount2 = 0, repeatCommandAmount3 = 0, repeatCommandAmount4 = 0, '
        query = query..'repeatCommandAmount5 = 0, repeatCommandAmount6 = 0, repeatCommandAmount7 = 0, repeatCommandAmount8 = 0 '
		query = query..'WHERE orderNumber = '..target

		dba.execute(query)
        Repeat.load()
        if Status.repeatCurrentActive == target then
            Status.repeatCurrentActive = 0
            Events.raiseEvent("checkRepeatActiveEvent", {target = "clear"})
        end
		showRepeatCurrentFields(Status.repeatCurrentDisplay)
		cecho("<yellow>Repeat: Repeat set cleared\n")
	end
end



-- check the repeat active button background
-----------------------------------------------------------
local function checkRepeatActiveButton(args)

    if Status.repeatCurrentActive == Status.repeatCurrentDisplay then
        GUI.buttonRepeat3:setStyleSheet(StyleButtonPaleGreen:getCSS())
    else
        GUI.buttonRepeat3:setStyleSheet(StyleButtonLightGrey:getCSS())
    end

end



-- build or update the table during setup
-----------------------------------------------------------
local function checkRepeatTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS repeat (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		repeatName VARCHAR(64) DEFAULT "",
		orderNumber INTEGER DEFAULT 0,
        repeatCommand1 VARCHAR(128) DEFAULT "",
        repeatCommand2 VARCHAR(128) DEFAULT "",
        repeatCommand3 VARCHAR(128) DEFAULT "",
        repeatCommand4 VARCHAR(128) DEFAULT "",
        repeatCommand5 VARCHAR(128) DEFAULT "",
        repeatCommand6 VARCHAR(128) DEFAULT "",
        repeatCommand7 VARCHAR(128) DEFAULT "",
        repeatCommand8 VARCHAR(128) DEFAULT "",
        repeatCommandAmount1 INTEGER DEFAULT 0,
        repeatCommandAmount2 INTEGER DEFAULT 0,
        repeatCommandAmount3 INTEGER DEFAULT 0,
        repeatCommandAmount4 INTEGER DEFAULT 0,
        repeatCommandAmount5 INTEGER DEFAULT 0,
        repeatCommandAmount6 INTEGER DEFAULT 0,
        repeatCommandAmount7 INTEGER DEFAULT 0,
        repeatCommandAmount8 INTEGER DEFAULT 0
	);]])


	local results = dba.query('SELECT id FROM repeat')
	if results.count() == 0 then
		for i = 1, 30 do
			dba.execute('INSERT INTO repeat DEFAULT VALUES')
		end
		dba.execute('UPDATE repeat SET orderNumber=id')
		local examplerepeats = 'UPDATE repeat SET repeatName="EXAMPLE", '
		examplerepeats = examplerepeats..'repeatCommand1="/chan 50", repeatCommand2="craft vial", repeatCommand3="pump forge", '
		examplerepeats = examplerepeats..'repeatCommandAmount1=1, repeatCommandAmount2=10, repeatCommandAmount3=2 '
		examplerepeats = examplerepeats..'WHERE orderNumber=1'
		dba.execute(examplerepeats)
	end

end



local function load()
	local result        = {}
	Status.repeatTable  = {}

	result = dba.query('SELECT * FROM repeat ORDER BY orderNumber')
	for i = 1, 30 do
		table.insert(Status.repeatTable, result[i])
	end
end



local function save()

end



local function setup(args)
	checkRepeatTable()
    Events.addListener("repeatClearEvent", sourceName, repeatClear)
    Events.addListener("repeatCopyEvent", sourceName, repeatCopy)
    Events.addListener("processRepeatEvent", sourceName, processRepeat)
    Events.addListener("saveRepeatSettingsEvent", sourceName, saveRepeatSettings)
    Events.addListener("setRepeatNameEvent", sourceName, setRepeatName)
    Events.addListener("setRepeatOrderEvent", sourceName, setRepeatOrder)
    Events.addListener("setRepeatCommandEvent", sourceName, setRepeatCommand)
    Events.addListener("setRepeatCommandAmountEvent", sourceName, setRepeatCommandAmount)
    Events.addListener("setRepeatCurrentNumberEvent", sourceName, setRepeatCurrentNumber)
    Events.addListener("checkRepeatActiveEvent", sourceName, checkRepeatActiveButton)

end

local function unsetup(args)
    Events.removeListener("repeatClearEvent", sourceName)
    Events.removeListener("repeatCopyEvent", sourceName)
    Events.removeListener("processRepeatEvent", sourceName)
    Events.removeListener("saveRepeatSettingsEvent", sourceName)
    Events.removeListener("setRepeatNameEvent", sourceName)
    Events.removeListener("setRepeatOrderEvent", sourceName)
    Events.removeListener("setRepeatCommandEvent", sourceName)
    Events.removeListener("setRepeatCommandAmountEvent", sourceName)
    Events.removeListener("setRepeatCurrentNumberEvent", sourceName)
    Events.removeListener("checkRepeatActiveEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Repeat = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save,
    showRepeatCurrentNumber = showRepeatCurrentNumber,
    showRepeatCurrentFields = showRepeatCurrentFields
}

return Repeat
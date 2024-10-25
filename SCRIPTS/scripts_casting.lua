local Casting		= {}
local sourceName	= "casting"
local isActive		= false



local function practiceCast(args)
	send("cast ! "..Status.castCurrentSpell.." @ ".. Status.castCurrentPower.. " "..Status.castCurrentArgs)
	Events.addListener("BEBTconcEvent", sourceName, practiceCast)
end



local function practiceCastSetup(args)
	local spellName = args["spellName"]
	local power = args["power"]
	local spellArguments = args["spellArguments"]
	isActive = true

	if power < 50 then power = 50 end

	Status.castCurrentSpell = spellName
	Status.castCurrentPower = power
	Status.castCurrentArgs = spellArguments
	
	local query = 'UPDATE casting '
	query = query..'SET castCurrentSpell="'..Status.castCurrentSpell..'", '
	query = query..'castCurrentPower='..Status.castCurrentPower..', '
	query = query..'castCurrentArgs="'..Status.castCurrentArgs..'"'
	dba.execute(query)

	Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..Status.castCurrentSpell.." @ "..Status.castCurrentPower.." "..Status.castCurrentArgs.."\n"})
	Events.addListener("BEBTconcEvent", sourceName, practiceCast)

end



-- change the power level
local function changePower(args)
	local spellPower = args["power"]

	if (spellPower < 50) or not (tonumber(spellPower)) then
		cecho("<red>ERROR: Invalid /cast power value\n")
	else
		Status.castCurrentPower = spellPower
		dba.execute('UPDATE casting SET castCurrentPower='..Status.castCurrentPower)
		cecho("<yellow>Channel: /cast power value updated\n")
		Events.raiseEvent("messageEvent", {message="<yellow>Practice casting "..Status.castCurrentSpell.." @ "..Status.castCurrentPower.." "..Status.castCurrentArgs.."\n"})
	end

end



local function practiceCastOff(args)
	isActive = false
	Events.raiseEvent("messageEvent", {message="<yellow>Stopped casting\n"})
	Events.removeListener("BEBTconcEvent", sourceName)
end



local function finishPracticing(args)
	if isActive then
		Events.addListener("BEBTconcEvent", sourceName, practiceCast)
	end
end



-- build or update the table during setup
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
		dba.execute('INSERT INTO casting DEFAULT VALUES')
	end

end



local function load()
	local result = {}
	
	result = dba.query('SELECT * FROM casting')[1]
	Status.castCurrentArgs = result.castCurrentArgs
	Status.castCurrentPower = result.castCurrentPower
	Status.castCurrentSpell = result.castCurrentSpell
end



local function save()

end



local function setup(args)
	checkCastingTable()
	Events.addListener("practiceCastEvent",sourceName, practiceCastSetup)
	Events.addListener("practiceCastOffEvent",sourceName, practiceCastOff)
--	Events.addListener("finishPracticingEvent",sourceName, finishedPracticing)
	Events.addListener("castPowerAdjustEvent",sourceName, changePower)
end

local function unsetup(args)
	Events.removeListener("practiceCastEvent",sourceName)
	Events.removeListener("practiceCastOffEvent",sourceName)
--	Events.removeListener("finishPracticingEvent",sourceName)
	Events.removeListener("castPowerAdjustEvent",sourceName)
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

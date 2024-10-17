local Inscribing	= {}
sourceName			= "inscribing"



local function inscribe(args)
	send("inscribe "..Status.scrollCurrentSpell.. " "..Status.scrollCurrentPower)
end



local function invoke(args)
	local command = "invoke "..Status.scrollCurrentSpell.." !"
	tempTimer(0.7, [[send(command)]])
end



local function inscribeSetup(args)
	local spell = args["spell"]
	local power = args["power"]

	Status.scrollCurrentSpell = spell
	Status.scrollCurrentPower = power
	dba.execute('UPDATE settings SET scrollCurrentSpell="'..Status.scrollCurrentSpell..'", scrollCurrentPower='..Status.scrollCurrentPower)

	cecho("<yellow>Inscribing "..Status.scrollCurrentSpell.." "..Status.scrollCurrentPower.."\n")
	Events.addListener("BEBTconcEvent", sourceName, inscribe)
	Events.addListener("finishedInscriptionEvent",sourceName,invoke)
	send("conc")

end



local function inscribeOff(args)
	Events.removeListener("BEBTconcEvent",sourceName)
	Events.removeListener("finishedInscriptionEvent",sourceName)
	cecho("<yellow>Stopped inscribing\n")
end



local function adjustPower(args)
	local power = args["power"]

	Status.scrollCurrentPower = power
	dba.execute('UPDATE settings SET scrollCurrentPower='..Status.scrollCurrentPower)
	cecho("<yellow>Inscribing "..Status.scrollCurrentSpell.." "..Status.scrollCurrentPower.."\n")
end



local function load()

end



local function save()

end



local function setup(args)
	Events.addListener("practiceInscribingEvent", sourceName, inscribeSetup)
	Events.addListener("practiceInscribingOffEvent", sourceName, inscribeOff)
	Events.addListener("practiceInscribingAdjustPowerEvent", sourceName, adjustPower)
end

local function unsetup(args)
	Events.removeListener("practiceInscribingEvent", sourceName)
	Events.removeListener("practiceInscribingOffEvent", sourceName)
	Events.removeListener("practiceInscribingAdjustPowerEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Inscribing = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Inscribing

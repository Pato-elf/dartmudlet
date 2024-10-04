Status = {}

local sourceName = "status"

-- character status
Status.age			= ''
Status.alignment	= ''
Status.aura			= ''
Status.encumbrance	= ''
Status.hunger		= ''
Status.movement		= ''
Status.name			= ''
Status.race			= ''
Status.soulage		= ''
Status.thirst		= ''

-- refresh box
Status.statusRefresh	= false
Status.refreshPower1	= 60
Status.refreshPower2	= 60
Status.refreshTarget1	= 'dryfter'
Status.refreshTarget2	= ''
Status.refreshType1		= 'auto'
Status.refreshType2		= 'auto'

-- channel box
Status.statusChannel		= false
Status.statusPowercast		= true
Status.statusAnnounce		= false
Status.statusCmdAddon		= false
Status.statusTeach			= false
Status.statusFeed			= false
Status.statusPlaySound		= true
Status.powercastAddon		= 3
Status.powercastAmount		= 500
Status.powercastPercent		= 0
Status.powercastSuccess		= 0
Status.powercastTotal		= 0
Status.powercastColorEcho	= 'magenta'
Status.powercastSoundFile	= 'Speech On.wav'
Status.focusAmountDefault	= 20
Status.focusAmountFeed		= 60
Status.focusAmountTeach		= 45
Status.focusTotal			= 0
Status.focusTarget			= 'pearl'
Status.focusTargetSource	= '(held) scrip'
Status.teachTarget			= 'tudor'
Status.cmdAddon				= ''





local function setAge(args)
	Status.soulage = args["soulAge"]
end

local function setAlignment(args)
	Status.alignment = args["alignment"]
end

local function setAura(args)
	Status.aura = args["aura"]
end

local function setEncumbrance(args)
	Status.encumbrance = args["encumbrance"]
end

local function setHunger(args)
	Status.hunger = args["hunger"]
end

local function setMovement(args)
	Status.movement = args["movement"]
end

local function setName(args)
	Status.name = args["name"]
end

local function setRace(args)
	Status.race = args["race"]
end

local function setThirst(args)
	Status.thirst = args["thirst"]
end

local function setAge(args)
	Status.age = args["age'"]
end

local function login(args)
	send("score")
	send("who")
end



function Status.setup(args)
	Events.addListener("ageEvent", sourceName, setAge)
	Events.addListener("alignmentEvent", sourceName, setAlignment)
	Events.addListener("auraEvent", sourceName, setAura)
	Events.addListener("encumbranceEvent", sourceName, setEncumbrance)
	Events.addListener("hungerEvent", sourceName, setHunger)
	Events.addListener("movementEvent", sourceName, setMovement)
	Events.addListener("nameEvent", sourceName, setName)
	Events.addListener("raceEvent", sourceName, setRace)
	Events.addListener("soulAgeEvent", sourceName, setSoulAge)
	Events.addListener("thirstEvent", sourceName, setThirst)
	Events.addListener("loginEvent", sourceName, login)
end



function Status.unsetup(args)
	Events.removeListener("ageEvent", sourceName)
	Events.removeListener("alignmentEvent", sourceName)
	Events.removeListener("auraEvent", sourceName)
	Events.removeListener("encumbranceEvent", sourceName)
	Events.removeListener("hungerEvent", sourceName)
	Events.removeListener("movementEvent", sourceName)
	Events.removeListener("nameEvent", sourceName)
	Events.removeListener("raceEvent", sourceName)
	Events.removeListener("soulAgeEvent", sourceName)
	Events.removeListener("thirstEvent", sourceName)
	Events.removeListener("loginEvent", sourceName)
end



function Status.resetup(args)
	Status.unsetup(args)
	Status.setup(args)
end

return Status

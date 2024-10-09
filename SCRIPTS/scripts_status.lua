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

-- refresh system
Status.statusRefresh	= false
Status.refreshPower1	= 50
--Status.refreshPower2	= 60
Status.refreshTarget1	= 'targetname'
--Status.refreshTarget2	= ''
--Status.refreshType1		= 'auto'
--Status.refreshType2		= 'auto'

-- channelling system
Status.powercastAddon			= 3
Status.powercastAmount			= 500
Status.powercastPercent			= 0
Status.powercastSuccess			= 0
Status.powercastTotal			= 0
Status.focusAmountDefault		= 20
Status.focusAmountFeed			= 60
Status.focusAmountTeach			= 20
Status.focusTotal				= 0
Status.focusTarget				= 'necklace'
Status.focusTargetSource		= '(held) scrip'
Status.teachTarget				= 'targetname'
Status.feedTarget				= 'targetname'
Status.channelMode				= 'POWERCAST'
Status.channelColorEcho			= 'magenta'
Status.powercastSoundFile		= 'Speech On.wav'
Status.cmdAddon					= ''
Status.statusChanShare			= 'on'
Status.statusPlaySound			= 'on'
Status.powercastPause			= 'on'
Status.powercastPauseisActive	= false

-- misc variables
Status.statusConc			= 'off'
Status.tooltipTime			= 5
Status.chatboxFontSize		= 9



local function setVariables()
	echo("Dropdown1", "<center><span style='color: white;'>"..Status.channelMode.."</span></center>")
	cecho("ChannelTextBox1", Info.showSpellCasting())
	cecho("ChannelTextBox2", "<yellow>POWERCAST MOD:&nbsp;&nbsp;&nbsp;"..Status.powercastAddon)
	cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
	cecho("ChannelTextBox4", Info.showPowercastPercentage())
	GUI.containerChannelCommand1:print(Status.focusAmountDefault)
	GUI.containerChannelCommand2:print(Status.focusTarget)
	GUI.containerChannelCommand3:print(Status.focusTargetSource)
	GUI.containerChannelCommand4:print(Status.powercastAmount)
	GUI.containerChannelCommand5:print(Status.teachTarget)
	GUI.containerChannelCommand6:print(Status.focusAmountTeach)
	GUI.containerChannelCommand7:print(Status.powercastAddon)
	GUI.containerChannelCommand8:print(Status.focusAmountFeed)
	GUI.containerChannelCommand9:print(Status.feedTarget)
	GUI.containerChannelCommand10:print(Status.cmdAddon)
	
	GUI.containerRefreshCommand1:print(Status.refreshTarget1)
	GUI.containerRefreshCommand2:print(Status.refreshPower1)
	
	
	if (Status.statusChanShare == "off") then
		GUI.containerChannelButton4:setStyleSheet(StyleButtonDarkGrey:getCSS())
	end
end



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
	setVariables()
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

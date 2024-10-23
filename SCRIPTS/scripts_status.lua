Status = {}
local sourceName = "status"



-- character status
-----------------------------------------------------------
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



-- alloc system variables
-----------------------------------------------------------
Status.allocDisplay = 1
Status.allocActive = 0

Status.allocsTable = {}


-- refresh system variables
-----------------------------------------------------------
Status.refreshPower1	= 50
Status.refreshPower2	= 50
Status.refreshTarget1	= 'targetname'
Status.refreshTarget2	= 'targetname'

-- unsaved refresh variables
Status.statusRefresh	= false



-- channelling system variables
-----------------------------------------------------------
Status.powercastAddon			= 3
Status.powercastAmount			= 500
Status.powercastSuccess			= 0
Status.powercastTotal			= 0
Status.focusAmountDefault		= 20
Status.focusAmountFeed			= 60
Status.focusAmountTeach			= 20
Status.focusTarget				= 'necklace'
Status.focusTargetSource		= '(held) scrip'
Status.teachTarget				= 'targetname'
Status.feedTarget				= 'targetname'
Status.channelMode				= 'POWERCAST'
Status.channelColorEcho			= 'magenta'
Status.powercastSoundFile		= 'Speech On.wav'
Status.cmdAddon					= ''
Status.statusChanShare			= 'on'
Status.statusFocusTotal			= 'off'
Status.statusPlaySound			= 'on'
Status.powercastPause			= 'on'


-- unsaved channelling variables
Status.powercastPercent			= 0
Status.focusTotal				= 0
Status.powercastPauseisActive	= false
Status.powercastisForce			= false
Status.statusChannel			= false



-- casting system variables
-----------------------------------------------------------
Status.castCurrentArgs	= ""
Status.castCurrentPower	= 100
Status.castCurrentSpell	= "lg"



-- misc variables
-----------------------------------------------------------
Status.Announce				= 'on'
Status.statusAntiSpam		= 'off'
Status.statusAura			= 'off'
Status.statusConc			= 'off'
Status.statusContents		= 'on'
Status.fontSizeChat			= 10
Status.fontSizeImproves		= 10
Status.fontSizeMessage		= 10
Status.fontSizeWho			= 10
Status.numLinesToCheck		= 20
Status.scrollCurrentSpell	= ''
Status.scrollCurrentPower	= 100


Status.tooltipTime			= 5






local function setVariables()
	echo("Dropdown1", "<center><span style='color: white;'>"..Status.channelMode.."</span></center>")
	cecho("ChannelTextBox1", Info.showSpellCasting())
	cecho("ChannelTextBox2", "<yellow>POWERCAST MOD:&nbsp;&nbsp;&nbsp;"..Status.powercastAddon)
	cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
	cecho("ChannelTextBox4", Info.showPowercastPercentage())
	cecho("ChannelTextBox16", "<magenta>"..Status.focusTotal.."%")
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
	GUI.containerRefreshCommand3:print(Status.refreshTarget2)
	GUI.containerRefreshCommand4:print(Status.refreshPower2)
	
	GUI.commandlineAllocs1:print(Status.allocsTable[1].allocName)
	GUI.commandlineAllocs2:print(Status.allocsTable[1].allocTarget)
	GUI.commandlineAllocs3:print(Status.allocsTable[1].bodypart1)
	GUI.commandlineAllocs4:print(Status.allocsTable[1].bonus1)
	GUI.commandlineAllocs5:print(Status.allocsTable[1].daring1)
	GUI.commandlineAllocs6:print(Status.allocsTable[1].speed1)
	GUI.commandlineAllocs7:print(Status.allocsTable[1].aiming1)
	GUI.commandlineAllocs8:print(Status.allocsTable[1].parry1)
	GUI.commandlineAllocs9:print(Status.allocsTable[1].control1)
	GUI.commandlineAllocs10:print(Status.allocsTable[1].null1)

	GUI.commandlineAllocs11:print(Status.allocsTable[1].bodypart2)
	GUI.commandlineAllocs12:print(Status.allocsTable[1].bonus2)
	GUI.commandlineAllocs13:print(Status.allocsTable[1].daring2)
	GUI.commandlineAllocs14:print(Status.allocsTable[1].speed2)
	GUI.commandlineAllocs15:print(Status.allocsTable[1].aiming2)
	GUI.commandlineAllocs16:print(Status.allocsTable[1].parry2)
	GUI.commandlineAllocs17:print(Status.allocsTable[1].control2)
	GUI.commandlineAllocs18:print(Status.allocsTable[1].null2)

	GUI.commandlineAllocs19:print(Status.allocsTable[1].bodypart3)
	GUI.commandlineAllocs20:print(Status.allocsTable[1].bonus3)
	GUI.commandlineAllocs21:print(Status.allocsTable[1].daring3)
	GUI.commandlineAllocs22:print(Status.allocsTable[1].speed3)
	GUI.commandlineAllocs23:print(Status.allocsTable[1].aiming3)
	GUI.commandlineAllocs24:print(Status.allocsTable[1].parry3)
	GUI.commandlineAllocs25:print(Status.allocsTable[1].control3)
	GUI.commandlineAllocs26:print(Status.allocsTable[1].null3)

	GUI.commandlineAllocs27:print(Status.allocsTable[1].bodypart4)
	GUI.commandlineAllocs28:print(Status.allocsTable[1].bonus4)
	GUI.commandlineAllocs29:print(Status.allocsTable[1].daring4)
	GUI.commandlineAllocs30:print(Status.allocsTable[1].speed4)
	GUI.commandlineAllocs31:print(Status.allocsTable[1].aiming4)
	GUI.commandlineAllocs32:print(Status.allocsTable[1].parry4)
	GUI.commandlineAllocs33:print(Status.allocsTable[1].control4)
	GUI.commandlineAllocs34:print(Status.allocsTable[1].null4)

	GUI.commandlineAllocs35:print(Status.allocsTable[1].bodypart5)
	GUI.commandlineAllocs36:print(Status.allocsTable[1].bonus5)
	GUI.commandlineAllocs37:print(Status.allocsTable[1].daring5)
	GUI.commandlineAllocs38:print(Status.allocsTable[1].speed5)
	GUI.commandlineAllocs39:print(Status.allocsTable[1].aiming5)
	GUI.commandlineAllocs40:print(Status.allocsTable[1].parry5)
	GUI.commandlineAllocs41:print(Status.allocsTable[1].control5)
	GUI.commandlineAllocs42:print(Status.allocsTable[1].null5)

	GUI.commandlineAllocs43:print(Status.allocsTable[1].bodypart6)
	GUI.commandlineAllocs44:print(Status.allocsTable[1].bonus6)
	GUI.commandlineAllocs45:print(Status.allocsTable[1].daring6)
	GUI.commandlineAllocs46:print(Status.allocsTable[1].speed6)
	GUI.commandlineAllocs47:print(Status.allocsTable[1].aiming6)
	GUI.commandlineAllocs48:print(Status.allocsTable[1].parry6)
	GUI.commandlineAllocs49:print(Status.allocsTable[1].control6)
	GUI.commandlineAllocs50:print(Status.allocsTable[1].null6)
	
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

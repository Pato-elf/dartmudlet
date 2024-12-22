Status				= {}
local sourceName	= "status"




-- alloc system variables
-----------------------------------------------------------
Status.allocCurrentDisplay	= 1
Status.allocsTable			= {}



-- casting system variables
-----------------------------------------------------------
Status.castCurrentArgs	= ''
Status.castCurrentPower	= 100
Status.castCurrentSpell	= 'lg'



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



-- gagging system variables
-----------------------------------------------------------
Status.gagChannels      = false
Status.gagCitizens      = false
Status.gagCreatures     = false
Status.gagPets          = false
Status.gagPrompts       = false
Status.gagQuests        = false
Status.gagSparring      = false
Status.gagTrainers      = false



-- language system variables
-----------------------------------------------------------
Status.languageType     = 'common'
Status.languageInterval = 10
Status.languageTitle1   = 'Bardic Songs'
Status.languageFile1    = 'language_bardic_songs.txt'
Status.languageSize1    = 262
Status.languageLine1    = 0
Status.languageTotal1   = 0
Status.languageActive1  = false

Status.languageTitle2   = 'Beowulf'
Status.languageFile2    = 'language_beowulf_1910.txt'
Status.languageSize2    = 3193
Status.languageLine2    = 0
Status.languageTotal2   = 0
Status.languageActive2  = false

Status.languageTitle3   = 'Medieval Proverbs'
Status.languageFile3    = 'language_medieval_proverbs.txt'
Status.languageSize3    = 226
Status.languageLine3    = 0
Status.languageTotal3   = 0
Status.languageActive3  = false

Status.languageTitle4   = 'Nature Metaphors'
Status.languageFile4    = 'language_nature_metaphors.txt'
Status.languageSize4    = 225
Status.languageLine4    = 0
Status.languageTotal4   = 0
Status.languageActive4  = false

Status.languageTitle5   = 'Rituals and Oaths'
Status.languageFile5    = 'language_rituals_oaths.txt'
Status.languageSize5    = 399
Status.languageLine5    = 0
Status.languageTotal5   = 0
Status.languageActive5  = false

Status.languageTitle6   = 'The Squire\'s Tale'
Status.languageFile6    = 'language_squires_tale.txt'
Status.languageSize6    = 664
Status.languageLine6    = 0
Status.languageTotal6   = 0
Status.languageActive6  = false

-- unsaved language variables
Status.statusLanguage   = false
Status.languageCurrent  = 0



-- refresh system variables
-----------------------------------------------------------
Status.refreshPower1	= 50
Status.refreshPower2	= 50
Status.refreshTarget1	= 'targetname'
Status.refreshTarget2	= 'targetname'

-- unsaved refresh variables
Status.statusRefresh	= false



-- repeat system variables
-----------------------------------------------------------
Status.repeatCurrentDisplay	= 1
Status.repeatCurrentActive	= 0
Status.repeatTable			= {}
Status.statusRepeatEcho     = 'off'



-- misc variables
-----------------------------------------------------------
Status.Announce				= 'on'
Status.statusAntiSpam		= 'off'
Status.statusAura			= 'off'
Status.statusConc			= 'off'
Status.statusContents		= 'on'
Status.statusWho            = 'on'
Status.fontSizeChat			= 10
Status.fontSizeImproves		= 10
Status.fontSizeMessage		= 10
Status.fontSizeWho			= 10
Status.numLinesToCheck		= 20
Status.scrollCurrentSpell	= ''
Status.scrollCurrentPower	= 100
Status.tooltipTime			= 7
Status.blockType            = ''





local function setVariables()


	-- CHANNEL BOX
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
	if (Status.statusChanShare == "off") then
		GUI.containerChannelButton4:setStyleSheet(StyleButtonDarkGrey:getCSS())
	end

	-- REFRESH BOX
	GUI.containerRefreshCommand1:print(Status.refreshTarget1)
	GUI.containerRefreshCommand2:print(Status.refreshPower1)
	GUI.containerRefreshCommand3:print(Status.refreshTarget2)
	GUI.containerRefreshCommand4:print(Status.refreshPower2)

	-- ALLOCS BOX
	Allocs.showAllocsCurrentFields(Status.allocCurrentDisplay)
	Allocs.showAllocsCurrentNumber(Status.allocCurrentDisplay)
	Events.raiseEvent("checkAllocSetButtonEvent", {target = "unknown"})

	-- REPEAT BOX
	Repeat.showRepeatCurrentFields(Status.repeatCurrentDisplay)
	Repeat.showRepeatCurrentNumber(Status.repeatCurrentDisplay)

    -- GAG BOX
    Events.raiseEvent("showGagButtonsEvent")

    -- LANGUAGE BOX
    Events.raiseEvent("showLanguageButtonsEvent")
    Events.raiseEvent("showLanguageTypeEvent")
    Events.raiseEvent("showLanguageStatsEvent")
end



--local function setAge(args)
--	Status.soulage = args["soulAge"]
--end



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
	Events.removeListener("thirstEvent", sourceName)
	Events.removeListener("loginEvent", sourceName)
end



function Status.resetup(args)
	Status.unsetup(args)
	Status.setup(args)
end


return Status

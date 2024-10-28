local Channelling			= {}
local sourceName			= "channelling"
local powercastTimeLast		= os.time()
local powercastTimeisFirst	= true



-- compute time elapsed since last time called
-----------------------------------------------------------
local function computeTimeElapsed()
	local timeelapsed = ""


	if powercastTimeisFirst then
		timeelapsed = "N/A"
		powercastTimeisFirst = false
	else
		timeelapsed = os.time()
		timeelapsed = timeelapsed - powercastTimeLast

		local hours   = math.floor(timeelapsed / 3600)
		local minutes = math.floor((timeelapsed % 3600) / 60)
		local seconds = timeelapsed % 60

		timeelapsed = string.format("%02d:%02d:%02d", hours, minutes, seconds)
	end

	powercastTimeLast = os.time()

	return timeelapsed

end


-- update the focus total display
-----------------------------------------------------------
local function updateFocusDisplay()
	GUI.containerChannelTextBox16:setStyleSheet(StyleTextWhiteLarge:getCSS())
	cecho("ChannelTextBox16", ""..Status.focusTotal.."%")
	tempTimer(0.06, function()
		GUI.containerChannelTextBox16:setStyleSheet(StyleTextMagentaLarge:getCSS())
		cecho("ChannelTextBox16", ""..Status.focusTotal.."%")
	end)
end



-- set channelMode
-----------------------------------------------------------
local function setchannelMode(args)
	local channelmode = args["input"]


	Status.channelMode = channelmode
	dba.execute('UPDATE channel SET channelMode="'..Status.channelMode..'"')
	send("conc", false)
	cecho("<yellow>Channel: Channel mode updated\n")
	
end



-- set focusAmountDefault
-----------------------------------------------------------
local function setfocusAmountDefault(args)
	local focusamount = tonumber(args["input"])	
	local saveflag = args["save"]


	if not focusamount then
		cecho("<red>ERROR: Invalid default channel value\n")
	else
		if (focusamount < 1) or (focusamount > 100) then
			cecho("<red>ERROR: Invalid default channel value\n")
		else
			Status.focusAmountDefault = focusamount
			if saveflag then dba.execute('UPDATE channel SET focusAmountDefault='..Status.focusAmountDefault) end
			cecho("<yellow>Channel: Default channel value updated\n")
		end
	end
	
end



-- set teachTarget
-----------------------------------------------------------
local function setteachTarget(args)
	local teachtarget = args["input"]
	local saveflag = args["save"]


	if tonumber(teachtarget) then
		cecho("<red>ERROR: Invalid teaching target\n")
	else
		Status.teachTarget = teachtarget
		if saveflag then dba.execute('UPDATE channel SET teachTarget="'..Status.teachTarget..'"') end
		cecho("<yellow>Channel: Teaching target updated\n")
	end
	
end



-- set powercastAmount
-----------------------------------------------------------
local function setpowercastAmount(args)
	local powercastamount = tonumber(args["input"])
	local saveflag = args["save"]


	if not powercastamount then
		cecho("<red>ERROR: Invalid powercast value\n")
	else
		if (powercastamount < 100) or (powercastamount > 999) then
			cecho("<red>ERROR: Invalid powercast value\n")
		else
			Status.powercastAmount = powercastamount
			if saveflag then dba.execute('UPDATE channel SET powercastAmount='..Status.powercastAmount) end
			cecho("<yellow>Channel: Powercast value updated\n")
		end
	end
	
end



-- set powercastAddon
-----------------------------------------------------------
local function setpowercastAddon(args)
	local powercastaddon = tonumber(args["input"])
	local saveflag = args["save"]


	if not powercastaddon then
		cecho("<red>ERROR: Invalid powercast addon value\n")
	else
		if (powercastaddon < -999) or (powercastaddon > 999) then
			cecho("<red>ERROR: Invalid powercast addon value\n")
		else
			Status.powercastAddon = powercastaddon
			if saveflag then dba.execute('UPDATE channel SET powercastAddon='..Status.powercastAddon) end
			cecho("ChannelTextBox2", "<yellow>POWERCAST MOD:&nbsp;&nbsp;&nbsp;"..Status.powercastAddon)
			cecho("<yellow>Channel: Powercast addon value updated\n")
		end
	end
	
end



-- set feedTarget
-----------------------------------------------------------
local function setfeedTarget(args)
	local feedtarget = args["input"]
	local saveflag = args["save"]

	
	if tonumber(feedtarget) then
		cecho("<red>ERROR: Invalid feeding target\n")
	else
		Status.feedTarget = feedtarget
		if saveflag then dba.execute('UPDATE channel SET feedTarget="'..Status.feedTarget..'"') end
		cecho("<yellow>Channel: Feeding target updated\n")
	end

end



-- set Status.focusAmountFeed
-----------------------------------------------------------
local function setfocusAmountFeed(args)
	local focusamountfeed = tonumber(args["input"])
	local saveflag = args["save"]


	if not focusamountfeed then
		cecho("<red>ERROR: Invalid feeding channel value\n")
	else
		if (focusamountfeed < 1) or (focusamountfeed > 100) then
			cecho("<red>ERROR: Invalid feeding channel value\n")
		else
			Status.focusAmountFeed = focusamountfeed
			if saveflag then dba.execute('UPDATE channel SET focusAmountFeed='..Status.focusAmountFeed) end
			cecho("<yellow>Channel: Feeding channel value updated\n")
		end
	end
	
end



-- set focusTarget
-----------------------------------------------------------
local function setfocusTarget(args)
	local focustarget = args["input"]
	local saveflag = args["save"]

	
	if tonumber(focustarget) then
		cecho("<red>ERROR: Invalid focus target\n")
	else
		Status.focusTarget = focustarget
		if saveflag then dba.execute('UPDATE channel SET focusTarget="'..Status.focusTarget..'"') end
		cecho("<yellow>Channel: Focus target updated\n")
	end
	
end



-- set focusTargetSource
-----------------------------------------------------------
local function setfocusTargetSource(args)
	local focustargetsource = args["input"]
	local saveflag = args["save"]

	
	if tonumber(focustargetsource) then
		cecho("<red>ERROR: Invalid focus target source\n")
	else
		Status.focusTargetSource = focustargetsource
		if saveflag then dba.execute('UPDATE channel SET focusTargetSource="'..Status.focusTargetSource..'"') end
		cecho("<yellow>Channel: Focus target source updated\n")
	end
	
end



-- set focusAmountTeach
-----------------------------------------------------------
local function setfocusAmountTeach(args)
	local focusamountteach = tonumber(args["input"])
	local saveflag = args["save"]


	if not focusamountteach then
		cecho("<red>ERROR: Invalid teaching channel value\n")
	else
		if (focusamountteach < 1) or (focusamountteach > 100) then
			cecho("<red>ERROR: Invalid teaching channel value\n")
		else
			Status.focusAmountTeach = focusamountteach
			if saveflag then dba.execute('UPDATE channel SET focusAmountTeach='..Status.focusAmountTeach) end
			cecho("<yellow>Channel: Teaching channel value updated\n")
		end
	end
	
end



-- set channel addon command
-----------------------------------------------------------
local function setchannelAddonCommand(args)
	local channeladdoncommand = args["input"]
	local saveflag = args["save"]


	Status.cmdAddon = channeladdoncommand
	if saveflag then dba.execute('UPDATE channel SET cmdAddon="'..Status.cmdAddon..'"') end
	cecho("<yellow>Channel: Channel addon command updated\n")
end



-- compute powercast number
-----------------------------------------------------------
local function computePowercast(args)
	local results = dba.query('SELECT count FROM improves WHERE who="'..Status.name..'" AND skill="spell casting"')[1]
	local spellcasting = tonumber(results.count)
	local powercastNumber = (spellcasting + Status.powercastAddon) * 100
	if powercastNumber < 100 then powercastNumber = 100 end
	
	return powercastNumber
end



-- perform a powercast
-----------------------------------------------------------
local function processPowercast(args)
	local powercastNumber = computePowercast()


	if not Status.powercastPauseisActive then
		if Status.focusTargetSource == "" then
			send("discharge " .. Status.focusTarget)
		else
			send("get " .. Status.focusTarget .. " from " .. Status.focusTargetSource)
			send("discharge " .. Status.focusTarget)
			send("put " .. Status.focusTarget .. " in " .. Status.focusTargetSource)
		end
		
		Status.focusTotal = 0
		updateFocusDisplay()
	end
	

	if (Status.powercastPause ~= "on") or (Status.powercastPauseisActive) then
	
		if Status.channelMode == "PC + TEACH" then
			send("stop teaching")
			send("cast ! lg @"..powercastNumber)
			send("teach "..Status.teachTarget)
		else
			send("cast ! lg @"..powercastNumber)
		end

		Status.powercastisForce = false
		Status.powercastTotal = Status.powercastTotal + 1
		dba.execute('UPDATE channel SET powercastTotal='..Status.powercastTotal)
		cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
		cecho("ChannelTextBox4", Info.showPowercastPercentage())
		cecho("<"..Status.channelColorEcho..">BEGIN POWERCAST (Time since last: "..computeTimeElapsed()..")\n")
	end
	
	if (Status.powercastPause == "on") then
		if Status.powercastPauseisActive then
			Status.powercastPauseisActive = false
		else
			Status.powercastPauseisActive = true
		end
	end
	
end



-- perform a channel
-----------------------------------------------------------
local function processChannel(args)
	local amount		= args["amount"]
	local focusamount	= 0
	local focustarget	= ""

	if amount then
		focusamount = amount
		if (Status.channelMode == "FEED AURA") then
			focustarget = Status.feedTarget
		else
			focustarget = Status.focusTarget
		end
	elseif (Status.channelMode == "PC + TEACH") then
		focusamount = Status.focusAmountTeach
		focustarget = Status.focusTarget
	elseif (Status.channelMode == "FEED AURA") then
		focusamount = Status.focusAmountFeed
		focustarget = Status.feedTarget
	else
		focusamount = Status.focusAmountDefault
		focustarget = Status.focusTarget
	end

	send("channel " .. focusamount .. " " .. focustarget, false)

	if Status.cmdAddon ~= "" then
		expandAlias(Status.cmdAddon)
	end
	
	if (Status.channelMode ~= "FEED AURA") or (Status.feedTarget == Status.focusTarget) then
		Status.focusTotal = Status.focusTotal + focusamount
		updateFocusDisplay()
	end

	if (Status.focusTotal >= Status.powercastAmount) and
	(Status.channelMode ~= "CHANNEL ONLY") and
	(Status.channelMode ~= "FEED AURA") and
	(Status.statusPlaySound ~= "off") then
		playSoundFile({name = packageFolder.."MEDIA/"..Status.powercastSoundFile})
	end

	if Status.statusFocusTotal == "on" then
		if Status.focusTotal < 10 then
			cecho("\n<" .. Status.channelColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t\t")
		else
			cecho("\n<" .. Status.channelColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t")
		end
	end
end



-- set /chan share command
-----------------------------------------------------------
local function setChanShare(args)
	local setting = string.lower(args["detail"])


	if tonumber(setting) or not ((setting == "brief") or (setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /chan share value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /chan share on|off|brief - Change settings of the channel share button (current setting: "..Status.statusChanShare..")\n")
	else
		Status.statusChanShare = setting
		dba.execute('UPDATE channel SET statusChanShare="'..Status.statusChanShare..'"')
		
		if (Status.statusChanShare == "off") then
			GUI.containerChannelButton4:setStyleSheet(StyleButtonDarkGrey:getCSS())
		else
			GUI.containerChannelButton4:setStyleSheet(StyleButtonLightGrey:getCSS())
		end
		
		cecho("<yellow>Channel: /chan share value updated\n")
	end
	
end



-- set /focus command
-----------------------------------------------------------
local function setFocusTotal(args)
	local setting = string.lower(args["detail"])


	if tonumber(setting) or not ((setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /focus value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /focus on|off - Show running focus total in main window (current setting: "..Status.statusFocusTotal..")\n")
	else
		Status.statusFocusTotal = setting
		dba.execute('UPDATE channel SET statusFocusTotal="'..Status.statusFocusTotal..'"')
		cecho("<yellow>Channel: /focus value updated\n")
	end
	
end



-- set /chan sound command
-----------------------------------------------------------
local function setChanSound(args)
	local setting = string.lower(args["detail"])


	if tonumber(setting) or not ((setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /chan sound value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /chan sound on|off - Play notification sound before powercast (current setting: "..Status.statusPlaySound..")\n")
	else
		Status.statusPlaySound = setting
		dba.execute('UPDATE channel SET statusPlaySound="'..Status.statusPlaySound..'"')
		cecho("<yellow>Channel: /chan sound value updated\n")
	end
	
end



-- set /chan pause command
-----------------------------------------------------------
local function setChanPause(args)
	local setting = string.lower(args["detail"])


	if tonumber(setting) or not ((setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /chan pause value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /chan pause on|off - Pause powercast to wait for full concentration (current setting: "..Status.powercastPause..")\n")
	else
		Status.powercastPause = setting
		dba.execute('UPDATE channel SET powercastPause="'..Status.powercastPause..'"')
		cecho("<yellow>Channel: /chan pause value updated\n")
	end
	
end



-- reset the powercast stats
-----------------------------------------------------------
local function resetPowercastStats()
	local query				= ""
	Status.powercastTotal	= 0
	Status.powercastSuccess	= 0
	Status.powercastPercent	= 0
	Status.focusTotal		= 0


	query = query..'UPDATE channel '
	query = query..'SET powercastTotal='..Status.powercastTotal..', '
	query = query..'powercastSuccess='..Status.powercastSuccess
	dba.execute(query)

	cecho("ChannelTextBox1", Info.showSpellCasting())
	cecho("ChannelTextBox2", "<yellow>POWERCAST MOD:&nbsp;&nbsp;&nbsp;"..Status.powercastAddon)
	cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
	cecho("ChannelTextBox4", Info.showPowercastPercentage())
	cecho("ChannelTextBox16", "<magenta>"..Status.focusTotal.."%")
	cecho("<yellow>Channel: Reset powercast stats\n")
end



-- process single channel
-----------------------------------------------------------
local function processSingleChannel(args)
	local amount = tonumber(args["detail"])


	if (not amount) or (amount < 1) or (amount > 100) then
		cecho("<red>ERROR: Invalid /chan value\n")
	elseif  (Status.focusTotal >= Status.powercastAmount) and ((Status.channelMode == "POWERCAST") or (Status.channelMode == "PC + TEACH")) then
		Events.raiseEvent("processPowercastEvent", {input = aura})
	else
		--if ((Status.channelMode == "FEED AURA") and (aura == "scintillating")) or (Status.channelMode ~= "FEED AURA") then
		processChannel({input = aura, amount = amount})
		--	Events.raiseEvent("processChannelEvent", {input = aura, amount = amount})
		--end
	end

end



-- save all channelling settings
-----------------------------------------------------------
local function saveChannelSettings(args)
	setpowercastAmount({save = false, input = GUI.containerChannelCommand4:getText()})
	setpowercastAddon({save = false, input = GUI.containerChannelCommand7:getText()})
	setfocusAmountDefault({save = false, input = GUI.containerChannelCommand1:getText()})
	setfocusAmountTeach({save = false, input = GUI.containerChannelCommand6:getText()})
	setfocusAmountFeed({save = false, input = GUI.containerChannelCommand8:getText()})
	setfocusTarget({save = false, input = GUI.containerChannelCommand2:getText()})
	setfocusTargetSource({save = false, input = GUI.containerChannelCommand3:getText()})
	setteachTarget({save = false, input = GUI.containerChannelCommand5:getText()})
	setfeedTarget({save = false, input = GUI.containerChannelCommand9:getText()})
	setchannelAddonCommand({save = false, input = GUI.containerChannelCommand10:getText()})
	Channelling.save()
end



-- build or update the table during setup
-----------------------------------------------------------
local function checkChannelTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS channel (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		channelColorEcho VARCHAR(16) DEFAULT "magenta",
		channelMode VARCHAR(16) DEFAULT "SELECT MODE",
		cmdAddon VARCHAR(64) DEFAULT "",
		feedTarget VARCHAR(16) DEFAULT "targetname",
		focusAmountDefault INTEGER DEFAULT 20,
		focusAmountFeed INTEGER DEFAULT 60,
		focusAmountTeach INTEGER DEFAULT 20,
		focusTarget VARCHAR(64) DEFAULT "necklace",
		focusTargetSource VARCHAR(64) DEFAULT "(held) scrip",
		powercastAddon INTEGER DEFAULT 3,
		powercastAmount INTEGER DEFAULT 500,
		powercastPause VARCHAR(16) DEFAULT "on",
		powercastSoundFile VARCHAR(64) DEFAULT "Speech On.wav",
		powercastSuccess INTEGER DEFAULT 0,
		powercastTotal INTEGER DEFAULT 0,
		statusChanShare VARCHAR(16) DEFAULT "brief",
		statusFocusTotal VARCHAR(16) DEFAULT "off",
		statusPlaySound VARCHAR(16) DEFAULT "on",
		teachTarget VARCHAR(16) DEFAULT "targetname"

	);]])

	local results = dba.query('SELECT id FROM channel')
	if results.count() == 0 then
		dba.execute('INSERT INTO channel DEFAULT VALUES')
	end

end



local function load()
	local result = {}

	result = dba.query('SELECT * FROM channel')[1]
	Status.channelColorEcho = result.channelColorEcho
	Status.channelMode = result.channelMode
	Status.cmdAddon = result.cmdAddon
	Status.feedTarget = result.feedTarget
	Status.focusAmountDefault = result.focusAmountDefault
	Status.focusAmountFeed = result.focusAmountFeed
	Status.focusAmountTeach = result.focusAmountTeach
	Status.focusTarget = result.focusTarget
	Status.focusTargetSource = result.focusTargetSource
	Status.powercastAddon = result.powercastAddon
	Status.powercastAmount = result.powercastAmount
	Status.powercastPause = result.powercastPause
	Status.powercastSoundFile = result.powercastSoundFile
	Status.powercastSuccess = result.powercastSuccess
	Status.powercastTotal = result.powercastTotal
	Status.statusChanShare = result.statusChanShare
	Status.statusFocusTotal = result.statusFocusTotal
	Status.statusPlaySound = result.statusPlaySound
	Status.teachTarget = result.teachTarget

end



local function save()
	local query = ""

	query = query..'UPDATE channel '
	query = query..'SET powercastTotal='..Status.powercastTotal..', '
	query = query..'powercastSuccess='..Status.powercastSuccess..', '
	query = query..'channelMode="'..Status.channelMode..'", '
	query = query..'focusAmountDefault='..Status.focusAmountDefault..', '
	query = query..'teachTarget="'..Status.teachTarget..'", '
	query = query..'powercastAmount='..Status.powercastAmount..', '
	query = query..'powercastAddon='..Status.powercastAddon..', '
	query = query..'feedTarget="'..Status.feedTarget..'", '
	query = query..'focusAmountFeed='..Status.focusAmountFeed..', '
	query = query..'focusTarget="'..Status.focusTarget..'", '
	query = query..'focusTargetSource="'..Status.focusTargetSource..'", '
	query = query..'focusAmountTeach='..Status.focusAmountTeach..', '
	query = query..'cmdAddon="'..Status.cmdAddon..'"'
	
	dba.execute(query)
end



local function setup(args)
	checkChannelTable()
	Events.addListener("singleChannelEvent", sourceName, processSingleChannel)
	Events.addListener("processPowercastEvent", sourceName, processPowercast)
	Events.addListener("processChannelEvent", sourceName, processChannel)
	Events.addListener("resetPowercastStatsEvent", sourceName, resetPowercastStats)
	Events.addListener("setchannelModeEvent", sourceName, setchannelMode)
	Events.addListener("setchannelAddonCommandEvent", sourceName, setchannelAddonCommand)
	Events.addListener("setteachTargetEvent", sourceName, setteachTarget)
	Events.addListener("setfeedTargetEvent", sourceName, setfeedTarget)
	Events.addListener("setpowercastAmountEvent", sourceName, setpowercastAmount)
	Events.addListener("setpowercastAddonEvent", sourceName, setpowercastAddon)
	Events.addListener("setfocusAmountDefaultEvent", sourceName, setfocusAmountDefault)
	Events.addListener("setfocusAmountFeedEvent", sourceName, setfocusAmountFeed)
	Events.addListener("setfocusAmountTeachEvent", sourceName, setfocusAmountTeach)
	Events.addListener("setfocusTargetEvent", sourceName, setfocusTarget)
	Events.addListener("setfocusTargetSourceEvent", sourceName, setfocusTargetSource)
	Events.addListener("saveChannelSettingsEvent", sourceName, saveChannelSettings)
	Events.addListener("setChanShareEvent", sourceName, setChanShare)
	Events.addListener("setChanSoundEvent", sourceName, setChanSound)
	Events.addListener("setFocusTotalEvent", sourceName, setFocusTotal)
	Events.addListener("setChanPauseEvent", sourceName, setChanPause)
end

local function unsetup(args)
	Events.removeListener("singleChannelEvent", sourceName)
	Events.removeListener("processPowercastEvent", sourceName)
	Events.removeListener("processChannelEvent", sourceName)
	Events.removeListener("resetPowercastStatsEvent", sourceName)
	Events.removeListener("setchannelModeEvent", sourceName)
	Events.removeListener("setchannelAddonCommandEvent", sourceName)
	Events.removeListener("setteachTargetEvent", sourceName)
	Events.removeListener("setfeedTargetEvent", sourceName)
	Events.removeListener("setpowercastAmountEvent", sourceName)
	Events.removeListener("setpowercastAddonEvent", sourceName)
	Events.removeListener("setfocusAmountDefaultEvent", sourceName)
	Events.removeListener("setfocusAmountFeedEvent", sourceName)
	Events.removeListener("setfocusAmountTeachEvent", sourceName)
	Events.removeListener("setfocusTargetEvent", sourceName)
	Events.removeListener("setfocusTargetSourceEvent", sourceName)
	Events.removeListener("saveChannelSettingsEvent", sourceName)
	Events.removeListener("setChanShareEvent", sourceName)
	Events.removeListener("setChanSoundEvent", sourceName)
	Events.removeListener("setFocusTotalEvent", sourceName)
	Events.removeListener("setChanPauseEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Channelling = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Channelling

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



-- set channelMode
-----------------------------------------------------------
local function setchannelMode(args)
	local channelmode = args["input"]
	
	Status.channelMode = channelmode
	send("conc", false)
	Channelling.save()
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
			if saveflag then Channelling.save() end
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
		if saveflag then Channelling.save() end
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
		if (powercastamount < 1) or (powercastamount > 999) then
			cecho("<red>ERROR: Invalid powercast value\n")
		else
			Status.powercastAmount = powercastamount
			if saveflag then Channelling.save() end
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
			cecho("ChannelTextBox2", "<yellow>POWERCAST MOD:&nbsp;&nbsp;&nbsp;"..Status.powercastAddon)
			if saveflag then Channelling.save() end
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
		if saveflag then Channelling.save() end
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
			if saveflag then Channelling.save() end
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
		if saveflag then Channelling.save() end
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
		if saveflag then Channelling.save() end
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
			if saveflag then Channelling.save() end
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
	if saveflag then Channelling.save() end
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
		Status.focusTotal = 0
		Status.powercastTotal = Status.powercastTotal + 1
		cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
		cecho("ChannelTextBox4", Info.showPowercastPercentage())
		cecho("<"..Status.channelColorEcho..">BEGIN POWERCAST (Time since last: "..computeTimeElapsed()..")\n")
		Channelling.save()
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
	local focusamount = 0
	local focustarget = ""
	
	if (Status.channelMode == "PC + TEACH") then
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
	
	Status.focusTotal = Status.focusTotal + focusamount
	
	if (Status.focusTotal >= Status.powercastAmount) and
	(Status.channelMode ~= "CHANNEL ONLY") and
	(Status.channelMode ~= "FEED AURA") and
	(Status.statusPlaySound ~= "off") then
		playSoundFile({name = packageFolder.."MEDIA/"..Status.powercastSoundFile})
	end
	
	if Status.focusTotal < 10 then
		cecho("\n<" .. Status.channelColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t\t")
	else
		cecho("\n<" .. Status.channelColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t")
	end
end



-- set /chan share command
-----------------------------------------------------------
local function setChanShare(args)
	local setting = args["detail"]


	if tonumber(setting) or not ((setting == "brief") or (setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /chan share value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /chan share on|off|brief - Change settings of the channel share button (current setting: "..Status.statusChanShare..")\n")
	else
		Status.statusChanShare = setting
		
		if (Status.statusChanShare == "off") then
			GUI.containerChannelButton4:setStyleSheet(StyleButtonDarkGrey:getCSS())
		else
			GUI.containerChannelButton4:setStyleSheet(StyleButtonLightGrey:getCSS())
		end
		
		Channelling.save()
		cecho("<yellow>Channel: /chan share value updated\n")
	end
	
end



-- set /chan sound command
-----------------------------------------------------------
local function setChanSound(args)
	local setting = args["detail"]


	if tonumber(setting) or not ((setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /chan sound value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /chan sound on|off - Play notification sound before powercast (current setting: "..Status.statusPlaySound..")\n")
	else
		Status.statusPlaySound = setting
		Channelling.save()
		cecho("<yellow>Channel: /chan sound value updated\n")
	end
	
end



-- set /chan pause command
-----------------------------------------------------------
local function setChanPause(args)
	local setting = args["detail"]


	if tonumber(setting) or not ((setting == "on") or (setting == "off") or (setting == "help")) then
		cecho("<red>ERROR: Invalid /chan pause value\n")
	elseif (setting == "help") then
		cecho("<yellow>USAGE: /chan pause on|off - Pause powercast to wait for full concentration (current setting: "..Status.powercastPause..")\n")
	else
		Status.powercastPause = setting
		Channelling.save()
		cecho("<yellow>Channel: /chan pause value updated\n")
	end
	
end



-- reset the powercast stats
-----------------------------------------------------------
local function resetPowercastStats()
	Status.powercastTotal = 0
	Status.powercastSuccess = 0
	Status.powercastPercent = 0
	Status.focusTotal = 0
	cecho("ChannelTextBox1", Info.showSpellCasting())
	cecho("ChannelTextBox2", "<yellow>POWERCAST MOD:&nbsp;&nbsp;&nbsp;"..Status.powercastAddon)
	cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
	cecho("ChannelTextBox4", Info.showPowercastPercentage())
	cecho("<yellow>Channel: Reset powercast stats\n")
	Channelling.save()
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



local function loaderFunction(sentTable)
	if sentTable then
		Status.channelMode = sentTable["channelMode"] or ""
		Status.statusPowercast = sentTable["statusPowercast"] or false
		Status.statusTeach = sentTable["statusTeach"] or false
		Status.statusFeed = sentTable["statusFeed"] or false
		Status.statusPlaySound = sentTable["statusPlaySound"] or true
		Status.powercastAddon = sentTable["powercastAddon"] or 3
		Status.powercastAmount = sentTable["powercastAmount"] or 500
		Status.powercastPercent = sentTable["powercastPercent"] or 0
		Status.powercastSuccess = sentTable["powercastSuccess"] or 0
		Status.powercastTotal = sentTable["powercastTotal"] or 0
		Status.focusAmountDefault = sentTable["focusAmountDefault"] or 20
		Status.focusAmountFeed = sentTable["focusAmountFeed"] or 60
		Status.focusAmountTeach = sentTable["focusAmountTeach"] or 20
		Status.focusTarget = sentTable["focusTarget"] or "necklace"
		Status.focusTargetSource = sentTable["focusTargetSource"] or "(held) scrip"
		Status.teachTarget = sentTable["teachTarget"] or "targetname"
		Status.feedTarget = sentTable["feedTarget"] or "targetname"
		Status.cmdAddon = sentTable["cmdAddon"] or ""
		Status.statusChanShare = sentTable["statusChanShare"] or "on"
		Status.statusPlaySound = sentTable["statusPlaySound"] or "on"
		Status.powercastPause = sentTable["powercastPause"] or "on"
	end
end




local function load()
	Events.raiseEvent("loadEvent",{
		sourceName = sourceName,
		functionToSendData = loaderFunction
	})
end



local function save()
	Events.raiseEvent("saveEvent",{
		sourceName = sourceName,
		tableToSave = {
			channelMode = Status.channelMode,
			statusPowercast = Status.statusPowercast,
			statusTeach = Status.statusTeach,
			statusFeed = Status.statusFeed,
			statusPlaySound = Status.statusPlaySound,
			powercastAddon = Status.powercastAddon,
			powercastAmount = Status.powercastAmount,
			powercastPercent = Status.powercastPercent,
			powercastSuccess = Status.powercastSuccess,
			powercastTotal = Status.powercastTotal,
			focusAmountDefault = Status.focusAmountDefault,
			focusAmountFeed = Status.focusAmountFeed,
			focusAmountTeach = Status.focusAmountTeach,
			focusTotal = Status.focusTotal,
			focusTarget = Status.focusTarget,
			focusTargetSource = Status.focusTargetSource,
			teachTarget = Status.teachTarget,
			feedTarget = Status.feedTarget,
			cmdAddon = Status.cmdAddon,
			statusChanShare = Status.statusChanShare,
			statusPlaySound = Status.statusPlaySound,
			powercastPause = powercastPause
		}
	})
end



local function setup(args)
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
	Events.addListener("setChanPauseEvent", sourceName, setChanPause)
end

local function unsetup(args)
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

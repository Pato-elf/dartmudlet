Auto = {}



-- compute powercast number
-----------------------------------------------------------
local function computePowercast(args)
	local results = dba.query('SELECT count FROM improves WHERE who="'..Status.name..'" AND skill="spell casting"')[1]
	local spellcasting = tonumber(results.count)
	local powercastNumber = (spellcasting + Status.powercastAddon) * 100
	
	return powercastNumber
end



-- display the powercasting stats
-----------------------------------------------------------
local function displayPowercastStats(args)
	local displaytype = args["detail"]
	local displaytext = ''
	local spellcasting = 0
	local powercastPercentDisplay = ""
	--local powercastNumber = computePowercast()
	local results = Skills.getSkill({who = Status.name, skill_name = "spell casting"})

	if results ~= -1 then spellcasting = tonumber(results.count) else spellcasting = 0 end

	if Status.powercastTotal == 0 then
		Status.powercastPercent = 0
	else
		Status.powercastPercent = (Status.powercastSuccess / Status.powercastTotal) * 100
	end
	
	powercastPercentDisplay = string.format("%.1f", Status.powercastPercent)
	
	displaytext = displaytext.."SPELLCASTING: "..spellcasting
	displaytext = displaytext.."   PCMOD: +"..Status.powercastAddon
	--displaytext = displaytext.."   FOCUS: "..Status.focusTotal
	displaytext = displaytext.."   SUCCESS: "..powercastPercentDisplay
	displaytext = displaytext.."% ("..Status.powercastTotal.." casts)"
	
	if displaytype == "share" then
		send("ooc "..displaytext)
	else
		cecho("<"..Status.channelColorEcho..">"..displaytext.."\n")
	end

end



-- perform a channel
-----------------------------------------------------------
local function processChannel(args)
	local focusamount = 0
	
	if Status.statusTeach then
		focusamount = Status.focusAmountTeach
	else
		focusamount = Status.focusAmountDefault
	end

	send("channel " .. focusamount .. " " .. Status.focusTarget, false)

	if Status.statusCmdAddon then
		expandAlias(Status.cmdAddon)
	end
	
	Status.focusTotal = Status.focusTotal + focusamount
	
	if (Status.focusTotal >= Status.powercastAmount) and (Status.statusPowercast) and (Status.statusPlaySound) then
		playSoundFile({name = packageFolder.."MEDIA/"..Status.powercastSoundFile})
	end
	
	if Status.focusTotal < 10 then
		cecho("\n<" .. Status.channelColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t\t")
	else
		cecho("\n<" .. Status.channelColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t")
	end
end



-- perform a powercast
-----------------------------------------------------------
local function processPowercast(args)
	local powercastNumber = computePowercast()
	
	-- check for Status.statusAnnounce
	send("get " .. Status.focusTarget .. " from " .. Status.focusTargetSource)
	send("discharge " .. Status.focusTarget)
	send("put " .. Status.focusTarget .. " in " .. Status.focusTargetSource)
	if Status.statusTeach then send("stop teaching") end
		send("cast ! lg @"..powercastNumber)
	if Status.statusTeach then send("teach "..Status.teachTarget) end
	
	Status.focusTotal = 0
	Status.powercastTotal = Status.powercastTotal + 1
	cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
	cecho("ChannelTextBox4", Info.showPowercastPercentage())
	cecho("<"..Status.channelColorEcho..">BEGIN POWERCAST\n")
	--displayPowercastStats("default")
end



-- incoming to process automated tasks
-- on bright eyed
-- on scintillating
-----------------------------------------------------------
local function processAutomation(args)
	
	if Status.statusRefresh then
		if (conc == "You're bright-eyed and bushy-tailed.") then
			send("cast ro @"..Status.refreshPower1.." "..Status.refreshTarget1)
		end
		
		
	elseif Status.statusChannel then
		if (aura == "scintillating") and (conc == "You're bright-eyed and bushy-tailed.") then
			if ((Status.focusTotal >= Status.powercastAmount) and (Status.statusPowercast)) then --or (matches[2] == "force") then
				processPowercast()
			else
				processChannel()
			end
		end
	end

end




















function setup(args)
	Events.addListener("displayStatsEvent", sourceName, displayPowercastStats)
	Events.addListener("auraAutoEvent", sourceName, processAutomation)
	Events.addListener("concAutoEvent", sourceName, processAutomation)
end



function unsetup(args)
	Events.removeListener("displayStatsEvent", sourceName)
	Events.removeListener("auraAutoEvent", sourceName)
	Events.removeListener("concAutoEvent", sourceName)
end



function resetup(args)
	unsetup(args)
	setup(args)
end



Auto =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Auto

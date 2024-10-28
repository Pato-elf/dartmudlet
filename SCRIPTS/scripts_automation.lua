Auto = {}



-- display the powercasting stats
-----------------------------------------------------------
local function displayPowercastStats(args)
	local displaytype				= args["detail"]
	local powercastPercentDisplay	= ""
	local displaytext				= ''
	local spellcasting


	if Status.statusChanShare == "off" then
		cecho("<red>ERROR: Channel stat sharing is disabled. Use (/chan share on) to enable\n")
		return 0
	end

	local results = Skills.getSkill({who = Status.name, skill_name = "spell casting"})

	if results ~= -1 then spellcasting = tonumber(results.count) else spellcasting = 0 end

	if Status.powercastTotal == 0 then
		Status.powercastPercent = 0
	else
		Status.powercastPercent = (Status.powercastSuccess / Status.powercastTotal) * 100
	end
	
	powercastPercentDisplay = string.format("%.1f", Status.powercastPercent)
	
	if (displaytype ~= "share") or (Status.statusChanShare ~= "brief") then
		displaytext = displaytext.."SPELLCASTING: "..spellcasting.."   "
	end
	
	displaytext = displaytext.."PCMOD: +"..Status.powercastAddon
	
	if (displaytype ~= "share") then
		displaytext = displaytext.."   FOCUS: "..Status.focusTotal
	end
	
	displaytext = displaytext.."   SUCCESS: "..powercastPercentDisplay
	displaytext = displaytext.."% ("..Status.powercastTotal.." casts)"
	
	if displaytype == "share" then
		send("ooc "..displaytext)
	else
		cecho("<"..Status.channelColorEcho..">"..displaytext.."\n")
	end

end



-- incoming to process automated tasks
-- on bright eyed
-- on scintillating
-----------------------------------------------------------
local function processAutomation(args)
	
	if Status.statusRefresh then
		if (conc == "You're bright-eyed and bushy-tailed.") then
			if (Status.refreshTarget1 ~= "") and (Status.refreshTarget1 ~= nil) then
				send("cast ro @"..Status.refreshPower1.." "..Status.refreshTarget1)
			end
			if (Status.refreshTarget2 ~= "") and (Status.refreshTarget2 ~= nil) then
				send("cast ro @"..Status.refreshPower2.." "..Status.refreshTarget2)
			end
		end
		
		
	elseif (Status.statusChannel) or (Status.powercastisForce) or (Status.powercastPauseisActive) then
		if (conc == "You're bright-eyed and bushy-tailed.") then --and (aura == "scintillating") then
			if Status.powercastisForce or Status.powercastPauseisActive then
				Events.raiseEvent("processPowercastEvent", {input = aura})
			elseif  (Status.focusTotal >= Status.powercastAmount) and ((Status.channelMode == "POWERCAST") or (Status.channelMode == "PC + TEACH")) then
					Events.raiseEvent("processPowercastEvent", {input = aura})
			else
				if ((Status.channelMode == "FEED AURA") and (aura == "scintillating")) or (Status.channelMode ~= "FEED AURA") then
					Events.raiseEvent("processChannelEvent", {input = aura})
				end
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

Auto = {}





-- perform a channel
-----------------------------------------------------------
local function processChannel(args)
	expandAlias("chan default")
	Status.focusTotal = Status.focusTotal + Status.focusAmountDefault
	if (Status.focusTotal >= Status.powercastAmount) and (Status.statusPowercast) and (Status.statusPlaySound) then
		playSoundFile({name = packageFolder.."MEDIA/"..pcsoundfile})
	end
	
	if focustotal < 10 then
		cecho("<" .. Status.powercastColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t\t")
	else
		cecho("<" .. Status.powercastColorEcho .. ">FOCUS TOTAL: " .. Status.focusTotal .. "%\t\t\t\t\t")
	end
end




-- incoming to process automated tasks
-----------------------------------------------------------
local function processChannelling(args)
	local powercastPercentDisplay = ""
	local results = dba.query('SELECT count FROM improves WHERE who="'..Status.name..'" AND skill="spell casting"')[1]
	local spellcasting = tonumber(results.count)
	local powercastNumber = (spellcasting + Status.powercastAddon) * 100


	if Status.powercastTotal == 0 then
		Status.powercastPercent = 0
	else
		Status.powercastPercent = (Status.powercastSuccess / Status.powercastTotal) * 100
	end
	
	powercastPercentDisplay = string.format("%.1f", Status.powercastPercent)

	local text = ''
	text = text.."\nPOWERCAST: "..powercastNumber
	text = text.."   PCMOD: +"..Status.powercastAddon
	text = text.."   FOCUS: "..Status.focusTotal
	text = text.."%   SUCCESS: "..powercastPercentDisplay
	text = text.."% ("..Status.powercastTotal.." casts)"
	cecho("<"..Status.powercastColorEcho..">"..text)

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
		--echo(aura.." "..conc.."\n");
		if (aura == "scintillating") and (conc == "You're bright-eyed and bushy-tailed.") then
			if ((Status.focusTotal >= Status.powercastAmount) and (Status.statusPowercast)) then --or (matches[2] == "force") then
				--powercast function
				echo("powercast time\n")
			else
				processChannel()
			end
			processChannelling()
		end
	end

end




















function setup(args)
	Events.addListener("auraAutoEvent", sourceName, processAutomation)
	Events.addListener("concAutoEvent", sourceName, processAutomation)
end



function unsetup(args)
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

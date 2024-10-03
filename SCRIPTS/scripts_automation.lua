Auto = {}

statusRefresh = false
statusChannel = false

refreshPower1 = 80
refreshTarget1 = "sianna"
refreshType1	= "auto"
refreshPower1 = 80
refreshTarget1 = ""
refreshType1	= "auto"



-- incoming to process automated tasks
-- on bright eyed
-- on scintillating
-----------------------------------------------------------
local function processAutomation(args)
	
	if statusRefresh then
		if (conc == "You're bright-eyed and bushy-tailed.") then
			send("cast ro @"..refreshPower1.." "..refreshTarget1)
		end
		
		
	elseif statusChannel then
		--echo(aura.." "..conc.."\n");
		if (aura == "scintillating") and (conc == "You're bright-eyed and bushy-tailed.") then
			expandAlias("chan default")
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

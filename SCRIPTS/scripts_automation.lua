Auto = {}





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

local Info = {}
local aliases = {}



local function setup(args)
	tempAliases = {}


	-- # repeat command	
	-------------------------------------------------------
	tempAliases.repeatCommand =
	tempAlias("^#(\\d+) (.*)$",
		[[
			for i = 1, tonumber(matches[2]) do
				expandAlias(matches[3])
			end
		]])



-- /help command	
---------------------------------------------------------------------
  	tempAliases.showHelp =
      tempAlias('^\\/help(?: )?(.*)',
								[[
									local detail = matches[2]
									local arguments = {detail = detail, who = Status.name}
									Events.raiseEvent('showHelpEvent', arguments)
								]])



-- /levels command
---------------------------------------------------------------------
  	tempAliases.showLevels =
      tempAlias('^\\/levels(?: )?(.*)',
								[[
									local detail = matches[2]
									local arguments = {detail = detail, who = Status.name}
									Events.raiseEvent('showLevelsEvent', arguments)
								]])



-- /conc command
---------------------------------------------------------------------
  	tempAliases.setConc =
      tempAlias('^\\/conc (.*)$',
								[[
									local detail = matches[2]
									local arguments = {detail = detail, who = Status.name}
									Events.raiseEvent('setConcEvent', arguments)
								]])



	aliases = tempAliases
end



local function unsetup(args)
	for i,v in pairs(aliases) do
		killAlias(v)
	end
end


local function resetup(args)
	unsetup(args)
	setup(args)
end



Info =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Info

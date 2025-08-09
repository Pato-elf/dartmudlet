local Info		= {}
local aliases	= {}



local function setup(args)
	tempAliases = {}


	-- # repeat command	
	-------------------------------------------------------
	tempAliases.repeatCommand =
	tempAlias("^#(\\d+) (.*)$",
		[[
			local repeatCommand = matches[3]
			for i = 1, tonumber(matches[2]) do
				expandAlias(repeatCommand)
			end
		]])



    -- # wait command	
	-------------------------------------------------------
	tempAliases.waitCommand =
	tempAlias("^#(?:W|w)(\\d+) (.*)$",
		[[
            local waittime = tonumber(matches[2])
            local command = matches[3]
            tempTimer(waittime, function() expandAlias(command) end)
            --tempTimer(waittime, expandAlias(command))
		--	for i = 1, tonumber(matches[2]) do
		--		expandAlias(matches[3])
		--	end
		]])



	-- /help command	
	-------------------------------------------------------
	tempAliases.showHelp =
	tempAlias('^\\/help(?: )?(.*)',
		[[
			local detail = matches[2]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('showHelpEvent', arguments)
		]])



	-- /levels command
	-------------------------------------------------------
	tempAliases.showLevels =
	tempAlias('^\\/levels(?: )?(.*)',
		[[
			local detail = matches[2]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('showLevelsEvent', arguments)
		]])



	-- /set conc command
	-------------------------------------------------------
	tempAliases.setConc =
	tempAlias('^\\/(set conc|conc) (.*)$',
		[[
			local detail = matches[3]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('setConcEvent', arguments)
		]])



	-- /set aura
	-------------------------------------------------------
	tempAliases.setAura =
	tempAlias('^\\/(set aura|aura) (.*)$',
		[[
			local detail = matches[3]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('setAuraEvent', arguments)
		]])



	-- /set contents
	-------------------------------------------------------
	tempAliases.setContents =
	tempAlias('^\\/(set contents|contents) (.*)$',
		[[
			local detail = matches[3]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('setContentsEvent', arguments)
		]])



	-- /random command
	-------------------------------------------------------
	tempAliases.showRandom =
	tempAlias('^\\/random (.*)$',
		[[
			local detail = matches[2]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('showRandomEvent', arguments)
		]])



    -- /date command
	-------------------------------------------------------
	tempAliases.showDate =
	tempAlias('^\\/date(.*)?$',
		[[
			local detail = matches[2]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('showDateEvent', arguments)
		]])



	-- /set fontsize
	-------------------------------------------------------
	tempAliases.setFontSize =
	tempAlias('^\\/set fontsize ([\\w]+) ([\\d]+)',
		[[
			local detail = matches[2]
			local size = matches[3]
			local arguments = {detail = detail, size = size}
			Events.raiseEvent('setFontSizeEvent', arguments)
		]])



	-- /set alignment
	-------------------------------------------------------
	tempAliases.setAlignment =
	tempAlias('^\\/set alignment (.*)$',
		[[
			local detail = matches[2]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('setAlignmentEvent', arguments)
		]])



    -- /set keypad
    -------------------------------------------------------
	tempAliases.setKeypad =
	tempAlias('^\\/set keypad ([\\w]+)',
		[[
			local detail = matches[2]
			local arguments = {detail = detail}
			Events.raiseEvent('setKeypadEvent', arguments)
		]])



	-- /set help
    -------------------------------------------------------
	tempAliases.setHelp =
	tempAlias('^\\/(set|set help)$',
		[[
			local arguments = {detail = "set"}
			Events.raiseEvent('showHelpEvent', arguments)
		]])



	-- /alloc copy
	-------------------------------------------------------
	tempAliases.allocCopy =
	tempAlias('^\\/alloc copy ([\\d]+) ([\\d]+)',
		[[
			local source = matches[2]
			local target = matches[3]
			local arguments = {source = source, target = target}
			Events.raiseEvent('allocCopyEvent', arguments)
		]])



	-- /repeat copy
	-------------------------------------------------------
	tempAliases.repeatCopy =
	tempAlias('^\\/repeat copy ([\\d]+) ([\\d]+)',
		[[
			local source = matches[2]
			local target = matches[3]
			local arguments = {source = source, target = target}
			Events.raiseEvent('repeatCopyEvent', arguments)
		]])



	-- /alloc clear
	-------------------------------------------------------
	tempAliases.allocClear =
	tempAlias('^\\/alloc clear ([\\d]+)',
		[[
			local target = matches[2]
			local arguments = {target = target}
			Events.raiseEvent('allocClearEvent', arguments)
		]])



	-- /repeat clear
	-------------------------------------------------------
	tempAliases.repeatClear =
	tempAlias('^\\/repeat clear ([\\d]+)',
		[[
			local target = matches[2]
			local arguments = {target = target}
			Events.raiseEvent('repeatClearEvent', arguments)
		]])



    -- /repeat echo
	-------------------------------------------------------
	tempAliases.repeatEcho =
	tempAlias('^\\/repeat echo ([\\w]+)',
		[[
			local detail = matches[2]
			local arguments = {detail = detail}
			Events.raiseEvent('setRepeatEchoEvent', arguments)
		]])



    -- /track command
	-------------------------------------------------------
	tempAliases.track =
	tempAlias('^\\/track ([\\w]+)',
		[[
			local name = matches[2]
            
            if (string.lower(name) == "help") then
                local arguments = {detail = "track"}
                Events.raiseEvent('showHelpEvent', arguments)
            else
                local arguments = {name = name}
			    Events.raiseEvent('showTrackingDetailEvent', arguments)
            end
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

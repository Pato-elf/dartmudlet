local Announce_Aliases  = {}
local aliases           = {}



local function setup(args)
	tempAliases = {}

	tempAliases.announceOn =
	tempAlias("^\\/(set announce|announce) on",
		[[
			local arguments = {}
			Events.raiseEvent("announceOnEvent", arguments)
		]])



	tempAliases.announceBrief =
	tempAlias("^\\/(set announce|announce) brief",
		[[
			local arguments = {}
			Events.raiseEvent("announceBriefEvent", arguments)
		]])



	tempAliases.announceVerbose =
	tempAlias("^\\/(set announce|announce) verbose",
		[[
			local arguments = {}
			Events.raiseEvent("announceVerboseEvent", arguments)
		]])



	tempAliases.announceOff =
	tempAlias("^\\/(set announce|announce) off",
		[[
			local arguments = {}
			Events.raiseEvent("announceOffEvent", arguments)
		]])



    tempAliases.announceHelp =
	tempAlias("^\\/(set announce|announce) (help|pet|pets|player|players)$",
		[[
			local arguments = {detail = "announce"}
            Events.raiseEvent("showHelpEvent", arguments)
		]])



	-- /set announce pets
	-------------------------------------------------------
	tempAliases.announcePets =
	tempAlias('^\\/(set announce|announce) (pet|pets) (.*)$',
		[[
			local detail = matches[4]
			local arguments = {detail = detail, who = Status.name}
			Events.raiseEvent('announcePetEvent', arguments)
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



Announce_Aliases =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Announce_Aliases

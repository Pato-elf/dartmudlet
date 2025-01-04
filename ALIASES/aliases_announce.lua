local Announce_Aliases  = {}
local aliases           = {}



local function setup(args)
	tempAliases = {}

	tempAliases.announceOn =
	tempAlias("^\\/announce on",
		[[
			local arguments = {}
			Events.raiseEvent("announceOnEvent", arguments)
		]])



	tempAliases.announceBrief =
	tempAlias("^\\/announce brief",
		[[
			local arguments = {}
			Events.raiseEvent("announceBriefEvent", arguments)
		]])



	tempAliases.announceVerbose =
	tempAlias("^\\/announce verbose",
		[[
			local arguments = {}
			Events.raiseEvent("announceVerboseEvent", arguments)
		]])



	tempAliases.announceOff =
	tempAlias("^\\/announce off",
		[[
			local arguments = {}
			Events.raiseEvent("announceOffEvent", arguments)
		]])



    tempAliases.announceHelp =
	tempAlias("^\\/announce help",
		[[
			local arguments = {detail = "announce"}
            Events.raiseEvent("showHelpEvent", arguments)
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

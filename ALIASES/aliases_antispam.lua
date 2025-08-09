local AntiSpam_Aliases  = {}
local aliases           = {}



local function setup(args)
	local tempAliases = {}

	tempAliases.AntiSpamOn =
	tempAlias("^\\/(set antispam|antispam) [Oo][Nn]",
		[[
			local arguments = {}
			Events.raiseEvent("antiSpamOnEvent", arguments)
		]])



	tempAliases.AntiSpamOff =
	tempAlias("^\\/(set antispam|antispam) [Oo][Ff][Ff]",
		[[
			local arguments = {}
			Events.raiseEvent("antiSpamOffEvent", arguments)
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



AntiSpam_Aliases =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return AntiSpam_Aliases

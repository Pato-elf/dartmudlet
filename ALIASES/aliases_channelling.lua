local Channelling_Aliases = {}
local aliases = {}



local function setup(args)
	tempAliases = {}



	--display channelling information to self
	tempAliases.chanInfo =
	tempAlias("^\\/chan info",
		[[
			local arguments = {detail = "info"}
			Events.raiseEvent("displayStatsEvent", arguments)
		]])



	--change channelling share settings
	tempAliases.chanShare =
	tempAlias("^\\/chan share ([\\w]+)",
		[[
			local detail = matches[2]
			local arguments = {detail = detail}
			Events.raiseEvent("setChanShareEvent", arguments)
		]])



	--change channelling sound settings
	tempAliases.chanSound =
	tempAlias("^\\/chan sound ([\\w]+)",
		[[
			local detail = matches[2]
			local arguments = {detail = detail}
			Events.raiseEvent("setChanSoundEvent", arguments)
		]])			



	--change channelling pause settings
	tempAliases.chanPause =
	tempAlias("^\\/chan pause ([\\w]+)",
		[[
			local detail = matches[2]
			local arguments = {detail = detail}
			Events.raiseEvent("setChanPauseEvent", arguments)
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



Channelling_Aliases =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Channelling_Aliases

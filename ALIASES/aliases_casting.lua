local Casting_Aliases = {}
local aliases = {}



local function setup(args)
	tempAliases = {}

	-- begin practice casting
	tempAliases.practiceCast =
	tempAlias("^\\/[Cc][Aa][Ss][Tt] (\\w+) (\\d+)(?: ([\\w,\\s]+))?",
		[[
			local spellName = string.lower(matches[2])
			local power = tonumber(matches[3]) or 100
			local spellArguments = matches[4] or ""
			local arguments = {spellName = spellName, power = power, spellArguments = spellArguments}
			Events.raiseEvent("practiceCastEvent", arguments)
		]])



	-- stop practice casting
	tempAliases.practiceCastOff =
	tempAlias("^\\/[Cc][Aa][Ss][Tt] [Oo][Ff][Ff]",
		[[
			local arguments = {}
			Events.raiseEvent("practiceCastOffEvent", arguments)
		]])



	-- adjust power for practice cast
	tempAliases.castAdjustPower =
	tempAlias("^\\/[Cc][Aa][Ss][Tt] [Pp][Oo][Ww][Ee][Rr] (\\d+)",
		[[
			local power = tonumber(matches[2]) or 100
			local arguments = {power = power}
			Events.raiseEvent("castPowerAdjustEvent", arguments)
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



Casting_Aliases =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Casting_Aliases

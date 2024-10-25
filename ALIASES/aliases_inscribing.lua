local Inscribing_Aliases	= {}
local aliases				= {}



local function setup(args)
	tempAliases = {}


	-- practice scroll writing
	tempAliases.practiceInscribing =
	tempAlias("^\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] (\\w+) (\\d+)",
		[[
			local spell = matches[2]
			local power = tonumber(matches[3]) or 100
			local arguments = {spell = spell, power = power}
			Events.raiseEvent("practiceInscribingEvent", arguments)
		]])



	-- stop practicing scroll writing
	tempAliases.inscribeOff =
	tempAlias("^\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] [Oo][Ff][Ff]",
		[[
			local arguments = {}
			Events.raiseEvent("practiceInscribingOffEvent", arguments)
		]])



	-- adjust power for scroll writing
	tempAliases.inscribeAdjustPower =
	tempAlias("^\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] [Pp][Oo][Ww][Ee][Rr] (\\d+)",
		[[
			local power = tonumber(matches[2]) or 100
			local arguments = {power = power}
			Events.raiseEvent("practiceInscribingAdjustPowerEvent", arguments)
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



Inscribing_Aliases =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Inscribing_Aliases

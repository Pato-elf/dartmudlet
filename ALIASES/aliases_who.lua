local Who_Aliases   = {}
local aliases       = {}



local function setup(args)
	tempAliases = {}


	tempAliases.whoOn =
	tempAlias("^\\/who on",
		[[
			local arguments = {}
			Events.raiseEvent("whoOnEvent", arguments)
		]])



	tempAliases.whoOff =
	tempAlias("^\\/who off",
		[[
			local arguments = {}
			Events.raiseEvent("whoOffEvent", arguments)
		]])



    tempAliases.whoHelp =
    tempAlias("^\\/who help",
        [[
            local arguments = {detail = "who"}
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



Who_Aliases =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Who_Aliases

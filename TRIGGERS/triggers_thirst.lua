local Thirst    = {}
local triggers  = {}


local function setup(args)
    local tempTriggers = {}


    tempTriggers.WellSlaked =
    tempRegexTrigger("^(?:> )*You are (well slaked)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}
			deleteLine()
            Events.raiseEvent("thirstEvent", arguments)
        ]])



    tempTriggers.NotThirsty =
    tempRegexTrigger("^(?:> )*You are (not thirsty)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}
			deleteLine()
            Events.raiseEvent("thirstEvent", arguments)
        ]])



    tempTriggers.SlightlyThirsty =
    tempRegexTrigger("^(?:> )*You are (slightly thirsty)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}
			deleteLine()
            Events.raiseEvent("thirstEvent", arguments)
        ]])



    tempTriggers.Thirsty =
    tempRegexTrigger("^(?:> )*You are (thirsty)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}
			deleteLine()
            Events.raiseEvent("thirstEvent", arguments)
        ]])


	tempTriggers.QuiteThirsty =
	tempRegexTrigger("^(?:> )*You are (quite thirsty)\\.",
		[[
			local thirst = matches[2]
			local arguments = {thirst = thirst}
			deleteLine()
			Events.raiseEvent("thirstEvent", arguments)
		]])



    tempTriggers.Parched =
    tempRegexTrigger("^(?:> )*You are (parched)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}
			deleteLine()
            Events.raiseEvent("thirstEvent", arguments)
        ]])



    tempTriggers.FaintFromThirst =
    tempRegexTrigger("^(?:> )*You are (faint from thirst)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}
			deleteLine()
            Events.raiseEvent("thirstEvent", arguments)
        ]])



    tempTriggers.CompletelyDehydrated =
    tempRegexTrigger("^(?:> )*You are (completely dehydrated)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}

            Events.raiseEvent("thirstEvent", arguments)
        ]])



    tempTriggers.DyingOfThirst =
    tempRegexTrigger("^(?:> )*You are (dying of thirst)\\.",
        [[
            local thirst = matches[2]
            local arguments = {thirst = thirst}

            Events.raiseEvent("thirstEvent", arguments)
        ]])

    triggers = tempTriggers
end



local function unsetup(args)
    for i,v in pairs(triggers) do
        killTrigger(v)
    end
    triggers = {}
end



local function resetup(args)
    unsetup(args)
    setup(args)
end



Thirst = {
    setup = setup
    ,unsetup = unsetup
    ,resetup = resetup
}

return Thirst

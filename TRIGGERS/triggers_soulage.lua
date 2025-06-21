local SoulAge   = {}
local triggers  = {}


local function setup(args)
    local tempTriggers = {}

    tempTriggers.SoulAge =
    tempRegexTrigger("^(?:> )*Your soul's age is: (\\d+) years(?:, (\\d+) months?)? by the (Common|Thorpian) Reckoning",
        [[
            local years		= matches[2]
            local months	= matches[3]
			local minutes	= 0

            if not months then
                months = 0
            end

            arguments = {years = years, months = months, minutes = minutes}
            Events.raiseEvent("SoulAgeEvent", arguments)
        ]])



	tempTriggers.SoulAge2 =
    tempRegexTrigger("^(?:> )*Your soul's age is: (\\d+) minutes",
        [[
            local years		= 0
            local months	= 0
			local minutes	= matches[2]

            arguments = {years = years, months = months, minutes = minutes}
            Events.raiseEvent("SoulAgeEvent", arguments)
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



SoulAge = {
    setup = setup,
    unsetup = unsetup,
    resetup = resetup
}

return SoulAge

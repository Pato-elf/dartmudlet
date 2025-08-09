local Alignment = {}
local triggers  = {}



local function setup(args)
	local tempTriggers = {}

	tempTriggers.Alignment1 =
	tempRegexTrigger("^(?:> )*You (\\w+) believe in (.*)\\.",
    [[
		local conviction	= matches[2] or ""
        local alignment		= matches[3] or ""
        local arguments		= {conviction = conviction,alignment = alignment}

    	Events.raiseEvent("alignmentEvent", arguments)
    ]])

	tempTriggers.Alignment2 =
	tempRegexTrigger("^(?:> )*You believe in (.*)\\.",
    [[
		local conviction	= "belief"
        local alignment		= matches[2] or ""
        local arguments		= {conviction = conviction,alignment = alignment}

    	Events.raiseEvent("alignmentEvent", arguments)
    ]])

	tempTriggers.Alignment3 =
	tempRegexTrigger("^(?:> )*You believe moderately in (.*)\\.",
    [[
		local conviction	= "moderate"
        local alignment		= matches[2] or ""
        local arguments		= {conviction = conviction,alignment = alignment}

    	Events.raiseEvent("alignmentEvent", arguments)
    ]])

	tempTriggers.Alignment4 =
	tempRegexTrigger("^(?:> )*You have some belief in (.*)\\.",
    [[
		local conviction	= "some belief"
        local alignment		= matches[2] or ""
        local arguments		= {conviction = conviction,alignment = alignment}

    	Events.raiseEvent("alignmentEvent", arguments)
    ]])

	tempTriggers.Alignment5 =
	tempRegexTrigger("^(?:> )*You are a (zealot|fanatic) in (.*)\\.",
    [[
		local conviction	= matches[2] or ""
        local alignment		= matches[3] or ""
        local arguments		= {conviction = conviction,alignment = alignment}

    	Events.raiseEvent("alignmentEvent", arguments)
    ]])

	tempTriggers.Alignment6 =
	tempRegexTrigger("^(?:> )*You don't feel strongly about anything\\.",
    [[
		local conviction	= "none"
        local alignment		= matches[1] or ""
        local arguments		= {conviction = conviction,alignment = alignment}

    	Events.raiseEvent("alignmentEvent", arguments)
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

Alignment = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Alignment

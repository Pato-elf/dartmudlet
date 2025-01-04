local Skill_Triggers    = {}
local triggers          = {}



local function setup(args)
	local tempTriggers = {}


	-- trigger for skill improves - self
    ---------------------------------------------------------------------
	tempTriggers.SkillImproveSelf =
	tempRegexTrigger("^(?:> )*\\* You think your ([\\w'\\-# ]+) skill has improved\\. \\*$",
	[[
		local name = Status.name
		local skill_name = matches[2] or ""
		arguments = {name = name, skill_name = skill_name}
		if skill_name == "spell casting" then Status.powercastSuccess=(Status.powercastSuccess+1) end

		Events.raiseEvent("skillImproveEvent", arguments)
	]])



	-- trigger for skill improves - others
    ---------------------------------------------------------------------
	tempTriggers.SkillImproveOther =
	tempRegexTrigger("^(?:> )*\\* You think that ([A-Za-z]+)'s ([\\w'\\-# ]+) skill has improved\\. \\*$",
	[[
		local name = matches[2] or ""
		local skill_name = matches[3] or ""
		arguments = {name = name, skill_name = skill_name}

		Events.raiseEvent("skillImproveEvent", arguments)
	]])



	-- trigger for skill mistakes
    ---------------------------------------------------------------------
	tempTriggers.SkillMistake =
	tempRegexTrigger("^(?:> )*\\(But you were mistaken.\\)",
	[[
		arguments = {}
		Events.raiseEvent("skillMistakeEvent", arguments)
	]])



    -- show skill trigger for catching skill roll over
	---------------------------------------------------------------------
    shownSkill =
    tempRegexTrigger("^(?:> )*([A-Za-z'\\-_# ]+):\\s+([A-Za-z ]+)\\.$",
        [[
            local skill_name = string.lower(matches[2])
            local skill_level = string.lower(matches[3])
            local isFalseOoc = string.find(matches[1], "(ooc)")
            local _s, spaces = string.gsub(skill_name, " ", " ")
            spaces = spaces or 0

            -- collection of possible false triggers due to the common pattern used in show skills output
            -- if there is more than 1 space its a false positive
            if skill_name == "concentration" or
            skill_name == "encumbrance" or
            skill_name == "held" or
            skill_name == "worn" or
            spaces > 1 or
            not isFalseOoc == nil then
                return
            end

            args = {skill_name = skill_name, skill_level = skill_level}
            Events.raiseEvent("shownSkillEvent", args)
        ]])
    disableTrigger(shownSkill)


	triggers = tempTriggers
end



local function unsetup(args)
	for i,v in pairs(triggers) do
		killTrigger(v)
	end
    killTrigger(shownSkill)
	triggers = {}
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Skill_Triggers = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Skill_Triggers

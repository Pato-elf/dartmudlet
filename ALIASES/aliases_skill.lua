local Skill     = {}
local aliases   = {}



local function setup(args)
	tempAliases = {}

	--alias to manually insert skill into the database
	tempAliases.insertSkill =
	tempAlias('^\\/insert ([\\w]+) ([A-Za-z_#\\-\' ]+) ([\\d]+)',
		[[
			local who = matches[2]
			local skill_name = matches[3]
			local count = matches[4]
			local arguments = {skill_name = skill_name, who = who, count = count}
			Events.raiseEvent('insertSkillEvent', arguments)
		]])



	--alias to update an existing skill
	tempAliases.updateSkill =
	tempAlias('^\\/update ([\\w]+) ([A-Za-z_#\\-\' ]+) ([\\d]+)',
		[[
			local who = matches[2]
			local skill_name = matches[3]
			local count = matches[4]
			local arguments = {skill_name = skill_name, who = who, count = count}
			Events.raiseEvent('updateSkillEvent', arguments)
		]])



	--alias for skill information
	tempAliases.SkillInfo =
	tempAlias('^\\/info ([\\w]+) ([A-Za-z_#<>\\*\\-\' ]+)',
		[[
			local who           = matches[2]
			who                 = (who:gsub("^%l", string.upper))
			local skill_name    = matches[3]
            local type          = "info"
			local arguments     = {skill_name = skill_name, who = who, type = type}

			Events.raiseEvent('skillInfoEvent', arguments)
		]])



    --alias for skill information error
	tempAliases.SkillInfoError =
	tempAlias('^\\/info ([\\w]+)$',
		[[
            cecho("<yellow>DARTMUDLET: Usage: /info <name> <skill name|skill group>\n")
		]])



    --alias for sharing skill information
	tempAliases.ShareSkill =
	tempAlias('^\\/share ([\\w]+) ([A-Za-z_#<>\\*\\-\' ]+)',
		[[
			local who           = matches[2]
			who                 = (who:gsub("^%l", string.upper))
			local skill_name    = matches[3]
            local type          = "share"
			local arguments     = {skill_name = skill_name, who = who, type = type}

			Events.raiseEvent('skillInfoEvent', arguments)
		]])



    --alias for sharing skill error
	tempAliases.ShareSkillError =
	tempAlias('^\\/share ([\\w]+)$',
		[[
			cecho("<yellow>DARTMUDLET: Usage: /share <name> <skill name|skill group>\n")
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



Skill =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Skill

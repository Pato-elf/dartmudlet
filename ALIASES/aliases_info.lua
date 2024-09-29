local Info = {}
local aliases = {}

local function setup(args)
  tempAliases = {}

--  	tempAliases.updateSkill =
--      tempAlias('^\\/update ([\\w]+) ([A-Za-z_\' ]+) ([\\d]+)',
--								[[
--									local who = matches[2]
--                 local skill_name = matches[3]
--                 local count = matches[4]
--                  local arguments = {skill_name = skill_name, who = who, count = count}
--									Events.raiseEvent('updateSkillEvent', arguments)
--								]])


-- # repeat command	
---------------------------------------------------------------------
  	tempAliases.repeatCommand =
      tempAlias("^#(\\d+) (.*)$",
								[[
									for i = 1, tonumber(matches[2]) do
										expandAlias(matches[3])
									end
								]])



-- /help command	
---------------------------------------------------------------------
  	tempAliases.showHelp =
      tempAlias('^\\/help(?: )?(.*)',
								[[
									local detail = matches[2]
									local arguments = {detail = detail, who = Status.name}
									Events.raiseEvent('showHelpEvent', arguments)
								]])



-- /levels command
---------------------------------------------------------------------
  	tempAliases.showLevels =
      tempAlias('^\\/levels(?: )?(.*)',
								[[
									local detail = matches[2]
									local arguments = {detail = detail, who = Status.name}
									Events.raiseEvent('showLevelsEvent', arguments)
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

Info =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Info

--Need a score parser for increaseSkill() to work. To be more specific I need to parse the output from the game's "score" command.
--Still need to implement an adjuster that will fix the skill levels if it finds them to be in error.
Skills = {}

local sourceName = 'skills'

local previous_skill_value = {}


levels = {}
levels.mythic     = {name = "mythic",         abbr = "mythic",    min = "10000",  max = "99999", next_level = nil}
levels.leggy      = {name = "legendary",      abbr = "leggy",	  	min = "1700",	  max = "9999",  next_level = levels.mythic}
levels.gm         = {name = "a grand master", abbr = "gm",			  min = "1400",	  max = "1699",  next_level = levels.leggy}
levels.virtuoso   = {name = "a virtuoso",     abbr = "virtuoso",	min = "1200",  	max = "1399",  next_level = levels.gm}
levels.consummate = {name = "consummate",     abbr = "consummate",min = "1050", 	max = "1199",  next_level = levels.virtuoso}
levels.hm         = {name = "a high master",  abbr = "hm",			  min = "920",	  max = "1049",  next_level = levels.consummate}
levels.renowned   = {name = "renowned",       abbr = "renowned",	min = "825",  	max = "919",   next_level = levels.hm}
levels.adept      = {name = "an adept",       abbr = "adept",		  min = "740",	  max = "824",   next_level = levels.renowned}
levels.eminent    = {name = "eminent",        abbr = "eminent",   min = "660",	  max = "739",   next_level = levels.adept}
levels.master     = {name = "a master",       abbr = "master",		min = "585",	  max = "659",   next_level = levels.eminent}
levels.superb     = {name = "superb",         abbr = "superb",		min = "515",	  max = "584",   next_level = levels.master}
levels.expert     = {name = "an expert",      abbr = "expert",		min = "450",	  max = "514",   next_level = levels.superb}
levels.excellent  = {name = "excellent",      abbr = "excellent",	min = "390",	  max = "449",   next_level = levels.expert}
levels.vg         = {name = "very good",      abbr = "vg",			  min = "335",	  max = "389",   next_level = levels.excellent}
levels.adroit     = {name = "adroit",         abbr = "adroit",		min = "285",	  max = "334",   next_level = levels.vg}
levels.good       = {name = "good",           abbr = "good",		  min = "240",	  max = "284",   next_level = levels.adroit}
levels.prof       = {name = "proficient",     abbr = "prof",		  min = "200",	  max = "239",   next_level = levels.good}
levels.fair       = {name = "fair",           abbr = "fair",		  min = "165",	  max = "199",   next_level = levels.prof}
levels.able       = {name = "able",           abbr = "able",	  	min = "135",	  max = "164",   next_level = levels.fair}
levels.aa         = {name = "above average",  abbr = "aa",		  	min = "110",	  max = "134",   next_level = levels.able}
levels.avg        = {name = "average",        abbr = "avg",		    min = "90",		  max = "109",   next_level = levels.aa}
levels.ba         = {name = "below average",  abbr = "ba",			  min = "70",		  max = "89",    next_level = levels.avg}
levels.nvg        = {name = "not very good",  abbr = "nvg",		    min = "50",		  max = "69",    next_level = levels.ba}
levels.poor       = {name = "poor",           abbr = "poor",		  min = "30",		  max = "49",    next_level = levels.nvg}
levels.beginner   = {name = "a beginner",     abbr = "beginner",	min = "18",		  max = "29",    next_level = levels.poor}
levels.novice     = {name = "a novice",       abbr = "novice",		min = "10",		  max = "17",    next_level = levels.beginner}
levels.tyro       = {name = "a tyro",         abbr = "tyro",		  min = "4",		  max = "9",     next_level = levels.novice}
levels.unskilled  = {name = "unskilled",      abbr = "unskilled",	min = "1",		  max = "3",     next_level = levels.tyro}
levels.NoSkill    = {name = "no skill",       abbr = "noskill", 	min = "0",		  max = "0",     next_level = levels.unskilled}



-- get skill from database
-----------------------------------------------------------
local function getSkill(args)
	local who = args["who"]
	local skill_name = args["skill_name"]

	if not who then
		who = Status.name
	end

	local results = dba.query('SELECT * FROM improves WHERE who="'..who..'" AND skill="'..skill_name..'"')

	if results.count() == 0 then
		return -1
	end

	if results.count() > 1 then
		local i
		
		cecho("<red>ERROR: Too many results did you mean:\n")
		for i=1,results.count() do
			cecho("<red>\t"..results[i].skill.."\n")
		end
		return 0
	end
	return results[1]
end



-- imp2lvl
-----------------------------------------------------------
local function imp2lvl(imp)
	imp = tonumber(imp)

	for k,v in pairs(levels) do
		if(imp >= tonumber(v.min) and imp <= tonumber(v.max)) then
			return v
		end
	end
	return levels.NoSkill
end



-- name2lvl
-----------------------------------------------------------
function name2lvl(name)

	for k,v in pairs(levels) do
		if (v.name == name) then
			return v
		end
	end

	return levels.NoSkill
end



-- skill info command
-----------------------------------------------------------
local function skillInfo(args)
	local skill_name = args["skill_name"]
	local who = args["who"]
	local result = getSkill(args)

	if result == -1 then
		cecho("<red>ERROR: Unknown skill - "..skill_name.."\n")
		return
	end

	local count = tonumber(result.count)
	local level = imp2lvl(count)
	local nextLevel = level.next_level
	local output = count.." - "..level.abbr
	if nextLevel ~= nil then
	    tilNext = level.next_level.min - count
	    output = output.." - ("..tilNext.." / "..nextLevel.abbr..")"
	end
	cecho("<yellow>Information for "..who..": "..result.skill.."\n")
	cecho("<yellow>Improves: "..output.."\n")
end



-- perform skill increase, update improves box, check skill level
-----------------------------------------------------------
local function increaseSkill(args)
	local skill_name = args["skill_name"]
	local who = args["name"]

	local results = dba.query('SELECT * FROM improves WHERE who="'..who..'" AND skill="'..skill_name..'"')[1]
	local count = 1

	if results then
		previous_skill_value = {}
		for k,v in pairs(results) do
			previous_skill_value[k] = v
		end

		results.count = tonumber(results.count) + 1
		count = results.count
		dba.execute('UPDATE improves SET count='..count..' WHERE who="'..who..'" AND skill="'..skill_name..'"')
		dba.execute('UPDATE improves SET last_imp=datetime("NOW") WHERE who="'..who..'" AND skill="'..skill_name..'"')
	else
		previous_skill_value = {
			skill = skill_name,
			who = who,
			count = 0,
			last_imp = 0
		}
		dba.execute('INSERT INTO improves (skill, count, who, last_imp) VALUES("'..skill_name..'", 1, "'..who..'", datetime("NOW"))')
	end

	UI.onImprove({name = who, skill_name = skill_name})

	--Check skill level reported by the mud (if imp is for the character; mud doesn't report pet skill levels)
	if who == Status.name then
	shownSkill =
		tempRegexTrigger("^(?:> )*([A-Za-z'\\-_# ]+):\\s+([A-Za-z ]+)\\.$",
			[[
				local skill_name = string.lower(matches[2])
				local skill_level = string.lower(matches[3])
				local isStupidOoc = string.find(matches[1], "(ooc)")
				local _s, spaces = string.gsub(skill_name, " ", " ")
				spaces = spaces or 0

				-- collection of possible false triggers due to the common pattern used in show skills output
				-- if there is more than 1 space its a false positive
				if skill_name == "concentration" or
				skill_name == "encumbrance" or
				skill_name == "held" or
				skill_name == "worn" or
				spaces > 1 or
				not isStupidOoc == nil then
					return
				end
  
				args = {skill_name = skill_name, skill_level = skill_level}
				Events.raiseEvent("shownSkillEvent", args)
			]])

		send("show skills "..skill_name, false) --PATO
		tempTimer(15, [[disableTrigger(]]..shownSkill..[[)]])
	end

	return count
end



-- skill mistake
-----------------------------------------------------------
local function skillMistake()
	if previous_skill_value.count ~= nil then
		local count = previous_skill_value.count
		local skill_name = previous_skill_value.skill
		local who = previous_skill_value.who
		local last_imp = previous_skill_value.last_imp
		if(count ~= 0) then
			dba.execute('UPDATE improves SET count='..count..' WHERE who="'..who..'" AND skill="'..skill_name..'"')
			dba.execute('UPDATE improves SET last_imp=datetime(\''..last_imp..'\') WHERE who="'..who..'" AND skill="'..skill_name..'"')
		else
			dba.execute('UPDATE improves SET count='..count..' WHERE who="'..who..'" AND skill="'..skill_name..'"')
			dba.execute('UPDATE improves SET last_imp=datetime("NOW") WHERE who="'..who..'" AND skill="'..skill_name..'"')
		end

		previous_skill_value = {}
	end
end



-- update a skill count
-----------------------------------------------------------
local function updateCount(args)
	local count = args["count"]
	local who = args["who"]
	who = (who:gsub("^%l", string.upper))
	local skill_name = args["skill_name"]
	local skill = getSkill({who = who, skill_name = skill_name})

	if skill ~= nil and skill~= 0 and skill ~= -1 then
		dba.execute('UPDATE improves SET count='..count..' WHERE who="'..who..'" AND skill="'..skill_name..'"')
		local imptext = "Updating skill: "..skill_name.." from "..skill.count.." to "..count
		cecho("\n<yellow>"..imptext.."\n")	
		UI.onImprove({name = who, skill_name = skill_name, text = imptext})
	else
		cecho("<red>ERROR: Unknown skill - "..skill_name.."\n")
	end
end



-- insert a skill into the database
-----------------------------------------------------------
local function insertSkill(args)
	local count = args["count"]
	local who = args["who"]
	who = (who:gsub("^%l", string.upper))
	local skill_name = args["skill_name"]
	local skill = getSkill({who = who, skill_name = skill_name})

	if skill ~= nil and skill~= 0 and skill ~= -1 then
		cecho("<red>ERROR: Skill already in database\n")
	else
		dba.execute('INSERT INTO improves (skill, count, who, last_imp) VALUES("'..skill_name..'", '..count..', "'..who..'", datetime("NOW"))')
		local imptext = "Inserting skill: "..skill_name.." at "..count
		cecho("<yellow>"..imptext.."\n")
		UI.onImprove({name = who, skill_name = skill_name, text = imptext})
	end

end



-- check shown skill to see if it needs update or insert
-----------------------------------------------------------
local function shownSkill(args)
	local who = Status.name
	local skill_name = args["skill_name"]
	local skill_level = args["skill_level"]

	local skill = getSkill({who = who, skill_name = skill_name})

	if(skill == -1 ) then
		local imps = name2lvl(skill_level).min
		dba.execute('INSERT INTO improves (skill, count, who, last_imp) VALUES("'..skill_name..'", '..imps..', "'..who..'", datetime("NOW"))')
		local imptext = "Adding Skill: "..skill_name.." to database for "..who.." at count: "..imps
		cecho("<yellow>\n"..imptext)
		UI.onImprove({name = who, skill_name = skill_name, text = imptext})
	else
		local dba_count = skill.count
		local current_skill_level = imp2lvl(dba_count)
		actual_skill_level = name2lvl(skill_level)
		if(current_skill_level.name ~= actual_skill_level.name) then
			updateCount({count=actual_skill_level.min, who=who, skill_name=skill_name})
		end
	end
end



-- setup
-----------------------------------------------------------
local function setup(args)
	-- build database if needed
	dba.execute('CREATE TABLE IF NOT EXISTS "improves" (_row_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, skill TEXT, count INTEGER DEFAULT 1, notes TEXT, last_imp TIMESTAMP, who VARCHAR(16), abbr TEXT, weight TEXT, power INTEGER);');
	local directory = args["directory"]
	directory = directory.."/SCRIPTS/"

	Events.addListener("skillImproveEvent", sourceName, increaseSkill)
	Events.addListener("skillInfoEvent", sourceName, skillInfo)
	Events.addListener("skillMistakeEvent", sourceName, skillMistake)
	Events.addListener("shownSkillEvent", sourceName, shownSkill)
	Events.addListener("updateSkillEvent", sourceName, updateCount)
	Events.addListener("insertSkillEvent", sourceName, insertSkill)
end



local function unsetup(args)
	Events.removeListener("skillImproveEvent", sourceName)
	Events.removeListener("skillInfoEvent", sourceName)
	Events.removeListener("skillMistakeEvent", sourceName)
	Events.removeListener("shownSkillEvent", sourceName)
	Events.removeListener("updateSkillEvent", sourceName)
	Events.removeListener("insertSkillEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Skills =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	imp2lvl = imp2lvl,
	getSkill = getSkill,
	nextLevel = nextLevel
}

return Skills

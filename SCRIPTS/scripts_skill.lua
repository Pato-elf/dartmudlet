Skills                      = {}
local sourceName            = 'skills'
local previous_skill_value  = {}
levels                      = {}



levels.mythic     = {name = "mythic",         abbr = "mythic",      min = "10000",  max = "99999", next_level = nil}
levels.leggy      = {name = "legendary",      abbr = "leggy",       min = "1700",   max = "9999",  next_level = levels.mythic}
levels.gm         = {name = "a grand master", abbr = "gm",          min = "1400",   max = "1699",  next_level = levels.leggy}
levels.virtuoso   = {name = "a virtuoso",     abbr = "virtuoso",    min = "1200",   max = "1399",  next_level = levels.gm}
levels.consummate = {name = "consummate",     abbr = "consummate",  min = "1050",   max = "1199",  next_level = levels.virtuoso}
levels.hm         = {name = "a high master",  abbr = "hm",          min = "920",    max = "1049",  next_level = levels.consummate}
levels.renowned   = {name = "renowned",       abbr = "renowned",    min = "825",    max = "919",   next_level = levels.hm}
levels.adept      = {name = "an adept",       abbr = "adept",       min = "740",    max = "824",   next_level = levels.renowned}
levels.eminent    = {name = "eminent",        abbr = "eminent",     min = "660",    max = "739",   next_level = levels.adept}
levels.master     = {name = "a master",       abbr = "master",      min = "585",    max = "659",   next_level = levels.eminent}
levels.superb     = {name = "superb",         abbr = "superb",      min = "515",    max = "584",   next_level = levels.master}
levels.expert     = {name = "an expert",      abbr = "expert",      min = "450",    max = "514",   next_level = levels.superb}
levels.excellent  = {name = "excellent",      abbr = "excellent",   min = "390",    max = "449",   next_level = levels.expert}
levels.vg         = {name = "very good",      abbr = "vg",          min = "335",    max = "389",   next_level = levels.excellent}
levels.adroit     = {name = "adroit",         abbr = "adroit",      min = "285",    max = "334",   next_level = levels.vg}
levels.good       = {name = "good",           abbr = "good",        min = "240",    max = "284",   next_level = levels.adroit}
levels.prof       = {name = "proficient",     abbr = "prof",        min = "200",    max = "239",   next_level = levels.good}
levels.fair       = {name = "fair",           abbr = "fair",        min = "165",    max = "199",   next_level = levels.prof}
levels.able       = {name = "able",           abbr = "able",        min = "135",    max = "164",   next_level = levels.fair}
levels.aa         = {name = "above average",  abbr = "aa",          min = "110",    max = "134",   next_level = levels.able}
levels.avg        = {name = "average",        abbr = "avg",         min = "90",     max = "109",   next_level = levels.aa}
levels.ba         = {name = "below average",  abbr = "ba",          min = "70",     max = "89",    next_level = levels.avg}
levels.nvg        = {name = "not very good",  abbr = "nvg",         min = "50",     max = "69",    next_level = levels.ba}
levels.poor       = {name = "poor",           abbr = "poor",        min = "30",     max = "49",    next_level = levels.nvg}
levels.beginner   = {name = "a beginner",     abbr = "beginner",    min = "18",     max = "29",    next_level = levels.poor}
levels.novice     = {name = "a novice",       abbr = "novice",      min = "10",     max = "17",    next_level = levels.beginner}
levels.tyro       = {name = "a tyro",         abbr = "tyro",        min = "4",      max = "9",     next_level = levels.novice}
levels.unskilled  = {name = "unskilled",      abbr = "unskilled",   min = "1",      max = "3",     next_level = levels.tyro}
levels.NoSkill    = {name = "no skill",       abbr = "noskill",     min = "0",      max = "0",     next_level = levels.unskilled}


local skills_level = {
    {num = 1,name = "unskilled",      abbr = "unskilled",	min = "1",		  max = "3"},
    {num = 2,name = "a tyro",         abbr = "tyro",		  min = "4",		  max = "9"},
    {num = 3,name = "a novice",       abbr = "novice",		min = "10",		  max = "17"},
    {num = 4,name = "a beginner",     abbr = "beginner",	min = "18",		  max = "29"},
    {num = 5,name = "poor",           abbr = "poor",		  min = "30",		  max = "49"},
    {num = 6,name = "not very good",  abbr = "nvg",		    min = "50",		  max = "69"},
    {num = 7,name = "below average",  abbr = "ba",			  min = "70",		  max = "89"},
    {num = 8,name = "average",        abbr = "avg",		    min = "90",		  max = "109"},
    {num = 9,name = "above average",  abbr = "aa",		  	min = "110",	  max = "134"},
    {num = 10,name = "able",           abbr = "able",	  	min = "135",	  max = "164"},
    {num = 11,name = "fair",           abbr = "fair",		  min = "165",	  max = "199"},
    {num = 12,name = "proficient",     abbr = "prof",		  min = "200",	  max = "239"},
    {num = 13,name = "good",           abbr = "good",		  min = "240",	  max = "284"},
    {num = 14,name = "adroit",         abbr = "adroit",		min = "285",	  max = "334"},
    {num = 15,name = "very good",      abbr = "vg",			  min = "335",	  max = "389"},
    {num = 16,name = "excellent",      abbr = "excellent",	min = "390",	  max = "449"},
    {num = 17,name = "an expert",      abbr = "expert",		min = "450",	  max = "514"},
    {num = 18,name = "superb",         abbr = "superb",		min = "515",	  max = "584"},
    {num = 19,name = "a master",       abbr = "master",		min = "585",	  max = "659"},
    {num = 20,name = "eminent",        abbr = "eminent",   min = "660",	  max = "739"},
    {num = 21,name = "an adept",       abbr = "adept",		  min = "740",	  max = "824"},
    {num = 22,name = "renowned",       abbr = "renowned",	min = "825",  	max = "919"},
    {num = 23,name = "a high master",  abbr = "hm",			  min = "920",	  max = "1049"},
    {num = 24,name = "consummate",     abbr = "consummate",min = "1050", 	max = "1199"},
    {num = 25,name = "a virtuoso",     abbr = "virtuoso",	min = "1200",  	max = "1399"},
    {num = 26,name = "a grand master", abbr = "gm",			  min = "1400",	  max = "1699"},
    {num = 27,name = "legendary",      abbr = "leggy",	  	min = "1700",	  max = "9999"},
    {num = 28,name = "mythic",         abbr = "mythic",    min = "10000",  max = "99999"}
}



local skills_fighter = {
    {num = 1,   name = "parry",             count = 0,  abbr = ""},
    {num = 2,   name = "control",           count = 0,  abbr = ""},
    {num = 3,   name = "split defense",     count = 0,  abbr = ""},
    {num = 4,   name = "aim blows",         count = 0,  abbr = ""},
    {num = 5,   name = "attack speed",      count = 0,  abbr = ""},
    {num = 6,   name = "offensive",         count = 0,  abbr = ""},
    {num = 7,   name = "daring",            count = 0,  abbr = ""},
    {num = 8,   name = "fighting",          count = 0,  abbr = ""},
    {num = 9,   name = "shield use",        count = 0,  abbr = ""},
    {num = 10,  name = "hafted",            count = 0,  abbr = ""},
    {num = 11,  name = "sword",             count = 0,  abbr = ""},
    {num = 12,  name = "brawling",          count = 0,  abbr = ""},
    {num = 13,  name = "multiple attacks",  count = 0,  abbr = ""},
    {num = 14,  name = "two-handed hafted", count = 0,  abbr = ""},
    {num = 15,  name = "two-handed sword",  count = 0,  abbr = ""},
    {num = 16,  name = "thrown",            count = 0,  abbr = ""},
	{num = 17,  name = "archery",           count = 0,  abbr = ""},
	{num = 18,  name = "dodge",             count = 0,  abbr = ""}
}



local skills_mage = {
    {num = 1,   name = "spell casting",     count = 0,  abbr = ""},
    {num = 2,   name = "channelling",       count = 0,  abbr = ""},
    {num = 3,   name = "magic theory",    count = 0,  abbr = ""},
    {num = 4,   name = "inscription",    count = 0,  abbr = ""},
    {num = 5,   name = "language#magic",    count = 0,  abbr = ""}
}



local skills_move = {
    {num = 1,   name = "riding",        count = 0,  abbr = ""},
    {num = 2,   name = "sailing",       count = 0,  abbr = ""},
    {num = 3,   name = "climbing",      count = 0,  abbr = ""},
    {num = 4,   name = "travel",        count = 0,  abbr = ""},
    {num = 5,   name = "hiking",        count = 0,  abbr = ""},
    {num = 6,   name = "swimming",      count = 0,  abbr = ""},
    {num = 7,   name = "acrobatics",    count = 0,  abbr = ""},
    {num = 8,   name = "spelunking",    count = 0,  abbr = ""}
}



local skills_crafts = {
    {num = 1,   name = "appraisal",         count = 0,  abbr = ""},
    {num = 2,   name = "herding",           count = 0,  abbr = ""},
    {num = 3,   name = "alchemy",           count = 0,  abbr = ""},
    {num = 4,   name = "smithing",          count = 0,  abbr = ""},
    {num = 5,   name = "butchering",        count = 0,  abbr = ""},
    {num = 6,   name = "cooking",           count = 0,  abbr = ""},
    {num = 7,   name = "wood working",      count = 0,  abbr = ""},
    {num = 8,   name = "farming",           count = 0,  abbr = ""},
    {num = 9,   name = "tanning",           count = 0,  abbr = ""},
    {num = 10,   name = "sewing",           count = 0,  abbr = ""},
    {num = 11,   name = "chandlery",        count = 0,  abbr = ""},
    {num = 12,   name = "metallurgy",       count = 0,  abbr = ""},
    {num = 13,   name = "milling",          count = 0,  abbr = ""},
    {num = 14,   name = "leather working",  count = 0,  abbr = ""},
    {num = 15,   name = "construction",     count = 0,  abbr = ""},
    {num = 16,   name = "lumbering",        count = 0,  abbr = ""},
    {num = 17,   name = "mining",           count = 0,  abbr = ""},
    {num = 18,   name = "brewing",          count = 0,  abbr = ""},
	{num = 19,   name = "stone working",    count = 0,  abbr = ""}
}



local skills_thief = {
    {num = 1,   name = "lock picking",  count = 0,  abbr = ""},
    {num = 2,   name = "hiding",        count = 0,  abbr = ""},
    {num = 3,   name = "sneaking",      count = 0,  abbr = ""},
    {num = 4,   name = "pilfer",        count = 0,  abbr = ""},
	{num = 5,   name = "ambush",        count = 0,  abbr = ""}
}



local skills_spells = {
	{num = 1,   name = "ambrosius's_encouragement",		count = 0,  abbr = ""},
	{num = 2,   name = "astral_guidance",				count = 0,  abbr = ""},
	{num = 3,   name = "blackthorn's_cold_cure",		count = 0,  abbr = ""},
	{num = 4,   name = "blackthorn's_mass_recall",		count = 0,  abbr = ""},
	{num = 5,   name = "blue_armor",					count = 0,  abbr = ""},
	{num = 6,   name = "blue_bolt",						count = 0,  abbr = ""},
	{num = 7,   name = "blue_focus",					count = 0,  abbr = ""},
	{num = 8,   name = "blur",							count = 0,  abbr = ""},
	{num = 9,   name = "blur_other",					count = 0,  abbr = ""},
	{num = 10,   name = "bor's_doom",					count = 0,  abbr = ""},
	{num = 11,   name = "buzz_animal_invisibility",		count = 0,  abbr = ""},
	{num = 12,   name = "chanakae's_unction",			count = 0,  abbr = ""},
	{num = 13,   name = "chill",						count = 0,  abbr = ""},
	{num = 14,   name = "dannika's_calm",				count = 0,  abbr = ""},
	{num = 15,   name = "daring's_rage",				count = 0,  abbr = ""},
	{num = 16,   name = "deepen",						count = 0,  abbr = ""},
	{num = 17,   name = "delior's_pocket_dimension",	count = 0,  abbr = ""},
	{num = 18,   name = "detect_alignment",				count = 0,  abbr = ""},
	{num = 19,   name = "detect_disease",				count = 0,  abbr = ""},
	{num = 20,   name = "detect_magic",					count = 0,  abbr = ""},
	{num = 21,   name = "detect_soul",					count = 0,  abbr = ""},
	{num = 22,   name = "detect_spell",					count = 0,  abbr = ""},
	{num = 23,   name = "dispel_spell",					count = 0,  abbr = ""},
	{num = 24,   name = "dog_fart",						count = 0,  abbr = ""},
	{num = 25,   name = "enlarge",						count = 0,  abbr = ""},
	{num = 26,   name = "enlarge_other",				count = 0,  abbr = ""},
	{num = 27,   name = "flameblade",					count = 0,  abbr = ""},
	{num = 28,   name = "flare",						count = 0,  abbr = ""},
	{num = 29,   name = "flash",						count = 0,  abbr = ""},
	{num = 30,   name = "flynn's_flimflam",				count = 0,  abbr = ""},
	{num = 31,   name = "frostaxe",						count = 0,  abbr = ""},
	{num = 32,   name = "gered's_tongues",				count = 0,  abbr = ""},
	{num = 33,   name = "greater_heal_other",			count = 0,  abbr = ""},
	{num = 34,   name = "greater_heal_self",			count = 0,  abbr = ""},
	{num = 35,   name = "greater_wound_transfer",		count = 0,  abbr = ""},
	{num = 36,   name = "green_armor",					count = 0,  abbr = ""},
	{num = 37,   name = "green_bolt",					count = 0,  abbr = ""},
	{num = 38,   name = "green_focus",					count = 0,  abbr = ""},
	{num = 39,   name = "guiding_light",				count = 0,  abbr = ""},
	{num = 40,   name = "heal_other",					count = 0,  abbr = ""},
	{num = 41,   name = "heal_self",					count = 0,  abbr = ""},
	{num = 42,   name = "ignite",						count = 0,  abbr = ""},
	{num = 43,   name = "influenza_cure",				count = 0,  abbr = ""},
	{num = 44,   name = "jonathan's_ears",				count = 0,  abbr = ""},
	{num = 45,   name = "jonathan's_fareyes",			count = 0,  abbr = ""},
	{num = 46,   name = "jonathan's_neareyes",			count = 0,  abbr = ""},
	{num = 47,   name = "jonathan's_nighteyes",			count = 0,  abbr = ""},
	{num = 48,   name = "jonathan's_nose",				count = 0,  abbr = ""},
	{num = 49,   name = "lesser_heal_other",			count = 0,  abbr = ""},
	{num = 50,   name = "lesser_heal_self",				count = 0,  abbr = ""},
	{num = 51,   name = "lesser_portal",				count = 0,  abbr = ""},
	{num = 52,   name = "lesser_summon_animal",			count = 0,  abbr = ""},
	{num = 53,   name = "lesser_wound_transfer",		count = 0,  abbr = ""},
	{num = 54,   name = "lirrin's_candle",				count = 0,  abbr = ""},
	{num = 55,   name = "lirrin's_glow",				count = 0,  abbr = ""},
	{num = 56,   name = "lirrin's_light",				count = 0,  abbr = ""},
	{num = 57,   name = "lirrin's_sun",					count = 0,  abbr = ""},
	{num = 58,   name = "lirrin's_torch",				count = 0,  abbr = ""},
	{num = 59,   name = "major_heal_other",				count = 0,  abbr = ""},
	{num = 60,   name = "major_heal_self",				count = 0,  abbr = ""},
	{num = 61,   name = "mark",							count = 0,  abbr = ""},
	{num = 62,   name = "mend",							count = 0,  abbr = ""},
	{num = 63,   name = "minor_dispel",					count = 0,  abbr = ""},
	{num = 64,   name = "minor_heal_other",				count = 0,  abbr = ""},
	{num = 65,   name = "minor_heal_self",				count = 0,  abbr = ""},
	{num = 66,   name = "minor_imbed",					count = 0,  abbr = ""},
	{num = 67,   name = "minor_summon_animal",			count = 0,  abbr = ""},
	{num = 68,   name = "murak's_permiable_field",		count = 0,  abbr = ""},
	{num = 69,   name = "mystic_arrow",					count = 0,  abbr = ""},
	{num = 70,   name = "nials_nibble",					count = 0,  abbr = ""},
	{num = 71,   name = "obfuscate_scroll",				count = 0,  abbr = ""},
	{num = 72,   name = "orange_armor",					count = 0,  abbr = ""},
	{num = 73,   name = "orange_bolt",					count = 0,  abbr = ""},
	{num = 74,   name = "orange_dragon_fire",			count = 0,  abbr = ""},
	{num = 75,   name = "orange_focus",					count = 0,  abbr = ""},
	{num = 76,   name = "orella's_deep_storage",		count = 0,  abbr = ""},
	{num = 77,   name = "other_spell_store",			count = 0,  abbr = ""},
	{num = 78,   name = "pol's_darkness",				count = 0,  abbr = ""},
	{num = 79,   name = "pol's_death_curse",			count = 0,  abbr = ""},
	{num = 80,   name = "pol's_gloom",					count = 0,  abbr = ""},
	{num = 81,   name = "pol's_impenetrable_blackness",	count = 0,  abbr = ""},
	{num = 82,   name = "pol's_shadows",				count = 0,  abbr = ""},
	{num = 83,   name = "pol's_twilight",				count = 0,  abbr = ""},
	{num = 84,   name = "preserve_corpse",				count = 0,  abbr = ""},
	{num = 85,   name = "quest's_vigor",				count = 0,  abbr = ""},
	{num = 86,   name = "recall",						count = 0,  abbr = ""},
	{num = 87,   name = "red_armor",					count = 0,  abbr = ""},
	{num = 88,   name = "red_bolt",						count = 0,  abbr = ""},
	{num = 89,   name = "red_dragon_fire",				count = 0,  abbr = ""},
	{num = 90,   name = "red_focus",					count = 0,  abbr = ""},
	{num = 91,   name = "refresh_other",				count = 0,  abbr = ""},
	{num = 92,   name = "reincarnation",				count = 0,  abbr = ""},
	{num = 93,   name = "restore_other_limb",			count = 0,  abbr = ""},
	{num = 94,   name = "restore_self_limb",			count = 0,  abbr = ""},
	{num = 95,   name = "resurrection",					count = 0,  abbr = ""},
	{num = 96,   name = "reveal_aura",					count = 0,  abbr = ""},
	{num = 97,   name = "sanctuary",					count = 0,  abbr = ""},
	{num = 98,   name = "sense_aura",					count = 0,  abbr = ""},
	{num = 99,   name = "shillelagh",					count = 0,  abbr = ""},
	{num = 100,   name = "shrink",						count = 0,  abbr = ""},
	{num = 101,   name = "shrink_other",				count = 0,  abbr = ""},
	{num = 102,   name = "skyrdin's_zephyr",			count = 0,  abbr = ""},
	{num = 103,   name = "sulamar's_final_breath",		count = 0,  abbr = ""},
	{num = 104,   name = "sulamar's_spark",				count = 0,  abbr = ""},
	{num = 105,   name = "tell",						count = 0,  abbr = ""},
	{num = 106,   name = "thunderhammer",				count = 0,  abbr = ""},
	{num = 107,   name = "troy's_helping_hand",			count = 0,  abbr = ""},
	{num = 108,   name = "warm",						count = 0,  abbr = ""},
	{num = 109,   name = "wizard_eye",					count = 0,  abbr = ""},
	{num = 110,   name = "yellow_armor",				count = 0,  abbr = ""},
	{num = 111,   name = "yellow_bolt",					count = 0,  abbr = ""},
	{num = 112,   name = "yellow_focus",				count = 0,  abbr = ""},
}



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
	local skill_name		= string.lower(args["skill_name"])
	local who				= args["who"]
    local type				= args["type"]
    local skill_list		= {}
    local char_length1		= 26
    local char_length2		= 52
    local char_fill1		= 0
    local char_fill2		= 0
    local tilNext			= 0
	local total_count		= 0
	local printed_skills	= 0
    local output			= ""
    local level
    local nextLevel
    local sort_type


    who = who:sub(1, 1):upper()..who:sub(2):lower()


    -- strip sort type symbol from skill_name
    skill_name = trim(skill_name)
    sort_type = skill_name:match("[<>]$")

    if sort_type then
        skill_name = skill_name:sub(1, -2)
        skill_name = trim(skill_name)
    end

    -- select or build skill list
    if (skill_name == "mage") then
        skill_list = skills_mage
    elseif (skill_name == "fighter") then
        skill_list = skills_fighter
    elseif (skill_name == "move") or (skill_name == "movement") then
        skill_list = skills_move
    elseif (skill_name == "craft") or (skill_name == "crafts") or (skill_name == "crafting") then
        skill_list = skills_crafts
    elseif (skill_name == "thief") or (skill_name == "theif") then
        skill_list = skills_thief
	elseif (skill_name == "spells") or (skill_name == "spell") then
        skill_list = skills_spells
    else
        local search_flag = skill_name
        search_flag = string.gsub(search_flag, "^%*", "%%")
        search_flag = string.gsub(search_flag, "%*$", "%%")

        if not string.match(search_flag, "^%%") and not string.match(search_flag, "%%$") then
            search_flag = "%" .. search_flag .. "%"
        end

        local result = dba.query('SELECT skill FROM improves WHERE who="'..who..'" AND skill LIKE "'..search_flag..'"')
        for i=1,result.count() do
            table.insert(skill_list, {
                num     = #skill_list + 1,
                name    = result[i].skill,
                count   = 0,
                abbr    = ""
            })
        end
    end

    -- get skill counts
    for i=1,#skill_list do
        local result = dba.query('SELECT * FROM improves WHERE who="'..who..'" AND skill="'..skill_list[i].name..'"')[1]
        if result == nil then
            skill_list[i].count = 0
        else
            skill_list[i].count = result.count
        end
    end

    -- get skill levels
    for i=1,#skill_list do
        for x=1,#skills_level do
            if (skill_list[i].count >= tonumber(skills_level[x].min)) and (skill_list[i].count <= tonumber(skills_level[x].max)) then
                skill_list[i].abbr = skills_level[x].name
            end
        end
    end

    -- sort and print skill list
    if (sort_type == ">") then
        table.sort(skill_list, function (k1,k2) return k1.count < k2.count end)
    else
        table.sort(skill_list, function (k1,k2) return k1.count > k2.count end)
    end

    for i,v in ipairs(skill_list) do

        if v.count > 0 then
            char_fill1		= char_length1 - string.len(skill_list[i].name) - 1
            char_fill2		= char_length2 - string.len(skill_list[i].name) - 3 - char_fill1 - string.len(v.abbr) - #tostring(v.count)
			total_count		= total_count + v.count
			printed_skills	= printed_skills + 1


            level		= imp2lvl(v.count)
            nextLevel	= level.next_level
            output		= ""

            if nextLevel ~= nil then
                tilNext = level.next_level.min - v.count
                output = output.."["..tilNext.." / "..nextLevel.abbr.."]"
            end

            if type == "share" then
                send("ooc "..who..":   "..v.name..":"..string.rep(" ", char_fill1).."("..v.count..") "..v.abbr..string.rep(" ", char_fill2)..output, false)
            else
                cecho(who..":   "..v.name..":"..string.rep(" ", char_fill1).."("..v.count..") "..v.abbr..string.rep(" ", char_fill2)..output.."\n")
            end
        end
    end

	if printed_skills >= 2 then
    	local total_label = "TOTAL"
    	char_fill1 = char_length1 - string.len(total_label) - 1
    	char_fill2 = char_length2 - string.len(total_label) - 3 - char_fill1 - string.len(tostring(total_count))

    	local output = who..":   "..total_label..":"..string.rep(" ", char_fill1).."("..total_count..")"..string.rep(" ", char_fill2).." across "..printed_skills.." skills"

    	if type == "share" then
			send("ooc ==============================================================================", false)
        	send("ooc "..output, false)
    	else
			cecho("==============================================================================\n")
        	cecho(output.."\n")
    	end
	end
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

    if Status.statusTracking then
        Events.raiseEvent("updateTrackingEvent", {name = who, skill = skill_name, count = 1})
    end
	UI.onImprove({name = who, skill_name = skill_name})

	--Check skill level reported by the mud (if imp is for the character; mud doesn't report pet skill levels)
	if who == Status.name then
        enableTrigger(shownSkill)
		send("show skills "..skill_name, false)
		tempTimer(Status.showSkillDelay, [[disableTrigger(]]..shownSkill..[[)]])
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

        if (Status.statusTracking) then --and (count > skill.count) then
            Events.raiseEvent("updateTrackingEvent", {name = who, skill = skill_name, count = count-skill.count})
        end

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



-- build or update the table during setup
-----------------------------------------------------------
local function checkImprovesTable(args)


	-- build database if needed
	dba.execute([[CREATE TABLE IF NOT EXISTS "improves" (
		_row_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		skill TEXT,
		count INTEGER DEFAULT 1,
		notes TEXT,
		last_imp TIMESTAMP,
		who VARCHAR(16),
		abbr TEXT,
		weight TEXT,
		power INTEGER
	);]])


	-- update legacy "scroll reading" skill to "magic theory"
	local temp1 = dba.query('SELECT * FROM improves WHERE skill = "scroll reading"')[1]
	if temp1 then
		systemMessage("Update IMPROVES table")
		dba.execute('UPDATE improves SET skill = "magic theory" WHERE skill = "scroll reading"')
	end

	-- remove duplicate magic theory skills
	local temp2 = dba.query('SELECT * FROM improves WHERE skill = "magic theory" GROUP BY who HAVING COUNT(*) > 1')[1]
	if temp2 then
		systemMessage("Update IMPROVES table")
		dba.execute([[DELETE FROM improves
			WHERE _row_id = (
				SELECT _row_id FROM improves
				WHERE skill = "magic theory"
		  		AND who IN (
				  	SELECT who FROM improves
			  		WHERE skill = "magic theory"
			  		GROUP BY who
			  		HAVING COUNT(*) > 1
		  		)
			ORDER BY count ASC
			LIMIT 1
		)]])
	end


	-- update legacy "scroll writing" skill to "inscription"
	local temp3 = dba.query('SELECT * FROM improves WHERE skill = "scroll writing"')[1]
	if temp3 then
		systemMessage("Update IMPROVES table")
		dba.execute('UPDATE improves SET skill = "inscription" WHERE skill = "scroll writing"')
	end

	-- remove duplicate inscription skills
	local temp4 = dba.query('SELECT * FROM improves WHERE skill = "inscription" GROUP BY who HAVING COUNT(*) > 1')[1]
	if temp4 then
		systemMessage("Update IMPROVES table")
		dba.execute([[DELETE FROM improves
			WHERE _row_id = (
				SELECT _row_id FROM improves
				WHERE skill = "inscription"
		  		AND who IN (
				  	SELECT who FROM improves
			  		WHERE skill = "inscription"
			  		GROUP BY who
			  		HAVING COUNT(*) > 1
		  		)
			ORDER BY count ASC
			LIMIT 1
		)]])
	end

end



-- setup
-----------------------------------------------------------
local function setup(args)
	checkImprovesTable()
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
	getSkill = getSkill
}

return Skills

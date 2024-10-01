Info = {}

local sourceName = "info"
local colorHelp = "yellow"
local spacerHelp = "   "
local versionNumber = "v1.2"


-- return quick help
-----------------------------------------------------------
local function showQuickHelp()
	local helpText = ""
	local helpTagYellow = "<span style=\"color: yellow;\">"
	local helpTagGreen = "<span style=\"color: palegreen; font-weight: bold;\">"
	local helpTagRed = "<span style=\"color: red; font-weight: bold;\">"
	local helpTagOff = "</span>"
	
	helpText = helpText..helpTagYellow
	helpText = helpText.."DartMUDlet - Pato Edition "..versionNumber.."<BR>"
	helpText = helpText.."============================================================================================="..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/unblock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagRed.." IF YOU ARE STUCK IN BLOCKING MODE"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/help&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." Display a full list of available commands"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/info &lt;skill&gt;"..helpTagOff..helpTagYellow.." Show current improves/level for a skill"..helpTagOff.."<BR><BR>"
	helpText = helpText..helpTagGreen.."/announce on&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." Announce improves in standard mode"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/announce brief&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." Announce improves in brief mode"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/announce verbose"..helpTagOff..helpTagYellow.." Announce improves in verbose mode"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/announce off&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." No announcement of improves"..helpTagOff.."<BR><BR>"
	helpText = helpText..helpTagYellow.."Contact Pato in Discord or in game if you have any<BR>questions or comments about using the package!<BR>"
	helpText = helpText..helpTagOff

	return helpText
end



-- /help command
-----------------------------------------------------------
local function showHelp(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	cecho(preText.."                         DartMUDlet - Pato Edition "..versionNumber.."\n")
	cecho(preText.."================================================================================\n")
	cecho(preText.."/setup   - Initialize variables, customize display, start improve tracking\n")
	cecho(preText.."/unsetup - Remove timers and triggers, deactivate display customizations\n")
	cecho(preText.."/resetup - Reinitialize timers, etc. Activate any updated DartMUDLet code\n")
	cecho(preText.."\n")
	cecho(preText.."/announce on      - Announce improves in standard mode (skill name+)\n")
	cecho(preText.."/announce brief   - Announce improves in brief mode (plus only, no skill name)\n")
	cecho(preText.."/announce verbose - Announce improves in verbose mode (skill and actual value)\n")
	cecho(preText.."/announce off     - No announcement of improves\n")
	cecho(preText.."\n")
	cecho(preText.."/block   - Block and queue new commands from being sent to DartMUD\n")
	cecho(preText.."/unblock - Resume sending commands to DartMUD, including queued ones first\n")
	cecho(preText.."\n")
	cecho(preText.."/cast ! <spell> @ <power> <args> - Repeat practice casting a spell\n")
	cecho(preText.."/cast ! off                      - Stop practicing; remember spell and power\n")
	cecho(preText.."/cast ! resume [<spell>]         - Resume practing last/named spell\n")
	cecho(preText.."/cast ! status [of <spell>]      - Show power used for last/named spell\n")
	cecho(preText.."\n")
	cecho(preText.."/channel <power> <target>     - Start channelling aura to target\n")
	cecho(preText.."/channel off                  - Stop channelling, save target and power level\n")
	cecho(preText.."/channel resume [<target>]    - Resume channelling last/named target\n")
	cecho(preText.."/channel status [of <target>] - Show power channeled to last/named target\n")
	cecho(preText.."\n")
	cecho(preText.."/inscribe ! <spell> @ <power>     - Start practice inscribing a spell\n")
	cecho(preText.."/inscribe ! off                   - Stop practice inscribing a spell\n")
	cecho(preText.."/inscribe ! resume [<spell>]      - Resume practice inscribing a spell\n")
	cecho(preText.."/inscribe ! adjust power <power>  - Change power you are using for practice\n")
	cecho(preText.."/inscribe ! status [of <spell>]   - Show power used for last/named spell\n")
	cecho(preText.."\n")
	cecho(preText.."/update <Who> <skill> <improves> - Manually set improves for you|pet's skill\n")
	cecho(preText.."/antispam on|off                 - Suppress repeated lines\n")
	cecho(preText.."/who on|off                      - Auto check the who list every 5 minutes\n")
	cecho(preText.."/info <skill>                    - Show current improves/level for a skill\n")
	cecho(preText.."/levels                          - Display a list of skill levels\n")
	cecho(preText.."/help                            - Display a list of available commands\n")
end



-- /levels command	
---------------------------------------------------------------------
local function showLevels(args)
	local skillnumPosition = 24
	local skillsizePosition = 44
	local preText = "<"..colorHelp..">"..spacerHelp
	local levels = {"mythic","legendary","a grand master","a virtuoso","consummate","a high master","renowned","an adept","eminent",
					"a master","superb","an expert","excellent","very good","adroit","proficient","fair","able","above average",
					"average","below average","not very good","poor","a beginner","a novice","a tyro","unskilled"}


	cecho(preText.."Skill Name              Level               Size\n")
	cecho(preText.."================================================\n")	
	for i,v in pairs(levels) do
		local skillSize    = ""
		local currentSkill = name2lvl(v)
	--echo("test "..currentSkill.name.."\n")
		if currentSkill.name == "mythic" then
			skillSize = "????"
		else
			skillSize = tonumber(currentSkill.max) - tonumber(currentSkill.min) + 1
		end
		
		local fillerChars1 = skillnumPosition - string.len(currentSkill.name)
		local fillerChars2 = skillsizePosition - string.len(currentSkill.name) - fillerChars1 - string.len(currentSkill.min)--math.floor(math.log(v.min)+1)
		
		cecho(preText..currentSkill.name..string.rep(" ", fillerChars1)..currentSkill.min..string.rep(" ", fillerChars2)..skillSize.."\n")
  end
end



-- delete prompt only lines
---------------------------------------------------------------------
local function emptyLine(args)
	deleteLine()
end





function setup(args)
  Events.addListener("showHelpEvent", sourceName, showHelp)
  Events.addListener("showLevelsEvent", sourceName, showLevels)
  Events.addListener("emptylineEvent", sourceName, emptyLine)
end



function unsetup(args)
  Events.removeListener("showHelpEvent", sourceName)
  Events.removeListener("showLevelsEvent", sourceName)
  Events.removeListener("emptylineEvent", sourceName)
end



function resetup(args)
  unsetup(args)
  setup(args)
end



Info =
{
	setup = setup
	,unsetup = unsetup
	,resetup = resetup
	,showQuickHelp = showQuickHelp
}

return Info

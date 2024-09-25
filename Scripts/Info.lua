Info = {}

local sourceName = "info"
local colorHelp = "yellow"
local spacerHelp = "   "

function showHelp(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	cecho(preText.."                         DartMUDlet - Pato Edition v1.2\n")
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
	cecho(preText.."/info <skill>                    - Shows current improves/level for a skill\n")
	cecho(preText.."/help                            - Display a list of available commands\n")
end



function setup(args)
  Events.addListener("showHelpEvent", sourceName, showHelp)
end



function unsetup(args)
  Events.removeListener("showHelpEvent", sourceName)
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
}

return Info

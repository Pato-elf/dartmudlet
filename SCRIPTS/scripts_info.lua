Info				= {}
local sourceName	= "info"
local colorHelp		= "grey"
local colorHead		= "cyan"
local colorTips		= "yellow"
local spacerHelp	= "   "
local levels		= {"mythic","legendary","a grand master","a virtuoso","consummate","a high master","renowned","an adept","eminent",
					"a master","superb","an expert","excellent","very good","adroit","good","proficient","fair","able","above average",
					"average","below average","not very good","poor","a beginner","a novice","a tyro","unskilled"}
math.randomseed(os.time())



-- return /random results
-----------------------------------------------------------
local function showRandom(args)
	local randomrange	= args["detail"]
	local randomnumber	= 0


	if tonumber(randomrange) then
		randomrange = tonumber(randomrange)
		if (randomrange < 2) or (randomrange > 1000000) then
			cecho("<red>ERROR: Invalid random number (Between 2 - 1000000)\n")
		else
			randomnumber = math.random(1, randomrange)
			send("ooc "..Status.name.." generates a random number between 1 and "..randomrange..": "..randomnumber)
		end

	elseif string.find(randomrange, ",") then
		local randomvalues = {}

		for value in string.gmatch(randomrange, "([^,]+)") do
			table.insert(randomvalues, value)
		end

		for i, v in ipairs(randomvalues) do
			randomvalues[i] = v:gsub("^%s*(.-)%s*$", "%1")
		end

		send("ooc "..Status.name.." picks a random value out of a list: "..randomrange)
		send("ooc Value selected: "..randomvalues[math.random(1, #randomvalues)])

	elseif (randomrange == "help") then
        Events.raiseEvent("showHelpEvent", {detail = "random"})
    else
		cecho("<"..colorTips..">USAGE: /random <num> - Generate a random number between 1 and a number of your choosing\n")
		cecho("<"..colorTips..">USAGE: /random <value,value,value> - Pick a random value from a list of values\n")
	end
end



-- return quick help
-----------------------------------------------------------
local function showQuickHelp()
	local helpText		= ""
	local helpTagYellow	= "<span style=\"color: yellow;\">"
	local helpTagGreen	= "<span style=\"color: palegreen; font-weight: bold;\">"
	local helpTagRed	= "<span style=\"color: red; font-weight: bold;\">"
	local helpTagOff	= "</span>"


	helpText = helpText..helpTagYellow
	helpText = helpText.."DartMUDlet - Pato Edition "..versionNumber.."<BR>"
	helpText = helpText.."============================================================================================="..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/unblock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagRed.."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IF YOU ARE STUCK IN BLOCKING MODE"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/help&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagYellow.."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Full list of available commands"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/info &lt;name&gt; &lt;skill&gt;"..helpTagOff..helpTagYellow.." Show current level for a skill"..helpTagOff.."<BR><BR>"
	helpText = helpText..helpTagGreen.."/announce on&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." Announce improves in standard mode"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/announce brief&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." Announce improves in brief mode"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/announce verbose"..helpTagOff..helpTagYellow.." Announce improves in verbose mode"..helpTagOff.."<BR>"
	helpText = helpText..helpTagGreen.."/announce off&nbsp;&nbsp;&nbsp;&nbsp;"..helpTagOff..helpTagYellow.." No announcement of improves"..helpTagOff.."<BR><BR>"
	helpText = helpText..helpTagYellow.."Contact Pato in Discord or in game if you have any<BR>questions or comments about using the package!<BR>"
	helpText = helpText..helpTagOff

	return helpText
end



-- return quick levels
-----------------------------------------------------------
local function showQuickLevels()
	local helpText		= ""
	local skillLevels	= {}
	local helpTagYellow	= "<span style=\"color: yellow;\">"
	local helpTagOff	= "</span>"


	for i,v in pairs(levels) do
		skillLevels[i] = name2lvl(v)
		skillLevels[i].length1 = 18-string.len(skillLevels[i].name)
		skillLevels[i].length2 = 13-string.len(skillLevels[i].min)
	end

	helpText = helpText..helpTagYellow
	helpText = helpText.."Skill Name"..string.rep("&nbsp;",8).."Level"..string.rep("&nbsp;",8).."Skill Name"..string.rep("&nbsp;",8).."Level<BR>"
	helpText = helpText.."======================================================<BR>"
	helpText = helpText..skillLevels[28].name..string.rep("&nbsp;",skillLevels[28].length1)..skillLevels[28].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[28].length2)..skillLevels[14].name..string.rep("&nbsp;",skillLevels[14].length1)..skillLevels[14].min.."<BR>"
	helpText = helpText..skillLevels[27].name..string.rep("&nbsp;",skillLevels[27].length1)..skillLevels[27].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[27].length2)..skillLevels[13].name..string.rep("&nbsp;",skillLevels[13].length1)..skillLevels[13].min.."<BR>"
	helpText = helpText..skillLevels[26].name..string.rep("&nbsp;",skillLevels[26].length1)..skillLevels[26].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[26].length2)..skillLevels[12].name..string.rep("&nbsp;",skillLevels[12].length1)..skillLevels[12].min.."<BR>"
	helpText = helpText..skillLevels[25].name..string.rep("&nbsp;",skillLevels[25].length1)..skillLevels[25].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[25].length2)..skillLevels[11].name..string.rep("&nbsp;",skillLevels[11].length1)..skillLevels[11].min.."<BR>"	
	helpText = helpText..skillLevels[24].name..string.rep("&nbsp;",skillLevels[24].length1)..skillLevels[24].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[24].length2)..skillLevels[10].name..string.rep("&nbsp;",skillLevels[10].length1)..skillLevels[10].min.."<BR>"	
	helpText = helpText..skillLevels[23].name..string.rep("&nbsp;",skillLevels[23].length1)..skillLevels[23].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[23].length2)..skillLevels[9].name..string.rep("&nbsp;",skillLevels[9].length1)..skillLevels[9].min.."<BR>"
	helpText = helpText..skillLevels[22].name..string.rep("&nbsp;",skillLevels[22].length1)..skillLevels[22].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[22].length2)..skillLevels[8].name..string.rep("&nbsp;",skillLevels[8].length1)..skillLevels[8].min.."<BR>"	
	helpText = helpText..skillLevels[21].name..string.rep("&nbsp;",skillLevels[21].length1)..skillLevels[21].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[21].length2)..skillLevels[7].name..string.rep("&nbsp;",skillLevels[7].length1)..skillLevels[7].min.."<BR>"
	helpText = helpText..skillLevels[20].name..string.rep("&nbsp;",skillLevels[20].length1)..skillLevels[20].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[20].length2)..skillLevels[6].name..string.rep("&nbsp;",skillLevels[6].length1)..skillLevels[6].min.."<BR>"
	helpText = helpText..skillLevels[19].name..string.rep("&nbsp;",skillLevels[19].length1)..skillLevels[19].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[19].length2)..skillLevels[5].name..string.rep("&nbsp;",skillLevels[5].length1)..skillLevels[5].min.."<BR>"
	helpText = helpText..skillLevels[18].name..string.rep("&nbsp;",skillLevels[18].length1)..skillLevels[18].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[18].length2)..skillLevels[4].name..string.rep("&nbsp;",skillLevels[4].length1)..skillLevels[4].min.."<BR>"
	helpText = helpText..skillLevels[17].name..string.rep("&nbsp;",skillLevels[17].length1)..skillLevels[17].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[17].length2)..skillLevels[3].name..string.rep("&nbsp;",skillLevels[3].length1)..skillLevels[3].min.."<BR>"
	helpText = helpText..skillLevels[16].name..string.rep("&nbsp;",skillLevels[16].length1)..skillLevels[16].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[16].length2)..skillLevels[2].name..string.rep("&nbsp;",skillLevels[2].length1)..skillLevels[2].min.."<BR>"
	helpText = helpText..skillLevels[15].name..string.rep("&nbsp;",skillLevels[15].length1)..skillLevels[15].min
	helpText = helpText..string.rep("&nbsp;",skillLevels[15].length2)..skillLevels[1].name..string.rep("&nbsp;",skillLevels[1].length1)..skillLevels[1].min.."<BR>"
	helpText = helpText..helpTagOff

	return helpText
end



-- /help base
-----------------------------------------------------------
local function showHelpBase(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."                         DartMUDlet - Pato Edition "..versionNumber.."\n")
	cecho(preHead.."==================================================================================\n")
	cecho(preHead.."Critical Commands\n")
	cecho(preText.."/setup            - Initialize variables, customize display, start improve tracking\n")
	cecho(preText.."/block            - Block and queue new commands from being sent to DartMUD\n")
	cecho(preText.."/unblock          - Resume sending commands to DartMUD, including queued ones first\n")
	cecho(preText.."/help <topic>     - Get detailed help for most DartMUDlet commands\n")
	cecho(preHead.."Skill Announce System\n")
	cecho(preText.."/announce on      - Announce improves in standard mode (skill name+)\n")
	cecho(preText.."/announce brief   - Announce improves in brief mode (plus only, no skill name)\n")
	cecho(preText.."/announce verbose - Announce improves in verbose mode (skill and actual value)\n")
	cecho(preText.."/announce off     - No announcement of improves\n")
	cecho(preHead.."Channelling System\n")
    cecho(preText.."/chan <num>                      - Manually channel amount to the channelling system\n")
	cecho(preText.."/chan info                       - Display full channelling stats on screen\n")
	cecho(preText.."/chan pause on|off               - Pause powercast to wait for full concentration\n")
	cecho(preText.."/chan share on|off|brief         - Change settings of the channel share button\n")
	cecho(preText.."/chan sound on|off               - Play notification sound before powercast\n")
	cecho(preHead.."Inscribe System\n")
	cecho(preText.."/inscribe <spell> <power>        - Start practice inscribing a spell\n")
	cecho(preText.."/inscribe power <power>          - Change power you are using for practice inscribe\n")
	cecho(preText.."/inscribe off                    - Stop practice inscribing a spell\n")
	cecho(preHead.."Skill Display System\n")
	cecho(preText.."/info <who> <skill>              - Show current improves/level for a skill\n")
    cecho(preText.."/share <who> <skill>             - OOC share current improves/level for a skill\n")
	cecho(preText.."/insert <who> <skill> <improves> - Manually insert a new skill into database\n")
	cecho(preText.."/update <who> <skill> <improves> - Manually set improves for you|pet's skill\n")
	cecho(preHead.."Other Commands\n")
	cecho(preText.."/alloc clear <num>               - Clear the contents of an allocation set\n")
	cecho(preText.."/alloc copy <num> <num>          - Copy one allocation set over to another\n")
	cecho(preText.."/cast power <power>              - Change the autocast power via keyboard command\n")
    cecho(preText.."/date <now> <+|-><num><h|d>      - Show game dates for the past, now, or future\n")
	cecho(preText.."/levels                          - Display a list of skill levels\n")
	cecho(preText.."/random <num>                    - Generate a random number between 1 and a number\n")
	cecho(preText.."/random <value,value,value>      - Pick a random value from a list of values\n")
	cecho(preText.."/repeat clear <num>              - Clear the contents of a repeat set\n")
	cecho(preText.."/repeat copy <num> <num>         - Copy one repeat set over to another\n")
    cecho(preText.."/repeat echo on|off              - Echo repeat commands to the screen (default off)\n")
    cecho(preText.."/track <option>                  - Command line control of the tracking system\n")
	cecho(preText.."#num <command>                   - Basic repeat commands (e.g. #3 say hi)\n")
    cecho(preText.."#Wnum <command>                  - Delay command for num seconds (e.g. #W4 smoke pipe)\n")
	cecho(preText.."\n")
	cecho(preHead.."The /set command allows several defaults to be set\n")
	cecho(preHead.."Use /help set <option> for more information. Current settings include:\n")
	cecho(preText.."alignment      announce       antispam       aura           conc\n")
	cecho(preText.."contents       focus          fontsize       keypad         who\n")
end



-- /help levels
-----------------------------------------------------------
local function showHelpLevels(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: levels\n")
	cecho(preHead.."USAGE: /levels\n")
    cecho(preText.."\n")
    cecho(preText.."Displays a full list of skill levels on the screen along with the size of\n")
    cecho(preText.."each skill.\n")
end



-- /help who
-----------------------------------------------------------
local function showHelpWho(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: who\n")
	cecho(preHead.."USAGE: /set who <on|off>\n")
    cecho(preText.."\n")
    cecho(preText.."Setting this to on will automatically update the WHO tab every five minutes.\n")
    cecho(preText.."Having this on will also keep the player from idling out of the game.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusWho)..")\n")
end



-- /help contents
-----------------------------------------------------------
local function showHelpContents(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: contents\n")
	cecho(preHead.."USAGE: /set contents <on|off>\n")
    cecho(preText.."\n")
    cecho(preText.."Lists container contents out in an alphabetical, \"contents\" style view.\n")
    cecho(preText.."It also groups single items together to show them in the same way as stackable\n")
    cecho(preText.."items. Works with many containers such as bins, tables, packs, bookshelves etc.\n")
    cecho(preText.."Also works with fishing nets.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusContents)..")\n")
end



-- /help aura
-----------------------------------------------------------
local function showHelpAura(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: aura\n")
	cecho(preHead.."USAGE: /set aura <on|off|scint>\n")
    cecho(preText.."\n")
    cecho(preText.."Displays aura output to the screen in addition to the auto updating aura box.\n")
    cecho(preText.."Setting the value to on will show all aura changes to the screen, while setting\n")
    cecho(preText.."the value to scint will only show when aura becomes scintillating on the screen.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusAura)..")\n")
end



-- /help conc
-----------------------------------------------------------
local function showHelpConc(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: conc\n")
	cecho(preHead.."USAGE: /set conc <on|off|bright>\n")
    cecho(preText.."\n")
    cecho(preText.."Displays concentration output to the screen in addition to the auto updating\n")
    cecho(preText.."concentration box. Setting the value to on will show all conc changes to the screen,\n")
    cecho(preText.."while setting the value to bright will only show when conc becomes bright-eyed.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusConc)..")\n")
end



-- /help setup
-----------------------------------------------------------
local function showHelpSetup(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: setup\n")
	cecho(preHead.."USAGE: /setup\n")
    cecho(preText.."\n")
    cecho(preText.."This command sets up a new instance of DartMUDlet. It does things like customize the\n")
    cecho(preText.."display, build database tables if they don't exist, and update existing database tables\n")
    cecho(preText.."with new fields. This command should be run when first setting up DartMUDlet, as well\n")
    cecho(preText.."as when updating to a new release.\n")
end



-- /help announce
-----------------------------------------------------------
local function showHelpAnnounce(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: announce\n")
	cecho(preHead.."USAGE: /set announce <on|off|brief|verbose>\n")
	cecho(preHead.."USAGE: /set announce pet <on|off|brief|verbose>\n")
    cecho(preText.."\n")
    cecho(preText.."This command will automatically OOC announce skill improvements to the room.\n")
	cecho(preText.."Announce status for the player and their pets can be set independently.\n")
    cecho(preText.."You can choose from various announce formats:\n\n")
    cecho(preText.."brief:   You say (OOC), '+'\n")
    cecho(preText.."on:      You say (OOC), 'skill_name+'\n")
    cecho(preText.."verbose: You say (OOC), 'skill_name+ (1234)'\n")
    cecho(preText.."\n")
	cecho(preText.."(Current player setting: "..string.upper(Status.statusAnnounce)..")\n")
	cecho(preText.."(Current pets setting:   "..string.upper(Status.statusAnnouncePet)..")\n")
end



-- /help antispam
-----------------------------------------------------------
local function showHelpAntispam(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: antispam\n")
	cecho(preHead.."USAGE: /set antispam <on|off>\n")
    cecho(preText.."\n")
    cecho(preText.."This command will attempt to suppress repeating lines to cut down on the amount\n")
    cecho(preText.."spam on the screen. This setting can also be toggled on and off from the GAGS\n")
    cecho(preText.."menu. Recommended keeping off unless needed.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusAntiSpam)..")\n")
end



-- /help fontsize
-----------------------------------------------------------
local function showHelpFontsize(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: fontsize\n")
	cecho(preHead.."USAGE: /set fontsize <option> <6-20>\n")
    cecho(preText.."\n")
    cecho(preText.."This command allows you to manually set the fontsize for various DartMUDlet tabs.\n")
    cecho(preText.."Current tab options are: all, chat, improves, message, who\n")
    cecho(preText.."Current font sizes are: 6 to 20\n")
    cecho(preText.."\n")
    cecho(preText.."(Default setting is 10)\n")
end



-- /help block and unblock
-----------------------------------------------------------
local function showHelpBlock(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: block, unblock\n")
	cecho(preHead.."USAGE: /block\n")
    cecho(preHead.."USAGE: /unblock\n")
    cecho(preText.."\n")
    cecho(preText.."The /block command blocks new commands from being sent to the game. It puts these\n")
    cecho(preText.."commands into a queue while you are performing interruptable actions such as casting\n")
    cecho(preText.."spells, writing books, or hunting. The /block command normally runs automatically and\n")
    cecho(preText.."doesn't require the player to trigger it.\n")
    cecho(preText.."\n")
    cecho(preText.."The /unblock command turns off blocking and allows commands to resume being sent to\n")
    cecho(preText.."the game. Any commands that are currently queued by the blocking system are sent first\n")
    cecho(preText.."in the order in which they were queued.\n")
    cecho(preText.."\n")
    cecho(preText.."The /unblock command normally runs automatically, however if you get stuck in blocking\n")
    cecho(preText.."mode for whatever reason, run the /unblock command to manually turn it off.\n")
end



-- /help date
-----------------------------------------------------------
local function showHelpDate(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: date\n")
	cecho(preHead.."USAGE: /date <now>\n")
    cecho(preHead.."USAGE: /date <+|-><num><h|d>\n")
    cecho(preText.."\n")
    cecho(preText.."This command will display the ingame dates for the common, adachian, and thorpian\n")
    cecho(preText.."calendars. It can show dates for the past, present, and future. Some examples of\n")
    cecho(preText.."date commands that can be run:\n")
    cecho(preText.."\n")
    cecho(preText.."/date now            -- display ingame calendar dates as of the current moment\n")
    cecho(preText.."/date +10h           -- display ingame calendar dates for 10 real hours from now\n")
    cecho(preText.."/date +365d          -- display ingame calendar dates for 1 real year from now\n")
    cecho(preText.."/date -12h           -- display ingame calendar dates for 12 real hours ago\n")
    cecho(preText.."/date -30d           -- display ingame calendar dates for 1 real month ago\n")
end



-- /help random
-----------------------------------------------------------
local function showHelpRandom(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: random\n")
	cecho(preHead.."USAGE: /random <num>\n")
    cecho(preHead.."USAGE: /random <value,value,value>\n")
    cecho(preText.."\n")
    cecho(preText.."This command can be used to generate a random number between 1 and a number of\n")
    cecho(preText.."your choosing to broadcast to the room. It can also be used to pick a random item\n")
    cecho(preText.."from a list. Some examples:\n")
    cecho(preText.."\n")
    cecho(preText.."/random 10                            -- pick a random number between 1 and 10\n")
    cecho(preText.."/random 100                           -- pick a random number between 1 and 100\n")
    cecho(preText.."/random apple,orange,banana,peach     -- pick a random item from a list of fruit\n")
end



-- /help focus
-----------------------------------------------------------
local function showHelpFocus(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: focus\n")
	cecho(preHead.."USAGE: /set focus <on|off>\n")
    cecho(preText.."\n")
    cecho(preText.."Use this command to show your running focus total in the main window. The focus\n")
    cecho(preText.."total will already update in the channel tab as you use the channelling system and\n")
    cecho(preText.."the /chan command. Turning this command on will also show the focus total in the\n")
    cecho(preText.."main window.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusFocusTotal)..")\n")
end



-- /help keypad
-----------------------------------------------------------
local function showHelpKeypad(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: keypad\n")
	cecho(preHead.."USAGE: /set keypad <on|off|help>\n")
    cecho(preText.."\n")
    cecho(preText.."Use this command to enable directional movement using the keypad. The numlock key should\n")
    cecho(preText.."be enabled to use this. Four different variations of keypad movement are possible:\n")
    cecho(preText.."\n")
    cecho(preText.."Keypad            - Standard movement\n")
    cecho(preText.."CTRL+Keypad       - Leading movement\n")
    cecho(preText.."SHIFT+Keypad      - Sequential movement (opening and closing doors behind you)\n")
    cecho(preText.."CTRL+SHIFT+Keypad - Sequential leading movement (leading while opening and closing doors)\n")
    cecho(preText.."\n")
    cecho(preText.."Use the keypad keys by themselves, or while pressing the optional CTRL and/or SHIFT keys\n")
    cecho(preText.."to create the type of movement behavior you want. Here is the full list of key bindings:\n")
    cecho(preText.."\n")
    cecho(preText.."Keypad 1        - southwest\n")
    cecho(preText.."Keypad 2        - south\n")
    cecho(preText.."Keypad 3        - southeast\n")
    cecho(preText.."Keypad 4        - west\n")
    cecho(preText.."Keypad 5        - look\n")
    cecho(preText.."Keypad 6        - east\n")
    cecho(preText.."Keypad 7        - northwest\n")
    cecho(preText.."Keypad 8        - north\n")
    cecho(preText.."Keypad 9        - northeast\n")
    cecho(preText.."Keypad -        - up\n")
    cecho(preText.."Keypad +        - down\n")
    cecho(preText.."Keypad /        - survey\n")
    cecho(preText.."Keypad *        - out\n")
    cecho(preText.."Keypad 0        - enter town\n")
    cecho(preText.."Keypad .        - enter gate\n")
    cecho(preText.."Keypad enter    - enter castle\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusKeypad)..")\n")
end



-- /help info
-----------------------------------------------------------
local function showHelpInfo(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: info, share\n")
	cecho(preHead.."USAGE: /info <who> <skill> [<>]\n")
    cecho(preHead.."USAGE: /share <who> <skill> [<>]\n")
    cecho(preText.."\n")
    cecho(preText.."The /info and /share commands will list one or more skills out for you or your pets.\n")
    cecho(preText.."Info will display skills to the screen and share will OOC share them with the room.\n")
    cecho(preText.."You can show a single skill, groups of skill types, or partial names for matching.\n")
    cecho(preText.."These commands function similar to the show skills command available in game. Some\n")
    cecho(preText.."examples of things you can do with these commands:\n")
    cecho(preText.."\n")
    cecho(preText.."/info playername herbalism        -- show info for the player's herbalism skill\n")
    cecho(preText.."/info playername yellow*          -- show player's skills that start with yellow\n")
    cecho(preText.."/info petname <                   -- show ALL a pet's skills in decreasing order\n")
    cecho(preText.."/info playername fighter          -- show player's skills of type 'fighter'\n")
    cecho(preText.."/share petname channelling        -- share a pet's channelling skill with the room\n")
    cecho(preText.."/share playername move >          -- share player's 'move' skills in increasing order\n")
    cecho(preText.."/share playername *other          -- share player's skills ending in other with room\n")
    cecho(preText.."\n")
    cecho(preText.."Valid skill categories are: fighter, mage, thief, crafts, movement (or move)\n")
end



-- /help insert, update
-----------------------------------------------------------
local function showHelpUpdate(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: update, insert\n")
	cecho(preHead.."USAGE: /update <who> <skillname> <num>\n")
    cecho(preHead.."USAGE: /insert <who> <skillname> <num>\n")
    cecho(preText.."\n")
    cecho(preText.."The /update command will update an existing skill for you or your pets. The skill\n")
    cecho(preText.."must already be in the database for it to work.\n")
    cecho(preText.."The /insert command will add a new skill into the database for you or your pets at\n")
    cecho(preText.."the initial number you select. Some examples:\n")
    cecho(preText.."\n")
    cecho(preText.."/update playername herbalism 100    -- update the player's herbalism skill to 100\n")
    cecho(preText.."/update petname fighting 200        -- update a pet's fighting skill to 200\n")
    cecho(preText.."/insert playername shield use 10    -- insert shield use skill for player at skill 10\n")
    cecho(preText.."/insert petname channelling 1       -- insert channelling skill for pet at skill 1\n")
end



-- /help chan, channel
-----------------------------------------------------------
local function showHelpChan(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: chan, channel\n")
	cecho(preHead.."USAGE: /chan <num>\n")
    cecho(preHead.."USAGE: /chan info\n")
	cecho(preHead.."USAGE: /chan pause on|off\n")
	cecho(preHead.."USAGE: /chan share on|off|brief\n")
	cecho(preHead.."USAGE: /chan sound on|off\n")
    cecho(preText.."\n")
    cecho(preText.."The /chan commands help you control the channelling system alongside the CHANNEL\n")
    cecho(preText.."tab window. Available commands are:\n")
    cecho(preText.."\n")
    cecho(preText.."/chan <num>                    - Manually channel amount to the channelling system\n")
    cecho(preText.."/chan info                     - Display full channelling stats on screen\n")
    cecho(preText.."/chan pause on|off             - Pause powercast to wait for full concentration\n")
    cecho(preText.."/chan share on|off|brief       - Change settings of the channel share button\n")
	cecho(preText.."/chan sound on|off             - Play notification sound before powercast\n")
	cecho(preText.."\n")
	cecho(preText.."(Current pause setting is "..string.upper(Status.powercastPause)..")\n")
	cecho(preText.."(Current share setting is "..string.upper(Status.statusChanShare)..")\n")
	cecho(preText.."(Current sound setting is "..string.upper(Status.statusPlaySound)..")\n")
end



-- /help repeat, repeats
-----------------------------------------------------------
local function showHelpRepeat(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: repeat\n")
	cecho(preHead.."USAGE: /repeat clear <num>\n")
    cecho(preHead.."USAGE: /repeat copy <num> <num>\n")
	cecho(preHead.."USAGE: /repeat echo on|off \n")
    cecho(preText.."\n")
    cecho(preText.."The /repeat commands help you control the repeat command system alongside the REPEAT\n")
    cecho(preText.."tab window. Available commands are:\n")
    cecho(preText.."\n")
    cecho(preText.."/repeat clear <num>              - Clear the contents of a repeat set\n")
    cecho(preText.."/repeat copy <num> <num>         - Copy one repeat set over to another\n")
    cecho(preText.."/repeat echo on|off              - Echo repeat commands to the screen (default off)\n")
	cecho(preText.."#num <command>                   - Basic repeat commands (e.g. #3 say hi)\n")
	cecho(preText.."\n")
	cecho(preText.."(Current repeat echo setting is "..string.upper(Status.statusRepeatEcho)..")\n")
end



-- /help alloc, allocs
-----------------------------------------------------------
local function showHelpAlloc(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: alloc, allocs\n")
	cecho(preHead.."USAGE: /alloc clear <num>\n")
    cecho(preHead.."USAGE: /alloc copy <num> <num>\n")
    cecho(preText.."\n")
    cecho(preText.."The /alloc commands help you control the allocation system alongside the ALLOCS\n")
    cecho(preText.."tab window. Available commands are:\n")
    cecho(preText.."\n")
    cecho(preText.."/alloc clear <num>               - Clear the contents of an allocation set\n")
    cecho(preText.."/alloc copy <num> <num>          - Copy one allocation set over to another\n")
end



-- /help cast, casting
-----------------------------------------------------------
local function showHelpCast(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: cast, casting\n")
	cecho(preHead.."USAGE: /cast power <num>\n")
    cecho(preText.."\n")
    cecho(preText.."The /cast commands help you control the spell practice system alongside the CASTING\n")
    cecho(preText.."tab window. Available commands are:\n")
    cecho(preText.."\n")
    cecho(preText.."/cast power <power>             - Change the autocast power via keyboard command\n")
end



-- /help inscribe, scrolls
-----------------------------------------------------------
local function showHelpInscribe(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: inscribe, scrolls\n")
	cecho(preHead.."USAGE: /inscribe <spell> <power>\n")
    cecho(preHead.."USAGE: /inscribe power <power>\n")
	cecho(preHead.."USAGE: /inscribe off\n")
    cecho(preText.."\n")
    cecho(preText.."The /inscribe commands help you control the scroll practice system. This system will\n")
    cecho(preText.."take a blank scroll held by the player and automatically inscribe and practice invoke\n")
    cecho(preText.."with it. Available commands are:\n")
	cecho(preText.."\n")
    cecho(preText.."/inscribe <spell> <power>        - Start practice inscribing a spell\n")
    cecho(preText.."/inscribe power <power>          - Change power you are using for practice inscribe\n")
    cecho(preText.."/inscribe off                    - Stop practice inscribing a spell\n")
end



-- /help alignment
-----------------------------------------------------------
local function showHelpAlignment(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: alignment\n")
	cecho(preHead.."USAGE: /set alignment <on|off>\n")
    cecho(preText.."\n")
    cecho(preText.."Use this command to change the auto update status of the player's alignment.\n")
    cecho(preText.."When activated, alignment will automatically be checked every 5 minutes on the\n")
    cecho(preText.."same cycle as the automatic 'who' command. Like the 'who' command, this\n")
    cecho(preText.."will prevent a player from idling out of the game.\n")
    cecho(preText.."\n")
    cecho(preText.."(Current setting is "..string.upper(Status.statusAlignment)..")\n")
end



-- /help set, settings
-----------------------------------------------------------
local function showHelpSet(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: set, settings\n")
	cecho(preHead.."USAGE: /set <options>\n")
    cecho(preHead.."USAGE: /help set <option> - for more information.\n")
    cecho(preText.."\n")
    cecho(preText.."Current list of /set options include:\n")
	cecho(preText.."alignment          Turn auto alignment updates on/off\n")
	cecho(preText.."announce           Automatically OOC announce skill improvements to the room\n")
	cecho(preText.."antispam           Suppress repeating lines to cut down on screen spam\n")
	cecho(preText.."aura               Displays aura status to the screen in addition to aura box\n")
	cecho(preText.."conc               Displays concentration status to the screen in addition to conc box\n")
	cecho(preText.."contents           List container contents out in combined, alphabetical view\n")
	cecho(preText.."focus              Show your running focus total in the main window\n")
    cecho(preText.."fontsize           Set the font size for various DartMUDlet windows\n")
    cecho(preText.."keypad             Turn keypad movement on/off\n")
	cecho(preText.."who                Automatically update who tab every five minutes\n")
end



-- /help tracking
-----------------------------------------------------------
local function showHelpTracking(args)
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."DARTMUDLET: tracking\n")
	cecho(preHead.."USAGE: /track <name|on|off|toggle|reset>\n")
    cecho(preText.."\n")
    cecho(preText.."NAME: Displays detailed statistics for skills gained while tracking system is active.\n")
    cecho(preText.."This can be for the player or for any pets that gained skills during this time.\n")
    cecho(preText.."\n")
    cecho(preText.."ON|OFF: Turns the tracking system on or off if not already at that status.\n")
    cecho(preText.."\n")
    cecho(preText.."TOGGLE: Flips the tracking system on or off depending on what the current status is.\n")
    cecho(preText.."This can also be done using the TRACKING ON/OFF button in the tracking tab.\n")
    cecho(preText.."\n")
    cecho(preText.."RESET: Reset the tracking stats and timer to zero. This can also be done using the\n")
    cecho(preText.."button labeled RESET TRACKING in the tracking tab.\n")
    cecho(preText.."\n")
end



-- /help main
-----------------------------------------------------------
local function showHelp(args)
    local detail = args["detail"]

    detail = trim(detail)
    detail = string.gsub(detail, "/", "")

    if (detail == "") or (detail == nil) or (detail == "help") then
        showHelpBase()
    elseif (detail == "level") or (detail == "levels") then
        showHelpLevels()
    elseif (detail == "track") or (detail == "tracking") then
        showHelpTracking()
    elseif (detail == "who") or (detail == "who on") then
        showHelpWho()
    elseif (detail == "content") or (detail == "contents") then
        showHelpContents()
    elseif (detail == "aura") or (detail == "aura on") then
        showHelpAura()
    elseif (detail == "conc") or (detail == "conc on") then
        showHelpConc()
    elseif (detail == "setup") or (detail == "resetup") then
        showHelpSetup()
    elseif (detail == "announce") or (detail == "verbose") then
        showHelpAnnounce()
    elseif (detail == "antispam") or (detail == "set antispam") then
        showHelpAntispam()
    elseif (detail == "fontsize") or (detail == "set fontsize") then
        showHelpFontsize()
    elseif (detail == "block") or (detail == "unblock") then
        showHelpBlock()
    elseif (detail == "date") or (detail == "date now") then
        showHelpDate()
    elseif (detail == "random") or (detail == "rand") then
        showHelpRandom()
    elseif (detail == "focus") or (detail == "focus on") then
        showHelpFocus()
    elseif (detail == "share") or (detail == "info") then
        showHelpInfo()
    elseif (detail == "update") or (detail == "insert") then
        showHelpUpdate()
    elseif (detail == "keypad") or (detail == "set keypad") then
        showHelpKeypad()
	elseif (detail == "set") or (detail == "settings") then
        showHelpSet()
	elseif (detail == "alignment") or (detail == "set alignment") then
        showHelpAlignment()
	elseif (detail == "chan") or (detail == "channel") then
        showHelpChan()
	elseif (detail == "inscribe") or (detail == "scrolls") then
        showHelpInscribe()
	elseif (detail == "alloc") or (detail == "allocs") then
        showHelpAlloc()
	elseif (detail == "cast") or (detail == "casting") then
        showHelpCast()
	elseif (detail == "repeat") or (detail == "repeats") then
        showHelpRepeat()
	else
		cecho("<"..colorTips..">HELP: Unknown help topic\n")
    end
end



-- /levels command	
-----------------------------------------------------------
local function showLevels(args)
	local skillnumPosition = 24
	local skillsizePosition = 44
	local preText = "<"..colorHelp..">"..spacerHelp
	local preHead = "<"..colorHead..">"..spacerHelp


	cecho(preHead.."Skill Name              Level               Size\n")
	cecho(preHead.."================================================\n")	
	for i,v in pairs(levels) do
		local skillSize    = ""
		local currentSkill = name2lvl(v)

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



-- show contents style containers
-- TODO: cleanup the book hack
-----------------------------------------------------------
local function showContents(args)
	local detail        = args["detail"]
	local items         = {}
	local itemOrder     = {}
	local falseStack    = {}
	local item          = ""
	local tempNum

	deleteLine()

	for k,v in pairs (detail) do
		-- negative look ahead regex causes double matches
		if k % 2 == 0 then

			item = string.gsub(v, ", ", "")
			item = trim(item)
			item = string.gsub(item, "^You catch ", "")
			item = string.gsub(item, " in your fishing net$", "")
			item = string.gsub(item, "^and ", "")
			item = string.gsub(item, "^an ", "")
			item = string.gsub(item, "^a ", "")
			tempNum = string.match(item, "^([0-9]+)")

			if tempNum then
				tempNum = tonumber(tempNum)
				item = trim(string.gsub(item, tempNum, ""))
			else
				tempNum = 1
			end

			-- build a count of each item type for final display
			if items[item] then
				items[item] = items[item] + tempNum
				falseStack[item] = true
			else
				items[item] = tempNum
				table.insert(itemOrder, item);
				falseStack[item] = false
			end
		end
	end

	-- sort alphabetically
	local keys = {}
	for key in pairs(items) do
		table.insert(keys, key)
	end
	table.sort(keys)

	echo("\n===============================================\n")
	for _, key in ipairs(keys) do
		local stack	= ""

		if key ~= 'by King Islagador"' then

			if items[key] > 1 then
				if falseStack[key] then
					stack = "<LightSlateGrey>"..items[key].."x"
				else
					stack = "<reset>"..items[key].."x"
				end
			end
			if key == 'volume entitled "A Treatise on Traps' then key = key..', by King Islagador"' end
			cecho(stack.."\t"..key.."\n")
		end
	end
	echo("===============================================\n")

end



-- show game date in the past, present, or future
-----------------------------------------------------------
local function showDate(args)
    local detail        = args["detail"]
    local direction
    local timemod
    local timetype


    detail = trim(detail)
    detail = string.lower(detail)
    direction, timemod, timetype = detail:match("^([+-]?)(%d+)(%w+)$")

    if (timetype ~= "h") and
    (timetype ~= "hr") and
    (timetype ~= "hour") and
    (timetype ~= "hours") and
    (timetype ~= "d") and
    (timetype ~= "day") and
    (timetype ~= "days") and
    (timetype ~= nil) then
        detail = "help"
    end

    if (detail == "now") or (detail == "current") or (detail == "present") then
        print("===============================================")
        print("Game date as of now ("..os.date("%Y-%m-%d %H:%M:%S").."):\n")
        print("Date(common):   "..date.format(os.time(), 3, "common"))
        print("Date(Adachian): "..date.format(os.time(), 3, "adachian"))
        print("Date(Thorpian): "..date.format(os.time(), 3, "thorpian"))
        print("===============================================")
    elseif (detail == "") or (detail == "help") or ((not direction) or (not timemod) or (not timetype)) then
        cecho("<"..colorTips..">USAGE: /date now                -- Show current game dates\n")
        cecho("<"..colorTips..">USAGE: /date <+|-><num><h|d>    -- Show game dates in the past or future\n")
    else
        local timechange    = 0
        local timetotal     = os.time()
        timetype            = string.lower(timetype)
        timemod             = tonumber(timemod)

        if (timemod > 999) or (timemod < 1) then
            cecho("<red>ERROR: date out of range\n")
            return
        end

        if (timetype == "h") or (timetype == "hr") or (timetype == "hour") or (timetype == "hours")then
            timechange = timemod * 3600
            timetype = "hours"
        else
            timechange = timemod * 86400
            timetype = "days"
        end

        print("===============================================")

        if (direction == "-") then
            timetotal = timetotal - timechange
            print("Game date "..timemod.." "..timetype.." ago ("..os.date("%Y-%m-%d %H:%M:%S",timetotal).."):\n")
        else
            timetotal = timetotal + timechange
            print("Game date "..timemod.." "..timetype.." from now ("..os.date("%Y-%m-%d %H:%M:%S",timetotal).."):\n")
        end

        print("Date(common):   "..date.format(timetotal, 3, "common"))
        print("Date(Adachian): "..date.format(timetotal, 3, "adachian"))
        print("Date(Thorpian): "..date.format(timetotal, 3, "thorpian"))

        print("===============================================")
    end

end



-- return spell casting text
-----------------------------------------------------------
local function showSpellCasting()
    local count
	local spellcastingText  = ""
	local results           = Skills.getSkill({who = Status.name, skill_name = "spell casting"})


	if results ~= -1 then
		count = tonumber(results.count)
	else
		count = 0
	end

	spellcastingText = "<yellow>SPELL CASTING:&nbsp;&nbsp;&nbsp;"..count

	return spellcastingText
end



-- return powercast success percentage
-----------------------------------------------------------
local function showPowercastPercentage()
	local powercastPercentDisplay = ""


	if Status.powercastTotal == 0 then
		Status.powercastPercent = 0
	else
		Status.powercastPercent = (Status.powercastSuccess / Status.powercastTotal) * 100
	end

	powercastPercentDisplay = "<yellow>SUCCESS RATE:&nbsp;&nbsp;&nbsp;&nbsp;"..string.format("%.1f", Status.powercastPercent).."%"

	return powercastPercentDisplay
end



-- return under construction message
-----------------------------------------------------------
local function showUnderConstruction()
	local helpText      = ""
	local helpTagYellow = "<span style=\"color: yellow;\">"
	local helpTagOff    = "</span>"


	helpText = helpText..helpTagYellow
	helpText = helpText.."Coming Soon!"
	helpText = helpText..helpTagOff

	return helpText
end



-- return in progress message
-----------------------------------------------------------
local function showInProgress()
	local helpText      = ""
	local helpTagYellow = "<span style=\"color: yellow;\">"
	local helpTagOff    = "</span>"


	helpText = helpText..helpTagYellow
	helpText = helpText.."&#128679; Work in Progress! &#128679;"
	helpText = helpText..helpTagOff

	return helpText
end



-- display the voting links on login
-----------------------------------------------------------
local function showVoting()

	local linkList = {
		{ url = "https://www.mudverse.com/vote/619",                            label = "Vote on MudVerse:       " },
		{ url = "https://browsermmorpg.com/vote.php?id=1702",                   label = "Vote on Browser MMORPG: " },
		{ url = "https://topwebgames.com/game/dartmud-lands-of-ferdarchi/vote", label = "Vote on Top Web Games:  " }
	}

	--echo("\n")
	cecho("\n<yellow>VOTE FOR DARTMUD!\n")
	cecho("<yellow>--------------------------------------------------------------------------------\n")
	for _, link in ipairs(linkList) do
		cecho("<cyan>"..link.label.."<u><white>"..link.url.."\n")
		selectString(link.url, 1)
		setUnderline(true)
		setLink("openWebPage('"..link.url.."')", "Click to open voting site")
	end
	cecho("<yellow>--------------------------------------------------------------------------------\n")
end



-- delete prompt only lines
-----------------------------------------------------------
local function emptyLine(args)
	deleteLine()
end



function setup(args)
	Events.addListener("showContentsEvent", sourceName, showContents)
	Events.addListener("showHelpEvent", sourceName, showHelp)
	Events.addListener("showRandomEvent", sourceName, showRandom)
	Events.addListener("showLevelsEvent", sourceName, showLevels)
    Events.addListener("showDateEvent", sourceName, showDate)
	Events.addListener("emptylineEvent", sourceName, emptyLine)
	Events.addListener("votingEvent", sourceName, showVoting)
end



function unsetup(args)
	Events.removeListener("showContentsEvent", sourceName)
	Events.removeListener("showHelpEvent", sourceName)
	Events.removeListener("showRandomEvent", sourceName)
	Events.removeListener("showLevelsEvent", sourceName)
    Events.removeListener("showDateEvent", sourceName)
	Events.removeListener("emptylineEvent", sourceName)
	Events.removeListener("votingEvent", sourceName)
end



function resetup(args)
	unsetup(args)
	setup(args)
end



Info =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	showQuickHelp = showQuickHelp,
	showQuickLevels = showQuickLevels,
	showSpellCasting = showSpellCasting,
	showInProgress = showInProgress,
	showUnderConstruction = showUnderConstruction,
	showPowercastPercentage = showPowercastPercentage
}

return Info

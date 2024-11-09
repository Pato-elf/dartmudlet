GUI							= GUI or {}
aura						= "unknown"
local windows				= {}
local windows_ByPosition	= {}
windows_ByPosition.topRight	= {}
windows_ByPosition.topLeft	= {}
windows_ByPosition.right	= {}



-- CREATE GUI
-----------------------------------------------------------
local function createUIConsole()
	GUI.top = Adjustable.Container:new({name = "top",x=0, y=0, height=188})
	GUI.right = Adjustable.Container:new({name = "right", x=-600, y=0, width=600, height="100%"})

	GUI.top:attachToBorder("top")
	GUI.right:attachToBorder("right")
	GUI.top:connectToBorder("right")

	GUI.top:setTitle("")
	GUI.right:setTitle("")

	GUI.top:setBorderMargin(0)
	GUI.top:setPadding(2)
	GUI.right:setBorderMargin(0)
	GUI.right:setPadding(2)

	createTabwindows()

	-- TABWINDOW1
	-------------------------
	createWhoBox()
	createLevelsBox()
	createMessageBox()

	-- TABWINDOW2
	-------------------------
	createImproveBox()
	createRefreshBox()
	createChannelBox()
	createAllocsBox()
	createRepeatBox()

	-- TABWINDOW3
	-------------------------
	createInfoBox()
    createGagsBox()
	createHelpBox()

	-- TABWINDOW4
	-------------------------
	createChatBox()
  
--GUI.top:load()
--GUI.right:load()
--GUI.tabwindow1:load()

end --createUIConsole



-- update chat box
-----------------------------------------------------------
local function onChat(args)
	local text = args["message"]
	local timestamp = getTime(true, "hh:mm:ss")
	echo("ChatBox", timestamp.." ")
	-- even though we get the text passed into the event we will get the text
	-- from buffer to preserve colors/formatting
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end



-- update who box
-----------------------------------------------------------
local function onWho(args)
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	deleteLine()
end

local function onStartWho(args)
	clearWindow("WhoBox")
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	Events.addListener("whoEvent", sourceName, onWho)
	deleteLine()
end

local function onWhoEnd(args)
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	Events.removeListener("whoEvent", sourceName)
	deleteLine()
end



-- update message box
-----------------------------------------------------------
local function onMessage(args)
	message = args["message"]
	cecho("MessageBox", " "..message)
end



-- update improves box
-----------------------------------------------------------
local function onImprove(args)
	local who			= args["name"]
	local skill_name	= args["skill_name"]
	local timestamp		= getTime(true, "hh:mm:ss")
	local output		= ''
	local count


	if args["text"] ~= nil then
		output = timestamp.." "..args["text"]
	else

		local skillVar = Skills.getSkill({who = who, skill_name = skill_name})

		if skillVar ~= -1 then
			count = tonumber(skillVar.count)
		else
			count = 1
		end

		local level = Skills.imp2lvl(count)
		local nextLevel = level.next_level
		if nextLevel == nil then
			if(who ~= Status.name) then
				output = timestamp.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..")"
			else
				output = timestamp.." "..skill_name.." - "..count.." ("..level.abbr..")"
			end
		else
			local tilNext = nextLevel.min - count
			if(who ~= Status.name) then
				output = timestamp.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
			else
				output = timestamp.." "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
			end
		end
	end

	echo("ImproveBox", " "..output.."\n")

	if skill_name == "spell casting" then
		cecho("ChannelTextBox1", Info.showSpellCasting())
		cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
		cecho("ChannelTextBox4", Info.showPowercastPercentage())

		local query = 'UPDATE channel '
		query = query..'SET powercastTotal='..Status.powercastTotal..', '
		query = query..'powercastSuccess='..Status.powercastSuccess
		dba.execute(query)
	end
	
end

local function onSkillMistake(args)
	selectCurrentLine("ImproveBox")
	deleteLine("ImproveBox")
	echo("ImproveBox", "")
end



-- update name box
-----------------------------------------------------------
local function onName(args)
	local showname		= args["fullname"]
	local name_table	= showname:split("are ")
	local name_table2


	showname = name_table[2]
	name_table2 = showname:split("%. ")
	showname = name_table2[1]

	cecho("\n"..showname)
	clearWindow("NameBox")
	cecho("NameBox", "Name: "..showname)
	deleteLine()
	
end



-- update age box
-----------------------------------------------------------
local function onAge(args)
	local years		= args["years"]
	local months	= args["months"]


	clearWindow("AgeBox")
	if months == "" then months = "0" end
	cecho("AgeBox", "Age: "..years.." years, "..months.." months")
	deleteLine()
end



-- update hunger box
-----------------------------------------------------------
local function onHunger(args)
	local hunger = args["hunger"]


	if hunger == "well fed" then hunger = "<pale_green>"..hunger
	elseif hunger == "not hungry" then hunger = "<pale_green>"..hunger
	elseif hunger == "slightly hungry" then hunger = "<yellow>"..hunger
	elseif hunger == "hungry" then hunger = "<yellow>"..hunger
	elseif hunger == "famished" then hunger = "<red>"..hunger
	elseif hunger == "faint from hunger" then hunger = "<red>"..hunger
	elseif hunger == "starving" then hunger = "<red>"..hunger
	elseif hunger == "starving to death" then hunger = "<red>"..hunger
	end
	
	clearWindow("HungerBox")
	cecho("HungerBox", "Hunger: "..hunger)
	moveCursorEnd()
end



-- update thirst box
-----------------------------------------------------------
local function onThirst(args)
	local thirst = args["thirst"]


	if thirst == "well slaked" then thirst = "<pale_green>"..thirst
	elseif thirst == "not thirsty" then thirst = "<pale_green>"..thirst
	elseif thirst == "slightly thirsty" then thirst = "<yellow>"..thirst
	elseif thirst == "thirsty" then thirst = "<yellow>"..thirst
	elseif thirst == "parched" then thirst = "<red>"..thirst
	elseif thirst == "faint from thirst" then thirst = "<red>"..thirst
	elseif thirst == "completely dehydrated" then thirst = "<red>"..thirst
	elseif thirst == "dying of thirst" then thirst = "<red>"..thirst
	end

	clearWindow("ThirstBox")
	cecho("ThirstBox", "Thirst: "..thirst)
	deleteLine()
	moveCursorEnd()
end



-- update encumbrance box
-----------------------------------------------------------
local function onEncumbrance(args)
	local encumbrance = args["encumbrance"]


	clearWindow("EncumbranceBox")
	cecho("EncumbranceBox", "Encumbrance: "..encumbrance)
	deleteLine()
	moveCursorEnd()
end



-- update movement box
-----------------------------------------------------------
local function onMovement(args)
	local movement = args["movement"]


	clearWindow("MovementBox")
	cecho("MovementBox", " Movement: "..movement)
	deleteLine()
	moveCursorEnd()
end



-- update date box
-----------------------------------------------------------
local function refreshUI(args)
	clearWindow("DateBox")
	cecho("DateBox", "Date(common): "..date.format(os.time(), 3, "common").."\nDate(Thorpian): "..date.format(os.time(), 3, "thorpian"))
end



-- update language box
-----------------------------------------------------------
local function onLanguage(args)
	local language  = args["detail"]


	clearWindow("LanguageBox")
	cecho("LanguageBox", "<cyan><b>Speak: "..language.."</b>")
end



-- update aim box
-----------------------------------------------------------
local function onAim(args)
	local target  = args["detail"]


	clearWindow("AimBox")
	cecho("AimBox", "<cyan><b>Aim:&nbsp;&nbsp;&nbsp;"..target.."</b>")
end



-- update aura box
-----------------------------------------------------------
local function onAura(args)
	local full				= args["full"]
	local auraBoxTextColor	= "white"
	local auraBoxBGColor	= "black"
	local scintBackground	= packageFolder.."MEDIA/rainbow_small.png"
	aura					= args["aura"]


	if (Status.statusAura == "off") or (string.match(full, "^".."Aura")) then
		deleteLine()
		moveCursorEnd()
	elseif (Status.statusAura == "scint") and (aura ~= "scintillating") then
		deleteLine()
		moveCursorEnd()
	end



	if aura == "scintillating" then auraBoxTextColor = "mediumblue" auraBoxBGColor = "crimson"
	elseif aura == "intense octarine" then auraBoxTextColor = "indigo" auraBoxBGColor = "aquamarine"
	elseif aura == "octarine" then auraBoxTextColor = "mediumvioletred" auraBoxBGColor = "aquamarine"
	elseif aura == "dim octarine" then auraBoxTextColor = "black" auraBoxBGColor = "aquamarine"  
	elseif aura == "intense violet" then auraBoxTextColor = "white" auraBoxBGColor = "darkmagenta"
	elseif aura == "violet" then auraBoxTextColor = "lightgrey" auraBoxBGColor = "darkmagenta"
	elseif aura == "dim violet" then auraBoxTextColor = "darkgrey" auraBoxBGColor = "darkmagenta"
	elseif aura == "intense indigo" then auraBoxTextColor = "white" auraBoxBGColor = "midnightblue"
	elseif aura == "indigo" then auraBoxTextColor = "lightgrey" auraBoxBGColor = "midnightblue"
	elseif aura == "dim indigo" then auraBoxTextColor = "dimgrey" auraBoxBGColor = "midnightblue"
	elseif aura == "intense blue" then auraBoxTextColor = "white" auraBoxBGColor = "blue"
	elseif aura == "blue" then auraBoxTextColor = "lightgrey" auraBoxBGColor = "blue"
	elseif aura == "greenish-blue" then auraBoxTextColor = "green" auraBoxBGColor = "blue"
	elseif aura == "bluish-green" then auraBoxTextColor = "blue" auraBoxBGColor = "darkgreen"
	elseif aura == "green" then auraBoxTextColor = "lightgreen" auraBoxBGColor = "darkgreen"
	elseif aura == "yellowish-green" then auraBoxTextColor = "yellow" auraBoxBGColor = "darkgreen"
	elseif aura == "greenish-yellow" then auraBoxTextColor = "darkgreen" auraBoxBGColor = "yellow"
	elseif aura == "yellow" then auraBoxTextColor = "darkgoldenrod" auraBoxBGColor = "yellow"
	elseif aura == "orangish-yellow" then auraBoxTextColor = "orangered" auraBoxBGColor = "yellow"
	elseif aura == "yellowish-orange" then auraBoxTextColor = "yellow" auraBoxBGColor = "orangered"
	elseif aura == "orange" then auraBoxTextColor = "white" auraBoxBGColor = "orangered"
	elseif aura == "reddish-orange" then auraBoxTextColor = "darkred" auraBoxBGColor = "orangered"
	elseif aura == "orangish-red" then auraBoxTextColor = "orangered" auraBoxBGColor = "darkred"
	elseif aura == "red" then auraBoxTextColor = "white" auraBoxBGColor = "darkred"
	elseif aura == "dim red" then auraBoxTextColor = "darkgrey" auraBoxBGColor = "darkred"
	elseif aura == "very dim red" then auraBoxTextColor = "black" auraBoxBGColor = "darkred"
	else aura = "no aura" auraBoxTextColor = "white" auraBoxBGColor = "black"
	end

	if aura == "scintillating" then
	setLabelStyleSheet("AuraBox",[[
		QLabel{
			font-size: 30px;
			font-weight: bold;
			font-family: verdana, tahoma;
			border-image: url("]]..scintBackground..[[");
			background-color: ]]..auraBoxBGColor..[[;
			margin: 0px 12px 0px 12px;
			border: 2px solid white;
		}
	]])
	else
	setLabelStyleSheet("AuraBox",[[
		QLabel{
			font-size: 30px;
			font-weight: bold;
			font-family: verdana, tahoma;
			background-color: ]]..auraBoxBGColor..[[;
			margin: 0px 12px 0px 12px;
		}
	]])
	end

	echo("AuraBox", [[<center style="color:]]..auraBoxTextColor..[[;">]]..aura.."</center>")

end



-- update concentration box
-----------------------------------------------------------
local function onConc(args)
	local full				= args["full"]
	local concBoxTextColor	= "white"
	local concBoxBGColor	= "black"
	local displayConc		= ""
	conc					= args["conc"]


	if (Status.statusConc == "off") or (string.match(full, "^".."Concentration")) then
		deleteLine()
		moveCursorEnd()
	elseif (Status.statusConc == "bright") and (conc ~= "You're bright-eyed and bushy-tailed.") then
		deleteLine()
		moveCursorEnd()
	end

	if conc == "You're bright-eyed and bushy-tailed." then concBoxTextColor = "white" concBoxBGColor = "darkgreen"
	elseif conc == "You're a bit off balance." then concBoxTextColor = "lightgrey" concBoxBGColor = "green"
	elseif conc == "You're somewhat distracted." then concBoxTextColor = "black" concBoxBGColor = "green"
	elseif conc == "You're off balance." then concBoxTextColor = "grey" concBoxBGColor = "yellow"
	elseif conc == "You're quite distracted." then concBoxTextColor = "black" concBoxBGColor = "goldenrod"
	elseif conc == "You're distracted and off balance." then concBoxTextColor = "white" concBoxBGColor = "red"
	elseif conc == "Your concentration is shot to hell." then concBoxTextColor = "white" concBoxBGColor = "darkred"
	elseif conc == "You're too confused to remember your name." then concBoxTextColor = "black" concBoxBGColor = "darkred"
	end

	setLabelStyleSheet("ConcBox",[[
		QLabel{
			font-size: 22px;
			font-weight: bold;
			font-family: verdana, tahoma;
			background-color: ]]..concBoxBGColor..[[;
			margin: 0px 10px 0px 10px;
			border: 2px solid white;
		}
	]])

	if conc == "You're too confused to remember your name." then
		displayConc = "Too confused to remember your name."
	else
		displayConc = conc
	end

	echo("ConcBox", [[<center style="color:]]..concBoxTextColor..[[;">]]..displayConc.."</center>")

end



local function setup(args)
	loadStylesheets()
	createUIConsole()

	Events.addListener("chatEvent", sourceName, onChat)
	Events.addListener("skillMistakeEvent", sourceName, onSkillMistake)
	Events.addListener("startWhoEvent", sourceName, onStartWho)
	Events.addListener("endWhoEvent", sourceName, onWhoEnd)
	Events.addListener("refreshUIEvent", sourceName, refreshUI)
	Events.addListener("nameEvent", sourceName, onName)
	Events.addListener("SoulAgeEvent", sourceName, onAge)
	Events.addListener("hungerEvent", sourceName, onHunger)
	Events.addListener("thirstEvent", sourceName, onThirst)
	Events.addListener("encumbranceEvent", sourceName, onEncumbrance)
	Events.addListener("movementEvent", sourceName, onMovement)
	Events.addListener("messageEvent", sourceName, onMessage)
	Events.addListener("concEvent", sourceName, onConc)
	Events.addListener("auraEvent", sourceName, onAura)
	Events.addListener("showLanguageEvent", sourceName, onLanguage)
    Events.addListener("showAimEvent", sourceName, onAim)
end

local function unsetup(args)
	Events.removeListener("chatEvent", sourceName)
	Events.removeListener("skillMistakeEvent", sourceName)
	Events.removeListener("startWhoEvent", sourceName)
	Events.removeListener("whoEvent", sourceName)
	Events.removeListener("endWhoEvent", sourceName)
	Events.removeListener("nameEvent", sourceName)
	Events.removeListener("SoulAgeEvent", sourceName)
	Events.removeListener("hungerEvent", sourceName)
	Events.removeListener("thirstEvent", sourceName)
	Events.removeListener("encumbranceEvent", sourceName)
	Events.removeListener("movementEvent", sourceName)
	Events.removeListener("messageEvent", sourceName)
	Events.removeListener("concEvent", sourceName)
	Events.removeListener("auraEvent", sourceName)
	Events.removeListener("showAimEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	resetup(args)
end


UI = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	onImprove = onImprove
}

return UI

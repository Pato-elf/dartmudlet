GUI = GUI or {}
local windows = {}
local windows_ByPosition = {}
windows_ByPosition.topRight = {}
windows_ByPosition.topLeft = {}
windows_ByPosition.right = {}



-- CREATE GUI
---------------------------------------------------------------------
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


GUI.tabwindow1 = GUI.tabwindow1 or
	Adjustable.TabWindow:new({
		name = "tabwindow1",
		x = 0, y = 0,
		width = "100%",
		height = "25%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"WHO","CHANNEL","STATS","ALLOCS","MAP"},
	},GUI.right)


GUI.tabwindow2 = GUI.tabwindow2 or
	Adjustable.TabWindow:new({
		name = "tabwindow2",
		x = 0, y = "25%",
		width = "100%",
		height = "25%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"MESSAGE","CAST","MISC","MISC2"},
	},GUI.right)

  
GUI.tabwindow3 = GUI.tabwindow3 or
	Adjustable.TabWindow:new({
		name = "tabwindow3",
		x = 0, y = "50%",
		width = "100%",
		height = "25%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"IMPROVE","TEST2"},
	},GUI.right)
  
  
GUI.tabwindow4 = GUI.tabwindow4 or
	Adjustable.TabWindow:new({
		name = "tabwindow4",
		x = 0, y = "75%",
		width = "100%",
		height = "25%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"INFO","TEST4"},
	},GUI.right)


GUI.tabwindow5 = GUI.tabwindow5 or
	Adjustable.TabWindow:new({
		name = "tabwindow5",
		x = 0, y = 0,
		width = "100%",
		height = "100%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"CHAT"},
	},GUI.top)
  


-- CREATE CHAT BOX
-----------------------------------------------------------
GUI.containerChatBox = GUI.containerChatBox or
	Geyser.MiniConsole:new({
		name = "ChatBox",
		x = 12, y = 10,
		fontSize = 8,
		width = "98%",
		height = "89%",
		color = "black"
	}, GUI.tabwindow5.CHATcenter)

local window								= {border = GUI.tabwindow5.CHATcenter, container = GUI.containerChatBox}
windows["ChatBox"]							= window
windows_ByPosition["topLeft"]["ChatBox"]	= window



-- CREATE WHO BOX
-----------------------------------------------------------
GUI.containerWhoBox = GUI.containerWhoBox or
	Geyser.MiniConsole:new({
		name = "WhoBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow1.WHOcenter)

local window								= {border = GUI.tabwindow1.WHOcenter, container = GUI.containerWhoBox}
windows["WhoBox"]							= window
windows_ByPosition["topLeft"]["WhoBox"]		= window



-- CREATE MESSAGE BOX
-----------------------------------------------------------
GUI.containerMessageBox = GUI.containerMessageBox or
	Geyser.MiniConsole:new({
		name = "MessageBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow2.MESSAGEcenter)

local window								= {border = GUI.tabwindow2.MESSAGEcenter, container = GUI.containerMessageBox}
windows["MessageBox"]						= window
windows_ByPosition["topLeft"]["MessageBox"]	= window



-- CREATE IMPROVE BOX
-----------------------------------------------------------
GUI.containerImproveBox = GUI.containerImproveBox or
	Geyser.MiniConsole:new({
		name = "ImproveBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow3.IMPROVEcenter)

local window								= {border = GUI.tabwindow3.IMPROVEcenter, container = GUI.containerImproveBox}
windows["ImproveBox"]						= window
windows_ByPosition["topLeft"]["ImproveBox"]	= window



-- CREATE INFO BOX
-----------------------------------------------------------
GUI.containerInfoBox = GUI.containerInfoBox or
	Geyser.MiniConsole:new({
		name = "InfoBox",
		x = 16, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow4.INFOcenter)

local window								= {border = GUI.tabwindow4.INFOcenter, container = GUI.containerInfoBox}
windows["InfoBox"]							= window
windows_ByPosition["topLeft"]["InfoBox"]	= window



	-- CREATE NAME BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerNameBox = GUI.containerNameBox or
		Geyser.MiniConsole:new({
			name = "NameBox",
			x = 0, y = 5,
			fontSize = 11,
			width = "100%",
			height = 18,
			color = "black"
		}, GUI.containerInfoBox)

	local window								= {border = GUI.containerInfoBox, container = GUI.containerNameBox}
	windows["NameBox"]							= window
	windows_ByPosition["topLeft"]["NameBox"]	= window



	-- CREATE AGE BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerAgeBox = GUI.containerAgeBox or
		Geyser.MiniConsole:new({
			name = "AgeBox",
			x = 0, y = 23,
			fontSize = 11,
			width = "100%",
			height = 18,
			color = "black"
		}, GUI.containerInfoBox)

	local window								= {border = GUI.containerInfoBox, container = GUI.containerAgeBox}
	windows["AgeBox"]							= window
	windows_ByPosition["topLeft"]["AgeBox"]		= window



	-- CREATE HUNGER BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerHungerBox = GUI.containerHungerBox or
		Geyser.MiniConsole:new({
			name = "HungerBox",
			x = 0, y = 41,
			fontSize = 11,
			width = "100%",
			height = 18,
			color = "black"
		}, GUI.containerInfoBox)

	local window								= {border = GUI.containerInfoBox, container = GUI.containerHungerBox}
	windows["HungerBox"]						= window
	windows_ByPosition["topLeft"]["HungerBox"]	= window



	-- CREATE THIRST BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerThirstBox = GUI.containerThirstBox or
		Geyser.MiniConsole:new({
			name = "ThirstBox",
			x = 0, y = 59,
			fontSize = 11,
			width = "100%",
			height = 18,
			color = "black"
		}, GUI.containerInfoBox)

	local window								= {border = GUI.containerInfoBox, container = GUI.containerThirstBox}
	windows["ThirstBox"]						= window
	windows_ByPosition["topLeft"]["ThirstBox"]	= window



	-- CREATE ENCUMBRANCE BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerEncumbranceBox = GUI.containerEncumbranceBox or
		Geyser.MiniConsole:new({
			name = "EncumbranceBox",
			x = 0, y = 77,
			fontSize = 11,
			width = "100%",
			height = 18,
			color = "black"
		}, GUI.containerInfoBox)

	local window									= {border = GUI.containerInfoBox, container = GUI.containerEncumbranceBox}
	windows["EncumbranceBox"]						= window
	windows_ByPosition["topLeft"]["EncumbranceBox"]	= window



	-- CREATE DATE BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerDateBox = GUI.containerDateBox or
		Geyser.MiniConsole:new({
			name = "DateBox",
			x = 0, y = 95,
			fontSize = 11,
			width = "100%",
			height = 36,
			color = "black"
		}, GUI.containerInfoBox)

	local window								= {border = GUI.containerInfoBox, container = GUI.containerDateBox}
	windows["DateBox"]							= window
	windows_ByPosition["topLeft"]["DateBox"]	= window



	-- CREATE LANGUAGE BOX - INSIDE INFO
	-------------------------------------------------------
	GUI.containerLanguageBox = GUI.containerLanguageBox or
		Geyser.MiniConsole:new({
			name = "LanguageBox",
			x = 0, y = 131,
			fontSize = 11,
			width = "100%",
			height = 18,
			color = "black"
		}, GUI.containerInfoBox)

	local window									= {border = GUI.containerInfoBox, container = GUI.containerLanguageBox}
	windows["LanguageBox"]							= window
	windows_ByPosition["topLeft"]["LanguageBox"]	= window



  

--GUI.top:load()
--GUI.right:load()
--GUI.tabwindow1:load()



end --createUIConsole



-- UPDATES ----------------------------------------------------------



-- update chat box
-----------------------------------------------------------
local function onChat(args)
	local text = args["message"]
	local ts = getTime(true, "hh:mm:ss")
	local container = windows["ChatBox"]["container"]
	container:echo(ts.." ")

	-- even though we get the text passed into the event we will get the text
	-- from buffer to preserve colors/formatting
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end



-- update who box
-----------------------------------------------------------
local function onWho(args)
	local container = windows["WhoBox"]["container"]
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	deleteLine()
end

local function onStartWho(args)
	local container = windows["WhoBox"]["container"]
	clearWindow("WhoBox")
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	Events.addListener("whoEvent", sourceName, onWho)
	deleteLine()
end

local function onWhoEnd(args)
	local container = windows["WhoBox"]["container"]
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
	local who = args["name"]
	local skill_name = args["skill_name"]
	local ts = getTime(true, "hh:mm:ss")
	local container = windows["ImproveBox"]["container"]
	local count = 0
	local output = ''

	local skillVar = Skills.getSkill({who = who, skill_name = skill_name})

	if skillVar ~= -1 then
		count = tonumber(skillVar.count)+1
	else
		count = 1
	end

	local level = Skills.imp2lvl(count)
	local nextLevel = level.next_level
	if nextLevel == nil then
		if(who ~= Status.name) then
			output = ts.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..")"
		else
			output = ts.." "..skill_name.." - "..count.." ("..level.abbr..")"
		end
	else
		local tilNext = nextLevel.min - count
		if(who ~= Status.name) then
			output = ts.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
		else
			output = ts.." "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
		end
	end

	container:echo(" "..output.."\n")
end

local function onSkillMistake(args)
	local container = windows["ImproveBox"]["container"]
	selectCurrentLine("ImproveBox")
	deleteLine("ImproveBox")
	container:echo("")
end



-- update name box
-----------------------------------------------------------
local function onName(args)
	showname = args["fullname"]
	name_table = showname:split("are ")
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
	years = args["years"]
	months = args["months"]
	clearWindow("AgeBox")
	if months == "" then months = "0" end
	cecho("AgeBox", "Age: "..years.." years, "..months.." months")
	deleteLine()
end



-- update hunger box
-----------------------------------------------------------
local function onHunger(args)
	hunger = args["hunger"]

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
	thirst = args["thirst"]
	
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
	encumbrance = args["encumbrance"]

	clearWindow("EncumbranceBox")
	cecho("EncumbranceBox", "Encumbrance: ")
	selectString(encumbrance, 1)
	copy()
	appendBuffer("EncumbranceBox")
	deleteLine()
	moveCursorEnd()
end



-- update movement box
-----------------------------------------------------------
local function onMovement(args)
  movement = args["movement"]

  clearWindow("MovementBox")
  cecho("MovementBox", " Movement: ")
  selectString(movement, 1)
  copy()
  appendBuffer("MovementBox")
  deleteLine()
  moveCursorEnd()
end



-- update date box
-----------------------------------------------------------
local function refreshUI(args)
--  for key,window in pairs(windows) do
--    local container = window["container"]

--    insertText(container["name"], "")
--  end

	clearWindow("DateBox")
	cecho("DateBox", "Date(common): "..date.format(os.time(), 3, "common").."\nDate(Thorpian): "..date.format(os.time(), 3, "thorpian"))
end



-- update language box
-----------------------------------------------------------
local function onLanguage(args)
	local language = args["detail"]
	local language_table = language:split("now ")
	language = language_table[2]
	local language_table2 = language:split("%.")
	language = language_table2[1]
	clearWindow("LanguageBox")
	cecho("LanguageBox", "<cyan><b>"..language.."</b>")
end







local function onConc(args)
  conc = args["conc"]

  clearWindow("ConcBox")
  cecho("ConcBox", " Concentration: ")
  selectString(conc, 1)
  copy()
  appendBuffer("ConcBox")
  deleteLine()
  moveCursorEnd()
end

local function onAura(args)
  aura = args["aura"]

  clearWindow("AuraBox")
  cecho("AuraBox", " Aura: ")
  selectString(aura, 1)
  copy()
  appendBuffer("AuraBox")
  deleteLine()
  moveCursorEnd()
end






local function setup(args)
  createUIConsole()

--  Events.addListener("sysWindowResizeEvent", sourceName, updateDisplay)
  Events.addListener("chatEvent", sourceName, onChat)
  Events.addListener("skillImproveEvent", sourceName, onImprove)
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
  Events.addListener("languageEvent", sourceName, onLanguage)

--  Events.addListener("tabGeneralClickedEvent", sourceName, onGeneralTabClick)
--  Events.addListener("tabMagicClickedEvent", sourceName, onMagicTabClick)
--  Events.addListener("tabCombatClickedEvent", sourceName, onCombatTabClick)
--  Events.addListener("tabLocationClickedEvent", sourceName, onLocationTabClick)
end

local function unsetup(args)
--  Events.removeListener("sysWindowResizeEvent", sourceName)
  Events.removeListener("chatEvent", sourceName)
  Events.removeListener("skillImproveEvent", sourceName)
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
  Events.removeListener("languageEvent", sourceName)

--  Events.removeListener("tabGeneralClickedEvent", sourceName)
--  Events.removeListener("tabMagicClickedEvent", sourceName)
--  Events.removeListener("tabCombatClickedEvent", sourceName)
--  Events.removeListener("tabLocationClickedEvent", sourceName)

  for key,window in pairs(windows) do
    local container = window["container"]
    local border = window["border"]

    Geyser:remove(container)
    Geyser:remove(border)
  end

  windows = {}
  windows_ByPosition = {}
end

local function resetup(args)
  unsetup(args)
  resetup(args)
end


UI = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return UI

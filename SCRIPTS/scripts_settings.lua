local Settings		= {}
local textMemory	= {}
local sourceName	= "settings"




-- announce improves
-----------------------------------------------------------
local function announceImprove(args)
	local skill_name = args["skill_name"]
	local name = args["name"]
	local skillcount = 0

	if(Status.statusAnnounce ~= 'off') then

		if(Status.statusAnnounce == 'verbose') then
			local results = dba.query('SELECT count FROM improves WHERE who="'..name..'" AND skill="'..skill_name..'"')[1]

			if results then
				skillcount = tonumber(results.count) + 1
			else
				skillcount = 1
			end

			if name == Status.name then
				send("ooc "..skill_name.."+ ("..skillcount..")")
			else
				send("ooc "..name.."'s "..skill_name.."+ ("..skillcount..")")
			end

		elseif(Status.statusAnnounce == 'brief') then
			if name == Status.name then
				send("ooc +")
			else
				send("ooc "..name.." +")
			end

		else
			if name == Status.name then
				send("ooc "..skill_name.."+")
			else
				send("ooc "..name.."'s "..skill_name.."+")
			end
		end
	end
end



-- block spam lines
-----------------------------------------------------------
local function blockSpam(args)
	local text              = args["text"]
	local currentLineNum    = getLineNumber()
    local linesToDelete     = {}


	if currentLineNum > 0 then
		local numDeleted = 0

		for i = 1, Status.numLinesToCheck, 1 do
			moveCursor(0, currentLineNum-i)

			local cursorText = string.gsub(getCurrentLine(), ' x%d+', '')

			if(selectString(text, 1) > -1) and (string.len(text) == string.len(cursorText)) then
				linesToDelete[currentLineNum-i] = true
				numDeleted = numDeleted + 1
			end
		end

		if textMemory[text] ~= nil then
			if(os.time() - textMemory[text]["time"] < 200) then
				textMemory[text]["time"] = os.time()
				textMemory[text]["numDeleted"] = textMemory[text]["numDeleted"] + numDeleted
			else
				textMemory[text]["time"] = os.time()
				textMemory[text]["numDeleted"] = numDeleted
			end
		else
			textMemory[text] = {}
			textMemory[text]["time"] = os.time()
			textMemory[text]["numDeleted"] = numDeleted
		end

		for k,v in pairs(linesToDelete) do
			moveCursor(0, k)
			deleteLine()
		end

		moveCursorEnd("main")
		if(numDeleted > 0) and (text ~= '> ') then
			cecho(" <green>x"..textMemory[text]["numDeleted"]+1)
		end
		insertText("")
	end
end



function announceOn(args)
	Status.statusAnnounce = 'on'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')
    systemMessage("Announce On")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: On\n"})
end



local function announceBrief(args)
	Status.statusAnnounce = 'brief'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')
    systemMessage("Announce Brief")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Brief\n"})
end



local function announceVerbose(args)
	Status.statusAnnounce = 'verbose'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')
    systemMessage("Announce Verbose")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Verbose\n"})
end



local function announceOff(args)
	Status.statusAnnounce = 'off'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')	
    systemMessage("Announce Off")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Off\n"})

end



local function antispamOn(args)
	Status.statusAntiSpam = 'on'
	dba.execute('UPDATE settings SET statusAntiSpam="'..Status.statusAntiSpam..'"')
    systemMessage("AntiSpam On")
	Events.raiseEvent("messageEvent", {message="<yellow>AntiSpam On.\n"})
	Events.addListener("anyEvent", sourceName, blockSpam)
end



local function antispamOff(args)
	Status.statusAntiSpam = 'off'
	dba.execute('UPDATE settings SET statusAntiSpam="'..Status.statusAntiSpam..'"')
    systemMessage("AntiSpam Off")
	Events.raiseEvent("messageEvent", {message="<yellow>AntiSpam Off.\n"})
	Events.removeListener("anyEvent", sourceName)
end



-- set the conc setting
-----------------------------------------------------------
local function setConc(args)
	local detail = string.lower(args["detail"])

	if not ((detail == "off") or (detail == "on") or (detail == "full") or (detail == "bright") or (detail == "help")) then
		cecho("<red>ERROR: Usage: /conc <off|on|full>\n")
	elseif (detail == "help") then
		cecho("<yellow>USAGE: /conc on|off|bright - Show concentration on screen (current setting: "..Status.statusConc..")\n")
	else
		if detail == "off" then
			cecho("<yellow>Concentration: Off\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: Off\n"})
			Status.statusConc = "off"
		elseif detail == "bright" then
			cecho("<yellow>Concentration: Bright only\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: Bright only\n"})
			Status.statusConc = "bright"
		else
			cecho("<yellow>Concentration: On\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: On\n"})
			Status.statusConc = "on"
		end

		dba.execute('UPDATE settings SET statusConc="'..Status.statusConc..'"')
	end

end



-- set the aura setting
-----------------------------------------------------------
local function setAura(args)
	local detail = string.lower(args["detail"])


	if not ((detail == "off") or (detail == "on") or (detail == "scint") or (detail == "help")) then
		cecho("<red>ERROR: Usage: /aura <on|off|scint>\n")
	elseif (detail == "help") then
		cecho("<yellow>USAGE: /aura on|off|scint - Show aura on screen (current setting: "..Status.statusAura..")\n")
	else
		if detail == "off" then
			cecho("<yellow>Aura: Off\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Aura: Off\n"})
			Status.statusAura = "off"
		elseif detail == "scint" then
			cecho("<yellow>Aura: Scint only\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Aura: Scint only\n"})
			Status.statusAura = "scint"
		else
			cecho("<yellow>Aura: On\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Aura: On\n"})
			Status.statusAura = "on"
		end

		dba.execute('UPDATE settings SET statusAura="'..Status.statusAura..'"')
	end

end



-- set the contents setting
-----------------------------------------------------------
local function setContents(args)
	local detail = string.lower(args["detail"])


	if not ((detail == "off") or (detail == "on") or (detail == "help")) then
		cecho("<red>ERROR: Usage: /contents <on|off>\n")
	elseif (detail == "help") then
		cecho("<yellow>USAGE: /contents on|off - Show expanded contents view for containers (current setting: "..Status.statusContents..")\n")
	else
		if detail == "off" then
			cecho("<yellow>Contents: Off\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Contents: Off\n"})
			Status.statusContents = "off"
		else
			cecho("<yellow>Contents: On\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Contents: On\n"})
			Status.statusContents = "on"
		end

		dba.execute('UPDATE settings SET statusContents="'..Status.statusContents..'"')
	end

end



-- set the repeat echo setting
-----------------------------------------------------------
local function setRepeatEcho(args)
	local detail = string.lower(args["detail"])


	if not ((detail == "off") or (detail == "on") or (detail == "help")) then
		cecho("<red>ERROR: Usage: /repeat echo <on|off>\n")
	elseif (detail == "help") then
		cecho("<yellow>USAGE: /repeat echo on|off - Echo repeat commands to the screen (current setting: "..Status.statusRepeatEcho..")\n")
	else
		if detail == "off" then
			cecho("<yellow>Repeat: Echo Off\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Repeat: Echo Off\n"})
			Status.statusRepeatEcho = "off"
		else
			cecho("<yellow>Repeat: Echo On\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Repeat: Echo On\n"})
			Status.statusRepeatEcho = "on"
		end

		dba.execute('UPDATE settings SET statusRepeatEcho="'..Status.statusRepeatEcho..'"')
	end

end



-- set the fontsize setting
-----------------------------------------------------------
local function setFontSize(args)
	local detail = string.lower(args["detail"])
	local size = args["size"]


	if (detail == "help") then
		cecho("<yellow>USAGE: /set fontsize <all|chat|improves|message|who> <8-16> - Set the fontsize for one or all valid tabs\n")
	elseif (tonumber(size) < 8) or (tonumber(size) > 16) then
		cecho("<red>ERROR: Usage: /set fontsize <all|chat|improves|message|who> <8-16> - Set the fontsize for one or all valid tabs\n")	
	elseif (detail == "chat") then
		Status.fontSizeChat = tonumber(size)
		dba.execute('UPDATE settings SET fontSizeChat="'..Status.fontSizeChat..'"')
		GUI.containerChatBox:setFontSize(Status.fontSizeChat)
		cecho("<yellow>Fontsize: CHAT = "..size.."\n")
		Events.raiseEvent("messageEvent", {message="<yellow>Fontsize: CHAT = "..size.."\n"})
	elseif (detail == "improves") then
		Status.fontSizeImproves = tonumber(size)
		dba.execute('UPDATE settings SET fontSizeImproves="'..Status.fontSizeImproves..'"')
		GUI.containerImproveBox:setFontSize(Status.fontSizeImproves)
		cecho("<yellow>Fontsize: IMPROVES = "..size.."\n")
		Events.raiseEvent("messageEvent", {message="<yellow>Fontsize: IMPROVES = "..size.."\n"})
	elseif (detail == "message") then
		Status.fontSizeMessage = tonumber(size)
		dba.execute('UPDATE settings SET fontSizeMessage="'..Status.fontSizeMessage..'"')
		GUI.containerMessageBox:setFontSize(Status.fontSizeMessage)
		cecho("<yellow>Fontsize: MESSAGE = "..size.."\n")
		Events.raiseEvent("messageEvent", {message="<yellow>Fontsize: MESSAGE = "..size.."\n"})
	elseif (detail == "who") then
		Status.fontSizeWho = tonumber(size)
		dba.execute('UPDATE settings SET fontSizeWho="'..Status.fontSizeWho..'"')
		GUI.containerWhoBox:setFontSize(Status.fontSizeWho)
		cecho("<yellow>Fontsize: WHO = "..size.."\n")
		Events.raiseEvent("messageEvent", {message="<yellow>Fontsize: WHO = "..size.."\n"})
	elseif (detail == "all") then
		Status.fontSizeChat = tonumber(size)
		Status.fontSizeImproves = tonumber(size)
		Status.fontSizeMessage = tonumber(size)
		Status.fontSizeWho = tonumber(size)

		local query = ''
		query = query..'UPDATE settings '
		query = query..'SET fontSizeChat='..Status.fontSizeChat..', '
		query = query..'fontSizeImproves='..Status.fontSizeImproves..', '
		query = query..'fontSizeMessage='..Status.fontSizeMessage..', '
		query = query..'fontSizeWho='..Status.fontSizeWho
		dba.execute(query)

		GUI.containerChatBox:setFontSize(Status.fontSizeChat)
		GUI.containerImproveBox:setFontSize(Status.fontSizeImproves)
		GUI.containerMessageBox:setFontSize(Status.fontSizeMessage)
		GUI.containerWhoBox:setFontSize(Status.fontSizeWho)
		cecho("<yellow>Fontsize: ALL = "..size.."\n")
		Events.raiseEvent("messageEvent", {message="<yellow>Fontsize: ALL = "..size.."\n"})
	else
		cecho("<red>ERROR: Usage: /set fontsize <all|chat|improves|message|who> <8-16> - Set the fontsize for one or all valid tabs\n")	
	end

end



-- build or update the table during setup
-----------------------------------------------------------
local function checkSettingsTable(args)


	-- create table if its not there
	dba.execute([[CREATE TABLE IF NOT EXISTS settings (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		fontSizeChat INTEGER DEFAULT 10,
		fontSizeImproves INTEGER DEFAULT 10,
		fontSizeMessage INTEGER DEFAULT 10,
		fontSizeWho INTEGER DEFAULT 10,
		numLinesToCheck INTEGER DEFAULT 20,
		scrollCurrentPower INTEGER DEFAULT 100,
		scrollCurrentSpell VARCHAR(16) DEFAULT "",
		statusAnnounce VARCHAR(16) DEFAULT "on",
		statusAntiSpam VARCHAR(16) DEFAULT "off",
		statusAura VARCHAR(16) DEFAULT "off",
		statusConc VARCHAR(16) DEFAULT "off",
		statusContents VARCHAR(16) DEFAULT "on",
        statusRepeatEcho VARCHAR(16) DEFAULT "off"
	);]])
	local results = dba.query('SELECT id FROM settings')
	if results.count() == 0 then
        systemMessage("Create SETTINGS table")
		dba.execute('INSERT INTO settings DEFAULT VALUES')
	end



	-- add any missing fields
	local temp = dba.query('SELECT * FROM settings')[1]
	if not temp.statusContents then
        systemMessage("Update SETTINGS table")
		dba.execute('ALTER TABLE settings ADD COLUMN statusContents VARCHAR(16) DEFAULT "on"')
        dba.execute('UPDATE settings SET statusContents = "on"')
	end

    if not temp.statusRepeatEcho then
        systemMessage("Update SETTINGS table")
		dba.execute('ALTER TABLE settings ADD COLUMN statusRepeatEcho VARCHAR(16) DEFAULT "off"')
        dba.execute('UPDATE settings SET statusRepeatEcho = "off"')
	end
end



local function load()
	local result = {}


    systemMessage("Load SETTINGS table")
	result = dba.query('SELECT * FROM settings')[1]
	Status.fontSizeChat = result.fontSizeChat
	Status.fontSizeImproves = result.fontSizeImproves
	Status.fontSizeMessage = result.fontSizeMessage
	Status.fontSizeWho = result.fontSizeWho
	Status.numLinesToCheck = result.numLinesToCheck
	Status.scrollCurrentPower = result.scrollCurrentPower
	Status.scrollCurrentSpell = result.scrollCurrentSpell
	Status.statusAnnounce = result.statusAnnounce
	Status.statusAntiSpam = result.statusAntiSpam
	Status.statusAura = result.statusAura
	Status.statusConc = result.statusConc
	Status.statusContents = result.statusContents
    Status.statusRepeatEcho = result.statusRepeatEcho

	GUI.containerChatBox:setFontSize(Status.fontSizeChat)
	GUI.containerImproveBox:setFontSize(Status.fontSizeImproves)
	GUI.containerMessageBox:setFontSize(Status.fontSizeMessage)
	GUI.containerWhoBox:setFontSize(Status.fontSizeWho)
end



local function save()

end



local function setup(args)
	checkSettingsTable()
	Events.addListener("skillImproveEvent",sourceName,announceImprove)
	Events.addListener("announceOnEvent",sourceName,announceOn)
	Events.addListener("announceVerboseEvent",sourceName,announceVerbose)
	Events.addListener("announceBriefEvent",sourceName,announceBrief)
	Events.addListener("announceOffEvent",sourceName,announceOff)
	Events.addListener("setAuraEvent", sourceName, setAura)
	Events.addListener("setConcEvent", sourceName, setConc)
	Events.addListener("setContentsEvent", sourceName, setContents)
	Events.addListener("setFontSizeEvent", sourceName, setFontSize)
    Events.addListener("setRepeatEchoEvent", sourceName, setRepeatEcho)
	Events.addListener("antiSpamOnEvent",sourceName, antispamOn)
	Events.addListener("antiSpamOffEvent",sourceName, antispamOff)
end

local function unsetup(args)
	Events.removeListener("skillImproveEvent",sourceName)
	Events.removeListener("announceOnEvent",sourceName)
	Events.removeListener("announceVerboseEvent",sourceName)
	Events.removeListener("announceBriefEvent",sourceName)
	Events.removeListener("announceOffEvent",sourceName)
	Events.removeListener("setAuraEvent", sourceName)
	Events.removeListener("setConcEvent", sourceName)
	Events.removeListener("setContentsEvent", sourceName)
	Events.removeListener("setFontSizeEvent", sourceName)
    Events.removeListener("setRepeatEchoEvent", sourceName)
	Events.removeListener("antiSpamOnEvent",sourceName)
	Events.removeListener("antiSpamOffEvent",sourceName)
end

local function resetup(args)
	unsetup(args)
	setup(args)
end

Settings = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Settings

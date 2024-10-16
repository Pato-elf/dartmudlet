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
	local text = args["text"]
	local linesToDelete = {}
	local currentLineNum = getLineNumber()

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
	cecho("<yellow>Announce: On\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: On\n"})
end



local function announceBrief(args)
	Status.statusAnnounce = 'brief'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')
	cecho("<yellow>Announce: Brief\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Brief\n"})
end



local function announceVerbose(args)
	Status.statusAnnounce = 'verbose'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')
	cecho("<yellow>Announce: Verbose\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Verbose\n"})
end



local function announceOff(args)
	Status.statusAnnounce = 'off'
	dba.execute('UPDATE settings SET statusAnnounce="'..Status.statusAnnounce..'"')	
	cecho("<yellow>Announce: Off (num)\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Off\n"})

end



local function antispamOn(args)
	Status.statusAntiSpam = 'on'
	dba.execute('UPDATE settings SET statusAntiSpam="'..Status.statusAntiSpam..'"')
	Events.raiseEvent("messageEvent", {message="<yellow>AntiSpam On.\n"})
	Events.addListener("anyEvent",sourceName, blockSpam)
end



local function antispamOff(args)
	Status.statusAntiSpam = 'off'
	dba.execute('UPDATE settings SET statusAntiSpam="'..Status.statusAntiSpam..'"')
	Events.raiseEvent("messageEvent", {message="<yellow>AntiSpam Off.\n"})
	Events.removeListener("anyEvent",sourceName)
end



-- set the conc setting
-----------------------------------------------------------
local function setConc(args)
	local detail = args["detail"]
	
	if not ((detail == "off") or (detail == "on") or (detail == "full") or (detail == "help")) then
		cecho("<red>ERROR: Usage: /conc <off|on|full>\n")
	elseif (detail == "help") then
		cecho("<yellow>USAGE: /conc off|on|full - Show concentration on screen (current setting: "..Status.statusConc..")\n")
	else
		if detail == "off" then
			cecho("<yellow>Concentration: Off\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: Off\n"})
			Status.statusConc = "off"
		elseif detail == "on" then
			cecho("<yellow>Concentration: On\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: On\n"})
			Status.statusConc = "on"
		else
			cecho("<yellow>Concentration: Full\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: Full\n"})
			Status.statusConc = "full"
		end

		dba.execute('UPDATE settings SET statusConc="'..Status.statusConc..'"')
	end

end



-- build or update the table during setup
-----------------------------------------------------------
local function checkSettingsTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS settings (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		chatboxFontSize INTEGER DEFAULT 9,
		numLinesToCheck INTEGER DEFAULT 20,
		scrollCurrentPower INTEGER DEFAULT 100,
		scrollCurrentSpell VARCHAR(16) DEFAULT "",
		statusAnnounce VARCHAR16 DEFAULT "on",
		statusAntiSpam VARCHAR16 DEFAULT "off",
		statusConc VARCHAR16 DEFAULT "off"
	);]])

	local results = dba.query('SELECT id FROM settings')
	if results.count() == 0 then
		dba.execute('INSERT INTO settings DEFAULT VALUES')
	end

end



local function load()
	local result = {}
	
	result = dba.query('SELECT * FROM settings')[1]
	Status.chatboxFontSize = result.chatboxFontSize
	Status.numLinesToCheck = result.numLinesToCheck
	Status.scrollCurrentPower = result.scrollCurrentPower
	Status.scrollCurrentSpell = result.scrollCurrentSpell
	Status.statusAnnounce = result.statusAnnounce
	Status.statusAntiSpam = result.statusAntiSpam
	Status.statusConc = result.statusConc
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
	Events.addListener("setConcEvent", sourceName, setConc)
	Events.addListener("antiSpamOnEvent",sourceName, antispamOn)
	Events.addListener("antiSpamOffEvent",sourceName, antispamOff)
end

local function unsetup(args)
	Events.removeListener("skillImproveEvent",sourceName)
	Events.removeListener("announceOnEvent",sourceName)
	Events.removeListener("announceVerboseEvent",sourceName)
	Events.removeListener("announceBriefEvent",sourceName)
	Events.removeListener("announceOffEvent",sourceName)
	Events.removeListener("setConcEvent", sourceName)
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

local Keybinds      = {}
local keypadKeys    = {}
local sourceName    = "keybinds"





-- load temp keys
-----------------------------------------------------------
local function loadKeys(args)
    local detail = args["detail"]


    if (detail == "keypad") and not next(keypadKeys) then

        -- standard movement
        keypadKeys[1] = tempKey(mudlet.keymodifier.Keypad, 0x31, [[send("sw")]])
        keypadKeys[2] = tempKey(mudlet.keymodifier.Keypad, 0x32, [[send("s")]])
        keypadKeys[3] = tempKey(mudlet.keymodifier.Keypad, 0x33, [[send("se")]])
        keypadKeys[4] = tempKey(mudlet.keymodifier.Keypad, 0x34, [[send("w")]])
        keypadKeys[5] = tempKey(mudlet.keymodifier.Keypad, 0x35, [[send("look")]])
        keypadKeys[6] = tempKey(mudlet.keymodifier.Keypad, 0x36, [[send("e")]])
        keypadKeys[7] = tempKey(mudlet.keymodifier.Keypad, 0x37, [[send("nw")]])
        keypadKeys[8] = tempKey(mudlet.keymodifier.Keypad, 0x38, [[send("n")]])
        keypadKeys[9] = tempKey(mudlet.keymodifier.Keypad, 0x39, [[send("ne")]])
        keypadKeys[10] = tempKey(mudlet.keymodifier.Keypad, 0x30, [[send("enter town")]])
        keypadKeys[11] = tempKey(mudlet.keymodifier.Keypad, 0x2e, [[send("enter gate")]])
        keypadKeys[12] = tempKey(mudlet.keymodifier.Keypad, 0x2d, [[send("u")]])
        keypadKeys[13] = tempKey(mudlet.keymodifier.Keypad, 0x2b, [[send("d")]])
        keypadKeys[14] = tempKey(mudlet.keymodifier.Keypad, 0x2a, [[send("out")]])
        keypadKeys[15] = tempKey(mudlet.keymodifier.Keypad, 0x2f, [[send("survey")]])
        keypadKeys[16] = tempKey(mudlet.keymodifier.Keypad, 0x01000005, [[send("enter castle")]])

        -- leading movement
        keypadKeys[17] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x31, [[send("lead sw")]])
        keypadKeys[18] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x32, [[send("lead s")]])
        keypadKeys[19] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x33, [[send("lead se")]])
        keypadKeys[20] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x34, [[send("lead w")]])
        keypadKeys[21] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x35, [[send("look")]])
        keypadKeys[22] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x36, [[send("lead e")]])
        keypadKeys[23] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x37, [[send("lead nw")]])
        keypadKeys[24] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x38, [[send("lead n")]])
        keypadKeys[25] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x39, [[send("lead ne")]])
        keypadKeys[26] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x30, [[send("lead enter town")]])
        keypadKeys[27] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x2e, [[send("lead enter gate")]])
        keypadKeys[28] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x2d, [[send("lead u")]])
        keypadKeys[29] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x2b, [[send("lead d")]])
        keypadKeys[30] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x2a, [[send("lead out")]])
        keypadKeys[31] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x2f, [[send("survey")]])
        keypadKeys[32] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000005, [[send("lead enter castle")]])

        -- sequence movement
        keypadKeys[33] = tempKey(mudlet.keymodifier.Keypad, 0x01000011, [[sendAll("open sw door","sw","close ne door")]])
        keypadKeys[34] = tempKey(mudlet.keymodifier.Keypad, 0x01000015, [[sendAll("open s door","s","close n door")]])
        keypadKeys[35] = tempKey(mudlet.keymodifier.Keypad, 0x01000017, [[sendAll("open se door","se","close nw door")]])
        keypadKeys[36] = tempKey(mudlet.keymodifier.Keypad, 0x01000012, [[sendAll("open w door","w","close e door")]])
        keypadKeys[37] = tempKey(mudlet.keymodifier.Keypad, 0x0100000b, [[send("look")]])
        keypadKeys[38] = tempKey(mudlet.keymodifier.Keypad, 0x01000014, [[sendAll("open e door","e","close w door")]])
        keypadKeys[39] = tempKey(mudlet.keymodifier.Keypad, 0x01000010, [[sendAll("open nw door","nw","close se door")]])
        keypadKeys[40] = tempKey(mudlet.keymodifier.Keypad, 0x01000013, [[sendAll("open n door","n","close s door")]])
        keypadKeys[41] = tempKey(mudlet.keymodifier.Keypad, 0x01000016, [[sendAll("open ne door","ne","close sw door")]])
        keypadKeys[42] = tempKey(mudlet.keymodifier.Keypad, 0x01000006, [[send("enter town")]])
        keypadKeys[43] = tempKey(mudlet.keymodifier.Keypad, 0x01000007, [[send("enter gate")]])
        keypadKeys[44] = tempKey(mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2d, [[sendAll("open u door","u","close d door")]])
        keypadKeys[45] = tempKey(mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2b, [[sendAll("open d door","d","close u door")]])
        keypadKeys[46] = tempKey(mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2a, [[send("out")]])
        keypadKeys[47] = tempKey(mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2f, [[send("survey")]])
        keypadKeys[48] = tempKey(mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x01000005, [[send("enter castle")]])

        -- sequence leading movement
        keypadKeys[49] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000011, [[sendAll("open sw door","lead sw","close ne door")]])
        keypadKeys[50] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000015, [[sendAll("open s door","lead s","close n door")]])
        keypadKeys[51] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000017, [[sendAll("open se door","lead se","close nw door")]])
        keypadKeys[52] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000012, [[sendAll("open w door","lead w","close e door")]])
        keypadKeys[53] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x0100000b, [[send("look")]])
        keypadKeys[54] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000014, [[sendAll("open e door","lead e","close w door")]])
        keypadKeys[55] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000010, [[sendAll("open nw door","lead nw","close se door")]])
        keypadKeys[56] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000013, [[sendAll("open n door","lead n","close s door")]])
        keypadKeys[57] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000016, [[sendAll("open ne door","lead ne","close sw door")]])
        keypadKeys[58] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000006, [[send("lead enter town")]])
        keypadKeys[59] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Keypad, 0x01000007, [[send("lead enter gate")]])
        keypadKeys[60] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2d, [[sendAll("open u door","lead u","close d door")]])
        keypadKeys[61] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2b, [[sendAll("open d door","lead d","close u door")]])
        keypadKeys[62] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2a, [[send("lead out")]])
        keypadKeys[63] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x2f, [[send("survey")]])
        keypadKeys[64] = tempKey(mudlet.keymodifier.Control+mudlet.keymodifier.Shift+mudlet.keymodifier.Keypad, 0x01000005, [[send("lead enter castle")]])
    end
end



-- remove temp keys
-----------------------------------------------------------
local function killKeys(args)
    local detail = args["detail"]


    if (detail == 'keypad') then
        for i,v in pairs(keypadKeys) do
            killKey(v)
        end
    keypadKeys = {}
    end
end



-- set the keypad setting
-----------------------------------------------------------
local function setKeypad(args)
	local detail = string.lower(args["detail"])


	if not ((detail == "off") or (detail == "on") or (detail == "help")) then
		cecho("<red>ERROR: Usage: /set keypad <on|off|help>\n")
	elseif (detail == "help") then
        Events.raiseEvent('showHelpEvent', {detail = "keypad"})
	else
		if detail == "off" then
            systemMessage("Keypad Off")
			Events.raiseEvent("messageEvent", {message="<yellow>Keypad: Off\n"})
			Status.statusKeypad = "off"
            killKeys({detail = "keypad"})
		else
            systemMessage("Keypad On")
			Events.raiseEvent("messageEvent", {message="<yellow>Keypad: On\n"})
            if (Status.statusKeypad ~= "on") then
			    Status.statusKeypad = "on"
                loadKeys({detail = "keypad"})
            end
		end

		dba.execute('UPDATE settings SET statusKeypad="'..Status.statusKeypad..'"')
	end
end



local function setup(args)
    Events.addListener("setKeypadEvent", sourceName, setKeypad)
    Events.addListener("loadKeysEvent", sourceName, loadKeys)
end



local function load()

end



local function save()

end



local function unsetup(args)
    killKeys({detail = "keypad"})
    Events.removeListener("setKeypadEvent", sourceName)
    Events.removeListener("loadKeysEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Keybinds = {
	setup   = setup,
	unsetup = unsetup,
	resetup = resetup,
    load    = load,
    save    = save
}

return Keybinds
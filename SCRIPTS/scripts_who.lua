Who                 = {}
local timers        = {}
local sourceName    = "who"



-- remove who timers
-----------------------------------------------------------
local function killTimers(args)

    for _,v in pairs(timers) do
		killTimer(v)
	end
end



-- build auto timers for who and show alignment
-----------------------------------------------------------
local function loadTimers(args)

	if (Status.statusWho == 'on') then send("who",false) end
	if (Status.statusAlignment == 'on') then send("show alignment",false) end
        --if (Status.statusWho == 'on') then
            timers.who = tempTimer(300,
	    	    [[
	    		    local args = {}
	    		    Events.raiseEvent("autoTimerEvent", args)
	    	    ]])
        --end
end



-- toggle who off
-----------------------------------------------------------
local function whoOff(args)

    if (Status.statusWho ~= 'off') then
        Status.statusWho = 'off'
        dba.execute('UPDATE settings SET statusWho = "off"')
        --killTimers()
    end
    systemMessage("Who Off")
end



-- toggle who on
-----------------------------------------------------------
local function whoOn(args)

    if (Status.statusWho ~= 'on') then
        Status.statusWho = 'on'
        dba.execute('UPDATE settings SET statusWho = "on"')
        --loadTimers()
    else
        send("who", false)
    end
    systemMessage("Who On")
end



local function setup(args)
	Events.addListener("autoTimerEvent", sourceName, loadTimers)
	Events.addListener("whoOnEvent", sourceName, whoOn)
	Events.addListener("whoOffEvent", sourceName, whoOff)
end



local function unsetup(args)
	Events.removeListener("autoTimerEvent", sourceName)
	Events.removeListener("whoOnEvent", sourceName)
	Events.removeListener("whoOffEvent", sourceName)
    killTimers()
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Who =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Who

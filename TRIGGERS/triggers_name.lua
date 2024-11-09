local Name      = {}
local triggers  = {}


local function setup(args)
    local tempTriggers = {}


    tempTriggers.Name =
    tempRegexTrigger("^(?:> )*You are (?:[A-Za-z]* )?(\\w+) the (\\w+)?(?: \\(.*\\))?\\.  You are (?:a|an) (?:[\\s\\S]+)\\.",
        [[
            local arguments = {name = matches[2], fullname = matches[1]}
            local race      = {race = matches[3]}
            Events.raiseEvent("nameEvent", arguments)
            Events.raiseEvent("raceEvent", race)
        ]])



    tempTriggers.Name2 =
    tempRegexTrigger("^(?:> )*You are (?:[A-Za-z]* )?(\\w+) the (\\w+)?(?: \\(.*\\))?, outlined by a .* glow\\.  You are (?:a|an) (?:[\\s\\S]+)\\.",
        [[
            local arguments = {name = matches[2], fullname = matches[1]}
            local race      = {race = matches[3]}
            Events.raiseEvent("nameEvent", arguments)
            Events.raiseEvent("raceEvent", race)
        ]])


    triggers = tempTriggers
end



local function unsetup(args)
    for i,v in pairs(triggers) do
        killTrigger(v)
    end
    triggers = {}
end

local function resetup(args)
    unsetup(args)
    setup(args)
end

Name = {
    setup = setup,
    unsetup = unsetup,
    resetup = resetup
}

return Name

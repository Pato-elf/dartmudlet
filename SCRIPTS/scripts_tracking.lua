local Tracking          = {}
local skillData         = {}
local timers            = {}
local sourceName        = "tracking"

local playerTotal       = 0
local playerMinuteRate  = 0
local playerHourRate    = 0

local petsTotal         = 0
local petsMinuteRate    = 0
local petsHourRate      = 0

local skillTotal        = 0

local totalMinutes      = 0
local totalHours        = 0
local totalMinuteRate   = 0
local totalHourRate     = 0

local hours             = 0
local minutes           = 0
local seconds           = 0
local timeFormatted     = ""



-- update the tracking timer
-----------------------------------------------------------
local function updateTrackingTimer()

    Status.trackingCurrentTime = Status.trackingCurrentTime + 1

    hours         = math.floor(Status.trackingCurrentTime / 3600)
    minutes       = math.floor((Status.trackingCurrentTime % 3600) / 60)
    seconds       = Status.trackingCurrentTime % 60
    timeFormatted = string.format("%02d:%02d:%02d", hours, minutes, seconds)

    cecho("textboxTracking1", timeFormatted)
end



-- update the stats display
-----------------------------------------------------------
local function updateTrackingStats()

    for i,set in ipairs(skillData) do
        if set[2] == Status.name then
            playerTotal = playerTotal + set[3]
        else
            petsTotal = petsTotal + set[3]
        end
    end

    if Status.trackingCurrentTime > 0 then
        totalMinutes        = Status.trackingCurrentTime / 60
        totalHours          = Status.trackingCurrentTime / 3600
        skillTotal          = playerTotal + petsTotal
        playerMinuteRate    = playerTotal / totalMinutes
        playerHourRate      = playerTotal / totalHours
        petsMinuteRate      = petsTotal / totalMinutes
        petsHourRate        = petsTotal / totalHours
        totalMinuteRate     = skillTotal / totalMinutes
        totalHourRate       = skillTotal / totalHours

        if playerTotal >= 100000 then playerTotal = 99999 end
        if petsTotal >= 100000 then petsTotal = 99999 end
        if skillTotal >= 100000 then skillTotal = 99999 end
        if playerMinuteRate >= 100000 then playerMinuteRate = 99999.9 end
        if playerHourRate >= 100000 then playerHourRate = 99999.9 end
        if petsMinuteRate >= 100000 then petsMinuteRate = 99999.9 end
        if petsHourRate >= 100000 then petsHourRate = 99999.9 end
        if totalMinuteRate >= 100000 then totalMinuteRate = 99999.9 end
        if totalHourRate >= 100000 then totalHourRate = 99999.9 end

        if playerTotal <= -100000 then playerTotal = -99999 end
        if petsTotal <= -100000 then petsTotal = -99999 end
        if skillTotal <= -100000 then skillTotal = -99999 end
        if playerMinuteRate <= -100000 then playerMinuteRate = -99999.9 end
        if playerHourRate <= -100000 then playerHourRate = -99999.9 end
        if petsMinuteRate <= -100000 then petsMinuteRate = -99999.9 end
        if petsHourRate <= -100000 then petsHourRate = -99999.9 end
        if totalMinuteRate <= -100000 then totalMinuteRate = -99999.9 end
        if totalHourRate <= -100000 then totalHourRate = -99999.9 end
    else
        totalMinutes        = 0
        totalHours          = 0
        skillTotal          = 0
        playerMinuteRate    = 0
        playerHourRate      = 0
        petsMinuteRate      = 0
        petsHourRate        = 0
        totalMinuteRate     = 0
        totalHourRate       = 0
    end


    GUI.textboxTracking9:echo(playerTotal,"yellow","r")                                 -- player improves
    GUI.textboxTracking10:echo(string.format("%.1f", playerMinuteRate),"yellow","r")    -- player imps/min
    GUI.textboxTracking11:echo(string.format("%.1f", playerHourRate),"yellow","r")      -- player imps/hour
    GUI.textboxTracking13:echo(petsTotal,"yellow","r")                                  -- pets improves
    GUI.textboxTracking14:echo(string.format("%.1f", petsMinuteRate),"yellow","r")      -- pets imps/min
    GUI.textboxTracking15:echo(string.format("%.1f", petsHourRate),"yellow","r")        -- pets imps/hour
    GUI.textboxTracking17:echo(skillTotal,"yellow","r")                                 -- total improves
    GUI.textboxTracking18:echo(string.format("%.1f", totalMinuteRate),"yellow","r")     -- total imps/min
    GUI.textboxTracking19:echo(string.format("%.1f", totalHourRate),"yellow","r")       -- total imps/hour

    playerTotal = 0
    petsTotal   = 0

end



-- remove tracking timer
-----------------------------------------------------------
local function killTimers(args)

    for k,v in pairs(timers) do
		killTimer(v)
	end
end



-- build tracking timer
-----------------------------------------------------------
local function loadTimers(args)

    updateTrackingTimer()
    updateTrackingStats()
    if (Status.statusTracking) then
        timers.tracking = tempTimer(Status.trackingInterval,
            [[
                local args = {}
                Events.raiseEvent("trackingTimerEvent", args)
            ]])
    end
end



-- update the skillData table
-----------------------------------------------------------
local function updateTrackingTable(args)
    local name      = args["name"]
    local skill     = args["skill"]
    local count     = args["count"]
    local isfound   = false

    if count == 0 then return end

    for _, set in ipairs(skillData) do
        if set[1] == skill and set[2] == name then
            set[3] = set[3] + count
            isfound = true
            break
        end
    end

    if not isfound then
        table.insert(skillData, {skill, name, count})
    end
end



-- show the tracking details
-----------------------------------------------------------
local function showTrackingDetail(args)
    local name              = args["name"]
    local tempSkills        = {}
    local tempSkillName     = ""
    local tempName          = ""
    local tempLine          = ""
    local tempCount         = 0
    local tempTotal         = 0
    local tempMinuteRate    = 0
    local tempHourRate      = 0
    local char_length1      = 26
    local char_fill1        = 0


    name            = string.lower(name)
    name            = utils.capitalize(name)
    hours           = math.floor(Status.trackingCurrentTime / 3600)
    minutes         = math.floor((Status.trackingCurrentTime % 3600) / 60)
    seconds         = Status.trackingCurrentTime % 60
    timeFormatted   = string.format("%02d:%02d:%02d", hours, minutes, seconds)


    -- check to see if time is zero
    if Status.trackingCurrentTime > 0 then
        totalMinutes        = Status.trackingCurrentTime / 60
        totalHours          = Status.trackingCurrentTime / 3600
    else
        totalMinutes        = 0
        totalHours          = 0
    end


    -- pull out skills from skillData for name
    for _, set in ipairs(skillData) do
        tempSkillName   = set[1]
        tempName        = set[2]
        tempCount       = set[3]

        if tempName == name then
            table.insert(tempSkills, {tempSkillName, tempCount})
        end
    end


    -- sort skills descending order
    table.sort(tempSkills, function(a, b) return a[2] > b[2] end)


    -- print out skills list
    print(name.." detailed tracking stats ("..timeFormatted..")")
    print("SKILL                       IMPS     IMPS/MIN      IMPS/HR")
    print("==========================================================")
    for _, skill in ipairs(tempSkills) do

        tempTotal = tempTotal + skill[2]

        if Status.trackingCurrentTime > 0 then
            tempMinuteRate    = skill[2] / totalMinutes
            tempHourRate      = skill[2] / totalHours

            if skill[2] >= 100000 then skill[2] = 99999 end
            if skill[2] <= -100000 then skill[2] = -99999 end
            if tempMinuteRate >= 100000 then tempMinuteRate = 99999.9 end
            if tempMinuteRate <= -100000 then tempMinuteRate = -99999.9 end
            if tempHourRate >= 100000 then tempHourRate = 99999.9 end
            if tempHourRate <= -100000 then tempHourRate = -99999.9 end
        end

        char_fill1 = char_length1 - string.len(skill[1])
        tempLine = skill[1]..string.rep(" ", char_fill1)..string.format("%6d", skill[2])
        tempLine = tempLine.."     "..string.format("%8.1f", tempMinuteRate).."     "
        tempLine = tempLine..string.format("%8.1f", tempHourRate)

        print(tempLine)
    end
    print("==========================================================")


    -- print out total line
    if Status.trackingCurrentTime > 0 then
        tempMinuteRate    = tempTotal / totalMinutes
        tempHourRate      = tempTotal / totalHours

        if tempTotal >= 100000 then tempTotal = 99999 end
        if tempTotal <= -100000 then tempTotal = -99999 end
        if tempMinuteRate >= 100000 then tempMinuteRate = 99999.9 end
        if tempMinuteRate <= -100000 then tempMinuteRate = -99999.9 end
        if tempHourRate >= 100000 then tempHourRate = 99999.9 end
        if tempHourRate <= -100000 then tempHourRate = -99999.9 end
    end

    tempLine = "TOTAL                     "..string.format("%6d", tempTotal)
    tempLine = tempLine.."     "..string.format("%8.1f", tempMinuteRate).."     "
    tempLine = tempLine..string.format("%8.1f", tempHourRate)
    print(tempLine)
end



-- set the tracking on/off
-----------------------------------------------------------
local function setTrackingActive()

    if not Status.statusTracking then
        Status.statusTracking = true
        GUI.buttonTracking1:setStyleSheet(StyleButtonPaleGreen:getCSS())

        GUI.tabwindow1:setTabHighlight("TRACKING","TRACKING",true)
        GUI.tabwindow2:setTabHighlight("TRACKING","TRACKING",true)
        GUI.tabwindow3:setTabHighlight("TRACKING","TRACKING",true)
        GUI.tabwindow4:setTabHighlight("TRACKING","TRACKING",true)

        echo("buttonTracking1", "<center>TRACKING ON</center>")
        Events.raiseEvent("messageEvent", {message="<yellow>Tracking: On\n"})
        systemMessage("Tracking On")
        loadTimers()
    else
        Status.statusTracking = false
        GUI.buttonTracking1:setStyleSheet(StyleButtonDarkGrey:getCSS())

        GUI.tabwindow1:setTabHighlight("TRACKING","TRACKING",false)
        GUI.tabwindow2:setTabHighlight("TRACKING","TRACKING",false)
        GUI.tabwindow3:setTabHighlight("TRACKING","TRACKING",false)
        GUI.tabwindow4:setTabHighlight("TRACKING","TRACKING",false)

        echo("buttonTracking1", "<center>TRACKING OFF</center>")
        Events.raiseEvent("messageEvent", {message="<yellow>Tracking: Off\n"})
        systemMessage("Tracking Off")
        killTimers()
    end

end



-- reset tracking stats
-----------------------------------------------------------
local function setTrackingReset()

    skillData                   = {}
    Status.trackingCurrentTime  = 0

    updateTrackingStats()
    cecho("textboxTracking1", "00:00:00")
    systemMessage("Tracking stats reset")
end



-- build or update the table during setup
-----------------------------------------------------------
local function load()

end



local function setup(args)
    Events.addListener("updateTrackingEvent", sourceName, updateTrackingTable)
    Events.addListener("showTrackingDetailEvent", sourceName, showTrackingDetail)
    Events.addListener("setTrackingResetEvent", sourceName, setTrackingReset)
    Events.addListener("setTrackingActiveEvent", sourceName, setTrackingActive)
    Events.addListener("trackingTimerEvent", sourceName, loadTimers)
end



local function save()

end



local function unsetup(args)
    Events.removeListener("updateTrackingEvent", sourceName)
    Events.removeListener("showTrackingDetailEvent", sourceName)
    Events.removeListener("setTrackingResetEvent", sourceName)
    Events.removeListener("setTrackingActiveEvent", sourceName)
    Events.removeListener("trackingTimerEvent", sourceName)
    killTimers()
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Tracking = {
	setup   = setup,
	unsetup = unsetup,
	resetup = resetup,
    load    = load,
    save    = save
}

return Tracking
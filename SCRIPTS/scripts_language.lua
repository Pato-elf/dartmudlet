local Language      = {}
local triggers      = {}
local timers        = {}
local file1         = {}
local file2         = {}
local file3         = {}
local file4         = {}
local file5         = {}
local file6         = {}
local files         = {}
local activeTitles  = {}
local sourceName    = "language"



-- set the active titles to be used for speaking
-----------------------------------------------------------
local function setActiveTitles()
    activeTitles  = {
        Status.languageActive1
        ,Status.languageActive2
        ,Status.languageActive3
        ,Status.languageActive4
        ,Status.languageActive5
        ,Status.languageActive6
    }
end



-- update title and total counters after speaking
-----------------------------------------------------------
local function updateCounters(args)
    local titlenum = args

    if titlenum == 1 then

        Status.languageTotal1 = Status.languageTotal1 + 1
        Status.languageLine1 = Status.languageLine1 + 1
        dba.execute('UPDATE language SET languageTotal1 = '..Status.languageTotal1..', languageLine1 = '..Status.languageLine1)
        Events.raiseEvent("showLanguageStatsEvent")

    elseif titlenum == 2 then

        Status.languageTotal2 = Status.languageTotal2 + 1
        Status.languageLine2 = Status.languageLine2 + 1
        dba.execute('UPDATE language SET languageTotal2 = '..Status.languageTotal2..', languageLine2 = '..Status.languageLine2)
        Events.raiseEvent("showLanguageStatsEvent")

    elseif titlenum == 3 then

        Status.languageTotal3 = Status.languageTotal3 + 1
        Status.languageLine3 = Status.languageLine3 + 1
        dba.execute('UPDATE language SET languageTotal3 = '..Status.languageTotal3..', languageLine3 = '..Status.languageLine3)
        Events.raiseEvent("showLanguageStatsEvent")

    elseif titlenum == 4 then

        Status.languageTotal4 = Status.languageTotal4 + 1
        Status.languageLine4 = Status.languageLine4 + 1
        dba.execute('UPDATE language SET languageTotal4 = '..Status.languageTotal4..', languageLine4 = '..Status.languageLine4)
        Events.raiseEvent("showLanguageStatsEvent")

    elseif titlenum == 5 then

        Status.languageTotal5 = Status.languageTotal5 + 1
        Status.languageLine5 = Status.languageLine5 + 1
        dba.execute('UPDATE language SET languageTotal5 = '..Status.languageTotal5..', languageLine5 = '..Status.languageLine5)
        Events.raiseEvent("showLanguageStatsEvent")

    else

        Status.languageTotal6 = Status.languageTotal6 + 1
        Status.languageLine6 = Status.languageLine6 + 1
        dba.execute('UPDATE language SET languageTotal6 = '..Status.languageTotal6..', languageLine6 = '..Status.languageLine6)
        Events.raiseEvent("showLanguageStatsEvent")

    end

end



-- remove language timer
-----------------------------------------------------------
local function speakLanguage()
    local linenum   = 0
    local preText   = "say (lang="..Status.languageType..") "


    for i=1, #activeTitles do
        if activeTitles[i] then
            if i == 1 then
                if Status.languageLine1 >= Status.languageSize1 then Status.languageLine1 = 0 end
                linenum = Status.languageLine1 + 1
            elseif i == 2 then
                if Status.languageLine2 >= Status.languageSize2 then Status.languageLine2 = 0 end
                linenum = Status.languageLine2 + 1
            elseif i == 3 then
                if Status.languageLine3 >= Status.languageSize3 then Status.languageLine3 = 0 end
                linenum = Status.languageLine3 + 1
            elseif i == 4 then
                if Status.languageLine4 >= Status.languageSize4 then Status.languageLine4 = 0 end
                linenum = Status.languageLine4 + 1
            elseif i == 5 then
                if Status.languageLine5 >= Status.languageSize5 then Status.languageLine5 = 0 end
                linenum = Status.languageLine5 + 1
            else
                if Status.languageLine6 >= Status.languageSize6 then Status.languageLine6 = 0 end
                linenum = Status.languageLine6 + 1
            end
            send(preText..files[i][linenum], false)
            updateCounters(i)
            break
        end
    end
end



-- remove language timer
-----------------------------------------------------------
local function killTimers(args)

    for k,v in pairs(timers) do
		killTimer(v)
	end
end



-- remove language trigger
-----------------------------------------------------------
local function killTriggers(args)

    for k,v in pairs(triggers) do
		killTrigger(v)
	end
end



-- build language timer
-----------------------------------------------------------
local function loadTimers(args)

        speakLanguage()
        if (Status.statusLanguage) then
            timers.langauge = tempTimer(Status.languageInterval,
	    	    [[
	    		    local args = {}
	    		    Events.raiseEvent("languageTimerEvent", args)
	    	    ]])
        end
end



-- build language trigger
-----------------------------------------------------------
local function loadTriggers(args)
    local gagset = "You are now speaking"


    		triggers.language = tempRegexTrigger("^(?:> )*"..gagset.."[\\s\\S]*",
			    [[
                    deleteLine()
			    ]])
end



-- set the language to train
-----------------------------------------------------------
local function setLanguageType(args)
	local language	= args["input"]

    trim(language)
    language = string.lower(language)
    language = language:gsub("^language#", "")

    if language == "mohnkee" then
        language = "mohnkeetongue"
    elseif language == "dark tongue" then
        language = "dark_tongue"
    elseif language == "elf" then
        language = "elvish"
    elseif language == "gnome" then
        language = "gnomish"
    elseif language == "dwarf" then
        language = "dwarvish"
    elseif language == "orc" then
        language = "orcish"
    end

    local results = dba.query('SELECT _row_id FROM improves WHERE skill=\"language#'..language..'\"')
	if results.count() == 0 then
        cecho("<red>ERROR: Unknown language\n")
        return false
    else
        Status.languageType = language
        GUI.commandlineLanguage1:print(Status.languageType)
        dba.execute('UPDATE language SET languageType = \"'..language..'\"')
        systemMessage("Language updated")
        return true
	end

end



-- set the language to train
-----------------------------------------------------------
local function setLanguageActive()


    if Status.statusLanguage then
        Status.statusLanguage = false
        GUI.buttonLanguage1:setStyleSheet(StyleButtonDarkGrey:getCSS())
        GUI.tabwindow1:setTabHighlight("LANGUAGE","LANGUAGE",false)
        GUI.tabwindow2:setTabHighlight("LANGUAGE","LANGUAGE",false)
        GUI.tabwindow3:setTabHighlight("LANGUAGE","LANGUAGE",false)
        GUI.tabwindow4:setTabHighlight("LANGUAGE","LANGUAGE",false)
        echo("buttonLanguage1", "<center>LANGUAGE OFF</center>")

        Events.raiseEvent("messageEvent", {message="<yellow>Language: Off\n"})
        systemMessage("Language Off")

        killTriggers()
        killTimers()
        send("conc", false)
    else

        if not setLanguageType({input = GUI.commandlineLanguage1:getText()}) then
            return
        end

        if  not Status.languageActive1 and
            not Status.languageActive2 and
            not Status.languageActive3 and
            not Status.languageActive4 and
            not Status.languageActive5 and
            not Status.languageActive6 then
                cecho("<red>ERROR: No language titles selected\n")
                return
        end

        Status.statusLanguage = true
        GUI.buttonLanguage1:setStyleSheet(StyleButtonPaleGreen:getCSS())
        GUI.tabwindow1:setTabHighlight("LANGUAGE","LANGUAGE",true)
        GUI.tabwindow2:setTabHighlight("LANGUAGE","LANGUAGE",true)
        GUI.tabwindow3:setTabHighlight("LANGUAGE","LANGUAGE",true)
        GUI.tabwindow4:setTabHighlight("LANGUAGE","LANGUAGE",true)
        echo("buttonLanguage1", "<center>LANGUAGE ON</center>")

        Events.raiseEvent("messageEvent", {message="<yellow>Language: On\n"})
        systemMessage("Language On")

        loadTriggers()
        loadTimers()
    end
end



-- reset language titles current numbers
-----------------------------------------------------------
local function setLanguageReset()
    local query = ""

    Status.languageLine1 = 0
    Status.languageLine2 = 0
    Status.languageLine3 = 0
    Status.languageLine4 = 0
    Status.languageLine5 = 0
    Status.languageLine6 = 0

    query = "UPDATE language SET "
    query = query.."languageLine1 = 0, "
    query = query.."languageLine2 = 0, "
    query = query.."languageLine3 = 0, "
    query = query.."languageLine4 = 0, "
    query = query.."languageLine5 = 0, "
    query = query.."languageLine6 = 0"
    dba.execute(query)
    Events.raiseEvent("showLanguageStatsEvent")
    systemMessage("Language reset lines")
end



-- toggle language titles on/off
-----------------------------------------------------------
local function setLanguageContent(args)
    local title = args["number"]


    if title == 1 then
        if Status.languageActive1 then
            Status.languageActive1 = false
            dba.execute('UPDATE language SET languageActive1 = false')
            GUI.buttonLanguage3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
            echo("buttonLanguage3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
            systemMessage("Language title 1 Off")
        else
            Status.languageActive1 = true
            dba.execute('UPDATE language SET languageActive1 = true')
            GUI.buttonLanguage3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
            echo("buttonLanguage3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
            systemMessage("Language title 1 On")
        end
    elseif title == 2 then
        if Status.languageActive2 then
            Status.languageActive2 = false
            dba.execute('UPDATE language SET languageActive2 = false')
            GUI.buttonLanguage4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
            echo("buttonLanguage4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
            systemMessage("Language title 2 Off")
        else
            Status.languageActive2 = true
            dba.execute('UPDATE language SET languageActive2 = true')
            GUI.buttonLanguage4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
            echo("buttonLanguage4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
            systemMessage("Language title 2 On")
        end
    elseif title == 3 then
        if Status.languageActive3 then
            Status.languageActive3 = false
            dba.execute('UPDATE language SET languageActive3 = false')
            GUI.buttonLanguage5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
            echo("buttonLanguage5", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
            systemMessage("Language title 3 Off")
        else
            Status.languageActive3 = true
            dba.execute('UPDATE language SET languageActive3 = true')
            GUI.buttonLanguage5:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
            echo("buttonLanguage5", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
            systemMessage("Language title 3 On")
        end
    elseif title == 4 then
        if Status.languageActive4 then
            Status.languageActive4 = false
            dba.execute('UPDATE language SET languageActive4 = false')
            GUI.buttonLanguage6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
            echo("buttonLanguage6", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
            systemMessage("Language title 4 Off")
        else
            Status.languageActive4 = true
            dba.execute('UPDATE language SET languageActive4 = true')
            GUI.buttonLanguage6:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
            echo("buttonLanguage6", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
            systemMessage("Language title 4 On")
        end
    elseif title == 5 then
        if Status.languageActive5 then
            Status.languageActive5 = false
            dba.execute('UPDATE language SET languageActive5 = false')
            GUI.buttonLanguage7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
            echo("buttonLanguage7", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
            systemMessage("Language title 5 Off")
        else
            Status.languageActive5 = true
            dba.execute('UPDATE language SET languageActive5 = true')
            GUI.buttonLanguage7:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
            echo("buttonLanguage7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
            systemMessage("Language title 5 On")
        end
    elseif title == 6 then
        if Status.languageActive6 then
            Status.languageActive6 = false
            dba.execute('UPDATE language SET languageActive6 = false')
            GUI.buttonLanguage8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
            echo("buttonLanguage8", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
            systemMessage("Language title 6 Off")
        else
            Status.languageActive6 = true
            dba.execute('UPDATE language SET languageActive6 = true')
            GUI.buttonLanguage8:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
            echo("buttonLanguage8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
            systemMessage("Language title 6 On")
        end
    end

    setActiveTitles()

end



-- add up language counter totals
-----------------------------------------------------------
local function computeLanguageTotal()
    local grandtotal = 0

    grandtotal  =   Status.languageTotal1 +
                    Status.languageTotal2 +
                    Status.languageTotal3 +
                    Status.languageTotal4 +
                    Status.languageTotal5 +
                    Status.languageTotal6
    return grandtotal
end



-- update all language buttons
-----------------------------------------------------------
local function showLanguageButtons(args)

    if Status.languageActive1 then
        GUI.buttonLanguage3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonLanguage3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonLanguage3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonLanguage3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.languageActive2 then
        GUI.buttonLanguage4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonLanguage4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonLanguage4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonLanguage4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.languageActive3 then
        GUI.buttonLanguage5:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonLanguage5", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonLanguage5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonLanguage5", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.languageActive4 then
        GUI.buttonLanguage6:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonLanguage6", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonLanguage6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonLanguage6", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.languageActive5 then
        GUI.buttonLanguage7:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonLanguage7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonLanguage7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonLanguage7", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.languageActive6 then
        GUI.buttonLanguage8:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonLanguage8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonLanguage8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonLanguage8", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

end



-- update language command line
-----------------------------------------------------------
local function showLanguageType(args)
    GUI.commandlineLanguage1:print(Status.languageType)
end



-- update language stats
-----------------------------------------------------------
local function showLanguageStats(args)
    GUI.textboxLanguage7:echo(Status.languageLine1.."/","yellow","r")
    GUI.textboxLanguage8:echo(Status.languageLine2.."/","yellow","r")
    GUI.textboxLanguage9:echo(Status.languageLine3.."/","yellow","r")
    GUI.textboxLanguage10:echo(Status.languageLine4.."/","yellow","r")
    GUI.textboxLanguage11:echo(Status.languageLine5.."/","yellow","r")
    GUI.textboxLanguage12:echo(Status.languageLine6.."/","yellow","r")

    GUI.textboxLanguage19:echo(Status.languageTotal1,"yellow","r")
    GUI.textboxLanguage20:echo(Status.languageTotal2,"yellow","r")
    GUI.textboxLanguage21:echo(Status.languageTotal3,"yellow","r")
    GUI.textboxLanguage22:echo(Status.languageTotal4,"yellow","r")
    GUI.textboxLanguage23:echo(Status.languageTotal5,"yellow","r")
    GUI.textboxLanguage24:echo(Status.languageTotal6,"yellow","r")

    GUI.textboxLanguage25:echo(computeLanguageTotal(),"yellow","r")
end



-- load a text file into a table for recite
-----------------------------------------------------------
local function loadFileToTable(args)
    local lines     = {}
    local linenum   = 1
    local file      = io.open(args, "r")


    if not file then
        cecho("<red>ERROR: Could not open file: "..args.."\n")
        return
    end

    for line in file:lines() do
        lines[linenum]  = line
        linenum         = linenum + 1
    end

    file:close()
    return lines
end



-- build or update the table during setup
-----------------------------------------------------------
local function checkLanguageTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS language (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        languageType VARCHAR(64) DEFAULT "common",
        languageActive1 BOOLEAN DEFAULT false,
        languageLine1 INTEGER DEFAULT 1,
        languageTotal1 INTEGER DEFAULT 0,
        languageActive2 BOOLEAN DEFAULT false,
        languageLine2 INTEGER DEFAULT 1,
        languageTotal2 INTEGER DEFAULT 0,
        languageActive3 BOOLEAN DEFAULT false,
        languageLine3 INTEGER DEFAULT 1,
        languageTotal3 INTEGER DEFAULT 0,
        languageActive4 BOOLEAN DEFAULT false,
        languageLine4 INTEGER DEFAULT 1,
        languageTotal4 INTEGER DEFAULT 0,
        languageActive5 BOOLEAN DEFAULT false,
        languageLine5 INTEGER DEFAULT 1,
        languageTotal5 INTEGER DEFAULT 0,
        languageActive6 BOOLEAN DEFAULT false,
        languageLine6 INTEGER DEFAULT 1,
        languageTotal6 INTEGER DEFAULT 0
	);]])

	local results = dba.query('SELECT id FROM language')
	if results.count() == 0 then
        systemMessage("Create LANGUAGE table")
		dba.execute('INSERT INTO language DEFAULT VALUES')
	end

end



-- build or update the table during setup
-----------------------------------------------------------
local function load()
	local result = {}


    systemMessage("Load LANGUAGE table")
	result = dba.query('SELECT * FROM language')[1]
    Status.languageType     = result.languageType
    Status.languageActive1  = (result.languageActive1 == 1)
    Status.languageLine1    = result.languageLine1
    Status.languageTotal1   = result.languageTotal1
    Status.languageActive2  = (result.languageActive2 == 1)
    Status.languageLine2    = result.languageLine2
    Status.languageTotal2   = result.languageTotal2
    Status.languageActive3  = (result.languageActive3 == 1)
    Status.languageLine3    = result.languageLine3
    Status.languageTotal3   = result.languageTotal3
    Status.languageActive4  = (result.languageActive4 == 1)
    Status.languageLine4    = result.languageLine4
    Status.languageTotal4   = result.languageTotal4
    Status.languageActive5  = (result.languageActive5 == 1)
    Status.languageLine5    = result.languageLine5
    Status.languageTotal5   = result.languageTotal5
    Status.languageActive6  = (result.languageActive6 == 1)
    Status.languageLine6    = result.languageLine6
    Status.languageTotal6   = result.languageTotal6

    systemMessage("Load LANGUAGE files")
    file1 = loadFileToTable(packageFolder.."MEDIA/"..Status.languageFile1) or {}
    file2 = loadFileToTable(packageFolder.."MEDIA/"..Status.languageFile2) or {}
    file3 = loadFileToTable(packageFolder.."MEDIA/"..Status.languageFile3) or {}
    file4 = loadFileToTable(packageFolder.."MEDIA/"..Status.languageFile4) or {}
    file5 = loadFileToTable(packageFolder.."MEDIA/"..Status.languageFile5) or {}
    file6 = loadFileToTable(packageFolder.."MEDIA/"..Status.languageFile6) or {}
    files = {file1,file2,file3,file4,file5,file6}
    setActiveTitles()
end



local function setup(args)
	checkLanguageTable()
    Events.addListener("showLanguageButtonsEvent", sourceName, showLanguageButtons)
    Events.addListener("showLanguageTypeEvent", sourceName, showLanguageType)
    Events.addListener("showLanguageStatsEvent", sourceName, showLanguageStats)
    Events.addListener("setLanguageContentEvent", sourceName, setLanguageContent)
    Events.addListener("setLanguageResetEvent", sourceName, setLanguageReset)
    Events.addListener("setLanguageTypeEvent", sourceName, setLanguageType)
    Events.addListener("setLanguageActiveEvent", sourceName, setLanguageActive)
    Events.addListener("languageTimerEvent", sourceName, loadTimers)
end



local function save()

end



local function unsetup(args)
    Events.removeListener("showLanguageButtonsEvent", sourceName)
    Events.removeListener("showLanguageTypeEvent", sourceName)
    Events.removeListener("showLanguageStatsEvent", sourceName)
    Events.removeListener("setLanguageContentEvent", sourceName)
    Events.removeListener("setLanguageResetEvent", sourceName)
    Events.removeListener("setLanguageTypeEvent", sourceName)
    Events.removeListener("setLanguageActiveEvent", sourceName)
    Events.removeListener("languageTimerEvent", sourceName)
    killTimers()
    killTriggers()
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Language = {
	setup   = setup,
	unsetup = unsetup,
	resetup = resetup,
    load    = load,
    save    = save
}

return Language
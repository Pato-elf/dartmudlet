local Announce = {}

local sourceName	= "announce"
local isAnnounce	= true
local isVerbose		= false
local isBrief		= false
local savedConc		= "off"



-- set the conc setting
-----------------------------------------------------------
local function announce(args)
	local skill_name = args["skill_name"]
	local name = args["name"]
	local skillcount = 0
	
	if(isAnnounce) then
  
		if(isVerbose) then
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

		elseif(isBrief) then
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



function announceOn(args)
	cecho("<yellow>Announce: On\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: On\n"})
	isAnnounce = true
	isVerbose = false
	isBrief   = false
	Announce.save()
end



local function announceBrief(args)
	cecho("<yellow>Announce: Brief\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Brief\n"})
	isAnnounce = true
	isVerbose = false
	isBrief   = true
	Announce.save()
end



local function announceVerbose(args)
	cecho("<yellow>Announce: Verbose\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Verbose\n"})
	isAnnounce = true
	isVerbose = true
	isBrief   = false
	Announce.save()
end



local function announceOff(args)
	cecho("<yellow>Announce: Off (num)\n")
	Events.raiseEvent("messageEvent", {message="<yellow>Announce: Off\n"})
	isAnnounce = false
	Announce.save()
end



-- set the conc setting
-----------------------------------------------------------
local function setConc(args)
	local detail = args["detail"]
	if (detail ~= "off") and (detail ~= "on") and (detail ~= "full") then
		cecho("<red>ERROR: Usage: /conc <off|on|full>\n")
	else
		if detail == "off" then
			cecho("<yellow>Concentration: Off\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: Off\n"})
			savedConc = "off"
		elseif detail == "on" then
			cecho("<yellow>Concentration: On\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: On\n"})
			savedConc = "on"
		else
			cecho("<yellow>Concentration: Full\n")
			Events.raiseEvent("messageEvent", {message="<yellow>Concentration: Full\n"})
			savedConc = "full"
		end
		Status.statusConc = savedConc
		Announce.save()
	end

	
end




local function loaderFunction(sentTable)
  if sentTable then
    isAnnounce = sentTable["isAnnounce"]
    isVerbose = sentTable["isVerbose"]
    isBrief   = sentTable["isBrief"]
	savedConc = sentTable["savedConc"]
	Status.statusConc = savedConc
  end
end



local function load()
	Events.raiseEvent("loadEvent",{sourceName = sourceName, functionToSendData = loaderFunction})
end



local function save()
	Events.raiseEvent("saveEvent",
		{
		sourceName = sourceName
		,tableToSave =
			{
				isAnnounce	= isAnnounce,
				isVerbose	= isVerbose,
				isBrief		= isBrief,
				savedConc	= savedConc
			}
		})
end



local function setup(args)
  Events.addListener("skillImproveEvent",sourceName,announce)
  Events.addListener("announceOnEvent",sourceName,announceOn)
  Events.addListener("announceVerboseEvent",sourceName,announceVerbose)
  Events.addListener("announceBriefEvent",sourceName,announceBrief)
  Events.addListener("announceOffEvent",sourceName,announceOff)
  Events.addListener("setConcEvent", sourceName, setConc)
end

local function unsetup(args)
  Events.removeListener("skillImproveEvent",sourceName,announce)
  Events.removeListener("announceOnEvent",sourceName)
  Events.removeListener("announceVerboseEvent",sourceName)
  Events.removeListener("announceBriefEvent",sourceName)
  Events.removeListener("announceOffEvent",sourceName)
  Events.removeListener("setConcEvent", sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Announce = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
  ,save = save
}

return Announce

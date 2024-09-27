local Announce = {}

local sourceName = "announce"
local isAnnounce = true
local isVerbose = false
local isBrief = false



local function announce(args)
  local skill_name = args["skill_name"]
  local name = args["name"]
  if(isAnnounce) then
  
    if(isVerbose) then
	  local getskill = dba.query('SELECT * FROM improves WHERE who="'..name..'" AND skill="'..skill_name..'"')[1]
      if name == Status.name then
        send("ooc "..skill_name.."+ ("..getskill.count..")")
      else
        send("ooc "..name.."'s "..skill_name.."+ ("..getskill.count..")")
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



local function loaderFunction(sentTable)
  if sentTable then
    isAnnounce = sentTable["isAnnounce"]
    isVerbose = sentTable["isVerbose"]
    isBrief   = sentTable["isBrief"]
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
				isAnnounce = isAnnounce,
				isVerbose  = isVerbose,
				isBrief    = isBrief
			}
		})
end



local function setup(args)
  Events.addListener("skillImproveEvent",sourceName,announce)
  Events.addListener("announceOnEvent",sourceName,announceOn)
  Events.addListener("announceVerboseEvent",sourceName,announceVerbose)
  Events.addListener("announceBriefEvent",sourceName,announceBrief)
  Events.addListener("announceOffEvent",sourceName,announceOff)
end

local function unsetup(args)
  Events.removeListener("skillImproveEvent",sourceName,announce)
  Events.removeListener("announceOnEvent",sourceName)
  Events.removeListener("announceVerboseEvent",sourceName)
  Events.removeListener("announceBriefEvent",sourceName)
  Events.removeListener("announceOffEvent",sourceName)
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

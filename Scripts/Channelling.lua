local Channelling = {}

local sourceName = "channelling"

local channelHistory = {}

local currentChannelTarget = ''
local currentChannelPower = 1
local currentChannelCount = 0

local function channel(args)
  send("channel "..currentChannelPower.. " "..currentChannelTarget)
  curentChannelCount = curentChannelCount + currentChannelPower
  cecho("<yellow>Channelled "..count.." to "..currentChannelTarget.."\n")
  channelHistory[currentChannelTarget].count = count

  Channelling.save()
end

local function channellingSetup(args)
  local power = args["power"]
  local target = args["target"]

  currentChannelTarget = target
  currentChannelPower = power
  currentChannelCount = 0
  channelHistory[target] = {power = currentChannelPower, count = currentChannelCount}

  Events.addListener("BEBTconcEvent", sourceName, channel)
  cecho("<yellow>Channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")
  send("conc")
  Channelling.save()
end

local function channelResume(args)
  local target = args["target"]

  if target == "" and currentChannelTarget ~= "" then
    Events.addListener("BEBTconcEvent", sourceName, channel)
    cecho("<yellow>Channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")
    send("conc")
  elseif channelHistory[target] then
    currentChannelTarget = target
    currentChannelPower = channelHistory[currentChannelTarget].power
    currentChannelCount = channelHistory[currentChannelTarget].count

    Events.addListener("BEBTconcEvent", sourceName, channel)
    cecho("<yellow>Channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")
    send("conc")
  end

  Channelling.save()
end

local function channelOff(args)
  cecho("<yellow>Stopped Channelling\n")
  Events.removeListener("BEBTconcEvent", sourceName)
end

local function changeTarget(args)
  local target = args["target"]
  currentChannelTarget = target

  if channelHistory[currenChannelTarget] then
    currentChannelCount = channelHistory[currentChannelTarget].count
  else
    channelHistory[currentChannelTarget] = {}
    currentChannelCount = 0
  end

  cecho("<yellow>Changed target to "..currentChannelTarget.." with current count of "..currentChannelCount.."\n")
  Channelling.save()
end

local function changePower(args)
  local power = args["power"]

  currentChannelPower = power

  cecho("<yellow>Channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")

  Channelling.save()
end

local function channelStatus(args)
  local target = args["target"]

  if target == "" and currentChannelTarget ~= "" then
    cecho("<yellow>Status: Channelling "..currentChannelPower.." to "..currentChannelTarget.."\n")
  elseif channelHistory[target] then
    local power = channelHistory[target].power
    local count = channelHistory[target].count

    cecho("<yellow>Status: Channelled "..power.." to "..target.." for a total of "..count.."\n")
  end
end

local function loaderFunction(sentTable)
  if sentTable then
   currentChannelPower = sentTable["currentChannelPower"] or 1
   currentChannelTarget = sentTable["currentChanneTarget"] or ""
   currentChannelCount = sentTable["currentChannelCount"] or 0
   channelHistory = sentTable["channelHistory"] or {}
 end
end

local function load()
  Events.raiseEvent("loadEvent",
                   {sourceName = sourceName, functionToSendData = loaderFunction})
end

local function save()
  Events.raiseEvent("saveEvent",
                    {
                    sourceName = sourceName
                    ,tableToSave = {
                        channelHistory = channelHistory
                        ,currentChannelPower = currentChannelPower
                        ,currentChannelTarget = currentChannelTarget
                        ,currentChannelCount = currentChannelCount
                      }
                    })
end

local function setup(args)
  Events.addListener("channelSetupEvent", sourceName, channelSetup)
  Events.addListener("channelResumeEvent", sourceName, channelResume)
  Events.addListener("channelOffEvent", sourceName, channelOff)
  Events.addListener("channelStatusEvent", sourceName, channelStatus)
  Events.addListener("channelTargetEvent", sourceName, changeTarget)
  Events.addListener("channelPowerEvent", sourceName, changePower)
end

local function unsetup(args)
  Events.removeListener("channelSetupEvent", sourceName)
  Events.removeListener("channelResumeEvent", sourceName)
  Events.removeListener("channelOffEvent", sourceName)
  Events.removeListener("channelStatusEvent", sourceName)
  Events.removeListener("channelTargetEvent", sourceName)
  Events.removeListener("channelPowerEvent", sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Channelling = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
  ,save = save
}

return Channelling

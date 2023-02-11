local Blocking = {}

local sourceName = "blocking"

local isBlocked = false
local queue = {}

local function block()
  isBlocked = true
  cecho("Blocking; new commands will be queued for later. Type /unblock to cancel early.\n")
end

local function unblock()
  if(isBlocked) then
    local count = table.size(queue)
    isBlocked = false
    cecho("No longer blocking\n")
    if count > 0 then
      echo("\nProcessing "..count.." previously queued command(s).\n")
      for i,v in ipairs(queue) do
        send(v)
      end
    end
    queue = {}
  end
end

local function lootShrub(event, args)
  send("take "..args)
  unblock()
end

local function onNetworkOutput(args)
  local command = args["command"]
    if isBlocked then
        echo("Queing command: '"..command.."'\n")
        table.insert(queue, command)
        denyCurrentSend()
        -- these are what trigger blocking inputs
    elseif string.match(command, "^cast ") and not string.match(command, '^cast ?!? tell') or
          string.match(command, "^inscribe ") or
          string.match(command, "^invoke ") or
          string.match(command, "^study ") or
          string.match(command, "^hunt ") or
          string.match(command, "^summon armor") then
--[[          string.match(command, "^search shrubs") then]]
      block()
    end
end

local function setup(args)
  Events.addListener("unblockEvent",sourceName,unblock)
  Events.addListener("shrubLootTrigger",sourceName,lootShrub)
  Events.addListener("blockEvent",sourceName,block)
  Events.addListener("sysDataSendRequestEvent",sourceName,onNetworkOutput)
end

local function unsetup(args)
  Events.removeListener("unblockEvent",sourceName)
  Events.removeListener("shrubLootTrigger",sourceName)
  Events.removeListener("blockEvent",sourceName)
  Events.removeListener("sysDataSendRequestEvent",sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Blocking = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Blocking

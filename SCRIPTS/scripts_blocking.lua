local Blocking		= {}
local sourceName	= "blocking"
local isBlocked		= false
local queue			= {}



local function block()
	isBlocked = true
	cecho("<orange>BLOCK\n")
end



-- process command through the blocker
-----------------------------------------------------------
local function onNetworkOutput(args)
	local command = args["command"]

	if isBlocked then
		cecho("<orange>QUEUE: "..command.."\n")
		table.insert(queue, command)
		denyCurrentSend()
	elseif string.match(command, "^cast ") and not (string.match(command, '^cast ?!? tell') or string.match(command, "^cast net")) or
		string.match(command, "^inscribe ") or
		string.match(command, "^invoke ") or
		string.match(command, "^study ") or
		string.match(command, "^hunt ") or
		string.match(command, "^revise ") or
		string.match(command, "^summon armor") then
		block()
	elseif string.match(command, "^write ") and not
		string.match(command, "^write color") and not
		string.match(command, "^write name") and not
		string.match(command, "^write sex") and not
		string.match(command, "^write breed") and not
		string.match(command, "^write fur") and not
		string.match(command, "^write eyes") and not
		string.match(command, "^write metal") and not
		string.match(command, "^write metal2") and not
		string.match(command, "^write size") and not
		string.match(command, "^write shape") and not
		string.match(command, "^write stone") and not
		string.match(command, "^write stone2") and not
		string.match(command, "^write inscription") and not
		string.match(command, "^write language") and not
		string.match(command, "^write facemarkings") and not
		string.match(command, "^write legmarkings") and not
		string.match(command, "^write intaglio") then
		block()
	end
end



-- check a queued command to see if its a blocker
-----------------------------------------------------------
local function isBlocker(args)
	local command = args

	if string.match(command, "^cast ") and not (string.match(command, '^cast ?!? tell') or string.match(command, "^cast net")) or
		string.match(command, "^inscribe ") or
		string.match(command, "^invoke ") or
		string.match(command, "^study ") or
		string.match(command, "^hunt ") or
		string.match(command, "^revise ") or
		string.match(command, "^summon armor") then
		return true
	elseif string.match(command, "^write ") and not
		string.match(command, "^write color") and not
		string.match(command, "^write name") and not
		string.match(command, "^write sex") and not
		string.match(command, "^write breed") and not
		string.match(command, "^write fur") and not
		string.match(command, "^write eyes") and not
		string.match(command, "^write metal") and not
		string.match(command, "^write metal2") and not
		string.match(command, "^write size") and not
		string.match(command, "^write shape") and not
		string.match(command, "^write stone") and not
		string.match(command, "^write stone2") and not
		string.match(command, "^write inscription") and not
		string.match(command, "^write language") and not
		string.match(command, "^write facemarkings") and not
		string.match(command, "^write legmarkings") and not
		string.match(command, "^write intaglio") then
		return true
	end

	return false
end



-- unblock function to process queues
-----------------------------------------------------------
local function unblock()
	local containsBlock = false
	local tempQueue		= {}


	if(isBlocked) then
		local count = table.size(queue)
		isBlocked = false

		if count > 0 then
			cecho("<orange>UNBLOCK ("..count.." queued)\n")

			for i, v in ipairs(queue) do
				if (not containsBlock) and (not isBlocker(v)) then
					send(v)
				elseif not containsBlock then
					send(v)
					containsBlock = true
				else
					table.insert(tempQueue, v)
				end

			end
		else
			cecho("<orange>UNBLOCK (0 queued)\n")
		end

	else
		--cecho("<orange>UNBLOCK (0 queued)\n")
	end

	queue = {}

	if containsBlock then
		isBlocked = true
		queue = tempQueue
	end
end



local function lootShrub(event, args)
	send("take "..args)
	unblock()
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
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Blocking

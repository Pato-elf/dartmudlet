Events = {}
local eventList = {}



local function setup(args)
	registerAnonymousEventHandler("sysDataSendRequest","Events.raiseSysDataSendRequestEvent")
end



local function unsetup(args)
	eventList = {}
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



local function createEventList(eventName)
	if(not eventList[eventName]) then
		eventList[eventName] = {}
	end
end



local function raiseSysDataSendRequestEvent(evt, command)
	args = {command = command}
	Events.raiseEvent("sysDataSendRequestEvent", args)
end



local function raiseEvent(eventName, args)
	createEventList(eventName)

	for k,v in pairs(eventList[eventName]) do
		v(args)
	end
end



local function addListener(eventName, sourceName, listenerFunction)
	createEventList(eventName)
	eventList[eventName][sourceName] = listenerFunction
end



local function removeListener(eventName, sourceName)
	createEventList(eventName)
	eventList[eventName][sourceName] = function(args) end
end



Events = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	raiseEvent = raiseEvent,
	raiseSysDataSendRequestEvent = raiseSysDataSendRequestEvent,
	addListener = addListener,
	removeListener = removeListener
}

return Events

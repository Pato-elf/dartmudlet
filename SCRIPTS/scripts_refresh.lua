local Refresh			= {}
local sourceName		= "refresh"



-- set refreshPower
-----------------------------------------------------------
local function setrefreshPower(args)
	local version = args["version"]
	local refreshpower = tonumber(args["input"])	
	local saveflag = args["save"]


	if not refreshpower then
		cecho("<red>ERROR: Invalid refresh power value\n")
	else
		if (refreshpower < 50) or (refreshpower > 999) then
			cecho("<red>ERROR: Invalid refresh power value\n")
		else
			if version == 1 then
				Status.refreshPower1 = refreshpower
			else
				Status.refreshPower2 = refreshpower
			end
			
			if saveflag then Refresh.save() end
			cecho("<yellow>Channel: Refresh power value updated\n")
		end
	end
	
end



-- set refreshTarget
-----------------------------------------------------------
local function setrefreshTarget(args)
	local version = args["version"]
	local refreshtarget = args["input"]
	local saveflag = args["save"]
	
	
	if tonumber(refreshtarget) then
		cecho("<red>ERROR: Invalid refresh target\n")
	else
		if version == 1 then
			Status.refreshTarget1 = refreshtarget
		else
			Status.refreshTarget2 = refreshtarget
		end
		
		if saveflag then Refresh.save() end
		cecho("<yellow>Channel: Refresh target updated\n")
	end
	
end



local function loaderFunction(sentTable)
	if sentTable then
		Status.refreshPower1 = sentTable["refreshPower1"] or 50
		Status.refreshTarget1 = sentTable["refreshTarget1"] or "targetname"
		Status.refreshPower2 = sentTable["refreshPower2"] or 50
		Status.refreshTarget2 = sentTable["refreshTarget2"] or "targetname"
	end
end




local function load()
	Events.raiseEvent("loadEvent",{
		sourceName = sourceName,
		functionToSendData = loaderFunction
	})
end



local function save()
	Events.raiseEvent("saveEvent",{
		sourceName = sourceName,
		tableToSave = {
			refreshPower1 = Status.refreshPower1,
			refreshTarget1 = Status.refreshTarget1,
			refreshPower2 = Status.refreshPower2,
			refreshTarget2 = Status.refreshTarget2
		}
	})
end



local function setup(args)
	Events.addListener("setrefreshTargetEvent", sourceName, setrefreshTarget)
	Events.addListener("setrefreshPowerEvent", sourceName, setrefreshPower)
end

local function unsetup(args)
	Events.removeListener("setrefreshTargetEvent", sourceName)
	Events.removeListener("setrefreshPowerEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Refresh = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Refresh

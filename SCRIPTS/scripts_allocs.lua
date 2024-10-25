Allocs				= {}
local sourceName	= "allocs"



-- display the current alloc fields
-----------------------------------------------------------
local function showAllocsCurrentFields(args)
	local allocnumber = args

	GUI.commandlineAllocs1:print(Status.allocsTable[allocnumber].allocName)
	GUI.commandlineAllocs2:print(Status.allocsTable[allocnumber].allocTarget)
	GUI.commandlineAllocs3:print(Status.allocsTable[allocnumber].bodypart1)
	GUI.commandlineAllocs4:print(Status.allocsTable[allocnumber].bonus1)
	GUI.commandlineAllocs5:print(Status.allocsTable[allocnumber].daring1)
	GUI.commandlineAllocs6:print(Status.allocsTable[allocnumber].speed1)
	GUI.commandlineAllocs7:print(Status.allocsTable[allocnumber].aiming1)
	GUI.commandlineAllocs8:print(Status.allocsTable[allocnumber].parry1)
	GUI.commandlineAllocs9:print(Status.allocsTable[allocnumber].control1)
	GUI.commandlineAllocs10:print(Status.allocsTable[allocnumber].null1)

	GUI.commandlineAllocs11:print(Status.allocsTable[allocnumber].bodypart2)
	GUI.commandlineAllocs12:print(Status.allocsTable[allocnumber].bonus2)
	GUI.commandlineAllocs13:print(Status.allocsTable[allocnumber].daring2)
	GUI.commandlineAllocs14:print(Status.allocsTable[allocnumber].speed2)
	GUI.commandlineAllocs15:print(Status.allocsTable[allocnumber].aiming2)
	GUI.commandlineAllocs16:print(Status.allocsTable[allocnumber].parry2)
	GUI.commandlineAllocs17:print(Status.allocsTable[allocnumber].control2)
	GUI.commandlineAllocs18:print(Status.allocsTable[allocnumber].null2)

	GUI.commandlineAllocs19:print(Status.allocsTable[allocnumber].bodypart3)
	GUI.commandlineAllocs20:print(Status.allocsTable[allocnumber].bonus3)
	GUI.commandlineAllocs21:print(Status.allocsTable[allocnumber].daring3)
	GUI.commandlineAllocs22:print(Status.allocsTable[allocnumber].speed3)
	GUI.commandlineAllocs23:print(Status.allocsTable[allocnumber].aiming3)
	GUI.commandlineAllocs24:print(Status.allocsTable[allocnumber].parry3)
	GUI.commandlineAllocs25:print(Status.allocsTable[allocnumber].control3)
	GUI.commandlineAllocs26:print(Status.allocsTable[allocnumber].null3)

	GUI.commandlineAllocs27:print(Status.allocsTable[allocnumber].bodypart4)
	GUI.commandlineAllocs28:print(Status.allocsTable[allocnumber].bonus4)
	GUI.commandlineAllocs29:print(Status.allocsTable[allocnumber].daring4)
	GUI.commandlineAllocs30:print(Status.allocsTable[allocnumber].speed4)
	GUI.commandlineAllocs31:print(Status.allocsTable[allocnumber].aiming4)
	GUI.commandlineAllocs32:print(Status.allocsTable[allocnumber].parry4)
	GUI.commandlineAllocs33:print(Status.allocsTable[allocnumber].control4)
	GUI.commandlineAllocs34:print(Status.allocsTable[allocnumber].null4)

	GUI.commandlineAllocs35:print(Status.allocsTable[allocnumber].bodypart5)
	GUI.commandlineAllocs36:print(Status.allocsTable[allocnumber].bonus5)
	GUI.commandlineAllocs37:print(Status.allocsTable[allocnumber].daring5)
	GUI.commandlineAllocs38:print(Status.allocsTable[allocnumber].speed5)
	GUI.commandlineAllocs39:print(Status.allocsTable[allocnumber].aiming5)
	GUI.commandlineAllocs40:print(Status.allocsTable[allocnumber].parry5)
	GUI.commandlineAllocs41:print(Status.allocsTable[allocnumber].control5)
	GUI.commandlineAllocs42:print(Status.allocsTable[allocnumber].null5)

	GUI.commandlineAllocs43:print(Status.allocsTable[allocnumber].bodypart6)
	GUI.commandlineAllocs44:print(Status.allocsTable[allocnumber].bonus6)
	GUI.commandlineAllocs45:print(Status.allocsTable[allocnumber].daring6)
	GUI.commandlineAllocs46:print(Status.allocsTable[allocnumber].speed6)
	GUI.commandlineAllocs47:print(Status.allocsTable[allocnumber].aiming6)
	GUI.commandlineAllocs48:print(Status.allocsTable[allocnumber].parry6)
	GUI.commandlineAllocs49:print(Status.allocsTable[allocnumber].control6)
	GUI.commandlineAllocs50:print(Status.allocsTable[allocnumber].null6)
end



-- display the current alloc number in the allocs window
-----------------------------------------------------------
local function showAllocsCurrentNumber(args)
	local allocnumber = args
	local displaytext = ""

	displaytext = "<yellow><span style='font-size: 30pt;'>"
	displaytext = displaytext..string.format("%02d", allocnumber)
	displaytext = displaytext.."</span>"

	cecho("textboxAllocs11", displaytext)
end



-- send current alloc to game
-----------------------------------------------------------
local function setAlloc(args)
	local settype = args["type"]
	local setting1 = ""
	local setting2 = ""
	local setting3 = ""
	local setting4 = ""
	local setting5 = ""
	local setting6 = ""
	local pretext = ""
	local target = Status.allocsTable[Status.allocCurrentDisplay].allocTarget


	if (Status.allocsTable[Status.allocCurrentDisplay].bodypart1 == "") and
	(Status.allocsTable[Status.allocCurrentDisplay].bodypart2 == "") and
	(Status.allocsTable[Status.allocCurrentDisplay].bodypart3 == "") and
	(Status.allocsTable[Status.allocCurrentDisplay].bodypart4 == "") and
	(Status.allocsTable[Status.allocCurrentDisplay].bodypart5 == "") and
	(Status.allocsTable[Status.allocCurrentDisplay].bodypart6 == "") then
		cecho("<red>ERROR: Allocation has no set bodyparts to set/share\n")
		return
	elseif settype == "share" then
		pretext = "ooc set combat allocation = "
	elseif (target == "") or (string.lower(Status.name) == target) then
		dba.execute('UPDATE allocs SET allocIsActive=false WHERE allocTarget="'..string.lower(Status.name)..'" OR allocTarget=""')
		dba.execute('UPDATE allocs SET allocIsActive=true WHERE allocOrderNumber='..Status.allocCurrentDisplay)
		pretext = "set combat allocation = "
	else
		dba.execute('UPDATE allocs SET allocIsActive=false WHERE allocTarget="'..target..'"')
		dba.execute('UPDATE allocs SET allocIsActive=true WHERE allocOrderNumber='..Status.allocCurrentDisplay)
		pretext = "say "..target.." set combat allocation = "
	end

	if Status.allocsTable[Status.allocCurrentDisplay].bodypart1 ~= "" then
		setting1 = pretext..Status.allocsTable[Status.allocCurrentDisplay].bodypart1
		setting1 = setting1..",b,"..Status.allocsTable[Status.allocCurrentDisplay].bonus1
		setting1 = setting1..",d,"..Status.allocsTable[Status.allocCurrentDisplay].daring1
		setting1 = setting1..",s,"..Status.allocsTable[Status.allocCurrentDisplay].speed1
		setting1 = setting1..",a,"..Status.allocsTable[Status.allocCurrentDisplay].aiming1
		setting1 = setting1..",p,"..Status.allocsTable[Status.allocCurrentDisplay].parry1
		setting1 = setting1..",c,"..Status.allocsTable[Status.allocCurrentDisplay].control1
		setting1 = setting1..",n,"..Status.allocsTable[Status.allocCurrentDisplay].null1
		send(setting1)
	end

	if Status.allocsTable[Status.allocCurrentDisplay].bodypart2 ~= "" then
		setting2 = pretext..Status.allocsTable[Status.allocCurrentDisplay].bodypart2
		setting2 = setting2..",b,"..Status.allocsTable[Status.allocCurrentDisplay].bonus2
		setting2 = setting2..",d,"..Status.allocsTable[Status.allocCurrentDisplay].daring2
		setting2 = setting2..",s,"..Status.allocsTable[Status.allocCurrentDisplay].speed2
		setting2 = setting2..",a,"..Status.allocsTable[Status.allocCurrentDisplay].aiming2
		setting2 = setting2..",p,"..Status.allocsTable[Status.allocCurrentDisplay].parry2
		setting2 = setting2..",c,"..Status.allocsTable[Status.allocCurrentDisplay].control2
		setting2 = setting2..",n,"..Status.allocsTable[Status.allocCurrentDisplay].null2
		send(setting2)
	end

	if Status.allocsTable[Status.allocCurrentDisplay].bodypart3 ~= "" then
		setting3 = pretext..Status.allocsTable[Status.allocCurrentDisplay].bodypart3
		setting3 = setting3..",b,"..Status.allocsTable[Status.allocCurrentDisplay].bonus3
		setting3 = setting3..",d,"..Status.allocsTable[Status.allocCurrentDisplay].daring3
		setting3 = setting3..",s,"..Status.allocsTable[Status.allocCurrentDisplay].speed3
		setting3 = setting3..",a,"..Status.allocsTable[Status.allocCurrentDisplay].aiming3
		setting3 = setting3..",p,"..Status.allocsTable[Status.allocCurrentDisplay].parry3
		setting3 = setting3..",c,"..Status.allocsTable[Status.allocCurrentDisplay].control3
		setting3 = setting3..",n,"..Status.allocsTable[Status.allocCurrentDisplay].null3
		send(setting3)
	end

	if Status.allocsTable[Status.allocCurrentDisplay].bodypart4 ~= "" then
		setting4 = pretext..Status.allocsTable[Status.allocCurrentDisplay].bodypart4
		setting4 = setting4..",b,"..Status.allocsTable[Status.allocCurrentDisplay].bonus4
		setting4 = setting4..",d,"..Status.allocsTable[Status.allocCurrentDisplay].daring4
		setting4 = setting4..",s,"..Status.allocsTable[Status.allocCurrentDisplay].speed4
		setting4 = setting4..",a,"..Status.allocsTable[Status.allocCurrentDisplay].aiming4
		setting4 = setting4..",p,"..Status.allocsTable[Status.allocCurrentDisplay].parry4
		setting4 = setting4..",c,"..Status.allocsTable[Status.allocCurrentDisplay].control4
		setting4 = setting4..",n,"..Status.allocsTable[Status.allocCurrentDisplay].null4
		send(setting4)
	end

	if Status.allocsTable[Status.allocCurrentDisplay].bodypart5 ~= "" then
		setting5 = pretext..Status.allocsTable[Status.allocCurrentDisplay].bodypart5
		setting5 = setting5..",b,"..Status.allocsTable[Status.allocCurrentDisplay].bonus5
		setting5 = setting5..",d,"..Status.allocsTable[Status.allocCurrentDisplay].daring5
		setting5 = setting5..",s,"..Status.allocsTable[Status.allocCurrentDisplay].speed5
		setting5 = setting5..",a,"..Status.allocsTable[Status.allocCurrentDisplay].aiming5
		setting5 = setting5..",p,"..Status.allocsTable[Status.allocCurrentDisplay].parry5
		setting5 = setting5..",c,"..Status.allocsTable[Status.allocCurrentDisplay].control5
		setting5 = setting5..",n,"..Status.allocsTable[Status.allocCurrentDisplay].null5
		send(setting5)
	end

	if Status.allocsTable[Status.allocCurrentDisplay].bodypart6 ~= "" then
		setting6 = pretext..Status.allocsTable[Status.allocCurrentDisplay].bodypart6
		setting6 = setting6..",b,"..Status.allocsTable[Status.allocCurrentDisplay].bonus6
		setting6 = setting6..",d,"..Status.allocsTable[Status.allocCurrentDisplay].daring6
		setting6 = setting6..",s,"..Status.allocsTable[Status.allocCurrentDisplay].speed6
		setting6 = setting6..",a,"..Status.allocsTable[Status.allocCurrentDisplay].aiming6
		setting6 = setting6..",p,"..Status.allocsTable[Status.allocCurrentDisplay].parry6
		setting6 = setting6..",c,"..Status.allocsTable[Status.allocCurrentDisplay].control6
		setting6 = setting6..",n,"..Status.allocsTable[Status.allocCurrentDisplay].null6
		send(setting6)
	end

	if not (settype == "share") then
		Status.allocsTable[Status.allocCurrentDisplay].allocIsActive = 1
		Events.raiseEvent("checkAllocSetButtonEvent", {target = target})
	end
end



-- check the alloc set button background
-----------------------------------------------------------
local function checkAllocSetButton(args)
	local target = args["target"]
	local isActive = 0
	isActive = dba.query('SELECT allocIsActive FROM allocs WHERE allocOrderNumber='..Status.allocCurrentDisplay)[1]

	if target == "unknown" then
		local temp = dba.query('SELECT allocTarget FROM allocs WHERE allocOrderNumber='..Status.allocCurrentDisplay)[1]
		target = temp.allocTarget
	end

	if isActive.allocIsActive == 1 then
		if (target == "") or (string.lower(Status.name) == target) then
			GUI.buttonAllocs3:setStyleSheet(StyleButtonPaleGreen:getCSS())
		else
			GUI.buttonAllocs3:setStyleSheet(StyleButtonPaleRed:getCSS())
		end
	else
		GUI.buttonAllocs3:setStyleSheet(StyleButtonLightGrey:getCSS())
	end
end



-- set the current alloc number
-----------------------------------------------------------
local function setAllocsCurrentNumber(args)
	local direction = args

	if direction == "up" then
		if Status.allocCurrentDisplay == 30 then
			Status.allocCurrentDisplay = 1
		else
			Status.allocCurrentDisplay = Status.allocCurrentDisplay + 1
		end
	else
		if Status.allocCurrentDisplay == 1 then
			Status.allocCurrentDisplay = 30
		else
			Status.allocCurrentDisplay = Status.allocCurrentDisplay - 1
		end
	end
	
	Allocs.showAllocsCurrentNumber(Status.allocCurrentDisplay)
	Allocs.showAllocsCurrentFields(Status.allocCurrentDisplay)
	checkAllocSetButton({target = "unknown"})
end



-- set alloc name
-----------------------------------------------------------
local function setAllocName(args)
	local allocvalue	= args["input"]
	local announce		= args["save"]

	
	Status.allocsTable[Status.allocCurrentDisplay].allocName = allocvalue
	dba.execute('UPDATE allocs SET allocName="'..allocvalue..'" WHERE allocOrderNumber='..Status.allocCurrentDisplay)
	if announce then cecho("<yellow>Allocs: Allocation name updated\n") end
end



-- set alloc target
-----------------------------------------------------------
local function setAllocTarget(args)
	local allocvalue	= string.lower(args["input"])
	local announce		= args["save"]

	
	Status.allocsTable[Status.allocCurrentDisplay].allocTarget = allocvalue
	dba.execute('UPDATE allocs SET allocTarget="'..allocvalue..'" WHERE allocOrderNumber='..Status.allocCurrentDisplay)
	if announce then cecho("<yellow>Allocs: Allocation target updated\n") end
end



-- set alloc bodypart
-----------------------------------------------------------
local function setAllocBodypart(args)
	local allocvalue	= args["input"]
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].bodypart1 = allocvalue
		dba.execute('UPDATE allocs SET bodypart1="'..allocvalue..'" WHERE bodypart1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].bodypart2 = allocvalue
		dba.execute('UPDATE allocs SET bodypart2="'..allocvalue..'" WHERE bodypart2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].bodypart3 = allocvalue
		dba.execute('UPDATE allocs SET bodypart3="'..allocvalue..'" WHERE bodypart3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].bodypart4 = allocvalue
		dba.execute('UPDATE allocs SET bodypart4="'..allocvalue..'" WHERE bodypart4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].bodypart5 = allocvalue
		dba.execute('UPDATE allocs SET bodypart5="'..allocvalue..'" WHERE bodypart5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].bodypart6 = allocvalue
		dba.execute('UPDATE allocs SET bodypart6="'..allocvalue..'" WHERE bodypart6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation bodypart"..partnumber.." updated\n") end
end



-- set alloc bonus
-----------------------------------------------------------
local function setAllocBonus(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation bonus"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].bonus1 = allocvalue
		dba.execute('UPDATE allocs SET bonus1="'..allocvalue..'" WHERE bonus1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].bonus2 = allocvalue
		dba.execute('UPDATE allocs SET bonus2="'..allocvalue..'" WHERE bonus2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].bonus3 = allocvalue
		dba.execute('UPDATE allocs SET bonus3="'..allocvalue..'" WHERE bonus3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].bonus4 = allocvalue
		dba.execute('UPDATE allocs SET bonus4="'..allocvalue..'" WHERE bonus4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].bonus5 = allocvalue
		dba.execute('UPDATE allocs SET bonus5="'..allocvalue..'" WHERE bonus5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].bonus6 = allocvalue
		dba.execute('UPDATE allocs SET bonus6="'..allocvalue..'" WHERE bonus6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation bonus"..partnumber.." updated\n") end
end



-- set alloc daring
-----------------------------------------------------------
local function setAllocDaring(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation daring"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].daring1 = allocvalue
		dba.execute('UPDATE allocs SET daring1="'..allocvalue..'" WHERE daring1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].daring2 = allocvalue
		dba.execute('UPDATE allocs SET daring2="'..allocvalue..'" WHERE daring2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].daring3 = allocvalue
		dba.execute('UPDATE allocs SET daring3="'..allocvalue..'" WHERE daring3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].daring4 = allocvalue
		dba.execute('UPDATE allocs SET daring4="'..allocvalue..'" WHERE daring4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].daring5 = allocvalue
		dba.execute('UPDATE allocs SET daring5="'..allocvalue..'" WHERE daring5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].daring6 = allocvalue
		dba.execute('UPDATE allocs SET daring6="'..allocvalue..'" WHERE daring6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation daring"..partnumber.." updated\n") end
end



-- set alloc speed
-----------------------------------------------------------
local function setAllocSpeed(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation speed"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].speed1 = allocvalue
		dba.execute('UPDATE allocs SET speed1="'..allocvalue..'" WHERE speed1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].speed2 = allocvalue
		dba.execute('UPDATE allocs SET speed2="'..allocvalue..'" WHERE speed2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].speed3 = allocvalue
		dba.execute('UPDATE allocs SET speed3="'..allocvalue..'" WHERE speed3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].speed4 = allocvalue
		dba.execute('UPDATE allocs SET speed4="'..allocvalue..'" WHERE speed4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].speed5 = allocvalue
		dba.execute('UPDATE allocs SET speed5="'..allocvalue..'" WHERE speed5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].speed6 = allocvalue
		dba.execute('UPDATE allocs SET speed6="'..allocvalue..'" WHERE speed6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation speed"..partnumber.." updated\n") end
end



-- set alloc aiming
-----------------------------------------------------------
local function setAllocAiming(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation aiming"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].aiming1 = allocvalue
		dba.execute('UPDATE allocs SET aiming1="'..allocvalue..'" WHERE aiming1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].aiming2 = allocvalue
		dba.execute('UPDATE allocs SET aiming2="'..allocvalue..'" WHERE aiming2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].aiming3 = allocvalue
		dba.execute('UPDATE allocs SET aiming3="'..allocvalue..'" WHERE aiming3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].aiming4 = allocvalue
		dba.execute('UPDATE allocs SET aiming4="'..allocvalue..'" WHERE aiming4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].aiming5 = allocvalue
		dba.execute('UPDATE allocs SET aiming5="'..allocvalue..'" WHERE aiming5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].aiming6 = allocvalue
		dba.execute('UPDATE allocs SET aiming6="'..allocvalue..'" WHERE aiming6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation aiming"..partnumber.." updated\n") end
end



-- set alloc parry
-----------------------------------------------------------
local function setAllocParry(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation parry"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].parry1 = allocvalue
		dba.execute('UPDATE allocs SET parry1="'..allocvalue..'" WHERE parry1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].parry2 = allocvalue
		dba.execute('UPDATE allocs SET parry2="'..allocvalue..'" WHERE parry2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].parry3 = allocvalue
		dba.execute('UPDATE allocs SET parry3="'..allocvalue..'" WHERE parry3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].parry4 = allocvalue
		dba.execute('UPDATE allocs SET parry4="'..allocvalue..'" WHERE parry4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].parry5 = allocvalue
		dba.execute('UPDATE allocs SET parry5="'..allocvalue..'" WHERE parry5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].parry6 = allocvalue
		dba.execute('UPDATE allocs SET parry6="'..allocvalue..'" WHERE parry6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation parry"..partnumber.." updated\n") end
end



-- set alloc control
-----------------------------------------------------------
local function setAllocControl(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation control"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].control1 = allocvalue
		dba.execute('UPDATE allocs SET control1="'..allocvalue..'" WHERE control1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].control2 = allocvalue
		dba.execute('UPDATE allocs SET control2="'..allocvalue..'" WHERE control2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].control3 = allocvalue
		dba.execute('UPDATE allocs SET control3="'..allocvalue..'" WHERE control3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].control4 = allocvalue
		dba.execute('UPDATE allocs SET control4="'..allocvalue..'" WHERE control4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].control5 = allocvalue
		dba.execute('UPDATE allocs SET control5="'..allocvalue..'" WHERE control5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].control6 = allocvalue
		dba.execute('UPDATE allocs SET control6="'..allocvalue..'" WHERE control6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation control"..partnumber.." updated\n") end
end



-- set alloc null
-----------------------------------------------------------
local function setAllocNull(args)
	local allocvalue	= tonumber(args["input"])
	local partnumber	= args["number"]
	local announce		= args["save"]

	
	if (not allocvalue) or (allocvalue < 0) or (allocvalue > 300) then
		cecho("<red>ERROR: Invalid allocation null"..partnumber.." value\n")
		return
	elseif partnumber == 1 then
		Status.allocsTable[Status.allocCurrentDisplay].null1 = allocvalue
		dba.execute('UPDATE allocs SET null1="'..allocvalue..'" WHERE null1 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 2 then
		Status.allocsTable[Status.allocCurrentDisplay].null2 = allocvalue
		dba.execute('UPDATE allocs SET null2="'..allocvalue..'" WHERE null2 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 3 then
		Status.allocsTable[Status.allocCurrentDisplay].null3 = allocvalue
		dba.execute('UPDATE allocs SET null3="'..allocvalue..'" WHERE null3 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 4 then
		Status.allocsTable[Status.allocCurrentDisplay].null4 = allocvalue
		dba.execute('UPDATE allocs SET null4="'..allocvalue..'" WHERE null4 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	elseif partnumber == 5 then
		Status.allocsTable[Status.allocCurrentDisplay].null5 = allocvalue
		dba.execute('UPDATE allocs SET null5="'..allocvalue..'" WHERE null5 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	else
		Status.allocsTable[Status.allocCurrentDisplay].null6 = allocvalue
		dba.execute('UPDATE allocs SET null6="'..allocvalue..'" WHERE null6 != "'..allocvalue..'" AND allocOrderNumber='..Status.allocCurrentDisplay)
	end

	if announce then cecho("<yellow>Allocs: Allocation null"..partnumber.." updated\n") end
end



-- set alloc order
-----------------------------------------------------------
local function setAllocOrder(args)

	local rows = dba.query([[SELECT allocOrderNumber, id FROM allocs ORDER BY CASE WHEN allocName = '' THEN 1 ELSE 0 END, allocName COLLATE NOCASE]])

	for i = 1, 30 do
		dba.execute('UPDATE allocs SET allocOrderNumber = '..i..' WHERE id = '..rows[i].id)
	end

	Status.allocCurrentDisplay = 1
	Allocs.load()
	Allocs.showAllocsCurrentFields(Status.allocCurrentDisplay)
	Allocs.showAllocsCurrentNumber(Status.allocCurrentDisplay)
	Events.raiseEvent("checkAllocSetButtonEvent", {target = "unknown"})
	cecho("<yellow>Allocs: Allocation order updated\n")
end



-- /alloc copy - copy an alloc from source to target
-----------------------------------------------------------
local function allocCopy(args)
	local source	= tonumber(args["source"])
	local target	= tonumber(args["target"])


	if (source < 1) or (source > 30) or (target < 1) or (target > 30) then
		cecho("<red>ERROR: Invalid allocation copy values\n")
	elseif (source == target) then
		cecho("<red>ERROR: Allocation copy values cannot be the same\n")
	else
		local query = 'UPDATE allocs SET '
		query = query..'allocIsActive = false,'
		query = query..'allocName = (SELECT allocName FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'allocTarget = (SELECT allocTarget FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bodypart1 = (SELECT bodypart1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bodypart2 = (SELECT bodypart2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bodypart3 = (SELECT bodypart3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bodypart4 = (SELECT bodypart4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bodypart5 = (SELECT bodypart5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bodypart6 = (SELECT bodypart6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bonus1 = (SELECT bonus1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bonus2 = (SELECT bonus2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bonus3 = (SELECT bonus3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bonus4 = (SELECT bonus4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bonus5 = (SELECT bonus5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'bonus6 = (SELECT bonus6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'daring1 = (SELECT daring1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'daring2 = (SELECT daring2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'daring3 = (SELECT daring3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'daring4 = (SELECT daring4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'daring5 = (SELECT daring5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'daring6 = (SELECT daring6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'speed1 = (SELECT speed1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'speed2 = (SELECT speed2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'speed3 = (SELECT speed3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'speed4 = (SELECT speed4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'speed5 = (SELECT speed5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'speed6 = (SELECT speed6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'aiming1 = (SELECT aiming1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'aiming2 = (SELECT aiming2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'aiming3 = (SELECT aiming3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'aiming4 = (SELECT aiming4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'aiming5 = (SELECT aiming5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'aiming6 = (SELECT aiming6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'parry1 = (SELECT parry1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'parry2 = (SELECT parry2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'parry3 = (SELECT parry3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'parry4 = (SELECT parry4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'parry5 = (SELECT parry5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'parry6 = (SELECT parry6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'control1 = (SELECT control1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'control2 = (SELECT control2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'control3 = (SELECT control3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'control4 = (SELECT control4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'control5 = (SELECT control5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'control6 = (SELECT control6 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'null1 = (SELECT null1 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'null2 = (SELECT null2 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'null3 = (SELECT null3 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'null4 = (SELECT null4 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'null5 = (SELECT null5 FROM allocs WHERE allocOrderNumber = '..source..'),'
		query = query..'null6 = (SELECT null6 FROM allocs WHERE allocOrderNumber = '..source..') '
		query = query..'WHERE allocOrderNumber = '..target

		dba.execute(query)
		Allocs.load()
		Allocs.showAllocsCurrentFields(Status.allocCurrentDisplay)
		cecho("<yellow>Allocs: Allocation copied\n")
	end
end



-- /alloc clear - clear the contents of an allocation set
-----------------------------------------------------------
local function allocClear(args)
	local target	= tonumber(args["target"])


	if (target < 1) or (target > 30) then
		cecho("<red>ERROR: Invalid allocation clear value\n")
	else
		local query = 'UPDATE allocs SET '
		query = query..'allocIsActive = false, allocName = "", allocTarget = "",'
		query = query..'bodypart1 = "", bodypart2 = "", bodypart3 = "", bodypart4 = "", bodypart5 = "", bodypart6 = "",'
		query = query..'bonus1 = 0, bonus2 = 0, bonus3 = 0, bonus4 = 0, bonus5 = 0, bonus6 = 0,'
		query = query..'daring1 = 0, daring2 = 0, daring3 = 0, daring4 = 0, daring5 = 0, daring6 = 0,'
		query = query..'speed1 = 0, speed2 = 0, speed3 = 0, speed4 = 0, speed5 = 0, speed6 = 0,'
		query = query..'aiming1 = 0, aiming2 = 0, aiming3 = 0, aiming4 = 0, aiming5 = 0, aiming6 = 0,'
		query = query..'parry1 = 0, parry2 = 0, parry3 = 0, parry4 = 0, parry5 = 0, parry6 = 0,'
		query = query..'control1 = 0, control2 = 0, control3 = 0, control4 = 0, control5 = 0, control6 = 0,'
		query = query..'null1 = 300, null2 = 300, null3 = 300, null4 = 300, null5 = 300, null6 = 300 '
		query = query..'WHERE allocOrderNumber = '..target

		dba.execute(query)
		Allocs.load()
		Allocs.showAllocsCurrentFields(Status.allocCurrentDisplay)
		Events.raiseEvent("checkAllocSetButtonEvent", {target = "unknown"})
		cecho("<yellow>Allocs: Allocation cleared\n")
	end
end



-- save all alloc settings
-- TODO: make more efficient?
-----------------------------------------------------------
local function saveAllocSettings(args)
	local savetype	= args["type"]

	setAllocName({save = false, number = 0, input = GUI.commandlineAllocs1:getText()})
	setAllocTarget({save = false, number = 0, input = GUI.commandlineAllocs2:getText()})

	setAllocBodypart({save = false, number = 1, input = GUI.commandlineAllocs3:getText()})
	setAllocBodypart({save = false, number = 2, input = GUI.commandlineAllocs11:getText()})
	setAllocBodypart({save = false, number = 3, input = GUI.commandlineAllocs19:getText()})
	setAllocBodypart({save = false, number = 4, input = GUI.commandlineAllocs27:getText()})
	setAllocBodypart({save = false, number = 5, input = GUI.commandlineAllocs35:getText()})
	setAllocBodypart({save = false, number = 6, input = GUI.commandlineAllocs43:getText()})

	setAllocBonus({save = false, number = 1, input = GUI.commandlineAllocs4:getText()})
	setAllocBonus({save = false, number = 2, input = GUI.commandlineAllocs12:getText()})
	setAllocBonus({save = false, number = 3, input = GUI.commandlineAllocs20:getText()})
	setAllocBonus({save = false, number = 4, input = GUI.commandlineAllocs28:getText()})
	setAllocBonus({save = false, number = 5, input = GUI.commandlineAllocs36:getText()})
	setAllocBonus({save = false, number = 6, input = GUI.commandlineAllocs44:getText()})

	setAllocDaring({save = false, number = 1, input = GUI.commandlineAllocs5:getText()})
	setAllocDaring({save = false, number = 2, input = GUI.commandlineAllocs13:getText()})
	setAllocDaring({save = false, number = 3, input = GUI.commandlineAllocs21:getText()})
	setAllocDaring({save = false, number = 4, input = GUI.commandlineAllocs29:getText()})
	setAllocDaring({save = false, number = 5, input = GUI.commandlineAllocs37:getText()})
	setAllocDaring({save = false, number = 6, input = GUI.commandlineAllocs45:getText()})

	setAllocSpeed({save = false, number = 1, input = GUI.commandlineAllocs6:getText()})
	setAllocSpeed({save = false, number = 2, input = GUI.commandlineAllocs14:getText()})
	setAllocSpeed({save = false, number = 3, input = GUI.commandlineAllocs22:getText()})
	setAllocSpeed({save = false, number = 4, input = GUI.commandlineAllocs30:getText()})
	setAllocSpeed({save = false, number = 5, input = GUI.commandlineAllocs38:getText()})
	setAllocSpeed({save = false, number = 6, input = GUI.commandlineAllocs46:getText()})
	
	setAllocAiming({save = false, number = 1, input = GUI.commandlineAllocs7:getText()})
	setAllocAiming({save = false, number = 2, input = GUI.commandlineAllocs15:getText()})
	setAllocAiming({save = false, number = 3, input = GUI.commandlineAllocs23:getText()})
	setAllocAiming({save = false, number = 4, input = GUI.commandlineAllocs31:getText()})
	setAllocAiming({save = false, number = 5, input = GUI.commandlineAllocs39:getText()})
	setAllocAiming({save = false, number = 6, input = GUI.commandlineAllocs47:getText()})

	setAllocParry({save = false, number = 1, input = GUI.commandlineAllocs8:getText()})
	setAllocParry({save = false, number = 2, input = GUI.commandlineAllocs16:getText()})
	setAllocParry({save = false, number = 3, input = GUI.commandlineAllocs24:getText()})
	setAllocParry({save = false, number = 4, input = GUI.commandlineAllocs32:getText()})
	setAllocParry({save = false, number = 5, input = GUI.commandlineAllocs40:getText()})
	setAllocParry({save = false, number = 6, input = GUI.commandlineAllocs48:getText()})

	setAllocControl({save = false, number = 1, input = GUI.commandlineAllocs9:getText()})
	setAllocControl({save = false, number = 2, input = GUI.commandlineAllocs17:getText()})
	setAllocControl({save = false, number = 3, input = GUI.commandlineAllocs25:getText()})
	setAllocControl({save = false, number = 4, input = GUI.commandlineAllocs33:getText()})
	setAllocControl({save = false, number = 5, input = GUI.commandlineAllocs41:getText()})
	setAllocControl({save = false, number = 6, input = GUI.commandlineAllocs49:getText()})

	setAllocNull({save = false, number = 1, input = GUI.commandlineAllocs10:getText()})
	setAllocNull({save = false, number = 2, input = GUI.commandlineAllocs18:getText()})
	setAllocNull({save = false, number = 3, input = GUI.commandlineAllocs26:getText()})
	setAllocNull({save = false, number = 4, input = GUI.commandlineAllocs34:getText()})
	setAllocNull({save = false, number = 5, input = GUI.commandlineAllocs42:getText()})
	setAllocNull({save = false, number = 6, input = GUI.commandlineAllocs50:getText()})

	cecho("<yellow>Allocs: Allocation set "..string.format("%02d", Status.allocCurrentDisplay).." updated\n")
	if savetype == "set" then setAlloc({input = "set"}) end
end



-- build or update the table during setup
-----------------------------------------------------------
local function checkAllocsTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS allocs (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		allocIsActive BOOLEAN DEFAULT false,
		allocName VARCHAR(64) DEFAULT "",
		allocOrderNumber INTEGER DEFAULT 0,
		allocTarget VARCHAR(16) DEFAULT "",
		bodypart1 VARCHAR(64) DEFAULT "",
		bonus1 INTEGER DEFAULT 0,
		daring1 INTEGER DEFAULT 0,
		speed1 INTEGER DEFAULT 0,
		aiming1 INTEGER DEFAULT 0,
		parry1 INTEGER DEFAULT 0,
		control1 INTEGER DEFAULT 0,
		null1 INTEGER DEFAULT 300,
		bodypart2 VARCHAR(64) DEFAULT "",
		bonus2 INTEGER DEFAULT 0,
		daring2 INTEGER DEFAULT 0,
		speed2 INTEGER DEFAULT 0,
		aiming2 INTEGER DEFAULT 0,
		parry2 INTEGER DEFAULT 0,
		control2 INTEGER DEFAULT 0,
		null2 INTEGER DEFAULT 300,
		bodypart3 VARCHAR(64) DEFAULT "",
		bonus3 INTEGER DEFAULT 0,
		daring3 INTEGER DEFAULT 0,
		speed3 INTEGER DEFAULT 0,
		aiming3 INTEGER DEFAULT 0,
		parry3 INTEGER DEFAULT 0,
		control3 INTEGER DEFAULT 0,
		null3 INTEGER DEFAULT 300,
		bodypart4 VARCHAR(64) DEFAULT "",
		bonus4 INTEGER DEFAULT 0,
		daring4 INTEGER DEFAULT 0,
		speed4 INTEGER DEFAULT 0,
		aiming4 INTEGER DEFAULT 0,
		parry4 INTEGER DEFAULT 0,
		control4 INTEGER DEFAULT 0,
		null4 INTEGER DEFAULT 300,
		bodypart5 VARCHAR(64) DEFAULT "",
		bonus5 INTEGER DEFAULT 0,
		daring5 INTEGER DEFAULT 0,
		speed5 INTEGER DEFAULT 0,
		aiming5 INTEGER DEFAULT 0,
		parry5 INTEGER DEFAULT 0,
		control5 INTEGER DEFAULT 0,
		null5 INTEGER DEFAULT 300,
		bodypart6 VARCHAR(64) DEFAULT "",
		bonus6 INTEGER DEFAULT 0,
		daring6 INTEGER DEFAULT 0,
		speed6 INTEGER DEFAULT 0,
		aiming6 INTEGER DEFAULT 0,
		parry6 INTEGER DEFAULT 0,
		control6 INTEGER DEFAULT 0,
		null6 INTEGER DEFAULT 300
	);]])


	local results = dba.query('SELECT id FROM allocs')
	if results.count() == 0 then
		for i = 1, 30 do
			dba.execute('INSERT INTO allocs DEFAULT VALUES')
		end
		dba.execute('UPDATE allocs SET allocOrderNumber=id')
		local exampleallocs = "UPDATE allocs SET "
		exampleallocs = exampleallocs..'bodypart1="left hand", bodypart2="right hand", allocName="DEFAULT", '
		exampleallocs = exampleallocs..'bonus1=75, daring1=75, speed1=75, aiming1=75, parry2=150, control2=150 '
		exampleallocs = exampleallocs..'WHERE allocOrderNumber=1'
		dba.execute(exampleallocs)
	end

end



local function load()
	local result = {}
	Status.allocsTable = {}
	
	result = dba.query('SELECT * FROM allocs ORDER BY allocOrderNumber')
	for i = 1, 30 do
		table.insert(Status.allocsTable, result[i])
	end
end



local function save()
	
end



local function setup(args)
	checkAllocsTable()
	Events.addListener("setAllocEvent", sourceName, setAlloc)
	Events.addListener("setAllocNameEvent", sourceName, setAllocName)
	Events.addListener("setAllocTargetEvent", sourceName, setAllocTarget)
	Events.addListener("setAllocBodypartEvent", sourceName, setAllocBodypart)
	Events.addListener("setAllocBonusEvent", sourceName, setAllocBonus)
	Events.addListener("setAllocDaringEvent", sourceName, setAllocDaring)
	Events.addListener("setAllocSpeedEvent", sourceName, setAllocSpeed)
	Events.addListener("setAllocAimingEvent", sourceName, setAllocAiming)
	Events.addListener("setAllocParryEvent", sourceName, setAllocParry)
	Events.addListener("setAllocControlEvent", sourceName, setAllocControl)
	Events.addListener("setAllocNullEvent", sourceName, setAllocNull)
	Events.addListener("setAllocOrderEvent", sourceName, setAllocOrder)
	Events.addListener("checkAllocSetButtonEvent", sourceName, checkAllocSetButton)
	Events.addListener("saveAllocSettingsEvent", sourceName, saveAllocSettings)
	Events.addListener("allocCopyEvent", sourceName, allocCopy)
	Events.addListener("allocClearEvent", sourceName, allocClear)
end

local function unsetup(args)
	Events.removeListener("setAllocEvent", sourceName)
	Events.removeListener("setAllocNameEvent", sourceName)
	Events.removeListener("setAllocTargetEvent", sourceName)
	Events.removeListener("setAllocBodypartEvent", sourceName)
	Events.removeListener("setAllocBonusEvent", sourceName)
	Events.removeListener("setAllocDaringEvent", sourceName)
	Events.removeListener("setAllocSpeedEvent", sourceName)
	Events.removeListener("setAllocAimingEvent", sourceName)
	Events.removeListener("setAllocParryEvent", sourceName)
	Events.removeListener("setAllocControlEvent", sourceName)
	Events.removeListener("setAllocNullEvent", sourceName)
	Events.removeListener("setAllocOrderEvent", sourceName)
	Events.removeListener("checkAllocSetButtonEvent", sourceName)
	Events.removeListener("saveAllocSettingsEvent", sourceName)
	Events.removeListener("allocCopyEvent", sourceName)
	Events.removeListener("allocClearEvent", sourceName)

end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Allocs = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save,
	setAllocsCurrentNumber = setAllocsCurrentNumber,
	showAllocsCurrentNumber = showAllocsCurrentNumber,
	showAllocsCurrentFields = showAllocsCurrentFields
}

return Allocs

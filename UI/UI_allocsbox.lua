allocsbox = {}

function createAllocsBox()


	local alloc1_y		= 170
	local alloc2_y		= 200
	local alloc3_y		= 230
	local alloc4_y		= 260
	local alloc5_y		= 290
	local alloc6_y		= 320

	local bodypart_x	= 37
	local bonus_x		= -308
	local daring_x		= -266
	local speed_x		= -224
	local aiming_x		= -182
	local parry_x		= -140
	local control_x		= -98
	local null_x		= -56



-- CREATE ALLOCS BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerAllocsBox = GUI.containerAllocsBox or
	Geyser.Label:new({
		name = "AllocsBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow2.ALLOCScenter)

GUI.containerAllocsBox:setStyleSheet(StyleBoxBlue:getCSS())

--echo("AllocsBox", Info.showUnderConstruction())



-------------------------------------------------------------------------------
-- COMMAND LINES
-------------------------------------------------------------------------------



	-- CREATE COMMANDLINE1 -> ALLOCS -> TABWINDOW2  (allocName)
	-------------------------------------------------------
	GUI.commandlineAllocs1 = GUI.commandlineAllocs1 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs1",
			x = -221, y = 80,
			width = 205, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs1:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs1:setAction(
	function(command)
		Events.raiseEvent("setAllocNameEvent", {save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE2 -> ALLOCS -> TABWINDOW2  (allocTarget)
	-------------------------------------------------------
	GUI.commandlineAllocs2 = GUI.commandlineAllocs2 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs2",
			x = -221, y = 110,
			width = 205, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs2:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs2:setAction(
	function(command)
		Events.raiseEvent("setAllocTargetEvent", {save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE3 -> ALLOCS -> TABWINDOW2  (bodypart1)
	-------------------------------------------------------
	GUI.commandlineAllocs3 = GUI.commandlineAllocs3 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs3",
			x = bodypart_x, y = alloc1_y,
			width = 190, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs3:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs3:setAction(
	function(command)
		Events.raiseEvent("setAllocBodypartEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE4 -> ALLOCS -> TABWINDOW2  (bonus1)
	-------------------------------------------------------
	GUI.commandlineAllocs4 = GUI.commandlineAllocs4 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs4",
			x = bonus_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs4:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs4:setAction(
	function(command)
		Events.raiseEvent("setAllocBonusEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE5 -> ALLOCS -> TABWINDOW2  (daring1)
	-------------------------------------------------------
	GUI.commandlineAllocs5 = GUI.commandlineAllocs5 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs5",
			x = daring_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs5:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs5:setAction(
	function(command)
		Events.raiseEvent("setAllocDaringEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE6 -> ALLOCS -> TABWINDOW2  (speed1)
	-------------------------------------------------------
	GUI.commandlineAllocs6 = GUI.commandlineAllocs6 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs6",
			x = speed_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs6:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs6:setAction(
	function(command)
		Events.raiseEvent("setAllocSpeedEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE7 -> ALLOCS -> TABWINDOW2  (aiming1)
	-------------------------------------------------------
	GUI.commandlineAllocs7 = GUI.commandlineAllocs7 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs7",
			x = aiming_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs7:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs7:setAction(
	function(command)
		Events.raiseEvent("setAllocAimingEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE8 -> ALLOCS -> TABWINDOW2  (parry1)
	-------------------------------------------------------
	GUI.commandlineAllocs8 = GUI.commandlineAllocs8 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs8",
			x = parry_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs8:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs8:setAction(
	function(command)
		Events.raiseEvent("setAllocParryEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE9 -> ALLOCS -> TABWINDOW2  (control1)
	-------------------------------------------------------
	GUI.commandlineAllocs9 = GUI.commandlineAllocs9 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs9",
			x = control_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs9:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs9:setAction(
	function(command)
		Events.raiseEvent("setAllocControlEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE10 -> ALLOCS -> TABWINDOW2  (null1)
	-------------------------------------------------------
	GUI.commandlineAllocs10 = GUI.commandlineAllocs10 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs10",
			x = null_x, y = alloc1_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs10:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs10:setAction(
	function(command)
		Events.raiseEvent("setAllocNullEvent", {number = 1, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)








	-- CREATE COMMANDLINE11 -> ALLOCS -> TABWINDOW2  (bodypart2)
	-------------------------------------------------------
	GUI.commandlineAllocs11 = GUI.commandlineAllocs11 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs11",
			x = bodypart_x, y = alloc2_y,
			width = 190, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs11:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs11:setAction(
	function(command)
		Events.raiseEvent("setAllocBodypartEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE12 -> ALLOCS -> TABWINDOW2  (bonus2)
	-------------------------------------------------------
	GUI.commandlineAllocs12 = GUI.commandlineAllocs12 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs12",
			x = bonus_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs12:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs12:setAction(
	function(command)
		Events.raiseEvent("setAllocBonusEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE13 -> ALLOCS -> TABWINDOW2  (daring2)
	-------------------------------------------------------
	GUI.commandlineAllocs13 = GUI.commandlineAllocs13 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs13",
			x = daring_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs13:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs13:setAction(
	function(command)
		Events.raiseEvent("setAllocDaringEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE14 -> ALLOCS -> TABWINDOW2  (speed2)
	-------------------------------------------------------
	GUI.commandlineAllocs14 = GUI.commandlineAllocs14 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs14",
			x = speed_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs14:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs14:setAction(
	function(command)
		Events.raiseEvent("setAllocSpeedEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE15 -> ALLOCS -> TABWINDOW2  (aiming2)
	-------------------------------------------------------
	GUI.commandlineAllocs15 = GUI.commandlineAllocs15 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs15",
			x = aiming_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs15:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs15:setAction(
	function(command)
		Events.raiseEvent("setAllocAimingEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE16 -> ALLOCS -> TABWINDOW2  (parry2)
	-------------------------------------------------------
	GUI.commandlineAllocs16 = GUI.commandlineAllocs16 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs16",
			x = parry_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs16:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs16:setAction(
	function(command)
		Events.raiseEvent("setAllocParryEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE17 -> ALLOCS -> TABWINDOW2  (control2)
	-------------------------------------------------------
	GUI.commandlineAllocs17 = GUI.commandlineAllocs17 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs17",
			x = control_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs17:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs17:setAction(
	function(command)
		Events.raiseEvent("setAllocControlEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE18 -> ALLOCS -> TABWINDOW2  (null2)
	-------------------------------------------------------
	GUI.commandlineAllocs18 = GUI.commandlineAllocs18 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs18",
			x = null_x, y = alloc2_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs18:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs18:setAction(
	function(command)
		Events.raiseEvent("setAllocNullEvent", {number = 2, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	
	
	
	
	
	-- CREATE COMMANDLINE19 -> ALLOCS -> TABWINDOW2  (bodypart3)
	-------------------------------------------------------
	GUI.commandlineAllocs19 = GUI.commandlineAllocs19 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs19",
			x = bodypart_x, y = alloc3_y,
			width = 190, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs19:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs19:setAction(
	function(command)
		Events.raiseEvent("setAllocBodypartEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE20 -> ALLOCS -> TABWINDOW2  (bonus3)
	-------------------------------------------------------
	GUI.commandlineAllocs20 = GUI.commandlineAllocs20 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs20",
			x = bonus_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs20:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs20:setAction(
	function(command)
		Events.raiseEvent("setAllocBonusEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE21 -> ALLOCS -> TABWINDOW2  (daring3)
	-------------------------------------------------------
	GUI.commandlineAllocs21 = GUI.commandlineAllocs21 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs21",
			x = daring_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs21:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs21:setAction(
	function(command)
		Events.raiseEvent("setAllocDaringEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE22 -> ALLOCS -> TABWINDOW2  (speed3)
	-------------------------------------------------------
	GUI.commandlineAllocs22 = GUI.commandlineAllocs22 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs22",
			x = speed_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs22:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs22:setAction(
	function(command)
		Events.raiseEvent("setAllocSpeedEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE23 -> ALLOCS -> TABWINDOW2  (aiming3)
	-------------------------------------------------------
	GUI.commandlineAllocs23 = GUI.commandlineAllocs23 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs23",
			x = aiming_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs23:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs23:setAction(
	function(command)
		Events.raiseEvent("setAllocAimingEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE24 -> ALLOCS -> TABWINDOW2  (parry3)
	-------------------------------------------------------
	GUI.commandlineAllocs24 = GUI.commandlineAllocs24 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs24",
			x = parry_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs24:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs24:setAction(
	function(command)
		Events.raiseEvent("setAllocParryEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE25 -> ALLOCS -> TABWINDOW2  (control3)
	-------------------------------------------------------
	GUI.commandlineAllocs25 = GUI.commandlineAllocs25 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs25",
			x = control_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs25:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs25:setAction(
	function(command)
		Events.raiseEvent("setAllocControlEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE26 -> ALLOCS -> TABWINDOW2  (null3)
	-------------------------------------------------------
	GUI.commandlineAllocs26 = GUI.commandlineAllocs26 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs26",
			x = null_x, y = alloc3_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs26:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs26:setAction(
	function(command)
		Events.raiseEvent("setAllocNullEvent", {number = 3, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- CREATE COMMANDLINE27 -> ALLOCS -> TABWINDOW2  (bodypart4)
	-------------------------------------------------------
	GUI.commandlineAllocs27 = GUI.commandlineAllocs27 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs27",
			x = bodypart_x, y = alloc4_y,
			width = 190, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs27:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs27:setAction(
	function(command)
		Events.raiseEvent("setAllocBodypartEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE28 -> ALLOCS -> TABWINDOW2  (bonus4)
	-------------------------------------------------------
	GUI.commandlineAllocs28 = GUI.commandlineAllocs28 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs28",
			x = bonus_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs28:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs28:setAction(
	function(command)
		Events.raiseEvent("setAllocBonusEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE29 -> ALLOCS -> TABWINDOW2  (daring4)
	-------------------------------------------------------
	GUI.commandlineAllocs29 = GUI.commandlineAllocs29 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs29",
			x = daring_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs29:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs29:setAction(
	function(command)
		Events.raiseEvent("setAllocDaringEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE30 -> ALLOCS -> TABWINDOW2  (speed4)
	-------------------------------------------------------
	GUI.commandlineAllocs30 = GUI.commandlineAllocs30 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs30",
			x = speed_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs30:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs30:setAction(
	function(command)
		Events.raiseEvent("setAllocSpeedEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE31 -> ALLOCS -> TABWINDOW2  (aiming4)
	-------------------------------------------------------
	GUI.commandlineAllocs31 = GUI.commandlineAllocs31 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs31",
			x = aiming_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs31:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs31:setAction(
	function(command)
		Events.raiseEvent("setAllocAimingEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE32 -> ALLOCS -> TABWINDOW2  (parry4)
	-------------------------------------------------------
	GUI.commandlineAllocs32 = GUI.commandlineAllocs32 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs32",
			x = parry_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs32:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs32:setAction(
	function(command)
		Events.raiseEvent("setAllocParryEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE33 -> ALLOCS -> TABWINDOW2  (control4)
	-------------------------------------------------------
	GUI.commandlineAllocs33 = GUI.commandlineAllocs33 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs33",
			x = control_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs33:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs33:setAction(
	function(command)
		Events.raiseEvent("setAllocControlEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE34 -> ALLOCS -> TABWINDOW2  (null4)
	-------------------------------------------------------
	GUI.commandlineAllocs34 = GUI.commandlineAllocs34 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs34",
			x = null_x, y = alloc4_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs34:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs34:setAction(
	function(command)
		Events.raiseEvent("setAllocNullEvent", {number = 4, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)













	-- CREATE COMMANDLINE35 -> ALLOCS -> TABWINDOW2  (bodypart5)
	-------------------------------------------------------
	GUI.commandlineAllocs35 = GUI.commandlineAllocs35 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs35",
			x = bodypart_x, y = alloc5_y,
			width = 190, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs35:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs35:setAction(
	function(command)
		Events.raiseEvent("setAllocBodypartEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE36 -> ALLOCS -> TABWINDOW2  (bonus5)
	-------------------------------------------------------
	GUI.commandlineAllocs36 = GUI.commandlineAllocs36 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs36",
			x = bonus_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs36:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs36:setAction(
	function(command)
		Events.raiseEvent("setAllocBonusEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE37 -> ALLOCS -> TABWINDOW2  (daring5)
	-------------------------------------------------------
	GUI.commandlineAllocs37 = GUI.commandlineAllocs37 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs37",
			x = daring_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs37:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs37:setAction(
	function(command)
		Events.raiseEvent("setAllocDaringEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE38 -> ALLOCS -> TABWINDOW2  (speed5)
	-------------------------------------------------------
	GUI.commandlineAllocs38 = GUI.commandlineAllocs38 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs38",
			x = speed_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs38:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs38:setAction(
	function(command)
		Events.raiseEvent("setAllocSpeedEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE39 -> ALLOCS -> TABWINDOW2  (aiming5)
	-------------------------------------------------------
	GUI.commandlineAllocs39 = GUI.commandlineAllocs39 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs39",
			x = aiming_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs39:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs39:setAction(
	function(command)
		Events.raiseEvent("setAllocAimingEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE40 -> ALLOCS -> TABWINDOW2  (parry5)
	-------------------------------------------------------
	GUI.commandlineAllocs40 = GUI.commandlineAllocs40 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs40",
			x = parry_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs40:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs40:setAction(
	function(command)
		Events.raiseEvent("setAllocParryEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE41 -> ALLOCS -> TABWINDOW2  (control5)
	-------------------------------------------------------
	GUI.commandlineAllocs41 = GUI.commandlineAllocs41 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs41",
			x = control_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs41:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs41:setAction(
	function(command)
		Events.raiseEvent("setAllocControlEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE42 -> ALLOCS -> TABWINDOW2  (null5)
	-------------------------------------------------------
	GUI.commandlineAllocs42 = GUI.commandlineAllocs42 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs42",
			x = null_x, y = alloc5_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs42:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs42:setAction(
	function(command)
		Events.raiseEvent("setAllocNullEvent", {number = 5, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	
	
	
	
	
	
	
	
	
	-- CREATE COMMANDLINE43 -> ALLOCS -> TABWINDOW2  (bodypart6)
	-------------------------------------------------------
	GUI.commandlineAllocs43 = GUI.commandlineAllocs43 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs43",
			x = bodypart_x, y = alloc6_y,
			width = 190, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs43:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs43:setAction(
	function(command)
		Events.raiseEvent("setAllocBodypartEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE44 -> ALLOCS -> TABWINDOW2  (bonus6)
	-------------------------------------------------------
	GUI.commandlineAllocs44 = GUI.commandlineAllocs44 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs44",
			x = bonus_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs44:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs44:setAction(
	function(command)
		Events.raiseEvent("setAllocBonusEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE45 -> ALLOCS -> TABWINDOW2  (daring6)
	-------------------------------------------------------
	GUI.commandlineAllocs45 = GUI.commandlineAllocs45 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs45",
			x = daring_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs45:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs45:setAction(
	function(command)
		Events.raiseEvent("setAllocDaringEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE46 -> ALLOCS -> TABWINDOW2  (speed6)
	-------------------------------------------------------
	GUI.commandlineAllocs46 = GUI.commandlineAllocs46 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs46",
			x = speed_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs46:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs46:setAction(
	function(command)
		Events.raiseEvent("setAllocSpeedEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE47 -> ALLOCS -> TABWINDOW2  (aiming6)
	-------------------------------------------------------
	GUI.commandlineAllocs47 = GUI.commandlineAllocs47 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs47",
			x = aiming_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs47:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs47:setAction(
	function(command)
		Events.raiseEvent("setAllocAimingEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE48 -> ALLOCS -> TABWINDOW2  (parry6)
	-------------------------------------------------------
	GUI.commandlineAllocs48 = GUI.commandlineAllocs48 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs48",
			x = parry_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs48:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs48:setAction(
	function(command)
		Events.raiseEvent("setAllocParryEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE49 -> ALLOCS -> TABWINDOW2  (control6)
	-------------------------------------------------------
	GUI.commandlineAllocs49 = GUI.commandlineAllocs49 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs49",
			x = control_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs49:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs49:setAction(
	function(command)
		Events.raiseEvent("setAllocControlEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE50 -> ALLOCS -> TABWINDOW2  (null6)
	-------------------------------------------------------
	GUI.commandlineAllocs50 = GUI.commandlineAllocs50 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs50",
			x = null_x, y = alloc6_y,
			width = 40, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs50:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs50:setAction(
	function(command)
		Events.raiseEvent("setAllocNullEvent", {number = 6, save = true, input = command})
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)






-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------



	-- CREATE TEXTBOX1 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs1 = GUI.textboxAllocs1 or
		Geyser.Label:new({
			name = "textboxAllocs1",
			x = bodypart_x-10, y = 150,
			fontSize = 11,
			width = 170,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs1:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs1", "<yellow>BODYPART")
	GUI.textboxAllocs1:setToolTip("The bodypart to set combat allocation for",Status.tooltipTime)



	-- CREATE TEXTBOX2 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs2 = GUI.textboxAllocs2 or
		Geyser.Label:new({
			name = "textboxAllocs2",
			x = bonus_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs2:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs2", "<yellow>B")
	GUI.textboxAllocs2:setToolTip("Bonus - how hard you try to hit",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX3 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs3 = GUI.textboxAllocs3 or
		Geyser.Label:new({
			name = "textboxAllocs3",
			x = daring_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs3:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs3", "<yellow>D")
	GUI.textboxAllocs3:setToolTip("Daring - how wildly you fight",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX4 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs4 = GUI.textboxAllocs4 or
		Geyser.Label:new({
			name = "textboxAllocs4",
			x = speed_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs4:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs4", "<yellow>S")
	GUI.textboxAllocs4:setToolTip("Speed - how fast you swing, must be non-zero to attack",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX5 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs5 = GUI.textboxAllocs5 or
		Geyser.Label:new({
			name = "textboxAllocs5",
			x = aiming_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs5:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs5", "<yellow>A")
	GUI.textboxAllocs5:setToolTip("Aiming - You must 'set aim to (part)' for aiming to be effective",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX6 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs6 = GUI.textboxAllocs6 or
		Geyser.Label:new({
			name = "textboxAllocs6",
			x = parry_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs6:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs6", "<yellow>P")
	GUI.textboxAllocs6:setToolTip("Parry - Deflecting blows",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX7 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs7 = GUI.textboxAllocs7 or
		Geyser.Label:new({
			name = "textboxAllocs7",
			x = control_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs7:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs7", "<yellow>C")
	GUI.textboxAllocs7:setToolTip("Control - Avoiding attacks",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX8 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs8 = GUI.textboxAllocs8 or
		Geyser.Label:new({
			name = "textboxAllocs8",
			x = null_x, y = 150,
			fontSize = 11,
			width = 45,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs8:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs8", "<yellow>N")
	GUI.textboxAllocs8:setToolTip("Null - Set at 300 to lock in the other numbers",Status.tooltipTime)



	-- CREATE TEXTBOX9 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs9 = GUI.textboxAllocs9 or
		Geyser.Label:new({
			name = "textboxAllocs9",
			x = -340, y = 86,
			fontSize = 11,
			width = 120,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs9:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs9", "<yellow>ALLOC NAME")
	GUI.textboxAllocs9:setToolTip("Name for the allocation set",Status.tooltipTime)



	-- CREATE TEXTBOX10 -> ALLOCS -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxAllocs10 = GUI.textboxAllocs10 or
		Geyser.Label:new({
			name = "textboxAllocs10",
			x = -340, y = 116,
			fontSize = 11,
			width = 120,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs10:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxAllocs10", "<yellow>TARGET NAME")
	GUI.textboxAllocs10:setToolTip("Who this allocation is for",Status.tooltipTime)



	-- CREATE TEXTBOX11 -> ALLOCS -> TABWINDOW2  (CURRENT ALLOC NUMBER)
	-------------------------------------------------------
	GUI.textboxAllocs11 = GUI.textboxAllocs11 or
		Geyser.Label:new({
			name = "textboxAllocs11",
			x = 79, y = 80,
			fontSize = 11,
			width = 120,
			height = 40,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs11:setStyleSheet(StyleTextBlue:getCSS())

	GUI.textboxAllocs11:setToolTip("Allocation number",Status.tooltipTime)






-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------



	-- CREATE BUTTON1 -> ALLOCS -> TABWINDOW2  (forward button)
	-----------------------------------------------------------
	GUI.buttonAllocs1 = GUI.buttonAllocs1 or
		Geyser.Label:new({
			name = "buttonAllocs1",
			x = bodypart_x+77, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.buttonAllocs1:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonAllocs1", "<center><span style='font-size: 24pt;'>&#9654;</span></center>")
	GUI.buttonAllocs1:setToolTip("Go to next allocation",Status.tooltipTime)
	GUI.buttonAllocs1:setClickCallback("buttonAllocs1_click")

	function buttonAllocs1_click()
		GUI.buttonAllocs1:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs1:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Allocs.setAllocsCurrentNumber("up")
	end



	-- CREATE BUTTON2 -> ALLOCS -> TABWINDOW2  (back button)
	-----------------------------------------------------------
	GUI.buttonAllocs2 = GUI.buttonAllocs2 or
		Geyser.Label:new({
			name = "buttonAllocs2",
			x = bodypart_x+22, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.buttonAllocs2:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonAllocs2", "<center><span style='font-size: 24pt;'>&#9664;</span></center>")
	GUI.buttonAllocs2:setToolTip("Go to previous allocation",Status.tooltipTime)
	GUI.buttonAllocs2:setClickCallback("buttonAllocs2_click")

	function buttonAllocs2_click()
		GUI.buttonAllocs2:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs2:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Allocs.setAllocsCurrentNumber("down")
	end



	-- CREATE BUTTON3 -> ALLOCS -> TABWINDOW2  (set button)
	-----------------------------------------------------------
	GUI.buttonAllocs3 = GUI.buttonAllocs3 or
		Geyser.Label:new({
			name = "buttonAllocs3",
			x = -235, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.buttonAllocs3:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonAllocs3", "<center><span style='font-size: 22pt; color: green;'>&#10004;</span></center>")
	GUI.buttonAllocs3:setToolTip("Set this allocation for the target",Status.tooltipTime)
	GUI.buttonAllocs3:setClickCallback("buttonAllocs3_click")

	function buttonAllocs3_click()
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("saveAllocSettingsEvent", {type = "set"})
	end



	-- CREATE BUTTON4 -> ALLOCS -> TABWINDOW2  (save button)
	-----------------------------------------------------------
	GUI.buttonAllocs4 = GUI.buttonAllocs4 or
		Geyser.Label:new({
			name = "buttonAllocs4",
			x = -180, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonAllocs4", "<center><span style='font-size: 22pt;'>&#128190;</span></center>")
	GUI.buttonAllocs4:setToolTip("Save these allocation settings",Status.tooltipTime)
	GUI.buttonAllocs4:setClickCallback("buttonAllocs4_click")

	function buttonAllocs4_click()
		GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("saveAllocSettingsEvent", {input = ""})
	end



	-- CREATE BUTTON5 -> ALLOCS -> TABWINDOW2  (share button)
	-----------------------------------------------------------
	GUI.buttonAllocs5 = GUI.buttonAllocs5 or
		Geyser.Label:new({
			name = "buttonAllocs5",
			x = -125, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.buttonAllocs5:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonAllocs5", "<center><span style='font-size: 22pt;'>&#128227;</span></center>")
	GUI.buttonAllocs5:setToolTip("OOC share this allocation with the room",Status.tooltipTime)
	GUI.buttonAllocs5:setClickCallback("buttonAllocs5_click")

	function buttonAllocs5_click()
		GUI.buttonAllocs5:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("setAllocEvent", {type = "share"})
	end



	-- CREATE BUTTON6 -> ALLOCS -> TABWINDOW2  (sort button)
	-----------------------------------------------------------
	GUI.buttonAllocs6 = GUI.buttonAllocs6 or
		Geyser.Label:new({
			name = "buttonAllocs6",
			x = -70, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.buttonAllocs6:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonAllocs6", "<center><span style='font-size: 22pt;'>&#128288;</span></center>")
	GUI.buttonAllocs6:setToolTip("Sort allocations alphabetically by Alloc name",Status.tooltipTime)
	GUI.buttonAllocs6:setClickCallback("buttonAllocs6_click")

	function buttonAllocs6_click()
		GUI.buttonAllocs6:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonAllocs6:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("setAllocOrderEvent", {type = "set"})
	end












    -- CREATE BUTTON7 -> ALLOCS -> TABWINDOW2  (set bodypart1 button)
	-----------------------------------------------------------
	GUI.buttonAllocs7 = GUI.buttonAllocs7 or
    Geyser.Label:new({
        name = "buttonAllocs7",
        x = 7, y = alloc1_y,
        fontSize = 14,
        width = 28,
        height = 28,
        color = "black"
    }, GUI.containerAllocsBox)

    GUI.buttonAllocs7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    echo("buttonAllocs7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    GUI.buttonAllocs7:setToolTip("Set this bodypart's allocation for the target\nMust be the active alloction",Status.tooltipTime)
    GUI.buttonAllocs7:setClickCallback("buttonAllocs7_click")

    function buttonAllocs7_click()
        GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveAllocSettingsEvent", {number = 1, type = "set"})
    end



    -- CREATE BUTTON8 -> ALLOCS -> TABWINDOW2  (set bodypart2 button)
	-----------------------------------------------------------
	GUI.buttonAllocs8 = GUI.buttonAllocs8 or
    Geyser.Label:new({
        name = "buttonAllocs8",
        x = 7, y = alloc2_y,
        fontSize = 14,
        width = 28,
        height = 28,
        color = "black"
    }, GUI.containerAllocsBox)

    GUI.buttonAllocs8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    echo("buttonAllocs8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    GUI.buttonAllocs8:setToolTip("Set this bodypart's allocation for the target\nMust be the active alloction",Status.tooltipTime)
    GUI.buttonAllocs8:setClickCallback("buttonAllocs8_click")

    function buttonAllocs8_click()
        GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveAllocSettingsEvent", {number = 2, type = "set"})
    end



    -- CREATE BUTTON9 -> ALLOCS -> TABWINDOW2  (set bodypart3 button)
	-----------------------------------------------------------
	GUI.buttonAllocs9 = GUI.buttonAllocs9 or
    Geyser.Label:new({
        name = "buttonAllocs9",
        x = 7, y = alloc3_y,
        fontSize = 14,
        width = 28,
        height = 28,
        color = "black"
    }, GUI.containerAllocsBox)

    GUI.buttonAllocs9:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    echo("buttonAllocs9", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    GUI.buttonAllocs9:setToolTip("Set this bodypart's allocation for the target\nMust be the active alloction",Status.tooltipTime)
    GUI.buttonAllocs9:setClickCallback("buttonAllocs9_click")

    function buttonAllocs9_click()
        GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveAllocSettingsEvent", {number = 3, type = "set"})
    end



    -- CREATE BUTTON10 -> ALLOCS -> TABWINDOW2  (set bodypart4 button)
	-----------------------------------------------------------
	GUI.buttonAllocs10 = GUI.buttonAllocs10 or
    Geyser.Label:new({
        name = "buttonAllocs10",
        x = 7, y = alloc4_y,
        fontSize = 14,
        width = 28,
        height = 28,
        color = "black"
    }, GUI.containerAllocsBox)

    GUI.buttonAllocs10:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    echo("buttonAllocs10", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    GUI.buttonAllocs10:setToolTip("Set this bodypart's allocation for the target\nMust be the active alloction",Status.tooltipTime)
    GUI.buttonAllocs10:setClickCallback("buttonAllocs10_click")

    function buttonAllocs10_click()
        GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveAllocSettingsEvent", {number = 4, type = "set"})
    end



    -- CREATE BUTTON11 -> ALLOCS -> TABWINDOW2  (set bodypart5 button)
	-----------------------------------------------------------
	GUI.buttonAllocs11 = GUI.buttonAllocs11 or
    Geyser.Label:new({
        name = "buttonAllocs11",
        x = 7, y = alloc5_y,
        fontSize = 14,
        width = 28,
        height = 28,
        color = "black"
    }, GUI.containerAllocsBox)

    GUI.buttonAllocs11:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    echo("buttonAllocs11", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    GUI.buttonAllocs11:setToolTip("Set this bodypart's allocation for the target\nMust be the active alloction",Status.tooltipTime)
    GUI.buttonAllocs11:setClickCallback("buttonAllocs11_click")

    function buttonAllocs11_click()
        GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveAllocSettingsEvent", {number = 5, type = "set"})
    end



    -- CREATE BUTTON12 -> ALLOCS -> TABWINDOW2  (set bodypart6 button)
	-----------------------------------------------------------
	GUI.buttonAllocs12 = GUI.buttonAllocs12 or
    Geyser.Label:new({
        name = "buttonAllocs12",
        x = 7, y = alloc6_y,
        fontSize = 14,
        width = 28,
        height = 28,
        color = "black"
    }, GUI.containerAllocsBox)

    GUI.buttonAllocs12:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    echo("buttonAllocs12", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    GUI.buttonAllocs12:setToolTip("Set this bodypart's allocation for the target\nMust be the active alloction",Status.tooltipTime)
    GUI.buttonAllocs12:setClickCallback("buttonAllocs12_click")

    function buttonAllocs12_click()
        GUI.buttonAllocs4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonAllocs4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveAllocSettingsEvent", {number = 6, type = "set"})
    end

end

return allocsbox

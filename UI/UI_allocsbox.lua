allocsbox = {}

function createAllocsBox()


	local alloc1_y		= 130
	local alloc2_y		= 160
	local alloc3_y		= 190
	local alloc4_y		= 220
	local alloc5_y		= 250
	local alloc6_y		= 280
	
	local bodypart_x	= 15
	local bonus_x		= 200
	local daring_x		= 242
	local speed_x		= 284
	local aiming_x		= 326
	local parry_x		= 368
	local control_x		= 410
	local null_x		= 452
	

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
			x = 160, y = 10,
			width = 45, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs1:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs1:setAction(
	function(command)
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE2 -> ALLOCS -> TABWINDOW2  (allocTarget)
	-------------------------------------------------------
	GUI.commandlineAllocs2 = GUI.commandlineAllocs2 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs2",
			x = 160, y = 40,
			width = 45, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs2:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs2:setAction(
	function(command)
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE3 -> ALLOCS -> TABWINDOW2  (bodypart1)
	-------------------------------------------------------
	GUI.commandlineAllocs3 = GUI.commandlineAllocs3 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs3",
			x = bodypart_x, y = alloc1_y,
			width = 170, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs3:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs3:setAction(
	function(command)
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)








	-- CREATE COMMANDLINE11 -> ALLOCS -> TABWINDOW2  (bodypart2)
	-------------------------------------------------------
	GUI.commandlineAllocs11 = GUI.commandlineAllocs11 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs11",
			x = bodypart_x, y = alloc2_y,
			width = 170, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs11:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs11:setAction(
	function(command)
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	
	
	
	
	
	-- CREATE COMMANDLINE19 -> ALLOCS -> TABWINDOW2  (bodypart3)
	-------------------------------------------------------
	GUI.commandlineAllocs19 = GUI.commandlineAllocs19 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs19",
			x = bodypart_x, y = alloc3_y,
			width = 170, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs19:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs19:setAction(
	function(command)
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- CREATE COMMANDLINE27 -> ALLOCS -> TABWINDOW2  (bodypart4)
	-------------------------------------------------------
	GUI.commandlineAllocs27 = GUI.commandlineAllocs27 or
		Geyser.CommandLine:new({
			name = "commandlineAllocs27",
			x = bodypart_x, y = alloc4_y,
			width = 170, height = 28,
	}, GUI.containerAllocsBox)

	GUI.commandlineAllocs27:setStyleSheet(StyleCommandLine:getCSS())
	
	GUI.commandlineAllocs27:setAction(
	function(command)
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
		--Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
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
			x = -265, y = 33,
			fontSize = 11,
			width = 260,
			height = 17,
			color = "black"
		}, GUI.containerAllocsBox)

	GUI.textboxAllocs1:setStyleSheet(StyleTextBlue:getCSS())


end

return allocsbox

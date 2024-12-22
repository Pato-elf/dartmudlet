infobox = {}



function createInfoBox()

-- CREATE INFO BOX -> TABWINDOW3
-----------------------------------------------------------
GUI.containerInfoBox = GUI.containerInfoBox or
	Geyser.Label:new({
		name = "InfoBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow3.INFOcenter)


GUI.containerInfoBox:setStyleSheet([[
		QLabel{
			color: black;
			background-color: black;
			margin: 10px;
		}
]])



	-- CREATE NAME BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerNameBox = GUI.containerNameBox or
		Geyser.Label:new({
			name = "NameBox",
			x = 0, y = 8,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)
		
	GUI.containerNameBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE AGE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerAgeBox = GUI.containerAgeBox or
		Geyser.Label:new({
			name = "AgeBox",
			x = 0, y = 25,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerAgeBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE HUNGER BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerHungerBox = GUI.containerHungerBox or
		Geyser.Label:new({
			name = "HungerBox",
			x = 0, y = 42,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)
		
	GUI.containerHungerBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE THIRST BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerThirstBox = GUI.containerThirstBox or
		Geyser.Label:new({
			name = "ThirstBox",
			x = 0, y = 59,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerThirstBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE ENCUMBRANCE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerEncumbranceBox = GUI.containerEncumbranceBox or
		Geyser.Label:new({
			name = "EncumbranceBox",
			x = 0, y = 76,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerEncumbranceBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE MOVEMENT BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerMovementBox = GUI.containerMovementBox or
		Geyser.Label:new({
			name = "MovementBox",
			x = 0, y = 93,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerMovementBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE DATE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerDateBox = GUI.containerDateBox or
		Geyser.Label:new({
			name = "DateBox",
			x = 0, y = 110,
			fontSize = 11,
			width = 360,
			height = 34,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerDateBox:setStyleSheet(StyleTextDefault:getCSS())



    -- CREATE AIM BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerAimBox = GUI.containerAimBox or
    Geyser.Label:new({
        name = "AimBox",
        x = -235, y = 110,
        fontSize = 11,
        width = 235,
        height = 17,
        color = "black"
    }, GUI.containerInfoBox)

    GUI.containerAimBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE SPEAK BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerSpeakBox = GUI.containerSpeakBox or
		Geyser.Label:new({
			name = "SpeakBox",
			x = -235, y = 127,
			fontSize = 11,
			width = 235,
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerSpeakBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE HOLDER BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerHolderBox = GUI.containerHolderBox or
		Geyser.Label:new({
			name = "HolderBox",
			x = 0, y = -133,
			fontSize = 24,
			width = "100%",
			height = 133,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerHolderBox:setStyleSheet([[
			QLabel{
				color: black;
				background-color: black;
				margin: 0 10px 11px 10px;
				border: 2px solid white;
			}
	]])



		-- CREATE AURA BOX -> HOLDER -> INFO -> TABWINDOW3
		-------------------------------------------------------
		GUI.containerAuraBox = GUI.containerAuraBox or
			Geyser.Label:new({
				name = "AuraBox",
				message = [[<center>no aura</center>]],
				x = 0, y = 2,
				fontSize = 24,
				width = "100%",
				height = 58,
				color = "black"
			}, GUI.containerHolderBox)

		GUI.containerAuraBox:setStyleSheet([[
			QLabel{
				font-size: 30px;
				font-weight: bold;
				font-family: verdana, tahoma;
				background-color: black;
				margin: 0px 12px 0px 12px;
			}
		]])



		-- CREATE CONC BOX -> HOLDER -> INFO -> TABWINDOW3
		-------------------------------------------------------
		GUI.containerConcBox = GUI.containerConcBox or
			Geyser.Label:new({
				name = "ConcBox",
				message = [[<center>unknown concentration</center>]],
				x = 0, y = 60,
				fontSize = 22,
				width = "100%",
				height = 62,
				color = "black"
			}, GUI.containerHolderBox)

		GUI.containerConcBox:setStyleSheet([[
			QLabel{
				font-size: 22px;
				font-weight: bold;
				font-family: verdana, tahoma;
				background-color: black;
				margin: 0px 10px 0px 10px;
				border: 2px solid white;
			}
		]])

end

return infobox

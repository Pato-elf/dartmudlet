stylesheets = {}


function loadStylesheets()

	StyleButtonPaleGreen = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: palegreen;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	StyleButtonPaleBlue = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #9898FB;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	StyleButtonPaleRed = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #FB98FB;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])
	
	StyleButtonDarkGrey = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #696969;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	StyleButtonLightGrey = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #D3D3D3;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])
	
	StyleButtonRed = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: red;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

    StyleButtonSmallPaleGreen = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: palegreen;
			margin: 0px;
            padding-left: -6px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 5px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

    StyleButtonSmallPaleRed = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #FB98FB;
			margin: 0px;
            padding-left: -6px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 5px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

    StyleButtonSmallLightGrey = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #D3D3D3;
			margin: 0px;
            padding-left: -6px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 5px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

    StyleButtonExtraSmallLightGrey = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #D3D3D3;
			margin: 0px;
            padding-left: -8px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 5px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	StyleBoxBlue = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: rgb(0,0,70);
			margin: 5px;
			border-radius: 10px;
			padding: 10px;
			font-size: 20pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	StyleBoxLevels = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: rgb(0,0,70);
			margin: 5px;
			border-radius: 10px;
			padding: 10px;
			font-size: 10pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'AlignTop | AlignLeft';
		}
	]])

	StyleBoxHelp = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: rgb(0,0,70);
			margin: 5px;
			border-radius: 10px;
			padding: 10px;
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'AlignTop | AlignLeft';
		}
	]])

	StyleTextDefault = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])

	StyleTextBlue = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: rgb(0,0,70);
			margin: 0px 10px 0px 10px;
		}
	]])

	StyleTextWhiteLarge = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			color: white;
			background-color: rgb(0,0,70);
			margin: 0px 10px 0px 10px;
		}
	]])

	StyleTextMagentaLarge = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			color: magenta;
			background-color: rgb(0,0,70);
			margin: 0px 10px 0px 10px;
		}
	]])

    StyleTextYellowLarge = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 13pt;
			font-family: Bitstream Vera Sans Mono;
			color: yellow;
			background-color: rgb(0,0,70);
			margin: 0px 10px 0px 10px;
		}
	]])

	StyleCommandLine = Geyser.StyleSheet:new([[
		QPlainTextEdit{
			color: black;
			border: 1px solid silver;
			background-color: #9898FB;
			font: bold 14pt;
			font-family: Bitstream Vera Sans Mono;

		}
	]])

	StyleDropdown = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #0000C0;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	StyleDropdownChild = Geyser.StyleSheet:new([[
		QLabel{
				color: black;
				background-color: #0000C0;
				border-width: 2px;
				border-style: solid;
				border-color: black;
				font-size: 14pt;
				font-family: Bitstream Vera Sans Mono;
				qproperty-alignment: 'Center';
		}
	]])

end

return stylesheets

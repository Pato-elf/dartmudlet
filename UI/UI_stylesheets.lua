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
			background-color: #9898FB;--#98CFEA;
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
	
	StyleTextBlueLarge = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
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

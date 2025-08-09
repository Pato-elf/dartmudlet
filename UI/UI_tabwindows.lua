tabwindows = {}


function createTabwindows()

GUI.tabwindow1 = GUI.tabwindow1 or
	Adjustable.TabWindow:new({
		name = "tabwindow1",
		x = 0, y = 0,
		width = "100%",
		--height = "30%",
		height = 200,
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"WHO","TRACKING","LANGUAGE","LEVELS"},
	},GUI.right)


GUI.tabwindow2 = GUI.tabwindow2 or
	Adjustable.TabWindow:new({
		name = "tabwindow2",
		--x = 0, y = "30%",
		x = 0, y = -690,
		width = "100%",
		--height = "40%",
		height = 390,
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; padding: 0px; margin: 5px;",
		tabs = {"IMPROVES","CASTING","CHANNEL","REFRESH","REPEAT","ALLOCS"},
	},GUI.right)


GUI.tabwindow3 = GUI.tabwindow3 or
	Adjustable.TabWindow:new({
		name = "tabwindow3",
		--x = 0, y = "70%",
		x = 0, y = -300,
		width = "100%",
		--height = "30%",
		height = 300,
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"INFO","GAGS","HELP"},
	},GUI.right)


GUI.tabwindow4 = GUI.tabwindow4 or
	Adjustable.TabWindow:new({
		name = "tabwindow4",
		x = 0, y = 0,
		width = "100%",
		height = "100%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"CHAT"},
	},GUI.topleft)


GUI.tabwindow5 = GUI.tabwindow5 or
	Adjustable.TabWindow:new({
		name = "tabwindow5",
		x = 0, y = 0,
		width = "100%",
		height = "100%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"LOCATION","MESSAGE"},
	},GUI.topright)

end

return tabwindows

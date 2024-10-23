local Info = {}
local triggers = {}


local function setup(args)
	local tempTriggers = {}



	-- empty line with just a prompt are removed	
	---------------------------------------------------------------------
	tempTriggers.emptyLine =
		tempRegexTrigger("^(?:> )*$",
			[[
				local detail = matches[1]
				arguments = {detail = detail}
				Events.raiseEvent("emptylineEvent", arguments)
			]])



	-- autosave	moved to message window
	---------------------------------------------------------------------
	tempTriggers.AutoSave =
		tempRegexTrigger("^(?:> )*Autosaving character\\.\\.\\.Ok",
			[[
				local matchline = matches[1]
				deleteLine()
				Events.raiseEvent("messageEvent", {message="<yellow>"..matchline.."\n"})
			]])



	-- capture current language	
	---------------------------------------------------------------------
	tempTriggers.captureLanguage =
		tempRegexTrigger("^(?:> )*You are now speaking .*",
			[[
				local detail = matches[1]
				arguments = {detail = detail}
				Events.raiseEvent("languageEvent", arguments)
			]])



	-- regaining consciousness	
	---------------------------------------------------------------------
	tempTriggers.regainConsciousness =
		tempRegexTrigger("^(?:> )*You regain consciousness!",
			[[
				send("score", false)
			]])




	-- contents view	
	---------------------------------------------------------------------
	tempTriggers.contentsView =
		tempComplexRegexTrigger("contentsView", "(On it you see:|It contains:|^You catch)",
			[[]], 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, nil)
		tempComplexRegexTrigger("contentsView", '("([^"]+)"|[^,]+)(?:[,.!]\\s*|\\sand\\s)',
			[[
				local detail = multimatches[2]
				arguments = {detail = detail}
				Events.raiseEvent("showContentsEvent", arguments)
			]], 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, nil)

	triggers = tempTriggers
end



local function unsetup(args)
	for i,v in pairs(triggers) do
		killTrigger(v)
	end
	triggers = {}
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Info = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Info

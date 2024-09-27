local Info = {}

local triggers = {}


local function setup(args)
  local tempTriggers = {}





-- empty line with just a prompt are removed	
---------------------------------------------------------------------
  tempTriggers.emptyLine =
    tempRegexTrigger("^(?:> )*$"
                     ,[[
                        local detail = matches[1]
                        arguments = {detail = detail}
                        Events.raiseEvent("emptylineEvent", arguments)
                      ]])


-- autosave	moved to message window
---------------------------------------------------------------------
  tempTriggers.AutoSave =
    tempRegexTrigger("^(?:> )*Autosaving character\\.\\.\\.Ok"
                     ,[[
                        local matchline = matches[1]
						moveCursor(0,getLineCount()-1)
						deleteLine()
						moveCursor(0,getLineCount())
						deleteLine()
						Events.raiseEvent("messageEvent", {message="<yellow>"..matchline.."\n"})
                      ]])


---------------------------------------------------------------------



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
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Info

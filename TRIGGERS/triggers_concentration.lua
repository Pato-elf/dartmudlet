local Concentration = {}
local triggers      = {}


local function setup(args)
	local tempTriggers = {}

	tempTriggers.BEBT =
    tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're bright-eyed and bushy-tailed\\.)",
		[[
			local full = matches[1]
			local conc = matches[2]
			local arguments = {full = full, conc = conc}

			Events.raiseEvent("concEvent", arguments)
			Events.raiseEvent("concAutoEvent", arguments)
		]])



	tempTriggers.BOB =
    tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're a bit off balance\\.)",
        [[
			local full = matches[1]
			local conc = matches[2]
			local arguments = {full = full, conc = conc}

            Events.raiseEvent("BOBconcEvent", arguments)
            Events.raiseEvent("concEvent", arguments)
        ]])



    tempTriggers.SD =
    tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're somewhat distracted\\.)",
        [[
			local full = matches[1]
			local conc = matches[2]
			local arguments = {full = full, conc = conc}

            Events.raiseEvent("SDconcEvent", arguments)
            Events.raiseEvent("concEvent", arguments)
        ]])



    tempTriggers.QD =
      tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're quite distracted\\.)"
                       ,[[
				local full = matches[1]
				local conc = matches[2]
				local arguments = {full = full, conc = conc}

                          Events.raiseEvent("QDconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.OB =
      tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're off balance\\.)"
                       ,[[
				local full = matches[1]
				local conc = matches[2]
				local arguments  = {full = full, conc = conc}

                          Events.raiseEvent("OBconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.DAOB =
      tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're distracted and off balance\\.)"
                       ,[[
				local full = matches[1]
				local conc = matches[2]
				local arguments  = {full = full, conc = conc}

                          Events.raiseEvent("DAOBconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.SHOT =
      tempRegexTrigger("^(?:> )*(?:Concentration : )?(Your concentration is shot to hell\\.)"
                       ,[[
				local full = matches[1]
				local conc = matches[2]
				local arguments  = {full = full, conc = conc}

                          Events.raiseEvent("SHOTconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.TCTRN =
      tempRegexTrigger("^(?:> )*(?:Concentration : )?(You're too confused to remember your name\\.)"
                       ,[[
				local full = matches[1]
				local conc = matches[2]
				local arguments  = {full = full, conc = conc}

                          Events.raiseEvent("TCTRNconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.Unconscious =
      tempRegexTrigger("^(?:> )*(You fall unconscious!)"
                       ,[[
				local full = matches[1]
				local conc = matches[2]
				local arguments  = {full = full, conc = conc}

                          Events.raiseEvent("UnconsciousEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])

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

Concentration = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Concentration

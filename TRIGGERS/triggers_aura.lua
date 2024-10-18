--Aura
local Aura = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.None =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?(None)\\."
                     ,[[
						local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("NoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.VeryDimRed =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (very dim red)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("VeryDimRedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimRed =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (dim red)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("DimRedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Red =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (red)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("RedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.OrangishRed =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (orangish-red)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("OrangishRedauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.ReddishOrange =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (reddish-orange)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("ReddishOrangeauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Orange =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (orange)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("OrangeauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.YellowishOrange =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (yellowish-orange)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("YellowishOrangeauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.OrangishYellow =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (orangish-yellow)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("OrangishYellowauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Yellow =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (yellow)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("YellowauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.GreenishYellow =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (greenish-yellow)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("GreenishYellowauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.YellowishGreen =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (yellowish-green)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("YellowishGreenauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Green =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (green)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("GreenauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.BluishGreen =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (bluish-green)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("BluishGreenauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.GreenishBlue =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (greenish-blue)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("GreenishBlueauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Blue =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (blue)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("BlueauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseBlue =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (intense blue)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("IntenseBlueauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimIndigo =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (dim indigo)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("DimIndigoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Indigo =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (indigo)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("IndigoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseIndigo =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (intense indigo)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("IntenseIndigoauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimViolet =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (dim violet)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("DimVioletauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Violet =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (violet)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("VioletauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseViolet =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (intense violet)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("IntenseVioletauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.DimOctarine =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (dim octarine)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("DimOctarineauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Octarine =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (octarine)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("OctarineauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.IntenseOctarine =
      tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (intense octarine)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("IntenseOctarineauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
                      ]])

  tempTriggers.Scintillating =
    tempRegexTrigger("^(?:> )*(?:Aura          : )?Your aura appears to be (scintillating)\\."
                     ,[[
                        local full = matches[1]
						local aura = matches[2]
						local arguments  = {full = full, aura = aura}

                        --Events.raiseEvent("ScintillatingauraEvent", arguments)
                        Events.raiseEvent("auraEvent", arguments)
						Events.raiseEvent("auraAutoEvent", arguments)
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

Aura = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Aura

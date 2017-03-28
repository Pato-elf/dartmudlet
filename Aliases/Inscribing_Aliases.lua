local Inscribing_Aliases = {}

local aliases = {}

local function setup(args)
  tempAliases = {}

  --Practice writing alias
tempAliases.practiceInscribing =
  tempAlias("\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] ! (\\w+)(?: @ (\\d+))?"
            ,[[
              local spell = matches[2]
              local power = tonumber(matches[3]) or 100
              local arguments = {spell = spell, power = power}

              Events.raiseEvent("practiceInscribingEvent", arguments)
            ]])

tempAliases.inscribeOff =
  tempAlias("\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] ! [Oo][Ff][Ff]"
            ,[[
              local arguments = {}
              Events.raiseEvent("practiceInscribingOffEvent", arguments)
            ]])

tempAliases.inscribeResume =
  tempAlias("\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] ! [Rr][Ee][Ss][Uu][Mm][Ee]"
            ,[[
              local arguments = {}
              Events.raiseEvent("practiceInscribingResumeEvent", arguments)
            ]])

tempAliases.inscribeAdjustPower =
  tempAlias("\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] ! [Aa][Dd][Jj][Uu][Ss][Tt] [Pp][Oo][Ww][Ee][Rr] (\\d+)"
            ,[[
              local power = tonumber(matches[2]) or 100
              local arguments = {power = power}
              Events.raiseEvent("practiceInscribingAdjustPowerEvent", arguments)
            ]])

tempAliases.inscribeAdjustSpell =
  tempAlias("\\/[Ii][Nn][Ss][Cc][Rr][Ii][Bb][Ee] ! [Aa][Dd][Jj][Uu][Ss][Tt] [Ss][Pp][Ee][Ll][Ll] ([A-Za-z]+)"
            ,[[
              local spell = string.lower(matches[2])
              local arguments = {spell = spell}
              Events.raiseEvent("practiceInscribingAdjustSpellEvent", arguments)
            ]])


  aliases = tempAliases
end

local function unsetup(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Inscribing_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Inscribing_Aliases

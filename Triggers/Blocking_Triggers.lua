local Blocking = {}

local triggers = {}
local textToUnBlock = {
  "You have written"
  ,"Your scroll writhes and disappears\\."
  ,"A glowing rune appears on the"
  ,"Your aura is too weak\\."
  ,"corpse isn't here!"
  ,"You don't have any mist!"
  ,"You neglected to name a target\\."
  ,"You don't know such a spell\\."
  ,"No effect"
  ,"What ?"
  ,"Your concentration is disrupted and the spell is lost\\."
  ,"Nothing happens"
  ,"You don't have a scroll"
  ,"The book is already obfuscated\\."
  ,"No target specified."
  ,"You need to be holding a blank scroll to inscribe\\."
  ,"You don't have any .*!"
  ,"You finish editing"
  ,"You finish studying the book\\."
  ,"You try to touch [A-Za-z]+, but you miss\\."
  ,"You stop hunting\\."
  ,"You come face to face with the .*!"
  ,"Submitted\\.  Thank you!"
  ,"Subject line too long\\.  Please limit it to 30 characters\\."
}

local function setup(args)
  local tempTriggers = {}

  for i,v in ipairs(textToUnBlock) do
    tempTriggers[i] =
      tempRegexTrigger("^(?:> )?"..v.."[\\s\\S]*"
                       ,[[
                          local arguments = {}
                          Events.raiseEvent("unblockEvent", arguments)
                        ]])
  end

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

Blocking = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Blocking

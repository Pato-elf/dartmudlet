local Blocking = {}

local triggers = {}
local textToUnBlock = {
  "Your message is borne away on a gentle breeze."
  ,"A gentle breeze stirs briefly, but nothing more."
  ,"You have written"
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
  ,"You can only learn .* from this book"
  ,"You try to touch [A-Za-z]+, but you miss\\."
  ,"You stop hunting\\."
  ,"You come face to face with the .*!"
  ,"Submitted\\.  Thank you!"
  ,"Subject line too long\\.  Please limit it to 30 characters\\."
  ,"You finish the incantation and the spell fades from your scroll\\."
  ,"A suit of .* Starplate armor materializes around you!"
  ,"Your mind is isolated, you cannot send a message\\."
    -- PATO added these additional unblock triggers below
  ,"The .* glows .*"
  ,"You don't have enough aura"
  ,"Your spellbook shimmers and vanishes"
  ,"The spell critically fails: you are stunned"
  ,"You are draped with a mantle"
  ,"You are surrounded by a shimmering"
  ,"A staccato flicker of light briefly illuminates the area"
  ,"The spell fails"
  ,"You are missing"
  ,"You didn't specify a target"
  ,"Your mist disappears"
  ,"You bludgeoned"
  ,"You singed"
  ,"You battered"
  ,"You charred"
  ,"You burned"
  ,"You seared"
  ,"You torched"
  ,"You imploded"
  ,"You pummeled"
  ,"You knocked"
  ,"You disintegrated"
  ,"You shocked"
  ,"You fried"
  ,"You zapped"
  ,"Coruscating rays of"
  ,"Your hands crackle"
  ,"A corona of .* surrounds you"
  ,"A maelstrom of .* churns around you"
  ,".* is draped with a mantle of"
  ,".* is encircled by turbulent"
  ,"You are encircled by turbulent"
  ,"The aura remains hidden"
  ,".* aura manifests!"
  ,"You sense that .* has no disease"
  ,"You notice that .* has"
  ,"You lay your hands on"
  ,"The spell critically fails!  Your abilities wane"
  ,"You finish work on"
  ,"Perhaps you should learn that spell more"
  ,"You can only inscribe one scroll at a time"
  ,".* mind is closed to you"
  ,"Your body adjusts to its new abilities"
  ,"Your abilities return to normal"
  ,"You grow in size"
  ,"You shrink in size"
  ,"You return to your normal size"
  ,"You need some ink"
  ,"The jar isn't open"
  ,"You are briefly surrounded by sparks"
  ,"Your hands are momentarily"
  ,"Your hands glow"
  ,"The spell critically fails"
  ,"You cannot find a corpse here"
  ,"You cannot understand .* well enough"
  ,"You feel a pocket dimension open up"
  ,"You heal"
  ,"You need 1 ounce of holy water for this spell"
  ,"Light bends around you, turning you translucent"
  ,"Your .* begins to manifest its aura"
  ,"A faintly glowing rune appears on"
  ,"Your .* feels"
  ,"You feel better"
  ,".* begins to glow"
  ,"Your eyes adjust"
  ,"Oh no, it escaped"
  ,"The talisman .* disintegrates"
  ,"You begin to waver"
  ,"The power of the spell is snatched from your control"
  ,"You have to be holding the"
  ,"You magically cool down"
  ,"Your senses adjust"
  ,"Your .* return to normal"
  ,"Your .* bursts"
  ,"Incandescent .* erupt from your body"
  ,"You sense its aura to be"
  ,"You sense a deep affection"
  ,".* is surrounded by a shimmering"
  ,"The rune on the talisman crackles with electricity"
  ,"You make a few gestures"
  ,"The area becomes a bit darker"
  ,"The wall flares up violently.  You are pained"
  ,"The spell merges with the wall, and alters it"
  ,".* spellbooks may be obfuscated"
  ,".* don't have a "
  ,"The .* disintegrates"
  ,"The rune on the .* crackles with electricity"
  ,"No language specified"
  ,"This spell does not work on such an object"
  ,"A translucent orb of"
  ,"You feel a lot better"
  ,"You feel more fluent"
  ,"You regain some feeling"
  ,"Your sense of .* becomes heightened"
  ,"Your recuperative powers"
  ,"The wall of light disappears"
  ,"Your surroundings disappear"
  ,"You must have mispronounced a lot of words"
  ,"You pass your"
  ,"Hunting cattle would be too easy"
  ,"You see the .* It stares back at you"
  ,"You see the .* It hasn't noticed you"
  ,"There's .* right here"
  ,"You restore"
  ,"That isn't alive"
  ,".* lets off a real rip-roarer"
  ,"Who do you wish to give the stored spell to?"
  ,"You feel an anticipation in the air"
  ,"You sense the spell becoming active"
  ,"Sparks shoot out of your fingers"
  ,"A small jet of fire leaps from your"
  ,"You are surrounded in"
}

local function setup(args)
  local tempTriggers = {}

  for i,v in ipairs(textToUnBlock) do
    tempTriggers[i] =
      tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*"
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

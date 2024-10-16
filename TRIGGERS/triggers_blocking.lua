local Blocking = {}
local triggers = {}



local textToUnBlock = {
	".* appears above your .* then"
	,".* aura manifests!"
	,".* begins to glow"
	,".* coil around you like a serpent"
	,".* don't have a "
	,".* is draped with a mantle of"
	,".* is encircled by turbulent"
	,".* is surrounded by a shimmering"
	,".* lets off a real rip-roarer"
	,".* mind is closed to you"
	,".* spellbooks may be obfuscated"
	,".* sprays from your"
	,"A cloud of .* forms above your"
	,"A corona of .* surrounds you"
	,"A faintly glowing rune appears on"
	,"A fulminating skull of .* encircles you"
	,"A gentle breeze stirs briefly, but nothing more."
	,"A glowing arrow pointing"
	,"A glowing rune appears on the"
	,"A maelstrom of .* churns around you"
	,"A small jet of fire leaps from your"
	,"A staccato flicker of light briefly illuminates the area"
	,"A suit of .* Starplate armor materializes around you!"
	,"A translucent orb of"
	,"corpse isn't here!"
	,"Coruscating rays of"
	,"Hunting cattle would be too easy"
	,"Incandescent .* erupt from your body"
	,"Light bends around you, turning you translucent"
	,"No effect"
	,"No language specified"
	,"No target specified."
	,"Nothing happens"
	,"Oh no, it escaped"
	,"Perhaps you should learn that spell more"
	,"Sparks shoot out of your"
	,"Subject line too long\\.  Please limit it to 30 characters\\."
	,"Submitted\\.  Thank you!"
	,"Tendrils of .* lash out wildly around you"
	,"That isn't alive"
	,"The .* disintegrates"
	,"The .* glows .*"
	,"The area becomes a bit darker"
	,"The aura remains hidden"
	,"The book is already obfuscated\\."
	,"The enchantment on .* holds"
	,"The jar isn't open"
	,"The power of the spell is snatched from your control"
	,"The rune on the .* crackles with electricity"
	,"The spell critically fails"
	,"The spell fails"
	,"The spell merges with the wall, and alters it"
	,"The talisman .* disintegrates"
	,"The wall flares up violently.  You are pained"
	,"The wall of light disappears"
	,"There's .* right here"
	,"This spell does not work on such an object"
	,"Usage: write"
	,"What ?"
	,"Who do you wish to give the stored spell to?"
	,"You are briefly surrounded by sparks"
	,"You are draped with a mantle"
	,"You are encircled by turbulent"
	,"You are missing"
	,"You are momentarily surrounded by a halo"
	,"You are suddenly surrounded in bubbles"
	,"You are surrounded by a shimmering"
	,"You are surrounded in"
	,"You battered"
	,"You begin to waver"
	,"You bludgeoned"
	,"You burned"
	,"You can only inscribe one scroll at a time"
	,"You can only learn .* from this book"
	,"You cannot find a corpse here"
	,"You cannot store such a complex spell"
	,"You cannot understand .* well enough"
	,"You charred"
	,"You chilled"
	,"You come face to face with the .*!"
	,"You didn't specify a target"
	,"You disintegrated"
	,"You don't have a scroll"
	,"You don't have any "
	,"You don't have enough aura"
	,"You don't know such a spell\\."
	,"You feel a lot better"
	,"You feel a pocket dimension open up"
	,"You feel an anticipation in the air"
	,"You feel better"
	,"You feel more fluent"
	,"You finish editing"
	,"You finish studying the book\\."
	,"You finish the incantation and the spell"
	,"You finish work on"
	,"You fried"
	,"You froze"
	,"You grow in size"
	,"You have to be holding the"
	,"You have written"
	,"You heal"
	,"You imploded"
	,"You internalize the power of the spell"
	,"You knocked"
	,"You lay your hands on"
	,"You magically cool down"
	,"You make a few gestures"
	,"You melted"
	,"You must have mispronounced a lot of words"
	,"You need 1 ounce of holy water for this spell"
	,"You need some ink"
	,"You need to be holding a blank scroll to inscribe\\."
	,"You neglected to name a target\\."
	,"You notice that .* has"
	,"You pass your"
	,"You pummeled"
	,"You regain some feeling"
	,"You restore"
	,"You return to your normal size"
	,"You scalded"
	,"You seared"
	,"You see the .* It hasn't noticed you"
	,"You see the .* It stares back at you"
	,"You sense a deep affection"
	,"You sense its aura to be"
	,"You sense that .* has no disease"
	,"You sense the spell becoming active"
	,"You shocked"
	,"You shrink in size"
	,"You singed"
	,"You stop hunting\\."
	,"You torched"
	,"You try to touch [A-Za-z]+, but you miss\\."
	,"You zap"
	,"Your .* begins to manifest its aura"
	,"Your .* bursts"
	,"Your .* feels"
	,"Your .* is wreathed"
	,"Your .* return to normal"
	,"Your abilities return to normal"
	,"Your aura is too weak"
	,"Your body adjusts to its new abilities"
	,"Your concentration is disrupted and the spell is lost"
	,"Your eyes adjust"
	,"Your hands are momentarily"
	,"Your hands crackle"
	,"Your hands glow"
	,"Your message is borne away on a gentle breeze"
	,"Your mind is isolated, you cannot send a message"
	,"Your mist disappears"
	,"Your recuperative powers"
	,"Your scroll writhes and disappears"
	,"Your sense of .* becomes heightened"
	,"Your senses adjust"
	,"Your spellbook shimmers and vanishes"
	,"Your surroundings disappear"
}



local function setup(args)
	local tempTriggers = {}

	for i,v in ipairs(textToUnBlock) do
		tempTriggers[i] =
		tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
			[[
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
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Blocking

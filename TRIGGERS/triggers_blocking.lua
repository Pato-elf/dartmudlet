local Blocking = {}
local triggers = {}



local textToUnBlock = {
	".* appears above your .* then"
	,".* aura manifests!"
	,".* begins to glow"
	,".* (begin|begins) .* glowing\\."
	,"The .* begins (faintly|softly|brightly|brilliantly) glowing"
	,"The .* becomes (faintly|deeply|distinctly) shrouded"
	,"Your .* begins (faintly|softly|brightly|brilliantly) glowing"
	,"Your .* becomes (faintly|deeply|distinctly) shrouded"
	,"An arcane rune appears on the .*"
	,".* believes"
	,".* coil around you like a serpent"
	,".* corpse isn't here"
	,".* don't have a "
	,".* is draped with a mantle of"
	,".* is encircled by turbulent"
	,".* is surrounded by a shimmering"
	,".* is surrounded in a tranquil mist" --
	,".* lets off a real rip-roarer"
	,".* mind is closed to you"
	,".* seems to go all out of focus"
	,".* shivers\\." --ch
	,".* spellbooks may be obfuscated"
	,".* sprays from your"
	,"A cloud of .* forms above your"
	,"A corona of .* surrounds you"
	,"A faint arrow appears briefly"
	,"A faintly glowing rune appears on"
	,"A flicker of light briefly illuminates"
	,"A fulminating skull of .* encircles you"
	,"A gentle breeze stirs briefly, but nothing"
	,"A glowing arrow pointing"
	,"A glowing rune appears on the"
	,"A maelstrom of .* churns around you"
	,"A shadow flits through the"
	,"A small jet of fire leaps from your"
	,"A staccato (flash|flicker) of light briefly illuminates"
	,"A suit of .* Starplate armor materializes around you"
	,"A toothy, disembodied mouth"
	,"A translucent orb of"
	,"Ah, that would be" --search
	,"Arguments should be "
	,"Coruscating rays of"
	,"How rude!"
	,"Hunting cattle would be too easy"
	,"Incandescent .* erupt from your"
	,"Light bends around you, turning you"
	,"No effect"
	,"No (language|target) specified"
	,"No such (language|target around|thing here)"
	,"Nothing happens"
	,"Oh no, it escaped"
	,"Perhaps you should learn that spell more"
	,"Sparks shoot out of your"
	,"Standing stones do not gather moss" --gather
	,"Subject line too long\\.  Please limit"
	,"Submitted\\.  Thank you"
	,"Tendrils of .* lash out wildly around you"
	,"That isn't alive"
	,"That person is not plagued"
	,"The .* disintegrates"
	,"The .* glows .*(red|orange|yellow|green|blue|indigo|violet|octarine|scintillating|moment)\\." --focus
	,"The area becomes a bit darker"
	,"The aura remains hidden"
	,"The book is already obfuscated" --os
	,"The clues lead out of this area"
	,"The enchantment on .* holds"
	,"The incantations contain a formulae" --ae
	,"The jar isn't open"
	,"The pages of the book disintegrate before your eyes" --study
	,"The pattern contains"
	,"The power of the spell is snatched from your"
	,"The rune on the .* crackles with electricity"
	,"The spell critically fails"
	,"The spell fails"
	,"The spell merges with the wall, and alters"
	,"The spell seems to have no effect"
	,"The talisman .* disintegrates"
	,"The wall flares up violently"
	,"The wall of light disappears"
	,"There's .* right here"
	,"There is no aura"
	,"This book makes no sense" --gibberish book
	,"This spell can only be cast on foci" --mi
	,"This spell does not work on such an object"
	,"Usage: write"
	,"What \\?"
	,"What focus do you wish to imbed" --mi
	,"Write what\\?"
	,"Who do you wish to give the stored spell"
	,"You absorb the wounds from"
	,"You are briefly surrounded by sparks"
	,"You are draped with a mantle" --fire armor
	,"You are encased in thick slabs" --earth armor
	,"You are encircled by turbulent" --air armor
	,"You are immersed in .* bubble" --water armor
	,"You are missing"
	,"You are momentarily surrounded by a halo"
	,"You are not magically armored"
	,"You are suddenly surrounded in bubbles"
	,"You are surrounded by a shimmering" --arcane armor
	,"You are surrounded in"
	,"You attempt to manipulate" --bd
	,"You (battered|bludgeoned|burned)"
	,"You begin .* glowing"
	,"You begin to waver"
	,"You can't hunt in here"
	,"You can't study a"
	,"You can only (inscribe|learn)"
	,"You cannot find a corpse here"
	,"You cannot find an enchantment"
	,"You cannot store such a complex spell"
	,"You cannot understand .* well enough"
	,"You (charred|chilled)"
	,"You come face to face with the"
	,"You didn't specify a target"
	,"You disintegrated"
	,"You don't find anything" --search
	,"You don't have a scroll"
	,"You don't have (any|enough)"
	,"You don't know such a spell"
	,"You fail at casting the spell"
	,"You fail to sense"
	,"You failed to cast the spell"
	,"You feel a (little|lot) better"
	,"You feel a pocket dimension open"
	,"You feel an anticipation in the air"
	,"You feel better"
	,"You feel more fluent"
	,"You feel your power drain"
	,"You fill the room with"
	,"You (find|found) " --search/gather
	,"You finish (editing|studying|work)"
	,"You finish the incantation"
	,"You found no " --gather
	,"You (fried|froze)"
	,"You gaze deeply into"
	,"You grow in size"
	,"You have to be holding the"
	,"You (heal|restore)"
	,"You hear a soothing"
	,"You (imploded|knocked|melted|pummeled)"
	,"You internalize the power of the"
	,"You lay your hands on"
	,"You magically cool down"
	,"You make a few gestures"
	,"You must have mispronounced a lot"
	,"You need 1 ounce of holy water" --cu
	,"You need 1 pinch of gemstone powder" --bmr
	,"You need a bound device for that" --ae
	,"You need rose for this spell" --gl
	,"You need some ink"
	,"You need to be holding a blank scroll"
	,"You neglected to name a target"
	,"You notice that .* has"
	,"You pass your"
	,"You raise your .* and a "
	,"You raise your hands and begin to"
	,"You regain some feeling"
	,"You return to your normal size"
	,"You (scalded|seared|shocked|singed)"
	,"You see the .* It hasn't noticed you" --hunt
	,"You see the .* It stares back at you" --hunt
	,"You sense a bond between" --ds
	,"You sense a deep affection" --ds
	,"You sense its aura to be"
	,"You sense that .* has no disease" --dd
	,"You sense the spell becoming active"
	,"You shrink in size"
	,"You spot (it|him|her|them)!" --search
	,"You stop hunting\\."
	,"You torched"
	,"You try to touch [A-Za-z]+, but you"
	,"You zap"
	,"Your .* begins to manifest its aura"
	,"Your .* bursts"
	,"Your (\\w+) disappears"
	,"Your .* feels"
	,"Your .* is wreathed"
	,"Your .* return to normal"
	,"Your .* tingles"
	,"Your abilities return to normal"
	,"Your aura is too weak"
	,"Your body adjusts to its new abilities"
	,"Your concentration is (broken|disrupted)"
	,"Your eyes adjust"
	,"Your hands are momentarily"
	,"Your hands (crackle|glow)"
	,"Your message is borne away"
	,"Your mind is isolated, you cannot send"
	,"Your recuperative powers"
	,"Your scroll writhes and disappears"
	,"Your sense of .* becomes heightened"
	,"Your senses adjust"
	,"Your spellbook shimmers and vanishes"
	,"Your surroundings disappear"
	,"Your vision blurs and feel yourself"
	,"You're not holding a " --mi
	,"You've already searched this area"
}



local function setup(args)
	local tempTriggers = {}

	for i,v in ipairs(textToUnBlock) do
		tempTriggers[i] =
		tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
			[[
				local text      = matches[1] or ""
				local arguments = {}

				if not (Status.blockType == 'inscribe') then 
					Status.blockType = ''
					Events.raiseEvent("unblockEvent", arguments)

				elseif not
				string.find(text, "mist") and not
				string.find(text, "gusak") or
				string.find(text, "missing mist") then
					Status.blockType = ''
					Events.raiseEvent("unblockEvent", arguments)
				end
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

local Blocking = {}
local triggers = {}



local textToUnBlock = {
	".* appears above your .* then"
	,".* aura manifests!"
	,".* begins to glow"
	,".* believes"
	,".* coil around you like a serpent"
	,".* corpse isn't here"
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
	,"A staccato flicker of light briefly illuminates"
	,"A suit of .* Starplate armor materializes around you"
    ,"A toothy, disembodied mouth"
	,"A translucent orb of"
	,"Arguments should be "
	,"Coruscating rays of"
	,"How rude!"
	,"Hunting cattle would be too easy"
	,"Incandescent .* erupt from your"
	,"Light bends around you, turning you"
	,"No effect"
	,"No language specified"
    ,"No such language"
	,"No target specified."
	,"Nothing happens"
	,"Oh no, it escaped"
	,"Perhaps you should learn that spell more"
	,"Sparks shoot out of your"
	,"Subject line too long\\.  Please limit"
	,"Submitted\\.  Thank you"
	,"Tendrils of .* lash out wildly around you"
	,"That isn't alive"
	,"That person is not plagued"
	,"The .* disintegrates"
	,"The .* glows .*"
	,"The area becomes a bit darker"
	,"The aura remains hidden"
	,"The book is already obfuscated"
	,"The clues lead out of this area"
	,"The enchantment on .* holds"
	,"The jar isn't open"
	,"The pattern contains"
	,"The power of the spell is snatched from your"
	,"The rune on the .* crackles with electricity"
	,"The spell critically fails"
	,"The spell fails"
	,"The spell merges with the wall, and alters"
	,"The talisman .* disintegrates"
	,"The wall flares up violently"
	,"The wall of light disappears"
	,"There's .* right here"
	,"This spell does not work on such an object"
	,"Usage: write"
	,"What ?"
	,"Who do you wish to give the stored spell"
    ,"You absorb the wounds from"
    ,"You are briefly surrounded by sparks"
	,"You are draped with a mantle"
	,"You are encircled by turbulent"
	,"You are missing"
	,"You are momentarily surrounded by a halo"
    ,"You are not magically armored"
	,"You are suddenly surrounded in bubbles"
	,"You are surrounded by a shimmering"
	,"You are surrounded in"
	,"You (battered|bludgeoned|burned)"
	,"You begin to waver"
	,"You can't hunt in here"
	,"You can't study a"
	,"You can only inscribe one scroll"
	,"You can only learn .* from this book"
	,"You cannot find a corpse here"
    ,"You cannot find an enchantment"
	,"You cannot store such a complex spell"
	,"You cannot understand .* well enough"
	,"You (charred|chilled)"
	,"You come face to face with the"
	,"You didn't specify a target"
	,"You disintegrated"
	,"You don't have a scroll"
	,"You don't have any "
	,"You don't have enough aura"
	,"You don't know such a spell"
	,"You fail at casting the spell"
	,"You fail to sense"
	,"You failed to cast the spell"
	,"You feel a lot better"
	,"You feel a pocket dimension open"
	,"You feel an anticipation in the air"
	,"You feel better"
	,"You feel more fluent"
    ,"You feel your power drain"
	,"You fill the room with"
	,"You finish (editing|studying|work)"
	,"You finish the incantation"
	,"You (fried|froze)"
	,"You grow in size"
	,"You have to be holding the"
	,"You have written"
	,"You heal"
	,"You hear a soothing"
	,"You imploded"
	,"You internalize the power of the"
	,"You knocked"
	,"You lay your hands on"
	,"You magically cool down"
	,"You make a few gestures"
	,"You melted"
	,"You must have mispronounced a lot"
	,"You need 1 ounce of holy water"
	,"You need some ink"
	,"You need to be holding a blank scroll to"
	,"You neglected to name a target"
	,"You notice that .* has"
	,"You pass your"
	,"You pummeled"
	,"You raise your hands and begin to"
	,"You regain some feeling"
	,"You restore"
	,"You return to your normal size"
	,"You (scalded|seared|shocked|singed)"
	,"You see the .* It hasn't noticed you"
	,"You see the .* It stares back at you"
	,"You sense a deep affection"
	,"You sense its aura to be"
	,"You sense that .* has no disease"
	,"You sense the spell becoming active"
	,"You shrink in size"
	,"You stop hunting\\."
	,"You torched"
	,"You try to touch [A-Za-z]+, but you miss"
	,"You zap"
	,"Your .* begins to manifest its aura"
	,"Your .* bursts"
	,"Your (\\w+) disappears" --
	,"Your .* feels"
	,"Your .* is wreathed"
	,"Your .* return to normal"
	,"Your .* tingles"
	,"Your abilities return to normal"
	,"Your aura is too weak"
	,"Your body adjusts to its new abilities"
	,"Your concentration is disrupted"
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
	,"You've already searched this area"
}



local function setup(args)
	local tempTriggers = {}

	for i,v in ipairs(textToUnBlock) do
		tempTriggers[i] =
		tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
			[[
                local text      = matches[1]
				local arguments = {}

                if not (Status.blockType == 'inscribe') then 
                    Status.blockType = ''
				    Events.raiseEvent("unblockEvent", arguments)
                elseif not (string.find(text, "mist") or string.find(text, "gusak")) then
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

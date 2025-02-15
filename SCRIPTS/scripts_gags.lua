local Gags              = {}
local petGags           = {}
local creatureGags      = {}
local citizenGags       = {}
local trainerGags       = {}
local sparringGags      = {}
local channelGags       = {}
local promptGags        = {}
local questGags         = {}
local sourceName		= "gags"


local petList = {
    "(\\w+) (brays|digs|pants|rests|sleeps|snorts|spits|squeaks)\\."
    ,"(\\w+) stares (intently|piercingly)"
    ,"(\\w+) (hops|rolls|snuffles|springs|wanders) around"
    ,"(\\w+) follows (\\w+) around"
    ,"(\\w+) (bites|eyes|washes|watches) (\\w+)\\."
    ,"(\\w+) (hoots|snorts|whickers|whistles) softly"
    ,"(\\w+) looks for something to (eat|steal)"
    ,"(\\w+) chases (her|his) tail"
    ,"(\\w+) chatters (loudly|noisily)"
    ,"(\\w+) licks (her|his) (paw|tail)"
    ,"(\\w+) idly chews some cud"
    ,"(\\w+) nibbles on some grass"
    ,"(\\w+) paws at the ground with a hoof"
    ,"(\\w+) fluffs up (her|his) feathers"
    ,"(\\w+) wags (her|his) tail"
    ,"(\\w+) squeaks (at|quietly|to)"
    ,"(\\w+) (chirrups|nuzzles)"
    ,"(\\w+) takes a bath"
    ,"(\\w+) snorts and tosses"
    ,"(\\w+) sniffs at"
    ,"(\\w+) sniffs the air"
    ,"(\\w+) twitches (her|his) tail"
    ,"(\\w+) washes (her|his) face"
    ,"(\\w+) grooms (her|his) (fur|tail)"
    ,"(\\w+) looks about cautiously"
    ,"(\\w+) looks around for some grass"
    ,"(\\w+) curls up (and|in|with)"
    ,"(\\w+) rests lazily"
    ,"(\\w+) eyes (\\w+) as if calculating"
    ,"(\\w+) (skulks|trots) about"
    ,"(\\w+) (pounces|jumps) on"
    ,"(\\w+) rubs up against"
    ,"(\\w+) (preens|washes) (her|him)self"
    ,"(\\w+) sniffs around (for|where)"
    ,"(\\w+) brays obnoxiously"
    ,"(\\w+) helps (\\w+) dig"
    ,"(\\w+) hangs upside down"
    ,"(\\w+) looks for bugs to eat"
    ,"(\\w+) searches the area for something"
    ,"(\\w+) wrestles with (\\w+)"
    ,"(\\w+) stands beside (\\w+)"
    ,"(\\w+) exclaims, \\'(H|h)ee-haw"
}


local questList = {
    "In the Commander\\'s temple"
    ,"Seek out the Holy Island"
    ,"It waits for you in the southern"
    ,"Serve the Red Sword"
    ,"The Master of Battle has"
    ,"With the Symbol of the Commander"
    ,"Find your destiny across the"
}


local channelList = {
    "None of the power"
    ,"A gossamer strand"
}


local creatureList = {
    "(Donkey|Horse|Rhinoceros|Zebra) (looks|grazes|nibbles|watches)"
    ,"Turtle (appears|looks|rests)"
    ,"Turtle crawls ahead"
    ,"Turtle drags itself a few"
    ,"Crab scuttles about"
    ,"Crab scuttles back and"
    ,"Crab (wiggles|cocks|scavenges|waves)"
    ,"Elephant (flaps|forages|trumpets|tosses)"
    ,"(Cat|Rat) looks at"
    ,"Cat (pokes|scratches|sniffs|washes)"
    ,"Bat (flits|lets)"
    ,"Ox (bellows|chews|grazes|moos|nibbles)"
    ,"Ox asks, \\'MOO"
    ,"Ostrich (squawks|pecks|nibbles|cranes|looks|eyes)"
    ,"Camel spits at"
    ,"Wolf watches"
    ,"Horse looks around"
    ,"Crow (exclaims|watches|caws|stares)"
    ,"Turkey (exclaims|looks|pecks)"
    ,"Owl scans"
    ,"(Grouse|Partridge|Pheasant) (preens|wanders)"
    ,"(Nightingale|Quail|Sparrow) pecks"
    ,"Bee glares"
    ,"Rat searches"
    ,"Gerbil nibbles"
    ,"Gecko (cocks|runs)"
    ,"Lobster (cocks|wiggles|waves|scuttles|scavenges)"
    ,"Parrot (nibbles|preens|squawks)"
    ,"Peacock looks"
    ,"Squirrel digs"
    ,"Fox (slinks|watches)"
}


local citizenemotes = "blinks|bows|chuckles|flees|frowns|giggles|glares|grins|hums|looks|"
citizenemotes = citizenemotes.."nods|peers|ponders|screams|shakes|smiles|smirks|stares|stretches|swings|twiddles|whistles|yawns"
local citizenspeaks = "asks|exclaims|says"
local citizenList   = {
    "([\\w']+) incants some mystic phrases but"
    ,"Selah (barks|yips)"
    ,"Luc (coughs|pokes|rocks|smiles|stares)"
    ,"Lumum (says|nods)"
    ,"Manaine straightens"
    ,"Charlotte (smiles|wipes)"
    ,"Charlotte exclaims in common, \\'I love"
    ,"Dougal (coughs|wipes)"
    ,"Dougal asks in common, \\'Are you looking for anything"
    ,"([\\w']+) asks in common, \\'Got anything to eat"
    ,"([\\w']+) asks in common, \\'Need something carried"
    ,"Rice (counts|messes|sniffs|yawns)"
    ,"Sylis (cries|sniffs|weeps)"
    ,"(Lulpox|Torcas) (stares|nudges|grins|chuckles|whispers|points)"

    ,"(Agnesina|Agneta|Agostino|Ai|Aiko|Alberea|Alegreza|Alesia|Almaricus|Aluysio|Andrea|Anechino|Arizzo|Ascelina|Aya) ("..citizenemotes..")"
    ,"(Agnesina|Agneta|Agostino|Ai|Aiko|Alberea|Alegreza|Alesia|Almaricus|Aluysio|Andrea|Anechino|Arizzo|Ascelina|Aya) ("..citizenspeaks..")"
    ,"(Barbus|Bartolomeo|Benevenuta|Bertucio|Blancha|Bolezino|Borbrator|Brother|Bucello) ("..citizenemotes..")"
    ,"(Barbus|Bartolomeo|Benevenuta|Bertucio|Blancha|Bolezino|Borbrator|Brother|Bucello) ("..citizenspeaks..")"
    ,"(Claricia|Colette) ("..citizenemotes..")"
    ,"(Claricia|Colette) ("..citizenspeaks..")"
    ,"(Dai|Danieli|Dyonisius) ("..citizenemotes..")"
    ,"(Dai|Danieli|Dyonisius) ("..citizenspeaks..")"
    ,"(Edelina|Ermengardis|Evrardus) ("..citizenemotes..")"
    ,"(Edelina|Ermengardis|Evrardus) ("..citizenspeaks..")"
    ,"(Federico|Felle|Fiora|Flaminio|Flos|Francescino) ("..citizenemotes..")"
    ,"(Federico|Felle|Fiora|Flaminio|Flos|Francescino) ("..citizenspeaks..")"
    ,"(Gerita|Gerolimo|Giacomo|Girardus|Girout|Gregorio|Guiburgis|Guillelmus) ("..citizenemotes..")"
    ,"(Gerita|Gerolimo|Giacomo|Girardus|Girout|Gregorio|Guiburgis|Guillelmus) ("..citizenspeaks..")"
    ,"(Hakji|Hecelina|Helena|Helloysis|Heloysis|Hersendis) ("..citizenemotes..")"
    ,"(Hakji|Hecelina|Helena|Helloysis|Heloysis|Hersendis) ("..citizenspeaks..")"
    ,"(Ienobu|Itkkitk) ("..citizenemotes..")"
    ,"(Ienobu|Itkkitk) ("..citizenspeaks..")"
    ,"(Jacobus) ("..citizenemotes..")"
    ,"(Jacobus) ("..citizenspeaks..")"
    ,"(Kasumi|Kentaro) ("..citizenemotes..")"
    ,"(Kasumi|Kentaro) ("..citizenspeaks..")"
    ,"(Lambertus|Lancelinus|Leonardo|Lorenzo|Luca|Lucha|Luciana) ("..citizenemotes..")"
    ,"(Lambertus|Lancelinus|Leonardo|Lorenzo|Luca|Lucha|Luciana) ("..citizenspeaks..")"
    ,"(Matio|Micola|Mirabae|Moonoolool|Multormuh) ("..citizenemotes..")"
    ,"(Matio|Micola|Mirabae|Moonoolool|Multormuh) ("..citizenspeaks..")"
    ,"(Nasih) ("..citizenemotes..")"
    ,"(Nasih) ("..citizenspeaks..")"
    ,"(Oliverio|Ooll) ("..citizenemotes..")"
    ,"(Oliverio|Ooll) ("..citizenspeaks..")"
    ,"(Paolo|Pasqualina|Petronilla|Piruza) ("..citizenemotes..")"
    ,"(Paolo|Pasqualina|Petronilla|Piruza) ("..citizenspeaks..")"
    ,"(Rambaldo|Richa|Rigi|Romano|Rogerus) ("..citizenemotes..")"
    ,"(Rambaldo|Richa|Rigi|Romano|Rogerus) ("..citizenspeaks..")"
    ,"(Scabor|Scalortormut|Sedilia|Seimei|Shinobu|Shun|Simon|Staji) ("..citizenemotes..")"
    ,"(Scabor|Scalortormut|Sedilia|Seimei|Shinobu|Shun|Simon|Staji) ("..citizenspeaks..")"
    ,"(Tetsu|Thadeo|Thalia|Thomas|Thomisina|Tirna|Tor|Tsukasa|Tuscus) ("..citizenemotes..")"
    ,"(Tetsu|Thadeo|Thalia|Thomas|Thomisina|Tirna|Tor|Tsukasa|Tuscus) ("..citizenspeaks..")"
    ,"(Un) ("..citizenemotes..")"
    ,"(Un) ("..citizenspeaks..")"
    ,"(Vitaliano) ("..citizenemotes..")"
    ,"(Vitaliano) ("..citizenspeaks..")"
    ,"(Wakil) ("..citizenemotes..")"
    ,"(Wakil) ("..citizenspeaks..")"
    ,"(Zulian) ("..citizenemotes..")"
    ,"(Zulian) ("..citizenspeaks..")"
}


local trainerList = {
    "Ambrosius (dozes|examines|winks|yawns)"
    ,"Nazir (scowls|yawns|grunts|slouches)"
    ,"Nazir exclaims"
    ,"Ambrosius (exclaims|says) in (magic|common), \\'(Always|Trust|Open|Focus|Let|See)"
    ,"Ambrosius says in (magic|common), \\'I am a master"
    ,"Ambrosius says in (magic|common), \\'A closed mind"
    ,"Ambrosius says in (magic|common), \\'The (Ebon|mages|true)"
}


local sparringList = {
    "(\\w+) stamps a hoof"
    ,"(\\w+) lashes out"
    ,"(\\w+) neighs loudly"
    ,"(\\w+) rears back"
    ,"(\\w+) tosses (her|his) head"
    ,"(\\w+) attempts to trample"
    ,"(Aegnor|Aloysius) (listens|peers|hums|leans)"
    ,"Hassan (asks|exclaims|ignores|says|smiles|smirks)"
    ,"Armando (paces|pats)"
    ,"Khash (grins|spits)"
    ,"Ozzo (asks|exclaims)"
    ,"Pell (spins|reverses)"
    ,"Gudz says in common, \\'Leave now"
    ,"Gudz exclaims in common, \\'This will be"
    ,"Gudz asks in common, \\'What is it with"
    ,"Gudz says in common, \\'Run while you"
    ,"Gudz exclaims in common, \\'Wake up"
    ,"Luthien powerfully attacks"
    ,"Luthien angrily swings"
    ,"Luthien exclaims in elvish, \\'This is my home"
    ,"Luthien exclaims in elvish, \\'You don\\'t like it"
    ,"Morrigan (executes|kicks|punches|pushes)"
    ,"Morrigan lets out a warcry"
    ,"Pharos (grunts|stares)"
    ,"Pharos says in common, \\'Heh"
    ,"(\\w+) picks (her|his) nose"
    ,"(\\w+) tosses (her|his) head"
    ,"([\\w']+) (spits|kicks) at"
    ,"([\\w']+) (growls|snarls|sneers|taunts)"
    ,"([\\w']+) grins arrogantly"
    ,"([\\w']+) says in southern, \\'I\\'m going to enjoy killing"
    ,"([\\w']+) asks in southern, \\'Koon you feel lucky"
    ,"([\\w']+) asks in southern, \\'Why are you so obsessed"
    ,"Sparrow (swoops|tries)"
    ,"Bee (dives|tries|hums|stabs)"
    ,"Bat tries"
    ,"Rat jumps"
    ,"Crab snaps"
}



-- build regex triggers
-----------------------------------------------------------
local function loadTriggers(args)
    local gagset = args["detail"]


    if (gagset == 'gagPets') then
	    for i,v in ipairs(petList) do
    		petGags[i] =
		    tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
			    [[
                    deleteLine()
			    ]])
	    end

    elseif (gagset == 'gagChannels') then
        for i,v in ipairs(channelList) do
            channelGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagCreatures') then
        for i,v in ipairs(creatureList) do
            creatureGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagCitizens') then
        for i,v in ipairs(citizenList) do
            citizenGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagTrainers') then
        for i,v in ipairs(trainerList) do
            trainerGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagSparring') then
        for i,v in ipairs(sparringList) do
            sparringGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagQuests') then
        for i,v in ipairs(questList) do
            questGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagPrompts') then
        promptGags =
        tempRegexTrigger("^(?:> )*$",
            [[
                local detail = matches[1]
                arguments = {detail = detail}
                Events.raiseEvent("emptylineEvent", arguments)
            ]])
    end

end



-- remove regex triggers
-----------------------------------------------------------
local function killTriggers(args)
    local gagset = args["detail"]


    if (gagset == 'gagPets') then
        for i,v in pairs(petGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagChannels') then
        for i,v in pairs(channelGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagCreatures') then
        for i,v in pairs(creatureGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagCitizens') then
        for i,v in pairs(citizenGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagTrainers') then
        for i,v in pairs(trainerGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagSparring') then
        for i,v in pairs(sparringGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagQuests') then
        for i,v in pairs(questGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagPrompts') then
        killTrigger(promptGags)
    end

end



-- toggle gagPrompts on|off
-----------------------------------------------------------
local function setGagPrompts(args)

    if Status.gagPrompts then
        Status.gagPrompts = false
        dba.execute('UPDATE gags SET gagPrompts = false')
        killTriggers({detail = "gagPrompts"})
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag prompts Off")
    else
        Status.gagPrompts = true
        dba.execute('UPDATE gags SET gagPrompts = true')
        loadTriggers({detail = "gagPrompts"})
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag prompts On")
    end
end



-- toggle gagPets on|off
-----------------------------------------------------------
local function setGagPets(args)

    if Status.gagPets then
        Status.gagPets = false
        dba.execute('UPDATE gags SET gagPets = false')
        killTriggers({detail = "gagPets"})
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag pets Off")
    else
        Status.gagPets = true
        dba.execute('UPDATE gags SET gagPets = true')
        loadTriggers({detail = "gagPets"})
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag pets On")
    end
end



-- toggle gagCreatures on|off
-----------------------------------------------------------
local function setGagCreatures(args)

    if Status.gagCreatures then
        Status.gagCreatures = false
        dba.execute('UPDATE gags SET gagCreatures = false')
        killTriggers({detail = "gagCreatures"})
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag creatures Off")
    else
        Status.gagCreatures = true
        dba.execute('UPDATE gags SET gagCreatures = true')
        loadTriggers({detail = "gagCreatures"})
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag creatures On")
    end
end



-- toggle gagCitizens on|off
-----------------------------------------------------------
local function setGagCitizens(args)

    if Status.gagCitizens then
        Status.gagCitizens = false
        dba.execute('UPDATE gags SET gagCitizens = false')
        killTriggers({detail = "gagCitizens"})
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag citizens Off")
    else
        Status.gagCitizens = true
        dba.execute('UPDATE gags SET gagCitizens = true')
        loadTriggers({detail = "gagCitizens"})
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag citizens On")
    end
end



-- toggle gagTrainers on|off
-----------------------------------------------------------
local function setGagTrainers(args)

    if Status.gagTrainers then
        Status.gagTrainers = false
        dba.execute('UPDATE gags SET gagTrainers = false')
        killTriggers({detail = "gagTrainers"})
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag trainers Off")
    else
        Status.gagTrainers = true
        dba.execute('UPDATE gags SET gagTrainers = true')
        loadTriggers({detail = "gagTrainers"})
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag trainers On")
    end
end



-- toggle gagSparring on|off
-----------------------------------------------------------
local function setGagSparring(args)

    if Status.gagSparring then
        Status.gagSparring = false
        dba.execute('UPDATE gags SET gagSparring = false')
        killTriggers({detail = "gagSparring"})
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag sparring Off")
    else
        Status.gagSparring = true
        dba.execute('UPDATE gags SET gagSparring = true')
        loadTriggers({detail = "gagSparring"})
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag sparring On")
    end
end



-- toggle gagChannels on|off
-----------------------------------------------------------
local function setGagChannels(args)

    if Status.gagChannels then
        Status.gagChannels = false
        dba.execute('UPDATE gags SET gagChannels = false')
        killTriggers({detail = "gagChannels"})
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag channels Off")
    else
        Status.gagChannels = true
        dba.execute('UPDATE gags SET gagChannels = true')
        loadTriggers({detail = "gagChannels"})
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag channels On")
    end
end



-- toggle gagQuests on|off
-----------------------------------------------------------
local function setGagQuests(args)

    if Status.gagQuests then
        Status.gagQuests = false
        dba.execute('UPDATE gags SET gagQuests = false')
        killTriggers({detail = "gagQuests"})
        GUI.buttonGags9:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags9", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag quests Off")
    else
        Status.gagQuests = true
        dba.execute('UPDATE gags SET gagQuests = true')
        loadTriggers({detail = "gagQuests"})
        GUI.buttonGags9:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags9", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag quests On")
    end
end



-- toggle antiSpam on|off
-----------------------------------------------------------
local function setAntiSpamButton(args)

    if (Status.statusAntiSpam == 'on') then
        Events.raiseEvent("antiSpamOffEvent")
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    else
        Events.raiseEvent("antiSpamOnEvent")
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    end
end



-- update all gag buttons
-----------------------------------------------------------
local function showGagButtons(args)

    if Status.gagPrompts then
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagPets then
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagCreatures then
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagCitizens then
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagTrainers then
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagSparring then
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagChannels then
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if (Status.statusAntiSpam == 'on') then
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagQuests then
        GUI.buttonGags9:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags9", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags9:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags9", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end
end



-- build or update the table during setup
-----------------------------------------------------------
local function checkGagsTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS gags (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        gagChannels BOOLEAN DEFAULT false,
        gagCitizens BOOLEAN DEFAULT false,
        gagCreatures BOOLEAN DEFAULT false,
        gagPets BOOLEAN DEFAULT false,
        gagPrompts BOOLEAN DEFAULT true,
        gagQuests BOOLEAN DEFAULT false,
        gagSparring BOOLEAN DEFAULT false,
        gagTrainers BOOLEAN DEFAULT false
	);]])

	local results = dba.query('SELECT id FROM gags')
	if results.count() == 0 then
        systemMessage("Create GAGS table")
		dba.execute('INSERT INTO gags DEFAULT VALUES')
	end


    -- add any missing fields
	local temp = dba.query('SELECT * FROM gags')[1]
	if not temp.gagQuests then
        systemMessage("Update GAGS table")
		dba.execute('ALTER TABLE gags ADD COLUMN gagQuests BOOLEAN DEFAULT false')
        dba.execute('UPDATE gags SET gagQuests = false')
	end

end



-- build or update the table during setup
-----------------------------------------------------------
local function load()
	local result = {}


    systemMessage("Load GAGS table")
	result = dba.query('SELECT * FROM gags')[1]
    Status.gagChannels      = (result.gagChannels == 1)
    Status.gagCitizens      = (result.gagCitizens == 1)
    Status.gagCreatures     = (result.gagCreatures == 1)
    Status.gagPets          = (result.gagPets == 1)
    Status.gagPrompts       = (result.gagPrompts == 1)
    Status.gagQuests        = (result.gagQuests == 1)
    Status.gagSparring      = (result.gagSparring == 1)
    Status.gagTrainers      = (result.gagTrainers == 1)

    if Status.gagChannels then loadTriggers({detail = "gagChannels"}) end
    if Status.gagCitizens then loadTriggers({detail = "gagCitizens"}) end
    if Status.gagCreatures then loadTriggers({detail = "gagCreatures"}) end
    if Status.gagPets then loadTriggers({detail = "gagPets"}) end
    if Status.gagPrompts then loadTriggers({detail = "gagPrompts"}) end
    if Status.gagQuests then loadTriggers({detail = "gagQuests"}) end
    if Status.gagSparring then loadTriggers({detail = "gagSparring"}) end
    if Status.gagTrainers then loadTriggers({detail = "gagTrainers"}) end

end



local function setup(args)
	checkGagsTable()
	Events.addListener("setGagPromptsEvent", sourceName, setGagPrompts)
	Events.addListener("setGagPetsEvent", sourceName, setGagPets)
    Events.addListener("setGagCreaturesEvent", sourceName, setGagCreatures)
    Events.addListener("setGagCitizensEvent", sourceName, setGagCitizens)
    Events.addListener("setGagTrainersEvent", sourceName, setGagTrainers)
    Events.addListener("setGagSparringEvent", sourceName, setGagSparring)
    Events.addListener("setGagChannelsEvent", sourceName, setGagChannels)
    Events.addListener("setGagQuestsEvent", sourceName, setGagQuests)
    Events.addListener("setAntiSpamButtonEvent", sourceName, setAntiSpamButton)
    Events.addListener("showGagButtonsEvent", sourceName, showGagButtons)
end



local function save()

end



local function unsetup(args)

    if Status.gagChannels then killTriggers({detail = "gagChannels"}) end
    if Status.gagCitizens then killTriggers({detail = "gagCitizens"}) end
    if Status.gagCreatures then killTriggers({detail = "gagCreatures"}) end
    if Status.gagPets then killTriggers({detail = "gagPets"}) end
    if Status.gagPrompts then killTriggers({detail = "gagPrompts"}) end
    if Status.gagQuests then killTriggers({detail = "gagQuests"}) end
    if Status.gagSparring then killTriggers({detail = "gagSparring"}) end
    if Status.gagTrainers then killTriggers({detail = "gagTrainers"}) end

    Events.removeListener("setGagPromptsEvent", sourceName)
    Events.removeListener("setGagPetsEvent", sourceName)
    Events.removeListener("setGagCreaturesEvent", sourceName)
    Events.removeListener("setGagCitizensEvent", sourceName)
    Events.removeListener("setGagTrainersEvent", sourceName)
    Events.removeListener("setGagSparringEvent", sourceName)
    Events.removeListener("setGagChannelsEvent", sourceName)
    Events.removeListener("setGagQuestsEvent", sourceName)
    Events.removeListener("setAntiSpamButtonEvent", sourceName)
    Events.removeListener("showGagButtonsEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Gags = {
	setup   = setup,
	unsetup = unsetup,
	resetup = resetup,
    load    = load,
    save    = save
}

return Gags
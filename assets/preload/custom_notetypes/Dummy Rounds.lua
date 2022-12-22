function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dummy Rounds' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/DummyRounds'); 
			

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Dummy Rounds' then
		--cameraFlash('camGame', '9BC4C6', 0.2, false)
		playSound('gun', 0.6);
		playSound('shadowHurt', 0.7);
		characterPlayAnim('dad', 'shot', false);
		characterPlayAnim('boyfriend', shootAnims[direction + 1], false);
		setProperty('boyfriend.specialAnim', true);
		cameraShake('camGame', 0.02, 0.2)
		setProperty('health', getProperty('health')+0.00);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Dummy Rounds" then
	end
end

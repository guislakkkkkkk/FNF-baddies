function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Demon' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/Demon_Note'); 
			

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Demon' then
		setProperty('health', getProperty('health')+0.01);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Demon" then
		if difficulty == 2 then
			setProperty('health', getProperty('health')-0.3);
		end
		if difficulty == 1 then
			setProperty('health', getProperty('health')-0.1);
		end
		if difficulty == 0 then
			setProperty('health', getProperty('health')-0.05);
		end
		playSound('shadowHurt', 0.7);
	end
end

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ouch Notes' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/OuchyNotes'); 
			

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Ouch Notes' then
		setProperty('health', getProperty('health')+0.01);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Ouch Notes" then
		setProperty('health', getProperty('health')-0.2);
		playSound('shadowHurt', 0.7);
	end
end

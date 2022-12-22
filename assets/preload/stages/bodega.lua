local xx = 420;
local yy = 530; 
local xx2 = 650; 
local yy2 = 560; 
local ofs = 25;  
local followchars = false; 
local del = 0;
local del2 = 0;




function onCreate()

	
	--cameraShit
	camX = 'camFollow.x';	
	camY = 'camFollow.y';
	
	setProperty('cameraSpeed', 1.2)

	makeLuaSprite('wall', 'bodega/wall', -400, -180);
	setScrollFactor('wall', 0.9, 0.9);
	addLuaSprite('wall', false);
	scaleObject('wall', '1.1','1');

	makeLuaSprite('floor', 'bodega/floor', -900, 800);
	setScrollFactor('floor', 0.9, 0.9);
	addLuaSprite('floor', false);
	scaleObject('floor', '1.4','1.2');

	makeLuaSprite('stand', 'bodega/clerkStand', -400, -80);
	setScrollFactor('stand', 0.9, 0.9);
	addLuaSprite('stand', false);
	
	makeLuaSprite('stand2', 'bodega/snaccStand', 900, 160);
	setScrollFactor('stand2', 0.9, 0.9);
	addLuaSprite('stand2', false);

	makeAnimatedLuaSprite('her', 'bodega/carlita', 230,190)
	addAnimationByPrefix('her', 'dance', 'carlitaBop',24,true)
	addAnimationByPrefix('her', 'talk', 'talking',24,true)
	setScrollFactor('her', 0.9, 0.9);
	addLuaSprite('her',false)
	scaleObject('her', '0.95','0.95');
	objectPlayAnimation('her', 'dance',false)
	
	makeAnimatedLuaSprite('talk', 'bodega/dialogueShit', 80,400)
	addAnimationByPrefix('talk', '1', 'dialogue0',24,false)
	addAnimationByPrefix('talk', '2', 'dialogue2',24,false)
	addAnimationByPrefix('talk', '3', 'dialogue3',24,false)
	addAnimationByPrefix('talk', '4', 'dialogue4',24,false)
	addAnimationByPrefix('talk', '5', 'dialogue5',24,false)
	setScrollFactor('talk', 0.9, 0.9);
	scaleObject('talk', '0.95','0.95');
	setObjectCamera('talk', 'other')
	
	
	if not lowQuality then
		makeLuaSprite('light', 'nightmare/daLights', -800, -300);
		setScrollFactor('light', 0.9, 0.9);
		addLuaSprite('light', true);
		scaleObject('light', '1.9','1.2');
	end
	


	--precaching shart
	
	precacheSound('gun');
	precacheSound('carlitaSFX');

	precacheImage('bodega/dialogueShit');


end

function onUpdate()
	 for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
	
	setProperty('dad.scrollFactor.x', 0.9);
	setProperty('dad.scrollFactor.y', 0.9);

	setProperty('boyfriend.scrollFactor.x', 0.9);
	setProperty('boyfriend.scrollFactor.y', 0.9);

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
           
        else
               
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
	  if getProperty('boyfriend.animation.curAnim.name') == 'LEFTshoot' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
	 if getProperty('boyfriend.animation.curAnim.name') == 'RIGHTshoot' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
	if getProperty('boyfriend.animation.curAnim.name') == 'UPshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	   if getProperty('boyfriend.animation.curAnim.name') == 'DOWNshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- self explanatory
    end
    

	if curStep > 479 then --preps camera
		setProperty(camX, 400);
		setProperty(camY, 530);
	end

	if curStep > 492 then --shadow dies, jus gone lol
		setProperty('dad.alpha', 0) 
	end
end



function onBeatHit()
	--objectPlayAnimation('her', 'dance',true)
	

	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		characterPlayAnim('boyfriend','idle',true)
	end


end

function onGameOver()
	return Function_Stop;
end

stepHitFuncs = { --ui thingies

	[1] = function()
	
	end,


	[16] = function()

		playSound('carlitaSFX', 0.7);
		objectPlayAnimation('talk', '1',false)
		objectPlayAnimation('her', 'talk',false)
		addLuaSprite('talk',false)
		runTimer('gone1', 5.7, 1)
		
	end,
	[56] = function()
		playSound('carlitaSFX', 0.7);
		objectPlayAnimation('talk', '2',false)
		objectPlayAnimation('her', 'talk',false)
		setProperty('talk.x', 130);
		setProperty('talk.alpha', 1);
		runTimer('gone1', 5, 1)
	end,

	[89] = function()
		playSound('carlitaSFX', 0.7);
		objectPlayAnimation('talk', '3',false)
		objectPlayAnimation('her', 'talk',false)
		setProperty('talk.alpha', 1);
		runTimer('gone1', 6, 1)	
	end,

	[128] = function()
		followchars = true;
		doTweenAlpha('test', 'dad', 1, 2, 'smootherStepOut');
		doTweenZoom('zoom', 'camGame', '0.8', 1, 'bounceInOut')
		doTweenAlpha('begone', 'camHUD', 1, 1, 'smootherStepOut');	
	end,

	[269] = function()
		followchars = false;	
	end,


	[272] = function()
		--followchars = false;
		playSound('carlitaSFX', 0.7);
		doTweenZoom('zoom', 'camGame', '1', 2, 'bounceIn')
		doTweenAlpha('begone', 'camHUD', 0, 1, 'smootherStepOut');	
		objectPlayAnimation('talk', '4',false)
		objectPlayAnimation('her', 'talk',false)
		setProperty('talk.alpha', 1);
		runTimer('gone1', 7, 1)	
	end,

	[320] = function()
		followchars = true;
		doTweenZoom('zoom', 'camGame', '0.8', 1, 'bounceInOut')
		doTweenAlpha('begone', 'camHUD', 1, 1, 'smootherStepOut');	
		
	end,


	[470] = function()
		doTweenAlpha('begone', 'camHUD', 0, 1, 'smootherStepOut');
	end,
	[479] = function()
		playSound('shadowDeath', 1);
		triggerEvent('Play Animation', 'dies', 'Dad')
		doTweenZoom('zoom', 'camGame', '0.9', 2, 'bounceIn')
		runTimer('begoneThot', 2, 1) 
	end,

	
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

function onStartCountdown()
	doTweenZoom('zoom', 'camGame', '1', 4, 'smootherStepOut')
	setProperty(camX, 400);
	setProperty(camY, 330);
	setProperty('camHUD.alpha', 0);
	setProperty('dad.alpha', 0);
	--return Function_Continue;	

end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'gone1' then
		doTweenAlpha('cya', 'talk', 0, 0.8, 'smootherStepOut')
		objectPlayAnimation('her', 'dance',false)
	end
	if tag == 'begoneThot' then
		cameraFlash('camGame', 'FFFFFF', 3, false)
	end
end

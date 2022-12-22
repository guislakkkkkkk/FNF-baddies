local xx = 420;
local yy = 530; 
local xx2 = 650; 
local yy2 = 560; 
local ofs = 25;  
local followchars = true; 
local del = 0;
local del2 = 0;


function onCreate()

	
	--cameraShit
	
	
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
	
	
	if not lowQuality then
		makeLuaSprite('light', 'nightmare/daLights', -800, -300);
		setScrollFactor('light', 0.9, 0.9);
		addLuaSprite('light', true);
		scaleObject('light', '1.9','1.2');
	end
	
	
	

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
    
end



function onBeatHit()

end

stepHitFuncs = { 
	

	[40] = function() --testing space
	end,

}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end



function onTimerCompleted(tag, loops, loopsLeft)
	
end

local xx = 560;
local yy = 460;
local xx2 = 960;
local yy2 = 760;
local ofs = 70;
local followchars = false;
local del = 0;
local del2 = 0;

--960 x 650 y

--local missesCount = 0
--local missesDeath = 15

function opponentNoteHit()
	health = getProperty('health')
    		if getProperty('health') > 0.2 then
        		setProperty('health', health- 0.10);
   	 end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
		health = getProperty('health')
    		if getProperty('health') > 1.6 then
        		setProperty('healthGain', 0)
		elseif getProperty('health') < 1 then
		setProperty('health', health+ 0.04);
		setProperty('healthGain', 1)
   	 end
end
function onCreate()

	
	setProperty('cameraSpeed', 0.5)

	--healthShit
	moveX = 'healthBar.x'
	moveY = 'healthBar.y'

	--cameraShit
	camX = 'camFollow.x';	
	camY = 'camFollow.y';


	--spriteShit

	setPropertyFromClass('GameOverSubstate', 'characterName', 'JazzGameOver'); --Character json file for the death 
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'jasmineDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverTrap'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverTrapEnd'); --put in mods/music/

	makeLuaSprite('sky', 'nightmare/bgSky', -600, -410);
	setScrollFactor('sky', 0.9, 0.9);
	scaleObject('sky', '1.3','1.3');
	addLuaSprite('sky', false);

	if not lowQuality then
		makeAnimatedLuaSprite('building4', 'nightmare/testing/build4', -1700,100)
		addAnimationByPrefix('building4', 'further2', 'building4MOVE',48,true)
		objectPlayAnimation('building4', 'further2',true)
		setScrollFactor('building4', 0.8, 0.9);
		scaleObject('building4', '1','1.1');
		addLuaSprite('building4', false);

		makeAnimatedLuaSprite('building3', 'nightmare/testing/build3', -550,300)
		addAnimationByPrefix('building3', 'further', 'building3MOVE',48,true)
		objectPlayAnimation('building3', 'further',true)
		setScrollFactor('building3', 0.5, 0.6);
		scaleObject('building3', '1','1');
		addLuaSprite('building3', false);

		makeAnimatedLuaSprite('building2', 'nightmare/testing/build2', -550,300)
		addAnimationByPrefix('building2', 'back', 'building2MOVE',48,true)
		objectPlayAnimation('building2', 'back',true)
		setScrollFactor('building2', 0.4, 0.4);
		scaleObject('building2', '1','1');
		addLuaSprite('building2', false);

		makeAnimatedLuaSprite('building1', 'nightmare/testing/build1', -550,600)
		addAnimationByPrefix('building1', 'front', 'building1MOVE',24,true)
		objectPlayAnimation('building1', 'front',true)
		setScrollFactor('building1', 0.3, 0.8);
		scaleObject('building1', '1','1');
		addLuaSprite('building1', false);

	end

	--BG for fighting
	
	if not lowQuality then
		makeLuaSprite('tunnel', 'nightmare/fighting/tunnelWall', -4020, 0);
		setScrollFactor('tunnel', 0.9, 0.9);
		scaleObject('tunnel', '1.6','1.2');
		addLuaSprite('tunnel', false);

		makeAnimatedLuaSprite('tunnelLights', 'nightmare/fighting/lights',-4150, 250);
		setScrollFactor('tunnelLights', 0.9, 0.9);
		scaleObject('tunnelLights', '1.6','1.2');
		addAnimationByPrefix('tunnelLights', 'lights', 'movingLights',24,true)
		addLuaSprite('tunnelLights', false);

		makeAnimatedLuaSprite('POV', 'nightmare/fighting/tunnelWallPOV',300,50); --switches POV briefly
		setScrollFactor('POV', 0.9, 0.9);
		scaleObject('POV', '1','1');
		addAnimationByPrefix('POV', 'nextPOV', 'tunnelPOV',24,true)
		addLuaSprite('POV', false);
		setProperty('POV.alpha', 0) 

		makeAnimatedLuaSprite('fightHand2', 'nightmare/fighting/handBehindTrain', 1600,350) --second hand behind train
		addAnimationByPrefix('fightHand2', 'behind', 'handBehindTrain',24,false)
		objectPlayAnimation('fightHand2', 'behind',false)
		setScrollFactor('fightHand2', 0.9, 0.9);
		scaleObject('fightHand2', '0.8','0.8');
	end

	makeLuaSprite('train', 'nightmare/train', -900, 790);
	setScrollFactor('train', 0.9, 0.9);
	scaleObject('train', '1.4','1');
	addLuaSprite('train', false);

	if not lowQuality then
		makeLuaSprite('gameOverScreen', 'nightmare/gameOver/greenScreen', -600, -500);
		setScrollFactor('gameOverScreen',1, 1);
		scaleObject('gameOverScreen', '1.3','1.4');

		makeAnimatedLuaSprite('gameOverLaugh', 'nightmare/gameOver/angelicaTiana', -150,-50) 
		addAnimationByPrefix('gameOverLaugh', 'haha', 'baddiesLaugh',24,true)
		objectPlayAnimation('gameOverLaugh', 'haha',false)
		setScrollFactor('gameOverLaugh', 1, 1);
		scaleObject('gameOverLaugh', '0.9','0.9');

		makeLuaSprite('blood', 'nightmare/gameOver/blood', 0, 0);
		setScrollFactor('blood', 0.9, 0.9);
		scaleObject('blood', '1','1');
		setObjectCamera('blood', 'hud')
		setBlendMode('blood', 'add')
	end

	--tunnel to switch character
	makeAnimatedLuaSprite('wall', 'nightmare/tunnel', -320, 250);
	setScrollFactor('wall', 0.9, 0.9);
	scaleObject('wall', '0.8','0.9');
	addAnimationByPrefix('wall', 'pass', 'wallPass',24,true)

	--UI shit
	makeLuaSprite('healthShit', 'nightmare/bossHealthTest', 15, 565);
	setObjectCamera('healthShit', 'hud')
	addLuaSprite('healthShit', true)
	setObjectOrder('healthShit', 2)


	if not lowQuality then
		makeLuaSprite('light', 'nightmare/hugeLight', -600, -100);
		setScrollFactor('light', 0.3, 0.3);
		addLuaSprite('light', true);
		scaleObject('light', '1.3','1');
	end
	
	if not lowQuality then
		makeAnimatedLuaSprite('movie', 'nightmare/movieTime', 0,-150)
		setObjectCamera('movie', 'other')
		scaleObject('movie', '1','0.7');
		addLuaSprite('movie', false);
		--setObjectOrder('movie', 1)
		--addAnimationByPrefix('movie', 'popcorn', 'intoMovie',24,false)
		--objectPlayAnimation('movie', 'popcorn',true)
	end

	makeLuaSprite('hide', 'nightmare/black', 0, 0);
	setScrollFactor('hide', 0.9, 0.9);
	scaleObject('hide', '1','1');
	addLuaSprite('hide', true);
	setObjectCamera('movie', 'camHUD')

	if not lowQuality then
		makeAnimatedLuaSprite('fight1', 'nightmare/fighting/P1', 750,-50)
		addAnimationByPrefix('fight1', 'partone', 'PART1 FIGHT',24,false)
		objectPlayAnimation('fight1', 'partone',false)
		setScrollFactor('fight1', 0.9, 0.9);
		scaleObject('fight1', '0.8','0.8');
	end

	makeLuaText('talk2', '', '', '0', '600')
	setTextFont('talk2', 'jasmineTalks.otf')
	setTextAlignment('talk2', 'center')
	setObjectCamera('talk2', 'other')
	setTextSize('talk2','25')
	screenCenter('talk2', 'x')

	makeLuaText('talk3', '', '', '0', '600')
	setTextFont('talk3', 'jasmineTalks.otf')
	setTextAlignment('talk3', 'center')
	setObjectCamera('talk3', 'other')
	setTextSize('talk3','25')
	screenCenter('talk3', 'x')

	makeLuaText('talk4', '', '', '0', '600')
	setTextFont('talk4', 'jasmineTalks.otf')
	setTextAlignment('talk4', 'center')
	setObjectCamera('talk4', 'other')
	setTextSize('talk4','25')
	screenCenter('talk4', 'x')

	--precaching shart

	addCharacterToList('JazzGameOver','boyfriend');
	addCharacterToList('jazzShoot','boyfriend');
	addCharacterToList('jazzHurt','boyfriend');
	addCharacterToList('atrocityP2','dad');

	precacheImage('nightmare/tunnel');
	precacheImage('nightmare/secondPhase/bigassHand');
	precacheImage('nightmare/secondPhase/cuplol');
	precacheImage('nightmare/secondPhase/trainSeats');
	precacheImage('nightmare/secondPhase/trainWall');
	precacheImage('nightmare/jumpScare/jumpScare');
	precacheImage('nightmare/jumpScare/woke2');
	precacheImage('nightmare/jumpScare/bg');

	if not lowQuality then
		precacheImage('nightmare/daLights');
		precacheImage('nightmare/fighting/handBehindTrain');
		precacheImage('nightmare/fighting/P1');
		precacheImage('nightmare/fighting/P2');
		precacheImage('nightmare/fighting/CRUSH');
		precacheImage('nightmare/gameOver/angelicaTiana');
		precacheImage('nightmare/gameOver/greenScreen');
		precacheImage('nightmare/gameOver/blood');
		precacheSound('fightNew');
	end
	
	if lowQuality then
		addCharacterToList('jazzWait','boyfriend');
	end
	precacheSound('gun');

end

function onUpdate()
	
	setProperty('gf.alpha', 0)
	setProperty('building1.flipX', true)
	setProperty('building2.flipX', true)
	setProperty('building3.flipX', true)
	setProperty('building4.flipX', true)
	--healthBarShit

		
	setObjectOrder('healthShit', getObjectOrder('healthBar') +1)
	setProperty('iconP2.alpha', 0) 
	setProperty('iconP1.alpha', 0) 
	setProperty('scoreTxt.alpha', 0) 
	setProperty(moveX,150)

	if downscroll then
		setProperty('healthShit.y', 4)
	end
	

	 for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end

	


	if mustHitSection == false  then
			setProperty('defaultCamZoom',0.5)
			doTweenZoom('begin', 'camGame', '1.2', 1, 'bounceIn')
		else
            		setProperty('defaultCamZoom',1.3)
        end

	--this where i add a bunch of ingame shit lmao

	if curStep >0 then 
		cameraShake('camGame', 0.004, 1)
	end

	if curStep >128 then 
		setProperty('healthShit.alpha', 1)
		setProperty('healthBar.alpha', 1)
		
	end
	

	if curStep  > 669  then
		if mustHitSection == false  then
			setProperty('defaultCamZoom',0.7)
			doTweenZoom('begin', 'camGame', '1.2', 1, 'bounceIn')
		else
            		setProperty('defaultCamZoom',1.2)
        		end
	end

	if curStep > 669 then
		setProperty('dad.alpha', 1)
        else
           
         		setProperty('dad.alpha', 0)
        end

	if curStep > 1760 then -- fight begins
		setProperty('dad.alpha', 0)
		setProperty(camX, 1200);
		setProperty(camY, 690);
		if not lowQuality then
           			setProperty('defaultCamZoom',1.1)
         			setProperty('boyfriend.alpha', 0)
			setProperty(camX, 1400);
			setProperty(camY, 690);
		end
        end

	if curStep > 1815 then --she hops over to the other side
		if not lowQuality then
			setProperty(camX, 1600);
			setProperty(camY, 600);
		end
	end

	if curStep > 1852 then --game quickly takes us back over, switches POV
		if not lowQuality then
			setProperty(camX, 1200);
			setProperty(camY, 660);
			setProperty('cameraSpeed', 20)
		end
	end

	if curStep > 1873 then --she moves outta the way
		if not lowQuality then
			setProperty(camX, 1600);
			setProperty(camY, 660);
			setProperty('cameraSpeed', 0.8)
		end
	end

	if curStep > 1894 then --swaps over behind POV, kicking and snatched weave
		if not lowQuality then
			setProperty(camX, 1200);
			setProperty(camY, 690);
			setProperty('cameraSpeed', 20)
			setProperty('defaultCamZoom',1)
		end
	end
	
	if curStep > 1929 then -- stabbed
		if not lowQuality then
			setProperty(camX, 1300);
			setProperty(camY, 660);
			setProperty('cameraSpeed', 20)
			setProperty('defaultCamZoom',1.4)
		end
	end

	if curStep > 1954 then -- fall over, gets crushed
		if not lowQuality then
			setProperty(camX, 1500);
			setProperty(camY, 740);
			setProperty('cameraSpeed', 0.5)
		end
	end

	if curStep >1996 then --crash start
		if not lowQuality then
			cameraShake('camGame', 0.03, 0.5)
		end
	end

	if curStep >1999 then --crash stops
		if not lowQuality then
			cameraShake('camGame', 0.004, 0.5)
		end
	end

	if curStep > 2016 then --quickly set back cam into place for new scene
		setProperty(camX, 400);
		setProperty(camY, 400);
		setProperty('cameraSpeed', 20)

	end


	if curStep  > 2026  then -- reveal characters, set new zoom
		if mustHitSection == false  then
			setProperty('defaultCamZoom',1)
		else
            		setProperty('defaultCamZoom',0.8)
        		end
		setProperty('boyfriend.alpha', 1)
		setProperty('dad.alpha', 1)
		setProperty('cameraSpeed', 0.8)
	end

	if curStep  > 2832 then -- everything is gone
		setProperty('dad.alpha', 0)
		setProperty('boyfriend.alpha', 0)	
		cameraShake('camGame', 0, 0.5)
		setProperty(camX, 150);
		setProperty(camY, 200);
		setProperty('cameraSpeed', 20)
		
	end

	if curStep  > 2880 then -- everything is gone
		setProperty('defaultCamZoom',1.3)
	end

	--if missesCount == missesDeath then
       		--setProperty('health', 0)
  	--end

	--if misses == 5 then
		--objectPlayAnimation('hearts', 'one',false)
	--end

	--if misses == 10 then
		--objectPlayAnimation('hearts', 'two',false)

	--end

	--setTextString('missCount', missesCount)



	--setObjectOrder('move', getObjectOrder('iconP2') -1)
	--setProperty('move.flipX', false)
    	--setProperty('move.visible', true)
    	--setProperty('move.x', getProperty('iconP2.x') - 20)
    	--setProperty('move.y', getProperty('iconP2.y') - -20)
    	--setProperty('move.x', getProperty('iconP2.scale.x') - -20)
   	-- setProperty('move.antialiasing',true)

	--setObjectOrder('move', getObjectOrder('iconP1') -1)
    	--setProperty('move2.flipX', false)
    	--setProperty('move2.visible', true)
    	--setProperty('move2.x', getProperty('iconP1.x') - 20)
    	--setProperty('move2.y', getProperty('iconP1.y') - -90)
   	--setProperty('move2.x', getProperty('iconP1.scale.x') - -550)
    	--setProperty('move2.scale.y', getProperty('iconP1.scale.y'))
    	--setProperty('move2.antialiasing',true)

	--objectPlayAnimation('move2', 'idle',false)
	


	setProperty('boyfriend.scrollFactor.x', 0.9);
	setProperty('boyfriend.scrollFactor.y', 0.9);
	
	setProperty('dad.scrollFactor.x', 0.9);
	setProperty('dad.scrollFactor.y', 0.9);


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
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
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

function fadeStrums(alpha,time,movebf,movedad)
    if time <= 0 then
        if movebf == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
        if movedad == true then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
    else
        if movebf == true then
            for i = 4,7 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
        if movedad == true then
            for i = 0,3 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
    end
end

function onStartCountdown()
	setProperty('healthShit.alpha', 0)
	setProperty('healthBar.alpha', 0)
	
	return Function_Continue;	

end


function onBeatHit()

	--if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		--characterPlayAnim('boyfriend','idle',true)
	--end
end

stepHitFuncs = {
	
	[10] = function() --testing space
		
	end,

	[128] = function() --testing space
		removeLuaSprite('hide'); 
		cameraFlash('other', 'FFFFFF', 1, false)
		fadeStrums(1,2,true,false)
	end,

	[637] = function()  -- removes the tunnel transition 

		addLuaSprite('wall', true);
		runTimer('goneWall', 3, 1);
		
	end,

	[669] = function() --enables the followCam

		followchars = true;
		yy2 = 660;
		
	end,

	[1728] = function() -- tunnel enterance, fight prep

		if not lowQuality then
			doTweenX('tunnelMove', 'tunnel', -520, 1, 'smootherStepIn')
			doTweenX('tunnelLightsMove', 'tunnelLights', -650, 1, 'smootherStepIn')
			doTweenColor('bfColorTween', 'boyfriend', 'A08585', 1, 'smootherStepIn')
			doTweenColor('dark', 'train', 'A08585', 1, 'smootherStepIn')
		end
		
	end,

	[1760] = function() --fightScene P1

		doTweenAlpha('cya', 'camHUD', 0, 1, 'smootherStepOut')
		if lowQuality then
			cameraFlash('camGame', 'FFFFFF', 1, false)
			triggerEvent('Change Character', 0, 'jazzWait');
			
		end

		if not lowQuality then
			playSound('fightNew', 1);
			followchars = false;

			addAnimationByPrefix('movie', 'popcorn', 'intoMovie',24,false)
			objectPlayAnimation('movie', 'popcorn',true)
			setObjectCamera('movie', 'other')

			doTweenZoom('begin', 'camGame', '1.2', 0.5, 'circInOut')

			addLuaSprite('fight1', false);
		end
		
	end,

	[1825] = function() -- backHand appears
		if not lowQuality then
			setObjectOrder('fightHand2',  1)
			addLuaSprite('fightHand2', false);
			runTimer('goneHand2', 2.5, 1)
		end

		if lowQuality then
			triggerEvent('Play Animation', 'idle-alt', 'BF')
			lines = getRandomInt(1, 1, true)
			randomLinesFuncs[lines]();
			words = getRandomInt(1, 3, true)
			wordsFuncs[words]();
			addLuaText('talk2')
			screenCenter('talk2', 'x')
		end
	end,

	[1853] = function() -- P1 removed, P2 starts

		if not lowQuality then
			makeAnimatedLuaSprite('fight2', 'nightmare/fighting/P2', 350,100)
			addAnimationByPrefix('fight2', 'parttwo', 'PART2 FIGHT',24,false)
			objectPlayAnimation('fight2', 'partwo',false)
			setScrollFactor('fight2', 0.9, 0.9);
			scaleObject('fight2', '0.8','0.8');
			addLuaSprite('fight2', false);
			setObjectOrder('fight2',  5)
		
			setProperty('train.x', 300)
			removeLuaSprite('fight1', true);
		end

		
	end,
	
	[1894] = function() 
	
		if lowQuality then
			removeLuaText('talk2')
			lines = getRandomInt(2, 2, true)
			randomLinesFuncs[lines]();
			words = getRandomInt(1, 3, true)
			wordsFuncs[words]();
			addLuaText('talk3')
			screenCenter('talk3', 'x')
		end

		if not lowQuality then
			setProperty('train.x', 0)
			setProperty('train.y', 920)
		end
	end,
	[1904] = function() -- dramatic cam
		--setProperty('train.x', 0)
		--setProperty('train.y', 200)

		if not lowQuality then
			doTweenY('moveDown', 'train', 1500, 0.5, 'smootherStepIn')
			makeLuaSprite('train2', 'nightmare/train2', 200, 990);
			setScrollFactor('train2', 0.9, 0.9);
			scaleObject('train2', '1','1');
			addLuaSprite('train2', false);
			setObjectOrder('train2',  3)
			--doTweenY('moveUp', 'train', 790, 0.5, 'smootherStepIn')
		end


	end,

	[1920] = function() -- pov train
		if not lowQuality then
			setProperty('POV.alpha', 1) 
			doTweenY('moveUp', 'train', 790, 0.5, 'circIn')
			doTweenY('moveUp2', 'train2', 690, 0.3, 'circOut')
			runTimer('goneTrain', 0.95, 1);
		end

		
	end,

	
	[1931] = function() -- stabbed

		if not lowQuality then
			setProperty('POV.alpha', 0)
			cameraFlash('camGame', '990033', 3, false)
			setProperty('train.alpha', 1)
			doTweenZoom('begin', 'camGame', '1.5', 0.5, 'circInOut')
		end

		if lowQuality then
			removeLuaText('talk3')
			triggerEvent('Play Animation', 'trick1', 'BF')
			--lines = getRandomInt(1, 1, true)
			--randomLinesFuncs[lines]();
			--words = getRandomInt(1, 3, true)
			--wordsFuncs[words]();
			--addLuaText('talk3')
			--screenCenter('talk3', 'x')
		end
	end,

	

	[1970] = function() -- P2 removed, crush starts
		
		if not lowQuality then
			makeAnimatedLuaSprite('fight3', 'nightmare/fighting/CRUSH', 1050,160)
			addAnimationByPrefix('fight3', 'partthree', 'CRUSHED',24,false)
			objectPlayAnimation('fight3', 'partthree',false)
			setScrollFactor('fight3', 0.9, 0.9);
			scaleObject('fight3', '0.8','0.8');
			addLuaSprite('fight3', false);
		
			removeLuaSprite('POV', true);
			removeLuaSprite('fight2', true);
		end
		
		if lowQuality then
			triggerEvent('Play Animation', 'trick2', 'BF')
			runTimer('goodbyeFriend', 3.5, 1)
		end
	end,
	

	[2016] = function() -- fades out
		if not lowQuality then
			doTweenAlpha('begone3', 'fight3', 0, 1, 'smootherStepOut');
			doTweenAlpha('begone4', 'train', 0, 1, 'smootherStepOut');
			doTweenAlpha('begoneTunnel', 'tunnel', 0, 1, 'smootherStepOut');
			doTweenAlpha('begoneTunnelLights', 'tunnelLights', 0, 1, 'smootherStepOut');
			removeLuaSprite('light', true);
			doTweenAlpha('BRUG', 'movie', 0, 1, 'smootherStepIn')
		end

		if lowQuality then
			removeLuaSprite('train', true);
			removeLuaSprite('sky', true);
		end
		
		doTweenAlpha('begone2', 'camGame', 0, 1, 'smootherStepOut');
		
	end,

	[2026] = function() -- spawn next scene, fades in
		
		setObjectOrder('dadGroup',  0)
		setObjectOrder('boyfriendGroup',  3)

		makeLuaSprite('wall', 'nightmare/secondPhase/trainWall', -500, -110);
		setScrollFactor('wall', 0.9, 0.9);
		scaleObject('wall', '1','1');
		setObjectOrder('wall',  1)

		makeLuaSprite('hand', 'nightmare/secondPhase/bigassHand', 300, 0);
		setScrollFactor('hand', 0.9, 0.9);
		scaleObject('hand', '1','1');
		setObjectOrder('hand',  2)

		makeLuaSprite('seat', 'nightmare/secondPhase/trainSeats', -500, -110);
		setScrollFactor('seat', 0.9, 0.9);
		scaleObject('seat', '1','1');

		makeLuaSprite('cup', 'nightmare/secondPhase/cuplol',-500, -110);
		setScrollFactor('cup', 0.9, 0.9);
		scaleObject('cup', '1','1');

		addLuaSprite('wall', false);
		addLuaSprite('hand', false);
		addLuaSprite('seat', true);
		addLuaSprite('cup', true);
		

		if not lowQuality then
			makeLuaSprite('light', 'nightmare/daLights', -900, -200);
			setScrollFactor('light', 0.9, 0.9);
			addLuaSprite('light', true);
			scaleObject('light', '1.6','1');
		end

		
		doTweenAlpha('cya', 'camHUD', 1, 3, 'smootherStepOut');

		triggerEvent('Change Character', 'BF', 'jazzHurt') 
		triggerEvent('Change Character', 'Dad', 'atrocityP2') 

	
		followchars = true;
		xx = 230;
		yy = 340;
		xx2 = 450;
		yy2 = 460;
		ofs = 35;
		
		doTweenAlpha('begone2', 'camGame', 1, 3, 'smootherStepOut');
		
	end,

	[2816] = function() -- fades out

		doTweenAlpha('disappear', 'camGame', 0, 1, 'smootherStepOut');
		doTweenAlpha('disappear2', 'camHUD', 0, 1, 'smootherStepOut');
		
	end,

	[2848] = function() -- weakAss Jumpscare
		setProperty('camGame.alpha', 1)
		makeAnimatedLuaSprite('yikes', 'nightmare/jumpScare/jumpScare', -350,-250)
		addAnimationByPrefix('yikes', 'jump', 'scareLOL',24,false)
		objectPlayAnimation('yikes', 'jump',false)
		setScrollFactor('yikes', 0.9, 0.9);
		scaleObject('yikes', '1','1');
		addLuaSprite('yikes', false);
		runTimer('byebitch', 2.5, 1);
		followchars = false;
		runTimer('ohshit', 0.05, 40)
	end,

	[2880] = function() -- jasmineWoke

		cameraFlash('camGame', 'FFFFFF', 1, false)

		makeLuaSprite('thingy', 'nightmare/jumpScare/bg', -480, -200);
		setScrollFactor('thingy', 0.9, 0.9);
		scaleObject('thingy', '1.2','1.2');
		addLuaSprite('thingy', false);

		makeAnimatedLuaSprite('holy', 'nightmare/jumpScare/woke2', -380,0)
		addAnimationByPrefix('holy', 'damn', 'wake up',24,false)
		objectPlayAnimation('holy', 'damn',false)
		setScrollFactor('holy', 0.9, 0.9);
		scaleObject('holy', '1.2','1.2');
		addLuaSprite('holy', true);
		
	
	end,

	[2906] = function() -- fades out
		cameraFade('camGame', '000000', 2, false)
		
	end,
	
}

randomLinesFuncs = { --random words of encourgement
	[1] = function()
		wordsFuncs = {
			[1] = function()
				setTextString('talk2', 'Lets chill out together until we get to the next part. Might be a bit.')
				addLuaText('talk2')
			end,
			[2] = function()
				setTextString('talk2', 'Hey! I know it sucks being in low quality mode, but you gotta make sacrifices.')
				addLuaText('talk2')
			end,
			[3] = function()
				setTextString('talk2', 'Are you good at talking to girls? Lets test that as we wait. Hi, my name is Jasmine.')
				addLuaText('talk2')
			end,
		}
	end,
	
	[2] = function()
		wordsFuncs = {
			[1] = function()
				setTextString('talk3', 'Did you know I sing? I am gonna travel to Florida for my next tour.')
				addLuaText('talk3')
			end,
			[2] = function()
				setTextString('talk3', 'Ya know. I feel like we hate things for no reason sometimes. Do you feel the same?')
				addLuaText('talk3')
			end,
			[3] = function()
				setTextString('talk3', 'Wanna know how I broke my nail? No? I figured, haha.')
				addLuaText('talk3')
			end,
		}
	end,
	[3] = function()
		wordsFuncs = {
			[1] = function()
				setTextString('talk4', 'Well it was nice chatting with you. Remember keep your head up!')
				addLuaText('talk4')
			end,
			[2] = function()
				setTextString('talk4', 'Aw shit! Its about time to get back into it. Cya later, okay?')
				addLuaText('talk4')
			end,
			[3] = function()
				setTextString('talk4', 'Noooo not soo soonn! Alright, my ass has to get outta here! Goodbye player!')
				addLuaText('talk4')
			end,
		}
	end,

		
}

function windowShake(time)

    	windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    	windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
    	setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-6,6))

    	setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-6,6))
	
 end

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'goneWall' then
		removeLuaSprite('wall');
	end

	if tag == 'goneHand2' then
		removeLuaSprite('fightHand2');
	end
	
	if tag == 'goneTrain' then
		removeLuaSprite('train2'); 
	end

	if tag == 'byebitch' then
		removeLuaSprite('yikes'); 
	end

	if tag == 'ohshit' then
		windowShake()
	end
	if tag == 'goodbyeFriend' then
		doTweenAlpha('lowJazz', 'boyfriend', 0, 0.5, 'smootherStepOut');
	end
		
end



function onGameOverStart()

	
	setProperty(camX, 300); 
	setProperty(camY, 100);
	cameraFlash('other', '990033', 1, false)
	setProperty('healthShit.alpha', 0)
	screenCenter('boyfriend', '')
	addLuaSprite('blood', false);
	
	return Function_Continue;
end

function onGameOverConfirm(retry)
	addLuaSprite('gameOverScreen', false);
	addLuaSprite('gameOverLaugh', false);
	cameraFlash('camHUD', 'FFFFFF', 1, false)
	setProperty('blood.alpha', 0)
	
	
	doTweenColor('fakeFadeJazz', 'boyfriend', '000000', 2, 'smootherStepIn')
	doTweenColor('fakeFadeBG', 'gameOverScreen', '000000', 2, 'smootherStepIn')
	doTweenColor('fakeFade', 'gameOverLaugh', '000000', 2, 'smootherStepIn')
	-- Called when you Press Enter/Esc on Game Over
	-- If you've pressed Esc, value "retry" will be false
end
function onTweenCompleted(tag, loops, loopsLeft)
	
	if tag == 'begone3' then
		removeLuaSprite('fight3'); 
	end

	if tag == 'begone4' then
		removeLuaSprite('train'); 
	end

	if tag == 'moveDown' then
		setProperty('train.alpha', 0)
	end

	if tag == 'tunnelMove' then
		removeLuaSprite('sky');
		removeLuaSprite('building4');
		removeLuaSprite('building3');
		removeLuaSprite('building2');
		removeLuaSprite('building1');
	end

	if tag == 'begoneTunnel' then
		removeLuaSprite('tunnel');
	end

	if tag == 'begoneTunnelLights' then
		removeLuaSprite('tunnelLights');

	end

	if tag == 'disappear' then
		removeLuaSprite('wall', true); 
		removeLuaSprite('seat', true); 
		removeLuaSprite('cup', true); 
		removeLuaSprite('hand', true); 
		removeLuaSprite('light', true); 
	end

	if tag == 'BRUG' then
		removeLuaSprite('movie', true); 
	end


end



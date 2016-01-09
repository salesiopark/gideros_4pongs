scnIngame = Core.class(Sprite)

local bar1 = Bar.new(1)
local bar2 = Bar.new(2)
local bar3 = Bar.new(3)
local bar4 = Bar.new(4)

local ball0 = Ball.new()

local tchBeginX

local function controlReset(event)
	tchBeginX = nil
end


local function controlMove(event)
	if tchBeginX == nil then
		tchBeginX = event.touch.x
		return
	end

	local dx = event.touch.x - tchBeginX
	print(dx)

	bar1:update(dx)
	bar2:update(dx)
	bar3:update(dx)
	bar4:update(dx)
	
	tchBeginX = event.touch.x
end

local margin = 50

local function update()
	bar1x, bar1y = bar1:getPosition()
	bar2x, bar2y = bar2:getPosition()
	bar3x, bar3y = bar3:getPosition()
	bar4x, bar4y = bar4:getPosition()

	bx, by = ball0:getPosition()

	if bar1x-margin < bx and bx < bar1x+margin and by+35 > bar1y then
		ball0.dy = -1
	end

	if bar2x-margin < bx and bx < bar2x+margin and by-35 < bar2y then
		ball0.dy = 1
	end

	if bar3y-margin < by and by < bar3y+margin and bx-35 < bar3x then
		ball0.dx = 1
	end

	if bar4y-margin < by and by < bar4y+margin and bx+35 > bar4x then
		ball0.dx = -1
	end

	ball0:update()
end

function scnIngame:init()
	print('scn_ingame')
	local score = TextField.new(nil, '000')
	score:setPosition(100,100)
	score:setScale(10)
	self:addChild(score)
	
	self:addChild(bar1)
	self:addChild(bar2)
	self:addChild(bar3)
	self:addChild(bar4)
	
	self:addChild(ball0)
	self:addEventListener(Event.ENTER_FRAME, update)
	
	--stage:addEventListener(Event.TOUCHES_BEGIN, controlBegin)
	stage:addEventListener(Event.TOUCHES_MOVE, controlMove)
	stage:addEventListener(Event.TOUCHES_END, controlReset)
	stage:addEventListener(Event.TOUCHES_CANCEL, controlReset)
	
end

function scnIngame:onTransitionOutEnd()
	
end

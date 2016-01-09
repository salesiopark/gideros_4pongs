Ball = Core.class(Sprite)

local ttBall = Texture.new('img/ball.png',true)

function Ball:init()
	local bmp = Bitmap.new(ttBall)
	self.speed = 3
	self.dx = 1
	self.dy = 1
	
	self:addChild(bmp)
	local w, h = self:getWidth(), self:getHeight()
	self:setAnchorPosition(w/2, h/2)
	self:setPosition(200,600)
end

function Ball:update()
	x, y = self:getPosition()
	self:setPosition(x + self.dx*self.speed, y + self.dy*self.speed)
end


	

Bar = Core.class(Sprite)

local ttBarH = Texture.new('img/bar.png',true)
local ttBarV = Texture.new('img/vbar.png',true)

local minX, maxX = 45, 595
local minY, maxY = 200, 950 --300, 850

local centerX = (minX + maxX)/2
local centerY = (minY + maxY)/2

local dyScale = (maxY - minY)/(maxX - minX)

local barInfo = {
	{x = centerX, y = maxY, tt=ttBarH},
	{x = centerX, y = minY, tt=ttBarH},
	{x = minX, y = centerY, tt=ttBarV},
	{x = maxX, y = centerY, tt=ttBarV},
}	

function Bar:init(id)
	self.id = id
	local bmp = Bitmap.new(barInfo[id].tt)
	self:addChild(bmp)

	local w, h = self:getWidth(), self:getHeight()
	self:setAnchorPosition(w/2, h/2)
	self:setPosition(barInfo[id].x, barInfo[id].y)
end

local vect = {
	{dx = 1, dy = 0,},
	{dx = -1, dy = 0},
	{dx = 0, dy = -dyScale},
	{dx = 0, dy = dyScale},
}

local offset = 40

function Bar:update(dist)
	x, y = self:getPosition()
	newX = x + dist*vect[self.id].dx
	newY = y + dist*vect[self.id].dy
	
	if self.id == 1 or self.id == 2 then
		if newX < minX+offset then newX = minX+offset end
		if newX > maxX-offset then newX = maxX-offset end
	else
		if newY < minY+offset then newY = minY+offset end
		if newY > maxY-offset then newY = maxY-offset end
	end
	
	self:setPosition(newX, newY)
end
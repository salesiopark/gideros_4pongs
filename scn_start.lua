scnStart = Core.class(Sprite)

function gotoIngame()
	sm:changeScene('ingame', 0.5, SceneManager.fade)
end

function scnStart:init()
	print('scn_start')
	local title = TextField.new(nil, 'PongPong')
	title:setPosition(100,100)
	title:setScale(10)
	self:addChild(title)

	--stage:addEventListener(Event.MOUSE_DOWN, gotoIngame)
	stage:addEventListener(Event.TOUCHES_BEGIN, gotoIngame)

	--self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	--self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function scnStart:onTransitionOutBegin()
	print('scnStart out begin')
	--stage:removeEventListener(Event.MOUSE_DOWN, gotoIngame)
	stage:removeEventListener(Event.TOUCHES_BEGIN, gotoIngame)
end

function scnStart:onTransitionOutEnd()
	print('scnStart out end')
end


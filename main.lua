sm = SceneManager.new({
	['start'] = scnStart,
	['ingame'] = scnIngame,
})

stage:addChild(sm)
sm:changeScene('start', 1, SceneManager.fade)
	
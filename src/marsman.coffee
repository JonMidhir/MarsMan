class GameWorld
	constructor: (@canvas) ->
		@then = null
		@factories = []
		@oxygen = 0
		
	render: () ->
		
	update: (modifier) ->
		
	main: () ->
		now = Date.now()
		delta = now - @then
		
		@update(1000) #Shd be delta / 1000
		
		@render()
		@then = now
		true
	
	run: () ->
		@then = Date.now()
		callback = @main.bind(@)
		setInterval(callback, 1)
		
	add: (object) ->
		@canvas.ctx.fillStyle = object.color
		@canvas.ctx.fillRect object.x, object.y, object.width, object.height
		@factories.push object #shouldn't do this really, doesn't know object is a factory
		

class Factory
	constructor: (@x,@y) ->
		@height = 10
		@width = 10
		@color = '#00f'
		@oxygen = 10 #oxygen generated per second
		

$(document).ready ->
	canvas = {
		div: $('#canvas')
		height: $('#canvas').height()
		width: $('#canvas').width()
		ctx: $('#canvas').get(0).getContext("2d");
	}
	
	gameWorld = new GameWorld(canvas)
	gameWorld.run()
	
	canvas.div.live 'click', (e) ->
		factory = new Factory(e.pageX, e.pageY)
		gameWorld.add(factory)
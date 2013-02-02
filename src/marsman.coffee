class GameWorld
	constructor: (@canvas) ->
		@then = null
		@mounds = []
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
		@canvas.div.prepend(object.world_reference)
		object.world_reference.box2d(object.physics)

$(document).ready ->
	canvas = {
		div: $('#world')
		height: $('#world').height()
		width: $('#world').width()
	}
	
	gameWorld = new GameWorld(canvas)
	gameWorld.run()
	
	canvas.div.live 'click', (e) ->
		mound = new Mound(e.pageX, e.pageY)
		gameWorld.add(mound)
		
	buggy = new Buggy()
	gameWorld.add(buggy)
	
	$('body').keypress ->
		console.log ">"
  
	$("#floor").box2d({'x-velocity': -10, 'y-velocity': 10, 'static': true})
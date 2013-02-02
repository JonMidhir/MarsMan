class Mound
	constructor: (@x,@y) ->
		@height = 10
		@width = 10
		@color = '#f00'
		@oxygen = 10 #oxygen generated per second
		@world_reference = @world_constructor()
		@physics = {'y-velocity': 100}
		
	world_constructor: () -> $('<div class="mound"></div>')
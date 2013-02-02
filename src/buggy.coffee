class Buggy
	constructor: () ->
		@color = '#00f'
		@world_reference = @world_constructor()
		@physics = {'y-velocity': 10, 'density': 1000}
		
	world_constructor: () -> $('<div class="buggy"></div>')
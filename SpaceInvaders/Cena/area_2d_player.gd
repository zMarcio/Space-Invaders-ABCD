extends Area2D

@export var speed = 1800
var direction_x = Vector2.ZERO
var direction_y = Vector2.ZERO


func _process(delta):
	var input = Input.get_axis("move_left", 'move_right')
	var input_test = Input.get_axis("ui_up", "ui_down")
	if input < 0:
		direction_x = Vector2.LEFT
	elif input > 0 :
		direction_x = Vector2.RIGHT
	#elif input_test < 0:
		#direction_y = Vector2.UP 
	#elif input_test > 0:
		#direction_y = Vector2.DOWN 
	else: 
		direction_x = Vector2.ZERO
		direction_y = Vector2.ZERO
		
	var delta_movement_x = direction_x.x * speed * delta
	#var delta_movement_y = direction_y.y * speed * delta
	position.x += delta_movement_x
	#position.y += delta_movement_y
	

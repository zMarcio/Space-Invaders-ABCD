extends Area2D

@export var speed = 200
var direction_x = Vector2.ZERO
var direction_y = Vector2.ZERO

@onready 
var collistion_rect: CollisionShape2D = $CollisionShape2D

var bounding_size_x

var start_bound
var end_bound


func _ready():
	bounding_size_x = collistion_rect.shape.get_rect().size.x
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	#var camera_position = camera.position
	start_bound = (camera.position.x - rect.size.x) / 2
	end_bound = (camera.position.x + rect.size.x) / 2

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
		#direction_y = Vector2.ZERO
		
	var delta_movement_x = direction_x.x * speed * delta
	#var delta_movement_y = direction_y.y * speed * delta
	
	if(position.x + delta_movement_x < start_bound + bounding_size_x * transform.get_scale().x
	 || position.x + delta_movement_x > end_bound - bounding_size_x * transform.get_scale().x):
		return
	
	position.x += delta_movement_x
	
	#position.y += delta_movement_y
	

extends CanvasLayer
@onready var texture_rect_1 = %TextureRect_1
@onready var label_1 = %Label_1

@onready var texture_rect_2 = %TextureRect_2
@onready var label_2 = %Label_2

@onready var texture_rect_3 = %TextureRect_3
@onready var label_3 = %Label_3

@onready var timer = $Timer

@onready var button = %Button


var control_array = []

func _ready():
	control_array = [texture_rect_1,label_1,texture_rect_2,label_2,texture_rect_3,label_3,button]
	for control in control_array:
		(control as Control).visible = false


func _on_timer_timeout():
	var control = control_array.pop_front() as Control
	if control != null:
		control.visible = true
	else:
		timer.stop()
		timer.queue_free()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Cena/node_main.tscn")

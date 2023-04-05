extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gamepad_instance.z_index = 1
	gamepad_instance.position = gamepad_pos
	gamepad_instance.name = "gamepad"
	add_child(gamepad_instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

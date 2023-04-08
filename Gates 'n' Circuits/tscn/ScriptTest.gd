extends Node2D


var level = preload("res://data/levels/lv1.tscn")
var level_instance = level.instance()
var level_pos = Vector2(0,0)

var gamepad = preload("res://tscn/gamepad.tscn")
var gamepad_instance = gamepad.instance()
var gamepad_pos = Vector2(150,700)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gamepad_instance.z_index = 10
	gamepad_instance.position = gamepad_pos
	gamepad_instance.name = "gamepad"
	add_child(gamepad_instance)
	
	level_instance.position = level_pos
	level_instance.z_index = 0
	add_child(level_instance)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

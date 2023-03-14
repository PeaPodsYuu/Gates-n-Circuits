extends Node2D

var player = preload("res://data/player/Player.tscn")
var player_instance = player.instance()
var spawn_pos = Vector2(128,128)

var level = preload("res://tscn/lv1.tscn")
var level_instance = level.instance()
var level_pos = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player_instance.position = spawn_pos
	player_instance.name = "player_instance"
	player_instance.z_index = 1
	add_child(player_instance,true)
	
	level_instance.position = level_pos
	level_instance.z_index = 0
	add_child(level_instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

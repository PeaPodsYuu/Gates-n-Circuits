extends "res://tscn/lvl_base.gd"

var player = preload("res://data/player/Player.tscn")
var player_instance = player.instance()
var spawn_pos = Vector2(128,128)*6
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# 1-24 x 1-13

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_player()
	
	#for the and
	add_button(Vector2(3,2),Vector2(0,0))
	add_button(Vector2(5,2),Vector2(0,0))
	
	add_cable_vert(Vector2(3,3))
	add_cable_bend(Vector2(3,4),-PI/2)
	add_cable_vert_scaled(Vector2(3.5,4.25),-0.25)
	
	add_cable_bend(Vector2(5,3),PI)
	add_cable_bend(Vector2(4,3),0)
	add_cable_vert(Vector2(4,4))
	
	add_and_gate(Vector2(3.75,4.5),PI,Vector2.ZERO)
	add_cable_vert_scaled(Vector2(3.75,7),1.5)
	
	#--------------------------------
	
	add_cable_vert_scaled(Vector2(5,3.25),-0.25)
	add_cable_vert(Vector2(5,4))
	add_cable_vert(Vector2(5,5))
	add_cable_vert(Vector2(5,6))
	add_cable_bend(Vector2(5,7),-PI/2)
	 
	add_button(Vector2(7,2),Vector2(0,0))
	add_button(Vector2(9,2),Vector2(0,0))
	
	
	add_button(Vector2(11,2),Vector2(0,0))
	pass # Replace with function body.

func spawn_player():
	player_instance.position = spawn_pos
	player_instance.name = "player_instance"
	player_instance.z_index = 1
	get_node("/root/Game/LevelCreator").add_child(player_instance,true)

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
	
	add_button(Vector2(1,1),0)
	add_cable_vert_scaled(Vector2(1,1.625),-0.75)
	add_cable_bend(Vector2(1,2.25),-PI/2)
	add_cable_hor(Vector2(2,2.25))
	
	
	add_button(Vector2(2,1),0)
	add_cable_bend(Vector2(2,2),-PI/2)
	
	add_cable_hor_scaled(Vector2(2.625,2),-0.625)
	add_cable_hor_scaled(Vector2(2.625,2.25),-0.625)
	add_and_gate(Vector2(3,2),PI/2,Vector2.ZERO)
	
	add_cable_vert_scaled(Vector2(1,2.5),-0.5)
	add_cable_bend(Vector2(1,3),-PI/2)
	add_cable_hor_scaled(Vector2(2.5,3),1)
	add_cable_bend(Vector2(3.5,2.25),0)
	add_cable_vert_scaled(Vector2(3.5,2.875),-0.75)
	
	add_cable_hor_scaled(Vector2(3.625,2),-0.625)
	add_xor_gate(Vector2(4,2),PI/2,Vector2.ZERO)
	
	add_cable_hor(Vector2(3,1))
	add_not_gate(Vector2(3.5,1),PI/2,Vector2.ZERO)
	add_cable_hor_scaled(Vector2(4.25,1),-0.5)
	
	
	pass # Replace with function body.

func spawn_player():
	player_instance.position = spawn_pos
	player_instance.name = "player_instance"
	player_instance.z_index = 1
	get_node("/root/Game/LevelCreator").add_child(player_instance,true)

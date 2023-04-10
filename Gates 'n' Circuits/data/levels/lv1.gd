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
	
	add_button(Vector2(1,1),Vector2.ZERO)
	add_cable_vert_scaled(Vector2(1,1.625),-0.75)
	add_cable_bend(Vector2(1,2.25),-PI/2)
	add_cable_hor(Vector2(2,2.25))
	
	
	add_button(Vector2(2,1),Vector2.ZERO)
	add_cable_bend(Vector2(2,2),-PI/2)
	
	add_cable_hor_scaled(Vector2(2.625,2),-0.625)
	add_cable_hor_scaled(Vector2(2.625,2.25),-0.625)
	add_and_gate(Vector2(3,2),PI/2,Vector2.ZERO)
	
	add_cable_vert_scaled(Vector2(1,2.5),-0.5)
	add_cable_bend(Vector2(1,3),-PI/2)
	add_cable_hor_scaled(Vector2(2.5,3),1)
	add_cable_vert_scaled(Vector2(3.5,2.625),-0.25)
	add_cable_hor_scaled(Vector2(3.75,2.25),-0.5)
	
	add_cable_hor_scaled(Vector2(3.625,2),-0.625)
	add_xor_gate(Vector2(4,2),PI/2,Vector2.ZERO)
	
	add_cable_hor(Vector2(3,1))
	add_not_gate(Vector2(3.5,1),PI/2,Vector2.ZERO)
	add_cable_hor_scaled(Vector2(4.25,1),-0.5)
	
	add_button(Vector2(1,4),Vector2.ZERO)
	add_cable_hor(Vector2(2,4))
	
	add_button(Vector2(1,5),Vector2.ZERO)
	add_cable_hor(Vector2(2,5))
	
	add_cable_vert_scaled(Vector2(2.5,4.190),-0.625)
	add_cable_hor_scaled(Vector2(2.75,4.385),-0.5)
	add_cable_vert_scaled(Vector2(2.5,4.790),-0.625)
	add_cable_hor_scaled(Vector2(2.75,4.625),-0.5)
	add_or_gate(Vector2(3,4.5),PI/2,Vector2.ZERO)
	
	add_cable_hor_scaled(Vector2(3.625,4.5),-0.5)
	add_not_gate(Vector2(4,4.5),PI/2,Vector2.ZERO)
	
	add_button(Vector2(10,4),Vector2.ZERO)
	add_cable_hor_scaled(Vector2(9.25,4),-0.5)
	add_not_gate(Vector2(9,4),-PI/2,Vector2.ZERO)
	
	add_button(Vector2(10,5),Vector2.ZERO)
	add_cable_hor_scaled(Vector2(9.25,5),-0.5)
	add_not_gate(Vector2(9,5),-PI/2,Vector2.ZERO)
	add_cable_bend(Vector2(5,4.5),PI)
	add_cable_bend(Vector2(5,3.5),0)
	add_cable_vert_scaled(Vector2(5.5,3.25),-0.5)
	
	add_cable_hor_scaled(Vector2(8.5,4),-0.75)
	add_cable_hor_scaled(Vector2(8.5,5),-0.75)
	add_and_gate(Vector2(8,4.5),-PI/2,Vector2(1,1))
	add_cable_hor_scaled(Vector2(6.75,4.5),-0.5)
	add_cable_bend(Vector2(6,4.5),-PI/2)
	add_cable_vert(Vector2(6,3.5))
	
	add_cable_hor_scaled(Vector2(5.5,1),1)
	
	add_cable_hor_scaled(Vector2(5.5,2),1)
	
	add_cable_hor_scaled(Vector2(5.8,2.25),0.65)
	
	add_cable_hor(Vector2(4,3))
	add_cable_hor_scaled(Vector2(4.75,3),-0.5)
	add_cable_vert_scaled(Vector2(5,2.63),-0.2)
	
	add_cable_vert_scaled(Vector2(5.5,2.75),-0.5)
	add_cable_hor(Vector2(6,2.5))
	
	add_cable_hor_scaled(Vector2(6.25,3),-0.5)
	add_and_gate(Vector2(7,2),PI/2,Vector2(2,2))
	
	
	pass # Replace with function body.

func spawn_player():
	player_instance.position = spawn_pos
	player_instance.name = "player_instance"
	player_instance.z_index = 1
	get_node("/root/Game/LevelCreator").add_child(player_instance,true)

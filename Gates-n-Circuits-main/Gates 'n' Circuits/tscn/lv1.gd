extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	arrange_items()
	pass # Replace with function body.

func base_settings(node,pos):
	node.scale = Vector2(0.5,0.5)
	node.position.x = pos.x*64
	node.position.y = pos.y*64

func add_cable_vert(pos):
	var cable = preload("res://data/objects/Cable.tscn").instance()
	base_settings(cable,pos)
	add_child(cable)

func add_cable_hor(pos):
	var cable = preload("res://data/objects/Cable.tscn").instance()
	cable.rotate(PI/2)
	base_settings(cable,pos)
	add_child(cable)
	
func add_cable_vert_scaled(pos,length):
	var cable = preload("res://data/objects/Cable.tscn").instance()
	base_settings(cable,pos)
	cable.scale += Vector2(0,length)
	add_child(cable)

func add_cable_hor_scaled(pos,length):
	var cable = preload("res://data/objects/Cable.tscn").instance()
	cable.rotate(PI/2)
	base_settings(cable,pos)
	cable.scale += Vector2(0,length)
	add_child(cable)

func add_cable_bend(pos,rot):
	var cable = preload("res://data/objects/bend.tscn").instance()
	base_settings(pos,rot)
	cable.rotate(rot)
	add_child(cable)

func add_button(pos):
	var button = preload("res://data/objects/button.tscn").instance()
	base_settings(button,pos)
	add_child(button)

func add_and_gate(pos,rot):
	var gate = preload("res://data/objects/AND.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	add_child(gate)

func add_or_gate(pos,rot):
	var gate = preload("res://data/objects/OR.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	add_child(gate)

func add_not_gate(pos,rot):
	var gate = preload("res://data/objects/NOT.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	add_child(gate)

func add_nand_gate(pos,rot):
	var gate = preload("res://data/objects/NAND.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	add_child(gate)

func add_nor_gate(pos,rot):
	var gate = preload("res://data/objects/NOR.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	add_child(gate)

func add_xor_gate(pos,rot):
	var gate = preload("res://data/objects/XOR.tscn").instance()
	base_settings(gate,pos)
	gate.scale.x = 2
	gate.rotate(rot)
	add_child(gate)



func arrange_items():
	add_button(Vector2(3,3))
	add_cable_hor(Vector2(4,3))
	add_cable_hor_scaled(Vector2(5,3),0.5)
	
	
	add_button(Vector2(3,4))
	add_cable_hor(Vector2(4,4))
	add_cable_hor_scaled(Vector2(5,4),0.5)
	
	add_xor_gate(Vector2(6,3.5),PI/2)
	add_cable_hor(Vector2(7,3.5))
	
	pass

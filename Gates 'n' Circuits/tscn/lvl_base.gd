extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func base_settings(node,pos):
	print(node)
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
	base_settings(cable,pos)
	cable.rotate(rot)
	add_child(cable)

func add_button(pos,size):
	var button = preload("res://data/objects/button.tscn").instance()
	base_settings(button,pos)
	button.scale += size
	add_child(button)

func add_and_gate(pos,rot,size):
	var gate = preload("res://data/objects/AND.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

func add_or_gate(pos,rot,size):
	var gate = preload("res://data/objects/OR.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

func add_not_gate(pos,rot,size):
	var gate = preload("res://data/objects/NOT.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

func add_nand_gate(pos,rot,size):
	var gate = preload("res://data/objects/NAND.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

func add_nor_gate(pos,rot,size):
	var gate = preload("res://data/objects/NOR.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

func add_xor_gate(pos,rot,size):
	var gate = preload("res://data/objects/XOR.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

func add_xnor_gate(pos,rot,size):
	var gate = preload("res://data/objects/XNOR.tscn").instance()
	base_settings(gate,pos)
	gate.rotate(rot)
	gate.scale += size
	add_child(gate)

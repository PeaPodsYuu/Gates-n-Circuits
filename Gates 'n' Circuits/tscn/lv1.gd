extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	arrange_items()
	pass # Replace with function body.

func add_cable_vert(pos):
	var cable = preload("res://data/objects/Cable.tscn").instance()
	cable.scale = Vector2(0.5,0.5)
	cable.position = pos
	add_child(cable)

func add_cable2_hor(pos):
	var cable = preload("res://data/objects/Cable.tscn").instance()
	cable.rotate(PI/2)
	cable.scale = Vector2(0.5,0.5)
	cable.position = pos
	add_child(cable)

func arrange_items():
	var button = preload("res://data/objects/button.tscn").instance()
	button.scale = Vector2(0.5,0.5)
	button.position = Vector2(128,128)*4
	button.name = "button"
	add_child(button)
	
	add_cable_vert(Vector2(128,128)*4 + Vector2(0,64))
	add_cable_vert(Vector2(128,128)*4 + Vector2(0,128))
	add_cable_vert(Vector2(128,128)*4 + Vector2(0,-64))
	add_cable2_hor(Vector2(128,128)*4 + Vector2(0,-64))

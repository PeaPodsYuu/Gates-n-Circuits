extends Area2D


signal power
signal off


var active = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	get_node("../../player_instance").connect("stomp",self,"stomp")

func stomp():
	for source in get_overlapping_areas():
		if source.name == "Stomp":
			if active == 0:
				active = 1
				emit_signal("power")
			else:
				active = 0
				emit_signal("off")

func _on_Node2D_area_entered(i):
	return(i)

extends Area2D


signal power
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	get_node("../../player_instance").connect("stomp",self,"stomp")

func stomp():
	if(get_overlapping_areas().size()>0):
		print("hi")
		emit_signal("power")



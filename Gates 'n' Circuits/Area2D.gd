extends Area2D
var active = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.modulate = Color(0,0,0)
	get_node("../button").connect("power",self,"power")
	pass # Replace with function body.

func power():
	if(get_overlapping_areas().size()>0):
		$AnimatedSprite.modulate = Color(1,1,1)
		active = 1

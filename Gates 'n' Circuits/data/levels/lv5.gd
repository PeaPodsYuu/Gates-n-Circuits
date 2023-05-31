extends "res://tscn/lvl_base.gd"

var spawn_pos = Vector2(128,128)*6
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# 1-24 x 1-13

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Okay, time for a real one! No more cute names for the buttons.\nThis one may seem daunting at first sight, but notice that\nyou only have to turn on one AND gate...\nEasy, right? Well, I want to show you that this is\na staple of logic! The circuit builds\n(A AND B) OR (B AND C AND D) OR (A AND D)\nWe call this a disjunction(OR) of conjuctions(ANDS) and the\nformula is in disjunctive normal form!"
	$A/Label.text = "A"
	$B/Label.text = "B"
	$C/Label.text = "C"
	$D/Label.text = "D"
	spawn_player()
	var win_check = Timer.new()
	win_check.set_one_shot(false)
	win_check.set_wait_time(0.05)
	win_check.connect("timeout",self,"_win_timer")
	add_child(win_check)
	win_check.start()
	
	
	pass # Replace with function body.

func spawn_player():
	$Player.position = spawn_pos
	$Player.z_index = 1

func _win_timer():
	if $FINALOR.active == 1:
		get_parent().win_level(5)

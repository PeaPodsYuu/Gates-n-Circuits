extends "res://tscn/lvl_base.gd"

var spawn_pos = Vector2(128,128)*1.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# 1-24 x 1-13

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text="Uh oh! This looks like the same level, but...\nDo you see the strange extra line on\nthe left side of that OR gate?!\nThat is an exclusive OR (XOR) gate!\nIt is similar to the OR gate, but makes more sense\nin our natural speach. It is exclusively OR!\nThat means all three cannot be active anymore."
	$JACK/Label.text="JACK"
	$JANE/Label.text="JANE"
	$JILL/Label.text="JILL"
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
	if $FINALAND.active == 1:
		get_parent().win_level(3)

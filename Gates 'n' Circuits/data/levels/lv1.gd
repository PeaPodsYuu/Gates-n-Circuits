extends "res://tscn/lvl_base.gd"

var spawn_pos = Vector2(128,128)*6
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# 1-24 x 1-13

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text="^ Press to Win!\n\nThis is a \ntutorial level!\n\nAND: All inputs must \nbe true to activate.\n\nOR: Any input must be true to \nactivate (one or more!)\n\nNOT: Will output the \nopposite of the input."
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
	if($WINBUTTON.active == 1):
		get_parent().win_level(1)

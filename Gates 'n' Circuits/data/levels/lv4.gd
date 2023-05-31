extends "res://tscn/lvl_base.gd"

var spawn_pos = Vector2(128,128)*6
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# 1-24 x 1-13

# Called when the node enters the scene tree for the first time.
func _ready():
	$JACK.active = 1
	$Label.text="What do you think about this?\nJill AND Jane are best friends. They want to \nbe together!\nJack is pushy and wants to be friends too, \nbut the girls don't want to.\nJack should NOT be friends with Jane and Jill.\nCan you solve their connundrum?"
	$Label2.text="But there's a\nnew,scary\ngate! Don't\nworry, that's\njust NAND\n(not and).\nIt simply acts\nlike an AND\ngate followed\nby a NOT!"
	$JACK/Label.text="Jack"
	$JILL/Label.text="Jill"
	$JANE/Label.text="Jane"
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
		get_parent().win_level(4)

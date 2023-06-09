extends Node2D


var level_save = 0


var gamepad = preload("res://tscn/gamepad.tscn")
var gamepad_instance = gamepad.instance()
var gamepad_pos = Vector2(150,700)

var win_popup_scene = preload("res://data/misc/win_popup.tscn")
var win_popup = win_popup_scene.instance()

var level_instance
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_save()
	add_child(win_popup)
	win_popup.connect("win_confirm",self,"win_popup")
	win_popup.z_index = 20
	win_popup.position = Vector2(500,200)
	win_popup.hide()
	pass # Replace with function body.

func load_level(n):
	print(n)
	var level = load("res://data/levels/lv" + String(n) + ".tscn")
	level_instance = level.instance()
	var level_pos = Vector2(0,0)

	gamepad_instance.z_index = 10
	gamepad_instance.position = gamepad_pos
	gamepad_instance.name = "gamepad"
	add_child(gamepad_instance)
	
	level_instance.position = level_pos
	level_instance.z_index = 0
	add_child(level_instance)
	
	win_popup.hide()
	

func win_level(n):
	win_popup.show()
	level_save = max(level_save,n)
	var save_file = File.new()
	save_file.open("res://data/savegame.save",File.WRITE)
	var to_save = {"level_save" : level_save}
	save_file.store_line(to_json(to_save))
	save_file.close()
	
	

func win_popup():
	level_instance.queue_free()
	win_popup.hide()
	gamepad_instance.hide()
	get_parent().get_node("Level_Select").show()
	get_parent().get_node("Level_Select").update_allowance()

func load_save():
	var load_file = File.new()
	load_file.open("res://data/savegame.save",File.READ)
	var to_load = parse_json(load_file.get_line())
	level_save = to_load["level_save"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

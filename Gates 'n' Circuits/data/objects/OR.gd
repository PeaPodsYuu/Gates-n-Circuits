extends Area2D
var active = 0
var sources = []

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	
	var timer = Timer.new()
	timer.set_wait_time(0.1)
	timer.set_one_shot(false)
	timer.connect("timeout",self,"update")
	add_child(timer)
	timer.start()
	
	get_coll()
	
	$AnimatedSprite.modulate = Color(0,0,0)
	for source in sources:
		source.connect("power",self,"power")
		source.connect("off",self,"off")
	pass # Replace with function body.

func get_coll():
	for source in $Rx.get_overlapping_areas():
		if "button" in source.get_filename():
			sources.append(source)

func power():
	var ok = 0
	for source in $Rx.get_overlapping_areas():
		if ("active" in source):
			if(source.active == 1):
				ok = 1
	if ok == 1:
		$AnimatedSprite.modulate = Color(1,1,1)
		active = 1

func off():
	var ok = 1
	for source in $Rx.get_overlapping_areas():
		if ("active" in source):
			if(source.active == 1):
				ok = 0
	if ok == 1:
		$AnimatedSprite.modulate = Color(0,0,0)
		active = 0

func update():
	power()
	yield(get_tree().create_timer(0.1), "timeout")
	off()
	yield(get_tree().create_timer(0.1), "timeout")


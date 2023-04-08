extends KinematicBody2D

var speed = 15000
var velocity = Vector2.ZERO
onready var source = get_node("../gamepad")

signal stomp

func _ready():
	source.connect("move_with_pad",self,"move_with_pad")
	source.connect("Stomp",self,"stomp_pad")
	$Stomp.name = "Stomp"
	pass
	
func _process(delta):
	var sprite = $AnimatedSprite
	
	if Input.is_action_pressed("up"):
		velocity.y = -1
	if Input.is_action_pressed("down"):
		velocity.y = 1
	if Input.is_action_pressed("left"):
		velocity.x = -1
	if Input.is_action_pressed("right"):
		velocity.x = 1
	if Input.is_action_just_pressed("stomp"):
		emit_signal("stomp")
	
	if velocity == Vector2(1,0):
		sprite.play("right_walk")
	if velocity == Vector2(-1,0):
		sprite.play("left_walk")
	if velocity == Vector2(0,1):
		sprite.play("front_walk")
	if velocity == Vector2(0,-1):
		sprite.play("back_walk")
	
	if velocity.length() > 0:
		velocity = velocity * speed
	else:
		if sprite.animation == "front_walk":
			sprite.play("front_default")
		if sprite.animation == "back_walk":
			sprite.play("back_default")
		if sprite.animation == "left_walk":
			sprite.play("left_default")
		if sprite.animation == "right_walk":
			sprite.play("right_default")
	
	move_and_slide(velocity*delta)
	velocity = Vector2.ZERO

func move_with_pad(dir):
	velocity = dir
	pass

func stomp_pad():
	emit_signal("stomp")

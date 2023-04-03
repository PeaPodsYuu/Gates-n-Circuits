extends KinematicBody2D

var speed = 200

signal stomp

func _ready():
	$Stomp.name = "Stomp"
	pass
	
func _process(delta):
	var velocity = Vector2.ZERO
	var sprite = $AnimatedSprite
	
	
	if Input.is_action_pressed("up"):
		velocity.y = -1
		sprite.play("back_walk")
	if Input.is_action_pressed("down"):
		velocity.y = 1
		sprite.play("front_walk")
	if Input.is_action_pressed("left"):
		velocity.x = -1
		if velocity.y == 0:
			sprite.play("left_walk")
	if Input.is_action_pressed("right"):
		velocity.x = 1
		if velocity.y == 0:
			sprite.play("right_walk")
	if Input.is_action_just_pressed("stomp"):
		emit_signal("stomp")
	
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
	
	move_and_collide(velocity*delta)

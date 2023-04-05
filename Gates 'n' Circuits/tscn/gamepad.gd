extends Node2D
signal move_with_pad(direction)
signal Stomp

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.modulate.a = 0.5
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(_delta):
	if $R.pressed:
		emit_signal("move_with_pad",Vector2(1,0))
	if $L.pressed:
		emit_signal("move_with_pad",Vector2(-1,0))
	if $U.pressed:
		emit_signal("move_with_pad",Vector2(0,-1))
	if $D.pressed:
		emit_signal("move_with_pad",Vector2(0,1))


func _on_Stomp_button_down():
	emit_signal("Stomp")

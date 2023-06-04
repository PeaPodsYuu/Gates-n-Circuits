extends Node2D
signal win_confirm

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/ColorRect/Label.text = "Win Event Placeholder"
	$Area2D/ColorRect/TextureButton.texture_normal = preload("res://data/textures/button.png")
	$Area2D/ColorRect/TextureButton.expand = true
	$Area2D/ColorRect/TextureButton/Label.text = "CONFIRM"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_TextureButton_pressed():
	emit_signal("win_confirm")

extends Area2D


var page = 1
var buttons = []
var allowance
signal pressed(level)
signal select_level(level)

var MAX_LEVEL_ALLOWED = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("select_level",self,"select_level")
	var button_pos = $ColorRect.rect_position + Vector2(100,30) 
	for i in range(1,9):
		if i == 5:
			button_pos.y += 300
			button_pos.x = $ColorRect.rect_position.x + 100
		var button = TextureButton.new()
		button.name = String(i*page)
		button.texture_normal = preload("res://data/textures/button.png")
		button.rect_size = Vector2 (250,250)
		button.rect_position = button_pos
		button.expand = true
		button_pos.x += 300
		
		buttons = buttons + [button]
		
		button.connect("pressed",self,"pressed",[button.name])
		
		
		var button_font = DynamicFont.new()
		button_font.font_data = load("res://data/textures/8514oem.ttf")
		button_font.size = 100
		var label = Label.new()
		label.rect_size = button.rect_size
		label.rect_size.y /= 2
		label.rect_position.y += 80
		label.align = VALIGN_CENTER
		label.add_font_override("font",button_font)
		label.text = String(i)
		button.add_child(label)
		
		
		add_child(button)
	
	update_allowance()

func update_allowance():
	allowance = get_parent().get_node("LevelCreator").level_save+1
	for i in range(1,9):
		print(buttons[i-1])
		if(int(buttons[i-1].name) > allowance):
				buttons[i-1].modulate = Color(0.3,0.3,0.3)
		else:
			buttons[i-1].modulate = Color(1,1,1)

func pressed(level):
	if(int(level) <= allowance && int(level) <= MAX_LEVEL_ALLOWED):
		emit_signal("select_level",level[0])

func select_level(level):
	self.hide()
	get_node("../LevelCreator").load_level(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

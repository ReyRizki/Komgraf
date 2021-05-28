extends CustomShape


var rng = RandomNumberGenerator.new()
var random = Random.new()


func _ready():
	rng.randomize()


func _draw():
	draw_random_rhombus()


func draw_random_rhombus():
	var width = get_viewport().size.x
	var height = get_viewport().size.y

	var center = random.random_point(width, height)
	var length = rng.randf_range(30, 300)
	
	for i in range(50):
		center = Vector2(center.x + 2, center.y - 2)
		length -= 4
		
		draw_rhombus2(center, length, random.random_color())


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/Rhombuses.tscn")

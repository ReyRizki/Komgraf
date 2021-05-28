extends CustomShape


var rng = RandomNumberGenerator.new()
var random = Random.new()


func _ready():
	rng.randomize()


func _draw():
	for i in 10:
		draw_random_ellipse()


func draw_random_ellipse():
	var width = get_viewport().size.x
	var height = get_viewport().size.y

	var center = random.random_point(width, height)
	var rx = rng.randf_range(10, 100)
	var ry = rng.randf_range(10, 100)
	
	var color_array = []
	var draw = []

	for i in 4:
		draw.push_back(true)
		color_array.push_back(random.random_color())
	
	draw_midpoint_ellipse(center, rx, ry, PoolColorArray(color_array), draw)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/RandomEllipses.tscn")

extends CustomShape


var rng = RandomNumberGenerator.new()
var random = Random.new()


func _ready():
	rng.randomize()


func _draw():
	for i in 10:
		draw_random_circle()


func draw_random_circle():
	var width = get_viewport().size.x
	var height = get_viewport().size.y

	var center = random.random_point(width, height)
	var r = rng.randf_range(10, 100)

	var color_array = []
	var draw = []

	for i in 8:
		draw.push_back(true)
		color_array.push_back(random.random_color())

	var thickness = rng.randf_range(0, r)

	var p: float = 2 * PI * r / 8
	var dash: float = round(rng.randf_range(0, p))
	var gap: float = round(rng.randf_range(0, p))

	draw_circle_thickness(center, r, color_array, draw, thickness, dash, gap)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/RandomCircles.tscn")

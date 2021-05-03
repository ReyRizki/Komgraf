extends Flower


var rng = RandomNumberGenerator.new()
var random = Random.new()


func _ready():
	rng.randomize()


func _draw():
	for i in 1:
		draw_random_4petal_flower()


func draw_random_4petal_flower():
	var width = get_viewport().size.x
	var height = get_viewport().size.y

	var center = random.random_point(width, height)
	var length = rng.randf_range(50, 200)
	
	var color_array = []

	for i in 4:
		color_array.push_back(random.random_color())
	
	draw_4petals_flower(center, length, PoolColorArray(color_array))


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/Flower4.tscn")

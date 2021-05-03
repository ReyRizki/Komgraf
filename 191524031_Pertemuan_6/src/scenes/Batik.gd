extends Flower


var rng = RandomNumberGenerator.new()
var random = Random.new()


func _ready():
	rng.randomize()


func _draw():
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	
	var length = 100
	var x = length
	var y = length
	
	var color_array = []

	for i in 4:
		color_array.push_back(random.random_color())
	
	while y < height + length:
		while x < width + length:
			draw_batik(Vector2(x, y), length, color_array)
			x += 2 * length
		
		y += 2 * length
		x = length


func draw_batik(center, length, color_array):
	draw_8petals_flower(center, length, PoolColorArray(color_array))
	draw_4petals_flower(center, 2 * length / 3, PoolColorArray(color_array))


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/Batik.tscn")

extends Smiley


var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()


func _draw():
	for i in 1:
		draw_random_smiley()


func draw_random_smiley():
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	
	var center = random.random_point(width, height)
	var r = rng.randf_range(10, 100)
	
	draw_smiley(center, r)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/RandomSmileys.tscn")

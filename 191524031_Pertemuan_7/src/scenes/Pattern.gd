extends Pattern


func _draw():
	var max_size = get_viewport().size
	var center = max_size / 2

	var tip = center + Vector2(0, -200)

	for i in range(8):
		var degree = i * 45

		var start = rotate_point(tip, center, degree)

		draw_pattern(start, Color(0, 0, 1), degree)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


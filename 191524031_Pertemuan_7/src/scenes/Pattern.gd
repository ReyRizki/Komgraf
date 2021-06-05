extends Pattern


var colors = Colors.new()


func _draw():
	# get center of screen
	var max_size = get_viewport().size
	var center = max_size / 2

	# get tip of the pattern
	var tip = center + Vector2(0, -200)

	# draw pattern with animation
	for i in range(8):
		var degree = i * 45

		var start = rotate_point(tip, center, degree)

		draw_pattern(start, colors.nord0, degree)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


# button functions to change the speed and roatation orientation
func _on_Speed_Up_pressed():
	speed += 1


func _on_Speed_Down_pressed():
	# if (speed > 1):
	speed -= 1


func _on_CW_pressed():
	rotate_orientation = -1


func _on_CCW_pressed():
	rotate_orientation = 1

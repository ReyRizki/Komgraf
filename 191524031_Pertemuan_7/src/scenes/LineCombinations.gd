extends Stroke

var colors = Colors.new()

func _draw():
	draw_custom_line(
		Vector2(400, 300), 
		Vector2(600, 300), 
		colors.green, 
		3, 1, 0
	)
	
	draw_custom_line(
		Vector2(400, 350), 
		Vector2(600, 350), 
		colors.red, 
		2, 4, 1
	)
	
	draw_custom_line(
		Vector2(400, 400), 
		Vector2(600, 400), 
		colors.blue, 
		1, 5, 3
	)
	
	draw_custom_line(
		Vector2(400, 500), 
		Vector2(500, 700), 
		colors.blue, 
		1, 5, 3
	)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

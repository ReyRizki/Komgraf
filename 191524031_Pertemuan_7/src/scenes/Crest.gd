extends CustomShape


var colors = Colors.new()


func _draw():
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	
	var center = Vector2(width/2, height / 2)
	var r = 100
	
	var color_array = []
	var draw = []
	
	for i in 8:
		draw.push_back(true)
		color_array.push_back(colors.black)
	
	draw_circle_thickness(center, r, color_array, draw, 3 * r / 4)
	
	var point = Vector2(center.x, center.y - r)
	
	draw_pointy_line(point, center, 60)
	draw_pointy_line(point, center, 180)
	draw_pointy_line(point, center, -60)


func draw_pointy_line(point: Vector2, center: Vector2, degree: float = 0):
	for i in range(-5, 6):
		draw_custom_line(
			rotate_point(Vector2(center.x + i, center.y), center, degree), 
			rotate_point(point, center, degree), 
			colors.white
		)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

extends CustomShape


var colors = Colors.new()


func _draw():
	draw_flash_logo()


func draw_flash_logo():
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	
	var center = Vector2(width/2, height / 2)
	var r = 100
	
	var color_array = []
	var draw = []
	
	for i in 8:
		draw.push_back(true)
		color_array.push_back(colors.black)
	
	draw_midpoint_circle(center, r, color_array, draw)
	
	var points = PoolVector2Array([
		Vector2(center.x + r, center.y - 3 * r / 2),
		Vector2(center.x - r / 2, center.y - r / 4),
		Vector2(center.x, center.y - r / 4),
		Vector2(center.x - 3 * r / 4, center.y + r / 2),
		Vector2(center.x - r / 4, center.y + r / 2),
		Vector2(center.x - r, center.y + 3 * r / 2),
		Vector2(center.x + r / 2, center.y + r / 4),
		Vector2(center.x, center.y + r / 4),
		Vector2(center.x + 3 * r / 4, center.y - r / 2),
		Vector2(center.x + r / 4, center.y - r / 2),
	])
	
	draw_shape(points, Color(0.81, 0.66, 0.22))


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

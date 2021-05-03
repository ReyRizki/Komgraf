extends CustomShape


class_name Smiley


var random = Random.new()


func draw_smiley(center: Vector2, r: float):
	var color_array = []
	var draw = []
	
	for i in 8:
		draw.push_back(true)
		color_array.push_back(random.random_color())
	
	draw_midpoint_circle(center, r, color_array, draw)
	
	draw_midpoint_circle(Vector2(center.x + r/3, center.y - r/3), r/5, color_array, draw)
	draw_midpoint_circle(Vector2(center.x - r/3, center.y - r/3), r/5, color_array, draw)
	
	var draw_mouth = []
	for i in 8:
		draw_mouth.push_back(false)
	
	draw_mouth[0] = true
	draw_mouth[1] = true
	draw_mouth[4] = true
	draw_mouth[5] = true
	
	var r2 = r/3
	var y = center.y + r/5
	draw_midpoint_circle(Vector2(center.x, y), r2, color_array, draw_mouth)
	
	draw_custom_line(
		Vector2(center.x - r2, y),
		Vector2(center.x + r2, y),
		random.random_color()
	)

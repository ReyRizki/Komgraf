extends CustomShape


class_name Flower


func draw_4petals_flower(
		center: Vector2, 
		length: float, 
		colors: PoolColorArray
	):
	var r1: float = length / 2
	var r2: float = r1 / 2
	
	var p1 = Vector2(center.x, center.y - r1)
	var p2 = Vector2(center.x + r1, center.y)
	
	var draw = []
	
	for i in range(4):
		draw.push_back(true)
	
	draw_midpoint_ellipse(p1, r2, r1, colors, draw)
	draw_midpoint_ellipse(p2, r1, r2, colors, draw)
	draw_midpoint_ellipse(rotate_point(p1, center, 180), r2, r1, colors, draw)
	draw_midpoint_ellipse(rotate_point(p2, center, 180), r1, r2, colors, draw)


func draw_8petals_flower(
		center: Vector2, 
		length: float, 
		colors: PoolColorArray
	):
	var r1: float = length / 2
	var r2: float = 2 * r1 / 5 
	
	var p1 = Vector2(center.x, center.y - r1)
	var p2 = Vector2(center.x + r1, center.y)
	
	var draw = []
	
	for i in range(4):
		draw.push_back(i > 1)
		
	for i in range(8):
		var degree = 45 * i
		draw_midpoint_ellipse(
			rotate_point(p1, center, degree), 
			r2, r1, 
			colors, draw, degree
		)

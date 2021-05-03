extends Stroke


class_name CustomShape


func draw_shape(
	points: PoolVector2Array,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	for i in points.size():
		var start = points[i]
		var end = points[(i + 1) % points.size()]

		draw_custom_line(start, end, color, thickness, dash, gap)


func draw_square(
	point: Vector2,
	length: float,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var points = PoolVector2Array([
		point,
		Vector2(point.x + length, point.y),
		Vector2(point.x + length, point.y + length),
		Vector2(point.x, point.y + length),
	])

	draw_shape(points, color, thickness, dash, gap)


func draw_rectangle(
	point: Vector2,
	height: float,
	length: float,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var points = PoolVector2Array([
		point,
		Vector2(point.x + length, point.y),
		Vector2(point.x + length, point.y + height),
		Vector2(point.x, point.y + height),
	])

	draw_shape(points, color, thickness, dash, gap)


func draw_parallelogram(
	point: Vector2,
	height: float,
	length: float,
	alpha: float,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var beta = 90 - alpha
	var side = height * tan(deg2rad(beta))

	var points = PoolVector2Array([
		point,
		Vector2(point.x + length, point.y),
		Vector2(point.x + length + side, point.y + height),
		Vector2(point.x + side, point.y + height),
	])

	draw_shape(points, color, thickness, dash, gap)


func draw_rhombus(
	point: Vector2,
	diagonal1: float,
	diagonal2: float,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var d1 = diagonal1 / 2
	var d2 = diagonal2 / 2

	var points = PoolVector2Array([
		Vector2(point.x, point.y - d1),
		Vector2(point.x + d2, point.y),
		Vector2(point.x, point.y + d1),
		Vector2(point.x - d2, point.y),
	])

	draw_shape(points, color, thickness, dash, gap)


func draw_trapezoid(
	point: Vector2,
	height: float,
	top: float,
	bottom: float,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var points = PoolVector2Array([
		point,
		Vector2(point.x + top, point.y),
		Vector2(point.x + bottom, point.y + height),
		Vector2(point.x, point.y + height),
	])

	draw_shape(points, color, thickness, dash, gap)


func draw_right_triangle(
	point: Vector2,
	height: float,
	base: float,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var points = PoolVector2Array([
		point,
		Vector2(point.x + base, point.y + height),
		Vector2(point.x, point.y + height),
	])

	draw_shape(points, color, thickness, dash, gap)


func draw_circle_thickness(
		center: Vector2,
		r: float,
		colors: Array,
		draw: Array,
		thickness: float = 1,
		dash: float = 1,
		gap: float = 0
	):
	for i in range(r - thickness + 1, r + 1):
		draw_midpoint_circle(center, i, colors, draw, dash, gap)


func draw_midpoint_circle(
		center: Vector2,
		r: float,
		colors: Array,
		draw: Array,
		dash: float = 1,
		gap: float = 0
	):
	var x = r
	var y = 0

	put_pixel(x + center.x, y + center.y, colors[0])

	if (r > 0) :
		put_pixel(-x + center.x, y + center.y, colors[1])
		put_pixel(y + center.x, x + center.y, colors[5])
		put_pixel(y + center.x, -x + center.y, colors[6])

	var P = 1 - r

	var step = 0
	var skip = dash
	while x > y:
		var mult = gap if (step == skip) else 1

		for i in mult:
			y += 1
			if P <= 0:
				P = P + 2 * y + 1
			else:
				x -= 1

				P = P + 2 * y - 2 * x + 1

		if (step == skip):
			step += gap
			skip += dash + gap

			continue


		if (x < y):
			break

		var points = [
			Vector2(x, y),
			Vector2(-x, y),
			Vector2(x, -y),
			Vector2(-x, -y),
			Vector2(y, x),
			Vector2(-y, x),
			Vector2(y, -x),
			Vector2(-y, -x),
		]

		for i in 4:
			if (draw[i]):
				put_pixel(
					points[i].x + center.x,
					points[i].y + center.y,
					colors[i]
				)

		if x != y:
			for i in range(4, 8):
				if (draw[i]):
					put_pixel(
						points[i].x + center.x,
						points[i].y + center.y,
						colors[i]
					)

		step += 1


func draw_quadrant(
		point: Vector2, 
		center: Vector2, 
		colors: PoolColorArray, 
		draw: Array,
		degree: float = 0
	):
	var points = PoolVector2Array([
			Vector2(point.x, point.y),
			Vector2(-point.x, point.y),
			Vector2(point.x, -point.y),
			Vector2(-point.x, -point.y),
		])
	
	for i in range(4):
		points[i] = translate_point(points[i], center)
		points[i] = rotate_point(points[i], center, degree)
	
		if draw[i]:
			put_pixel(points[i].x, points[i].y, colors[i])


func draw_midpoint_ellipse(
		center: Vector2, 
		rx: float, 
		ry: float, 
		colors: PoolColorArray, 
		draw: Array,
		degree: float = 0
	):
	var x = 0
	var y = ry

	var d1 = ((ry * ry) - (rx * rx * ry) + (0.25 * rx * rx))
	var dx = 2 * ry * ry * x
	var dy = 2 * rx * rx * y

	while (dx < dy):
		draw_quadrant(Vector2(x, y), center, colors, draw, degree)

		if (d1 < 0):
			x += 1
			dx = dx + (2 * ry * ry)
			d1 = d1 + dx + (ry * ry)
		else:
			x += 1
			y -= 1
			dx = dx + (2 * ry * ry)
			dy = dy - (2 * rx * rx)
			d1 = d1 + dx - dy + (ry * ry)

	var d2 = (((ry * ry) * ((x + 0.5) * (x + 0.5))) +
		  ((rx * rx) * ((y - 1) * (y - 1))) -
		   (rx * rx * ry * ry))

	while (y >= 0):
		draw_quadrant(Vector2(x, y), center, colors, draw, degree)

		if (d2 > 0):
			y -= 1
			dy = dy - (2 * rx * rx)
			d2 = d2 + (rx * rx) - dy
		else:
			y -= 1
			x += 1
			dx = dx + (2 * ry * ry)
			dy = dy - (2 * rx * rx)
			d2 = d2 + dx - dy + (rx * rx)


func draw_equilateral_triangle(point: Vector2, length: float, color: Color):
	var p1 = point
	var p2 = Vector2(p1.x + length, p1.y)
	var p3 = rotate_point(p2, p1, -60)
	
	draw_shape(PoolVector2Array([p1, p2, p3]), color)


func draw_rhombus2(point: Vector2, length: float, color: Color):
	var p1 = point
	var p2 = Vector2(p1.x + length, p1.y)
	var p3 = rotate_point(p1, p2, -60)
	var p4 = rotate_point(p1, p2, 60)
	
	draw_shape(PoolVector2Array([p1, p3, p2, p4]), color)

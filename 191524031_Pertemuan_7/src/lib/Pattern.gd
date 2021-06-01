extends Transformations


class_name Pattern


var steps = 0


func _process(delta):
	steps += 1

	if (steps == 180):
		steps = 0

	update()


func draw_pattern(start: Vector2, color: Color, degree: float):
	# get parameter for a pattern component
	var current = Vector2(start.x + steps * sin(deg2rad(360 - degree)), start.y + steps * cos(deg2rad(degree)))
	var colors = PoolColorArray([color])
	var scale_factor = steps * 0.1

	# decide which points should use
	# if steps < 0, draw and animate square
	# else, draw and animate v-shaped pattern
	var points
	if(steps < 90):
		points = PoolVector2Array([
			rotate_point(current + scale_factor * Vector2(0, -1), current, degree + steps),
			rotate_point(current + scale_factor * Vector2(1, 0), current, degree + steps),
			rotate_point(current + scale_factor * Vector2(0, 1), current, degree + steps),
			rotate_point(current + scale_factor * Vector2(-1, 0), current, degree + steps),
		])
	else:
		points = PoolVector2Array([
			rotate_point(current + scale_factor * Vector2(0, 0), current, degree),
			rotate_point(current + scale_factor * Vector2(-1, -1), current, degree),
			rotate_point(current + scale_factor * Vector2(-1, 0), current, degree),
			rotate_point(current + scale_factor * Vector2(0, 1), current, degree),
			rotate_point(current + scale_factor * Vector2(1, 0), current, degree),
			rotate_point(current + scale_factor * Vector2(1, -1), current, degree),
		])

	# draw using draw_polygon()
	draw_polygon(points, colors)

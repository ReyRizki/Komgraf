extends Transformations


class_name Pattern


var steps = 0


func _process(delta):
	steps += 1

	if (steps == 180):
		steps = 0

	update()


func draw_filled_square(current: Vector2, color: Color, degree: float):
	var colors = PoolColorArray([color])
	var scale_factor = steps * 0.1

	var points = PoolVector2Array([
		rotate_point(Vector2(current.x, current.y) + scale_factor * Vector2(0, -1), current, degree + steps),
		rotate_point(Vector2(current.x, current.y) + scale_factor * Vector2(1, 0), current, degree + steps),
		rotate_point(Vector2(current.x, current.y) + scale_factor * Vector2(0, 1), current, degree + steps),
		rotate_point(Vector2(current.x, current.y) + scale_factor * Vector2(-1, 0), current, degree + steps),
	])

	draw_polygon(points, colors)

func draw_v():
	pass

func draw_pattern(start, color, degree):
	var current = Vector2(start.x + steps * sin(deg2rad(360 - degree)), start.y + steps * cos(deg2rad(degree)))
	if(steps < 90):
		draw_filled_square(current, color, degree)
	else:
		draw_v()

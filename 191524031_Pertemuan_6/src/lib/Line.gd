extends Transformations


class_name Stroke


func draw_custom_line(
	start: Vector2,
	end: Vector2,
	color: Color,
	thickness: float = 1,
	dash: int = 1,
	gap: int = 0
):
	var dy = end.y - start.y
	var dx = end.x - start.x

	var steps = abs(dx) if (abs(dx) > abs(dy)) else abs(dy)

	var x_inc = dx / steps
	var y_inc = dy / steps

	thickness -= 1

	var x = start.x
	var y = start.y

	var down = get_point(start, end, thickness, 1)

	var x_thick = down.x
	var y_thick = down.y

	var skip = dash
	var i = 1
	while i <= steps:
		if (i + 1) % skip == 0:
			x += x_inc * gap
			y += y_inc * gap

			x_thick += x_inc * gap
			y_thick += y_inc * gap

			skip += dash + gap
			i += gap
		else:
			x += x_inc
			y += y_inc

			x_thick += x_inc
			y_thick += y_inc

			i += 1

			draw_thickness(Vector2(x, y), Vector2(x_thick, y_thick), color)


func get_point(start: Vector2, end: Vector2, thickness: float, multiplier):
	var dy = end.y - start.y
	var dx = end.x - start.x

	var result = start

	if dx == 0:
		result.x += thickness

		return result
	elif dy == 0:
		result.y += thickness

		return result;

	var m = dy / dx
	var m_thick = (-1) * (1 / m)

	result.x = (thickness / sqrt(1 + pow(m_thick, 2))) + multiplier * start.x
	result.y = (m_thick * (result.x - start.x)) + multiplier * start.y

	return result

func draw_thickness(
	start: Vector2,
	end: Vector2,
	color: Color):
	var dy = end.y - start.y
	var dx = end.x - start.x

	var steps = abs(dx) if (abs(dx) > abs(dy)) else abs(dy)

	var x = start.x
	var y = start.y

	put_pixel(x, y, color)

	if steps > 0:
		var x_inc = dx / steps
		var y_inc = dy / steps

		for i in steps:
			x += x_inc
			y += y_inc

			put_pixel(x, y, color)


func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array(
		[Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array()
	)

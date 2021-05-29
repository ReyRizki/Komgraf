extends Node2D


class_name Transformations


func rotate_point(point:Vector2, center:Vector2, degree: float)->Vector2:
	var rotX
	var rotY

	var vcos: float = cos(deg2rad(degree))
	var vsin: float = sin(deg2rad(degree))

	var x1=center.x
	var y1=center.y

	var x2=point.x
	var y2=point.y

	rotX = (vcos * (x2 - x1)) + (-vsin * (y2 - y1)) + x1
	rotY = (vsin * (x2 - x1)) + (vcos * (y2 - y1)) + y1

	return Vector2(rotX,rotY)


func translate_point(p1: Vector2, p2: Vector2)->Vector2:
	var result = Vector2(p1.x + p2.x, p1.y + p2.y)

	return result

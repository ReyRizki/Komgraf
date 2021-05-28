extends Node2D


var angle_from: int = 30
var radius: int = 0
var reverse: bool = false
var x: int = 0
var y: int = 50


func _process(delta):
	angle_from += 1
	radius += (-1 if reverse else 1) * 1
	
	var width: int = get_viewport().size.x
	var height: int = get_viewport().size.x
	x += 1
	
	if (x == width):
		y += 20
		x = 0
		
		if (y >= height):
			y = 0
	
	if (radius == 0):
		reverse = false
	elif (radius == 50):
		reverse = true
	
	update()


func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)


func _draw():
	draw_circle_arc_poly(Vector2(x, y), radius, angle_from, angle_from + 300, Color(1, 1, 1))


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


extends Node2D


var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


func _draw():
	for i in 100:
		var start = random_point()
		var end = random_point()
		
		draw_line_dda(start, end, random_color())


# Function to get random points in the screen
func random_point():
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	
	return Vector2(rng.randf_range(0, width), rng.randf_range(0, height))


# Functio to get random color
func random_color():
	var red = rng.randf_range(0, 1)
	var green = rng.randf_range(0, 1)
	var blue = rng.randf_range(0, 1)
	
	return Color(red, green, blue)


# Function to draw a line based on DDA line algorithm
func draw_line_dda(start, end, color):
	var dx = end.x - start.x
	var dy = end.y - start.y
	
	var steps = abs(dx) if (abs(dx) > abs(dy)) else abs(dy)
	
	var x_inc = dx / steps
	var y_inc = dy / steps
	
	var x = start.x
	var y = start.y 
	
	put_pixel(x, y, color)
	
	for i in steps:
		x += x_inc
		y += y_inc
		
		put_pixel(x, y, color)


# Function to put a pixel with given coordinate and color
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array(
		[Vector2(x, y)]), 
		PoolColorArray([color]), 
		PoolVector2Array()
	)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/RandomLine.tscn")

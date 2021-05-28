extends Node2D


class_name Random


var rng = RandomNumberGenerator.new()


func _init():
	rng.randomize()


# Function to get random points in the screen
func random_point(width, height):
	return Vector2(rng.randf_range(0, width), rng.randf_range(0, height))


# Function to get random color
func random_color():
	var red = rng.randf_range(0, 1)
	var green = rng.randf_range(0, 1)
	var blue = rng.randf_range(0, 1)
	
	return Color(red, green, blue)

extends CustomShape


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var colors = Colors.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _draw():
	draw_square(Vector2(100, 100), 50, colors.black)
	draw_rectangle(Vector2(200, 100), 30, 50, colors.black)
	draw_parallelogram(Vector2(300, 100), 30, 50, 60, colors.black)
	draw_rhombus(Vector2(400, 100), 30, 40, colors.black)
	draw_trapezoid(Vector2(500, 100), 30, 30, 50, colors.black)
	draw_right_triangle(Vector2(600, 100), 30, 50, colors.black)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

extends Node2D


var colors = Colors.new()


func _draw():
	draw_identity()
	draw_title()


func draw_identity():
	var dynamic_font:DynamicFont = DynamicFont.new()
	dynamic_font.font_data = load("res://assets/font/dum1.ttf")
	dynamic_font.size = 16

	$"Identity".set("custom_fonts/font", dynamic_font)
	$"Identity".set("custom_colors/font_color", Colors.black)


func draw_title():
	var dynamic_font:DynamicFont = DynamicFont.new()
	dynamic_font.font_data = load("res://assets/font/BebasNeue-Regular.ttf")
	dynamic_font.size = 64
	dynamic_font.outline_color = Colors.black
	dynamic_font.outline_size = 1

	$"Title".set("custom_fonts/font", dynamic_font)
	$"Title".set("custom_colors/font_color", Colors.white)


func _on_RandomEllipses_pressed():
	get_tree().change_scene("res://scenes/RandomEllipses.tscn")


func _on_Logo_pressed():
	get_tree().change_scene("res://scenes/Logo.tscn")


func _on_Triangles_pressed():
	get_tree().change_scene("res://scenes/Triangles.tscn")


func _on_Rhombuses_pressed():
	get_tree().change_scene("res://scenes/Rhombuses.tscn")


func _on_Flower4_pressed():
	get_tree().change_scene("res://scenes/Flower4.tscn")


func _on_Flower8_pressed():
	get_tree().change_scene("res://scenes/Flower8.tscn")


func _on_Batik_pressed():
	get_tree().change_scene("res://scenes/Batik.tscn")


func _on_Crest_pressed():
	get_tree().change_scene("res://scenes/Crest.tscn")

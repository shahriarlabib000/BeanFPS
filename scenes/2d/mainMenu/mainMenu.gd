extends Control



func _on_h_slider_value_changed(value):
	Autoload.camSensitivity=value


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/3d/world/world.tscn")

extends Control

@onready var slider=$VBoxContainer2/HSlider
func _ready():
	slider.value= Autoload.camSensitivity

func _on_h_slider_value_changed(value):
	Autoload.camSensitivity=value

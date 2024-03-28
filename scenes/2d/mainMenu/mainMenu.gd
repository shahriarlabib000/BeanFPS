extends Control

@onready var loadingTxt=$loading

var scene="res://scenes/3d/world/world.tscn"
var progress=[]
var status

func _process(delta):
	status=ResourceLoader.load_threaded_get_status(scene,progress)
	progress[0]=snapped(progress[0]*100,0.01)
	loadingTxt.text=str(progress[0])+" %"
	
	if status==ResourceLoader.THREAD_LOAD_LOADED:
		var newTscn=ResourceLoader.load_threaded_get(scene)
		get_tree().change_scene_to_packed(newTscn)
		
func _on_h_slider_value_changed(value):
	Autoload.camSensitivity=value


func _on_button_pressed():
	loadingTxt.visible=true
	ResourceLoader.load_threaded_request(scene)

extends Node3D


# Called when the node enters the scene tree for the first time.
@onready var aniplayer=$AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		if !aniplayer.is_playing():
			aniplayer.play("shoot")
	

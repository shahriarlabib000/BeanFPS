extends Node3D

var target="bullet"
@onready var des=$dest
@onready var lift=$StaticBody3D
var goUp=false
var ammount=0.1
var destination = 45
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if destination-ammount > lift.position.y:
		lift.position.y +=ammount
	elif destination+ammount < lift.position.y:
		lift.position.y-=ammount
	des.mesh.text=str(int(lift.position.y))


func _on_liftPole_press():
	if destination==45:
		destination=0
	elif destination==0:
		destination=45

func _on_pole_1_pressed():
	destination=0

func _on_pole_2_pressed():
	destination=45

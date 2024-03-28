extends Node3D

@onready var enemy=preload("res://scenes/3d/enemy/enemy.tscn")
@onready var bomb=preload("res://scenes/3d/bomb/bomb.tscn")
@onready var sceneLight=$DirectionalLight3D
@onready var player=$Player
var killCount:=0
var spawnEnemy=false
var bulletShotCount:=0
var accuracy=0.0
var targetHit=0

# Called when the node enters the scene tree for the first time.

@warning_ignore("unused_parameter")
func _process(delta):
	if Input.is_action_just_pressed("tscn_reload"):
		get_tree().reload_current_scene()
	$Player/Head/Camera3D/ui/killCount.text=str(killCount)+"/15"
	if bulletShotCount!=0:
		accuracy=(float(targetHit)/float(bulletShotCount)) * 100
		accuracy=snapped(accuracy,0.01)
	$Player/Head/Camera3D/ui/accuracy.text=str(accuracy)+"%"
		#str(accuracy)+"%"


func _on_timer_timeout():
	if(spawnEnemy):
		var inst=enemy.instantiate()
		inst.position.x=100
		inst.position.y=4
		add_child(inst)
	
func enemyKilled():
	killCount+=1
	
func bulletShot():
	bulletShotCount+=1
	
func rightHit():
	targetHit+=1






func _on_pole_pressed():
	#sceneLight.visible=true
	var bombInst=bomb.instantiate()
	bombInst.position=Vector3(player.position.x,400,player.position.z)
	add_child(bombInst)
	player.death()

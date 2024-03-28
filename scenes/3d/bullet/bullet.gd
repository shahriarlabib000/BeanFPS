extends RigidBody3D


@onready var player=get_parent().get_parent().get_node("Player")#player in world
@onready var ray=$RayCast3D
@onready var world=get_parent().get_parent()
@onready var particle=$CPUParticles3D
var speed=1000
var rayCol
var knockback=20
var bulletRange=10000

func _ready():
	world.bulletShot()
	
	
@warning_ignore("unused_parameter")
func _process(delta):
	
	#position+= transform.basis * Vector3(0,0,-speed) * delta
	if ray.is_colliding():
		particle.visible=true
		rayCol=ray.get_collider()
		if rayCol.is_in_group("enemy"):
			rayCol.queue_free()
			world.enemyKilled() 
			world.rightHit()
			
		elif rayCol.is_in_group("friend"):
			rayCol.linear_velocity+=transform.basis * Vector3(0,0,-knockback)
			world.rightHit()
		
		elif rayCol.is_in_group("pole"):
			rayCol.btnHit()
			world.rightHit()
		
		queue_free()
	elif (position.distance_to(player.position) > bulletRange):
		queue_free()
	
		
@warning_ignore("unused_parameter")
func _integrate_forces(state):
	#pass
	#constant_force= basis.z * -speed
	apply_central_force(basis.z * -speed)


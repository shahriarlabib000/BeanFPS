extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var player=null
var time:=0.01/1.5
var gravity=ProjectSettings.get_setting("physics/3d/default_gravity")
@export var player_path:="../Player"
@onready var nav=$NavigationAgent3D
func _ready():
	player= get_node(player_path)
	
func _physics_process(delta):
	# Add the gravity.
	nav.target_position=player.position
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	

	# Handle jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction= nav.get_next_path_position() -global_position
	#direction=direction.normalized()
	velocity=direction#lerp(velocity,direction ,delta *50)
	

	move_and_slide()


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		body.death()
	

extends RigidBody3D

@onready var light=$OmniLight3D
@onready var particle=$CPUParticles3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y<=10:
		light.light_energy=999
		particle.emitting=false

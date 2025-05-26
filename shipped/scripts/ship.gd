extends RigidBody2D

var speed = 200

func _physics_process(delta):
	global_rotation = linear_velocity.angle() + PI/2

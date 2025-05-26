extends RigidBody2D

func _physics_process(delta: float) -> void:
	global_rotation = linear_velocity.angle() + PI/2

extends RigidBody2D

var previous_velocity = Vector2.ZERO
var acceleration = Vector2.ZERO

func _physics_process(delta: float) -> void:
	global_rotation = linear_velocity.angle() + PI/2
	
	var current_velocity = linear_velocity
	acceleration = (current_velocity - previous_velocity) / delta
	previous_velocity = current_velocity

	var mag = acceleration.length() / 1000
	set_modulate(Color(mag, 0, 0, 1))

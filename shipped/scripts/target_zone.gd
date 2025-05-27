extends Area2D

func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		body.queue_free()
		print("PACKAGE DELIVERED!")

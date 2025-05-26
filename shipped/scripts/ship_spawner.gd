extends Node2D

var dragging = false
var drag_start = Vector2.ZERO

const SHIP = preload("res://scenes/ship.tscn")

func _input(event):
	# Left‐click pressed: start drag
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_start = event.position
		else:
			if dragging:
				var drag_end = event.position
				var drag_vec = drag_end - drag_start
	
				var ship = SHIP.instantiate()
				ship.global_position = drag_end
				ship.global_rotation = 0
				
				add_child(ship)
				
				ship.apply_central_force(-drag_vec * 200)
				
				print("Spawned ship travelling: ", drag_vec.angle())
				
				dragging = false

	elif event is InputEventMouseMotion and dragging:
		var current_vec = event.position - drag_start

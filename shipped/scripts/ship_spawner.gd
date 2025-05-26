extends Node2D

var dragging = false
var drag_start = Vector2.ZERO

const SHIP = preload("res://scenes/ship.tscn")
const PATH = preload("res://scenes/path.tscn")
var path

func _input(event):
	# Left‐click pressed: start drag
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_start = event.position
			
			path = PATH.instantiate()
			path.curve = Curve2D.new()
			path.curve.add_point(drag_start)
			path.curve.add_point(drag_start)
			add_child(path)
		else:
			if dragging:
				path.queue_free()
				
				var drag_end = event.position
				var drag_vec = drag_end - drag_start
	
				var ship = SHIP.instantiate()
				ship.global_position = drag_end
				ship.global_rotation = drag_vec.angle() - PI/2
				
				add_child(ship)
				
				ship.linear_velocity = -drag_vec * 3
				
				dragging = false

	elif event is InputEventMouseMotion and dragging:
		path.curve.set_point_position(0, event.position)

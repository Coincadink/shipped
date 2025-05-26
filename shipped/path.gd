extends Path2D

@export var circle_spacing: float = 20.0
@export var circle_radius: float = 4.0

func _draw():
	if curve.get_point_count() < 2:
		return

	curve.bake_interval = 2.0

	var total_len = curve.get_baked_length()
	var d = 0.0
	while d <= total_len:
		var p = curve.sample_baked(d)
		draw_circle(p, circle_radius, Color.WHITE)
		d += circle_spacing

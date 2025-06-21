extends Node2D

var points = 0
func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		
		var space_state = get_world_2d().direct_space_state
		
		var parameters = PhysicsPointQueryParameters2D.new()
		parameters.position = mouse_pos
		parameters.collide_with_areas = true
		parameters.collide_with_areas = true
		
		var result = space_state.intersect_point(parameters,1)
		
		if result.size()>0:
			print("Hit:", result[0].collider)
			if result[0].collider is Fly:
				points+=1
				$Label.text = "Points: " + str(points)
				result[0].collider.hit()
		else:
			$glass.play("default")
			print("FUCK")
	

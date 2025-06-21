extends Button


#litreally stpuid test button that changes colour of balala at random
#because i wanted to make it so it changes with more points or something idk
func _on_pressed() -> void:
	var new_color1 = Color(randi_range(0,1), randi_range(0,1), randi_range(0,1))
	var new_color2 = Color(randi_range(0,1), randi_range(0,1), randi_range(0,1))
	var new_color3 = Color(randi_range(0,1), randi_range(0,1), randi_range(0,1))
	print("yeahbasically")
	$"../ColorRect".material.set_shader_parameter("colour_1",new_color1)
	$"../ColorRect".material.set_shader_parameter("colour_2",new_color2)
	$"../ColorRect".material.set_shader_parameter("colour_3",new_color3)

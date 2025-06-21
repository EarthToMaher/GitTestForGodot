extends Button



func _on_pressed() -> void:
	var new_color1 = Color(randi_range(0,1), randi_range(0,1), randi_range(0,1))
	var new_color2 = Color(randi_range(0,1), randi_range(0,1), randi_range(0,1))
	var new_color3 = Color(randi_range(0,1), randi_range(0,1), randi_range(0,1))
	print("yeahbasically")
	$"../ColorRect".material.set_shader_parameter("colour_1",new_color1)
	$"../ColorRect".material.set_shader_parameter("colour_2",new_color2)
	$"../ColorRect".material.set_shader_parameter("colour_3",new_color3)

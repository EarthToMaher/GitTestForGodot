extends Control


func _on_node_2d_ulost(points) -> void:
	$".".show()
	$gameover/Label.text = str("You hit the fly: " + str(points) + " times")


func _on_again_pressed() -> void:
	GameState.set_state(GameState.GameStateType.PLAYING)
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_main_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

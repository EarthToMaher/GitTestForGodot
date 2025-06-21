extends Sprite2D

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		$".".position = mouse_pos
		$".".show()
		var item = randi_range(1,7)
		match item:
			1: $".".texture = load("res://throwstuffquestionmark/000.png")
			2: $".".texture = load("res://throwstuffquestionmark/001.png")
			3: $".".texture = load("res://throwstuffquestionmark/002.png")
			4: $".".texture = load("res://throwstuffquestionmark/003.png")
			5: $".".texture = load("res://throwstuffquestionmark/004.png")
			6: $".".texture = load("res://throwstuffquestionmark/005.png")
			7: $".".texture = load("res://throwstuffquestionmark/006.png")
		$AnimationPlayer.play("throw")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".hide()

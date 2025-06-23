extends Node2D

signal ulost

func _ready() -> void:
	GameState.game_over_screen = $badgameovermenulol
	GameState.reset_points()
	$throw/AnimationPlayer.play("RESET")
func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed && GameState.current_state == GameState.GameStateType.PLAYING:
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
				GameState.increment_points()
				$Label.text = "Points: " + str(GameState.get_point())
				result[0].collider.hit()
		else:
			$glass.play("default")
			play_sound()
			$throw/AnimationPlayer.play("SUCK")
			$MRTOONDIES.play()
			$MRTOONDIES.volume_db = 35
			GameState.set_state(GameState.GameStateType.FAIL)
			await $throw/AnimationPlayer.animation_finished
			ulost.emit(GameState.get_point())
	
func play_sound():
	var sound = AudioStreamPlayer.new()
	sound.stream = load("res://shattering-chandelier-38391.mp3")
	sound.autoplay = false
	sound.volume_db = 16 #im gonna increase this by 1 each time people complain
	#FUCK YOU!!!!!!!
	add_child(sound)
	sound.play()

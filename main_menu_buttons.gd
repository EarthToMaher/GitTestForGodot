extends Control

var stupuid = false

#wait its all poop

func _on_play_pressed() -> void:
	GameState.set_state(GameState.GameStateType.PLAYING)
	$"../background".play("default")
	$"../Sprite2D/AnimationPlayer".play("grow")
	$"../title".hide()
	$".".hide()
	await $"../Sprite2D/AnimationPlayer".animation_finished
	get_tree().change_scene_to_file("res://node_2d.tscn")



func _on_how_to_play_pressed() -> void:
	$".".hide()
	$"../title".hide()
	$"../VBoxContainer".show()
	$"../background".play("go left?")
	$"../back".show()
	stupuid = false


func _on_options_pressed() -> void:
	$"../title".hide()
	$".".hide()
	$"../optinsstuf".show()
	$"../back".show()
	$"../background".play("go right?")
	stupuid = true


func _on_quit_pressed() -> void:
	var lol = randi_range(1,5)
	if lol == 5:
		$"../AnimatedSprite2D".show()
		$"../AnimatedSprite2D".play("default")
		$"../AnimatedSprite2D/AudioStreamPlayer2D".play()
		await $"../AnimatedSprite2D/AudioStreamPlayer2D".finished
		get_tree().quit()
	else:
		get_tree().quit()


func _on_back_pressed() -> void:
	$"../VBoxContainer".hide()
	$"../back".hide()
	$"../optinsstuf".hide()
	$".".show()
	$"../title".show()
	if stupuid == true:
		$"../background".play_backwards("go right?")
	else:
		$"../background".play_backwards("go left?")

#make this break the glass eventually
func _on_check_box_button_down() -> void:
	$"../AnimatedSprite2D".show()
	$"../AnimatedSprite2D".play("default")
	$"../AnimatedSprite2D/AudioStreamPlayer2D".play()
	$"../optinsstuf".hide()
	await $"../AnimatedSprite2D/AudioStreamPlayer2D".finished
	get_tree().quit()


func _on_check_box_4_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GameState.boomer = true
		$"../optinsstuf/boomer".show()
		$"../optinsstuf/actualboomer".show()
		$"../optinsstuf/boomer".play()
		$"../AnimatedSprite2D/AudioStreamPlayer2D".play()
	else:
		GameState.boomer = true
		$"../optinsstuf/actualboomer".hide()

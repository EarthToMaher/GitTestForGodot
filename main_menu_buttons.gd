extends Control

var stupuid = false
var score 


func _ready():
	score = GameState.loadgift()[0]
	if score >= 1:
		GameState.highscore = score
		$"../Label".show()
		$"../Label".text = str("highscore: " + str(score))

#wait its all poop

func _on_play_pressed() -> void:
	GameState.set_state(GameState.GameStateType.PLAYING)
	$"../background".play("default")
	$"../Sprite2D/AnimationPlayer".play("grow")
	$"../title".hide()
	$".".hide()
	$"../Label".hide()
	await $"../Sprite2D/AnimationPlayer".animation_finished
	get_tree().change_scene_to_file("res://node_2d.tscn")



func _on_how_to_play_pressed() -> void:
	$".".hide()
	$"../title".hide()
	$"../VBoxContainer".show()
	$"../background".play("go left?")
	$"../back".show()
	$"../Label".hide()
	stupuid = false


func _on_options_pressed() -> void:
	$"../title".hide()
	$".".hide()
	$"../optinsstuf".show()
	$"../back".show()
	$"../background".play("go right?")
	$"../Label".hide()
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

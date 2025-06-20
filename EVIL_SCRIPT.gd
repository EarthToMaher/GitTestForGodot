extends Node


func _on_pressed() -> void:
	$"../AnimatedSprite2D".play("EVILMODE")
	$"../AnimatedSprite2D".show()
	$"../AudioStreamPlayer2D".play()
	$".".hide()


func _on_animated_sprite_2d_animation_finished() -> void:
	$"../AnimatedSprite2D".hide()
	$".".show()

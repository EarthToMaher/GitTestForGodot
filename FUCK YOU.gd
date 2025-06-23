extends AnimatedSprite2D

func _ready():
	if GameState.boomer == true:
		$".".play("PISSBOT")

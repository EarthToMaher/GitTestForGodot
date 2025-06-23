extends "res://Fly.gd"

signal uDied

@export var timeToDie: float = 10
var baseTimeToDie: float = 10

func _ready() -> void:
	super()
	set_process(false)
	visible = false
	isRespawning = true
	baseTimeToDie = timeToDie
func hit():
	super()
	timeToDie = baseTimeToDie
func moveFly(delta: float) -> void:
	super(delta)
	timeToDie -= delta
	if timeToDie <= 0:
		attackPlayer()
		
func attackPlayer():
	print("YOU DIe")
	$throw/AnimationPlayer.play("SUCK")
	GameState.set_state(GameState.GameStateType.FAIL)
	await $throw/AnimationPlayer.animation_finished
	#uDied.emit()
		

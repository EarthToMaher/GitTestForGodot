extends Node

@export var SpawnRate: float = 0.01
const funnyFly = preload("res://FunnyFly.tscn")
func _physics_process(delta: float) -> void:
	if GameState.current_state == GameState.GameStateType.FAIL:
		return
	var value = randf()
	if value < SpawnRate/60:
		var flySpawned = funnyFly.instantiate()
		$"..".add_child(flySpawned)
		print("IT HAPPeNeD")

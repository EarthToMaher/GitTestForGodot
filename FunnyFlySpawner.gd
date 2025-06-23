extends Node

@export var SpawnRate: float = 0.01

func _physics_process(delta: float) -> void:
	var value = randf()
	if value < SpawnRate/60:
		load("res://FunnyFly.tscn")
		print("IT HAPPeNeD")

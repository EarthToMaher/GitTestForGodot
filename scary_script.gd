extends Node
func _process(delta: float) -> void:
		$".".position -= Vector3.FORWARD*delta;

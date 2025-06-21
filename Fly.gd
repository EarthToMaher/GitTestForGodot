extends Area2D
class_name Fly

@export var speed: float = 100
@export var minDirectionLength: float = 0.5
@export var maxDirectionLength: float = 2
var currentDirectionLength: float = 0
var currentDirection: Vector2 = Vector2(0,0)

func hit():
	print("Owie!")
	position = Vector2(0,0)
	
func _process(delta: float) -> void:
	moveFly(delta)
	
func moveFly(delta: float) -> void:
	if currentDirectionLength <= 0:
		changeDirection()
	position+=currentDirection*speed*delta
	currentDirectionLength-=delta
	
func changeDirection():
	var xDirection = randf_range(-1,1)
	var yDirection = randf_range(-1,1)
	currentDirection = Vector2(xDirection,yDirection)
	currentDirectionLength = randf_range(minDirectionLength,maxDirectionLength)
	
	

extends Area2D
class_name Fly

@export var speed: float = 100
@export var speedIncrementer: float = 10
@export var minDirectionLength: float = 0.5
@export var maxDirectionLength: float = 2
var currentDirectionLength: float = 0
var currentDirection: Vector2 = Vector2(0,0)
var isRespawning: bool = false

func hit():
	isRespawning = true
	print("Owie!")

	var size = get_viewport().get_visible_rect().size
	var xPosition = 0
	var yPosition = 0

	var whereOffScreen = randi_range(0, 2)  # 0 = both off, 1 = x only, 2 = y only

	# X Position
	if whereOffScreen == 2:
		xPosition = randf_range(0, size.x)  # On-screen X
	else:
		var leftOrRight = randi_range(0, 1)
		xPosition = -100 if leftOrRight == 0 else size.x + 100  # Off-screen X

	# Y Position
	if whereOffScreen == 1:
		yPosition = randf_range(0, size.y)  # On-screen Y
	else:
		var upOrDown = randi_range(0, 1)
		yPosition = -100 if upOrDown == 0 else size.y + 100  # Off-screen Y

	position = Vector2(xPosition, yPosition)

	# Optional difficulty tuning
	speed += speedIncrementer
	minDirectionLength = clamp(minDirectionLength - 0.05, 0.05, 0.5)
	maxDirectionLength = clamp(maxDirectionLength - 0.2, 0.2, 2)
	
func _process(delta: float) -> void:
	
	if !isRespawning:
		var viewport_rect = get_viewport().get_visible_rect()
		# If using global_position to track Area2D
		if not viewport_rect.has_point(global_position):
			OffScreen()
		moveFly(delta)
		return
	isRespawning = false
	
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
	
func OffScreen():
	var xDirection = currentDirection.x
	var yDirection = currentDirection.y
	var size = get_viewport().get_visible_rect().size
	if position.x<=0:
		xDirection = randf_range(0,1)
		#position = Vector2(0,position.y)
	elif position.x>= size.x:
		xDirection = randf_range(-1,0)
		#position = Vector2(size.x,position.y)
	if position.y <= 0:
		yDirection = randf_range(0,1)
		#position = Vector2(position.x,0)
	elif position.y >= size.y:
		yDirection = randf_range(-1,0)
		#position = Vector2(position.x,size.y)
	currentDirection = Vector2(xDirection,yDirection)
	currentDirectionLength = randf_range(minDirectionLength,maxDirectionLength)
			
	

	

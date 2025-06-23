extends Area2D

#Appears behind the glass but can't actually be killed

var currentDirectionLength: float = 1.5

var currentDirection: Vector2 = Vector2(0,0)

var speed = 200

func _ready() -> void:
	changeDirection()

func _process(delta: float) -> void:
	currentDirectionLength -= delta
	moveFly(delta)
	var viewport_rect = get_viewport().get_visible_rect()
		# If using global_position to track Area2D
	if not viewport_rect.has_point(global_position):
		OffScreen()
	
	
func moveFly(delta: float) -> void:
	if currentDirectionLength <= 0:
		changeDirection()
	position+=currentDirection*speed*delta
	
func changeDirection():
	var xDirection = randf_range(-1,1)
	var yDirection = randf_range(-1,1)
	currentDirection = Vector2(xDirection,yDirection)
	currentDirectionLength = 1.5
	
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
	currentDirectionLength = 1.5

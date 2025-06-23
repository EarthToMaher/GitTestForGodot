extends "res://Fly.gd"

signal uDied

@export var timeToDie: float = 10
var baseTimeToDie: float = 10
var animLength: float = 1
@export var scaleIncrement: Vector2 = Vector2(0.5,0.5)

func _ready() -> void:
	super()
	set_process(false)
	visible = false
	isRespawning = true
	baseTimeToDie = timeToDie
func hit():
	super()
	timeToDie = baseTimeToDie
func _process(delta: float):
	if timeToDie <= 0:
		attackPlayer(delta)
	else:
		super(delta)
func moveFly(delta: float) -> void:
	super(delta)
	timeToDie -= delta
	if timeToDie <= 0:
		play_sound()
		
func attackPlayer(delta: float):
	#print("YOU DIe")
	GameState.set_state(GameState.GameStateType.FAIL)
	$"../AudioStreamPlayer2D".volume_db = 20
	# Get center of viewport in global coordinates
	var center = get_viewport().get_visible_rect().size / 2
	# Direction vector from current position to center
	var direction = (center - global_position).normalized()
	 # Move toward center at speed * delta
	global_position += direction * speed * 2 * delta
	scale += scaleIncrement * delta
	scaleIncrement+=(scaleIncrement*delta)*10
	animLength -= delta
	if (animLength <= 0):
		GameState.game_over("You got killed by the wasp!")
		hide()

func play_sound():
	var sound = AudioStreamPlayer.new()
	sound.stream = load("res://bee_wasp-97053.mp3")
	sound.autoplay = false
	sound.volume_db = 30 #im gonna increase this by 1 each time people complain
	#FUCK YOU!!!!!!!
	add_child(sound)
	sound.play()
	

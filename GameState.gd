extends Node
var config=ConfigFile.new()

signal badfly

var boomer = false

var highscore = 0 

enum GameStateType{
	START,
	PLAYING,
	FAIL
}

var points : int = 0

var current_state : GameStateType = GameStateType.PLAYING
var game_over_screen: Control = null

signal state_changed(new_state)

func increment_points() -> void:
	points+=1
	#return points
	
func get_point () -> int:
	return points

func set_state(new_state: GameStateType):
	if new_state != current_state:
		current_state = new_state
		emit_signal("state_changed", new_state)

func game_over(gameOverLabelText : String):
	set_state(GameStateType.FAIL)
	if points > highscore:
		savecake(points)
	game_over_screen.show()
	game_over_screen.set_label_text(gameOverLabelText)
	game_over_screen.set_point_text(points)

func reset_points():
	points = 0

func savecake(points):
	highscore = points
	config.set_value("flykill","points",points)
	config.save("user://highscore.cfg")

#stole this from fnas 
func loadgift() -> Array:
	var err = config.load("user://highscore.cfg")
	print (err)
	if err == OK:
		var spoints = [config.get_value("flykill","points",)]
		highscore = spoints[0]
		return spoints
	else: 
		var myArray: Array[int] = [-1]
		return myArray

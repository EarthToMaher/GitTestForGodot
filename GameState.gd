extends Node


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
	game_over_screen.show()
	game_over_screen.set_label_text(gameOverLabelText)
	game_over_screen.set_point_text(points)

func reset_points():
	points = 0

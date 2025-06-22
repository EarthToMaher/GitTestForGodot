extends Node


enum GameStateType{
	START,
	PLAYING,
	FAIL
}

var current_state : GameStateType = GameStateType.PLAYING

signal state_changed(new_state)

func set_state(new_state: GameStateType):
	if new_state != current_state:
		current_state = new_state
		emit_signal("state_changed", new_state)

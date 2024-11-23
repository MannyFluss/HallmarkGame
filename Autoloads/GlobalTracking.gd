extends Node



var states = ["santa_dialogue_available","secret_ending_enabled"]

func has_state(state_name : String)->bool:
	return states.has(state_name)

func add_state(state_name : String)->void:
	states.append(state_name)

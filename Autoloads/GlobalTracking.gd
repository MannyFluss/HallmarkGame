extends Node



var states = ["santa_dialogue_available","secret_ending_enabled"]

var tracking_variables = {
	"your_name" : "Christine",
	"favorite_xmas_drink" : "hot chocolate",
	"favorite_xmas_song" : "all I want for chirstmas is you",
	"what_i_want" : "a new car",
	"what_i_really_want" : "I want santa",
	
}


func has_state(state_name : String)->bool:
	return states.has(state_name)

func add_state(state_name : String)->void:
	states.append(state_name)

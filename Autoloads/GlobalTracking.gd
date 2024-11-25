extends Node



var states = ["santa_dialogue_available","secret_ending_enabled"]

var tracking_variables = {
	"your_first_name" : "Christine",
	"your_last_name" : "Evergreen",
	
	"favorite_drink" : "hot chocolate",
	"favorite_food" : "Spiral Ham",
	"favorite_movie" : "Santa 2, slay again",
	"favorite_song": "yo mama",
	"what_i_want" : "a new car",
	
}



#fav song -
#fav cookie
#fav movie
#fav drink
#fav food


#first name
#last name

func has_state(state_name : String)->bool:
	return states.has(state_name)

func add_state(state_name : String)->void:
	states.append(state_name)

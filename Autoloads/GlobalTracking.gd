extends Node



var states = ["santa_dialogue_available","secret_ending_enabled"]

var tracking_variables = {
	"your_first_name" : "Christine",
	"your_last_name" : "Evergreen",
	
	"favorite_drink" : "hot chocolate",
	"favorite_food" : "Spiral Ham",
	"favorite_song": "Last Christmas I gave you my Fart",
	"favorite_cookie" : "choclate chip",
	"what_i_want" : "a new Xbox",
	
}




#@onready var favorite_song: TextEdit = %FavoriteSong
#@onready var childhood_meal: TextEdit = %ChildhoodMeal
#@onready var favorite_drink: TextEdit = %FavoriteDrink
#@onready var favorite_cookie: TextEdit = %FavoriteCookie
#@onready var what_i_want: TextEdit = %WhatIWant

#@onready var first_name: TextEdit = %FirstName
#@onready var last_name: TextEdit = %LastName


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

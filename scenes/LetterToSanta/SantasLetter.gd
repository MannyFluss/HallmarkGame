extends Node2D

@onready var letter_to_scroll: Node2D = $LetterToScroll

@onready var favorite_song: TextEdit = %FavoriteSong
@onready var childhood_meal: TextEdit = %ChildhoodMeal
@onready var favorite_drink: TextEdit = %FavoriteDrink
@onready var favorite_cookie: TextEdit = %FavoriteCookie
@onready var what_i_want: TextEdit = %WhatIWant
@onready var first_name: TextEdit = %FirstName
@onready var last_name: TextEdit = %LastName

signal continue_typing

@onready var all_of_the_text: RichTextLabel = %AllOfTheText

@onready
var letter_text = all_of_the_text.text

@onready
var init_position_letter : Vector2 = $LetterToScroll/Letter.position

@onready var the_text_edits: Control = %TheTextEdits


var tween : Tween = null

var space_counter = 0

var typing = true

var times_stopped_typing = 0

func _ready() -> void:
	all_of_the_text.text = ""
	for letter in letter_text:
		await get_tree().create_timer(randf_range(.01/2,.05/2)).timeout
		typing = true
		all_of_the_text.text += letter
		if letter == " ":
			space_counter += 1
		else:
			space_counter = 0
		if space_counter == 3:
			typing = false
			# enable the text edit biatch
			
			var curr = the_text_edits.get_child(times_stopped_typing)
			if curr:
				curr.visible = true
				var tween : Tween = get_tree().create_tween()
				tween.tween_property(curr,"self_modulate",Color(1,1,1,1),.5)
				if curr == %LastName:
					submit_appear()
			times_stopped_typing += 1
			
			await continue_typing
		
	
	pass

func submit_appear()->void:
	var tween : Tween = get_tree().create_tween()
	tween.tween_property($SubmitButton,"self_modulate",Color(1,1,1,1),.5)
	
func _on_button_pressed() -> void:
	if tween and tween.is_running():
		return
	if typing:
		return
	
	tween = get_tree().create_tween()
	var fuck = letter_to_scroll.position + Vector2(0,-300)
	fuck.y = max(fuck.y, -1000)
	
	tween.tween_property(letter_to_scroll,"position",fuck,1.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	continue_typing.emit()

func _on_submit_button_pressed() -> void:
	SceneSwitcher.SwitchScene("res://scenes/act1.2/Act1_2.tscn")
	
	

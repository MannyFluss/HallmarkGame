extends Node2D

@onready var letter_to_scroll: Node2D = $LetterToScroll

@onready var present_i_want_text_edit: TextEdit = %PresentIWantTextEdit
@onready var favorite_xmas_song_text_edit: TextEdit = %FavoriteXmasSongTextEdit
@onready var what_i_really_want_text_edit: TextEdit = %WhatIReallyWantTextEdit
@onready var favorite_xmas_drink_text_edit: TextEdit = %FavoriteXmasDrinkTextEdit
@onready var sign_my_name: TextEdit = %SignMyName

#fav song
#fav cookie
#fav movie
#fav drink
#fav food

#first name
#last name
signal continue_typing

@onready var all_of_the_text: RichTextLabel = %AllOfTheText

@onready
var letter_text = all_of_the_text.text

@onready var text_edits = [
	%PresentIWantTextEdit,
	%FavoriteXmasSongTextEdit,
	%WhatIReallyWantTextEdit,
	%FavoriteXmasDrinkTextEdit,
	%SignMyName
]
@onready
var init_position_letter : Vector2 = $LetterToScroll/Letter.position


var tween : Tween = null

var space_counter = 0


func _ready() -> void:
	all_of_the_text.text = ""
	for letter in letter_text:
		await get_tree().create_timer(randf_range(.01/2,.05/2)).timeout
		all_of_the_text.text += letter
		if letter == " ":
			space_counter += 1
		else:
			space_counter = 0
		if space_counter == 3:
			await continue_typing
		
	
	pass


func _on_button_pressed() -> void:
	if tween and tween.is_running():
		return
	
	tween = get_tree().create_tween()
	var fuck = letter_to_scroll.position + Vector2(0,-300)
	fuck.y = max(fuck.y, -1000)
	
	tween.tween_property(letter_to_scroll,"position",fuck,1.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	continue_typing.emit()

func _on_submit_button_pressed() -> void:
	for edit : TextEdit in text_edits:
		if edit.text == "":
			if tween:
				tween.kill()
			tween = get_tree().create_tween()
			tween.tween_property(letter_to_scroll,"position",Vector2.ZERO,1.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
			return
			
	
	GlobalTracking.tracking_variables["your_name"] = sign_my_name.text
	GlobalTracking.tracking_variables["favorite_xmas_drink"] = favorite_xmas_drink_text_edit.text
	GlobalTracking.tracking_variables["favorite_xmas_song"] = favorite_xmas_song_text_edit.text
	GlobalTracking.tracking_variables["what_i_want"] = present_i_want_text_edit.text
	GlobalTracking.tracking_variables["what_i_really_want"] = what_i_really_want_text_edit.text
	
	

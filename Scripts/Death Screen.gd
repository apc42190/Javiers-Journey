extends Node2D

var button : String
var yes_hovered = load("res://UI Elements/yes_button_pressed.png") 
var no_hovered = load("res://UI Elements/no_button_pressed.png") 
var yes_normal = load("res://UI Elements/yes_button.png") 
var no_normal = load("res://UI Elements/no_button.png") 


func _on_Yes_Button_pressed():
	get_tree().change_scene("res://Scenes/Level_1.tscn")

func _on_No_Button_pressed():
	get_tree().change_scene("res://Scenes/Start Screen.tscn")

func _ready():
	button = "yes"

func _process(delta):

	if button == "yes":
		get_node("Yes Button").set_normal_texture(yes_hovered)
		get_node("No Button").set_normal_texture(no_normal)
		if Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_down"):
			button = "no"
		if Input.is_action_just_pressed("jump"):
			_on_Yes_Button_pressed()
	elif button == "no":
		get_node("Yes Button").set_normal_texture(yes_normal)
		get_node("No Button").set_normal_texture(no_hovered)
		if Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_down"):
			button = "yes"
		if Input.is_action_just_pressed("jump"):
			_on_No_Button_pressed()

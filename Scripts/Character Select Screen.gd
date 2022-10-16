extends Node2D

onready var javier : AnimatedSprite = get_node("Javier")
onready var the_girl : AnimatedSprite = get_node("The Girl")

var javier_frames : SpriteFrames = preload("res://Animations/little_dude.res")
var the_girl_frames : SpriteFrames = preload("res://Animations/Leslie.res")
var the_girl_alternate_frames : SpriteFrames = preload("res://Animations/Leslie Alternate.res")

func _ready():
	GlobalVariables.character = javier_frames
	javier.play("Running")
	the_girl.play("Idle")

func _process(delta):
	if Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_left"):
		if javier.animation == "Running":
			GlobalVariables.character = the_girl_frames
			javier.play("Idle")
			the_girl.play("Running")
		else:
			GlobalVariables.character = javier_frames
			javier.play("Running")
			the_girl.play("Idle")
	if Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_down"):
		if the_girl.animation == "Running":
			if the_girl.frames == the_girl_frames:
				the_girl.frames = the_girl_alternate_frames
				GlobalVariables.character = the_girl_alternate_frames
			else:
				the_girl.frames = the_girl_frames
				GlobalVariables.character = the_girl_frames
	if Input.is_action_just_pressed("jump"):
		Audio.fade_out("Duty Free Baby")
		Audio.fade_in("Main Background")
		get_tree().change_scene("res://Scenes/Level_1.tscn")

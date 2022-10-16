extends Node2D

func _on_X_pressed():
	get_tree().change_scene("res://Scenes/Start Screen.tscn")

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		_on_X_pressed()

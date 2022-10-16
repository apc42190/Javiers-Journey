extends Node2D

func _ready():
	z_index = 100

func _process(delta):
	global_position.y -= 5 * delta 

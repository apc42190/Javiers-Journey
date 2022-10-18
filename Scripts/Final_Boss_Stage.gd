extends Node2D 

onready var clouds : ParallaxLayer = get_node("ParallaxBackground/Clouds")
onready var clouds_2 : ParallaxLayer = get_node("ParallaxBackground/Clouds2")
onready var player = get_node("Player")


func _ready():
	player.global_position = Vector2(-55, 79)
	player.last_checkpoint_location = player.global_position



func _process(delta):
	if Input.is_action_just_pressed("reset_level"):
		get_tree().change_scene(get_tree().current_scene.filename)
		
	move_clouds(delta)


func move_clouds(delta):
	clouds.motion_offset.x += 1 * delta
	clouds_2.motion_offset.x += 2 * delta


func _on_End_Game_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			body.top_speed = 0
			body.jump_force = 0
			var credits = load("res://Scenes/Credits.tscn")
			var instance = credits.instance()
			instance.global_position = Vector2(528, 230)
			add_child(instance)
			print(instance)


func _on_End_Music_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			Audio.fade_out("Main Background")
			Audio.fade_out("Duty Free Baby")

			var music = get_node("Everlasting Sleep")
			if !music.is_playing():
				music.play()

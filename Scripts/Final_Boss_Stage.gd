extends Node2D 

onready var clouds : ParallaxLayer = get_node("ParallaxBackground/Clouds")
onready var player = get_node("Player")


func _ready():
	player.global_position = Vector2(-55, 79)



func _process(delta):
	if Input.is_action_just_pressed("reset_level"):
		get_tree().change_scene(get_tree().current_scene.filename)
		
	move_clouds(delta)


func move_clouds(delta):
	clouds.motion_offset.x += 1 * delta
	if clouds.motion_offset.x > 128:
		clouds.motion_offset.x = 0


func _on_End_Game_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			body.top_speed = 0
			body.jump_force = 0
			var credits = load("res://Scenes/Credits.tscn")
			var instance = credits.instance()
			instance.global_position = Vector2(528, 200)
			add_child(instance)
			print(instance)

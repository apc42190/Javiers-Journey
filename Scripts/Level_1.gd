extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("reset_level"):
		get_tree().change_scene(get_tree().current_scene.filename)


func _on_Down_The_Well_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D1/AnimatedSprite")
			sprite.play("Wave")
			var position : Vector2 = get_node("Checkpoints/Down/Checkpoint D1").global_position
			body.last_checkpoint_location = position
			GlobalVariables.last_major_checkpoint_location = position


func _on_Checkpoint_D2_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D2/AnimatedSprite")
			sprite.play("Wave")
			body.last_checkpoint_location = get_node("Checkpoints/Down/Checkpoint D2").global_position


func _on_Checkpoint_D3_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D3/AnimatedSprite")
			sprite.play("Wave")
			var position : Vector2 = get_node("Checkpoints/Down/Checkpoint D3").global_position
			body.last_checkpoint_location = position
			GlobalVariables.last_major_checkpoint_location = position



func _on_Checkpoint_D4_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D4/AnimatedSprite")
			sprite.play("Wave")
			body.last_checkpoint_location = get_node("Checkpoints/Down/Checkpoint D4").global_position


func _on_Checkpoint_D5_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D5/AnimatedSprite")
			sprite.play("Wave")
			var position : Vector2 = get_node("Checkpoints/Down/Checkpoint D5").global_position
			body.last_checkpoint_location = position
			GlobalVariables.last_major_checkpoint_location = position


func _on_Checkpoint_D6_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D6/AnimatedSprite")
			sprite.play("Wave")
			var position : Vector2 = get_node("Checkpoints/Down/Checkpoint D6").global_position
			body.last_checkpoint_location = position
			GlobalVariables.last_major_checkpoint_location = position


func _on_Checkpoint_D7_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Down/Checkpoint D7/AnimatedSprite")
			sprite.play("Wave")
			body.last_checkpoint_location = get_node("Checkpoints/Down/Checkpoint D7").global_position


func _on_Portal_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var position : Vector2 = get_node("Checkpoints/Down/Checkpoint D7").global_position
			body.global_position = position


func _on_Checkpoint_U1_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			Audio.fade_out("Main Background")
			Audio.fade_in("Duty Free Baby")
			var sprite : AnimatedSprite = get_node("Checkpoints/Up/Checkpoint U1/AnimatedSprite")
			sprite.play("Wave")
			var position : Vector2 = get_node("Checkpoints/Up/Checkpoint U1").global_position
			body.last_checkpoint_location = position
			GlobalVariables.last_major_checkpoint_location = position


func _on_Checkpoint_U2_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Up/Checkpoint U2/AnimatedSprite")
			sprite.play("Wave")
			body.last_checkpoint_location = get_node("Checkpoints/Up/Checkpoint U2").global_position


func _on_Checkpoint_U3_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Up/Checkpoint U3/AnimatedSprite")
			sprite.play("Wave")
			var position : Vector2 = get_node("Checkpoints/Up/Checkpoint U3").global_position
			body.last_checkpoint_location = position
			GlobalVariables.last_major_checkpoint_location = position


func _on_Checkpoint_U4_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Up/Checkpoint U4/AnimatedSprite")
			sprite.play("Wave")
			body.last_checkpoint_location = get_node("Checkpoints/Up/Checkpoint U4").global_position


func _on_Checkpoint_U5_body_entered(body):
		if body:
			if body.is_in_group("Player"):
				var sprite : AnimatedSprite = get_node("Checkpoints/Up/Checkpoint U5/AnimatedSprite")
				sprite.play("Wave")
				var position : Vector2 = get_node("Checkpoints/Up/Checkpoint U5").global_position
				body.last_checkpoint_location = position
				GlobalVariables.last_major_checkpoint_location = position


func _on_Checkpoint_U6_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			var sprite : AnimatedSprite = get_node("Checkpoints/Up/Checkpoint U6/AnimatedSprite")
			sprite.play("Wave")
			body.last_checkpoint_location = get_node("Checkpoints/Up/Checkpoint U6").global_position


func _on_Boss_body_entered(body):
	if body:
			if body.is_in_group("Player"):
				var sprite : AnimatedSprite = get_node("Checkpoints/Boss/AnimatedSprite")
				sprite.play("Wave")
				var position : Vector2 = get_node("Checkpoints/Boss").global_position
				body.last_checkpoint_location = position
				GlobalVariables.last_major_checkpoint_location = position


func _on_Boss_Portal_body_entered(body):
	if body:
		if body.is_in_group("Player"):
				get_tree().change_scene("res://Scenes/Final_Boss_Stage.tscn")

extends StaticBody2D

var stand_counter : float = 0.0
var state : String = "idle"
onready var sprite : AnimatedSprite = get_node("AnimatedSprite")

func _process(delta):
	if state == "idle":
		get_node("CollisionShape2D").set_deferred("disabled", false)
		sprite.play("Reform")
	elif state == "crumbling" and stand_counter > 0.5 and stand_counter < 1:
		sprite.play("Crumble")
	elif state == "crumbling" and stand_counter > 1 and stand_counter < 3.0:
		get_node("CollisionShape2D").set_deferred("disabled", true)
	elif state == "crumbling" and stand_counter >= 3.0:
		state = "idle"
		stand_counter = 0
	if state == "crumbling":
		stand_counter += delta

func _on_Area2D_body_entered(body):
	if body:
		if body.is_in_group("Player"):
			state = "crumbling"

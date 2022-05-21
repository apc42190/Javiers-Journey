extends ParallaxBackground

onready var clouds : ParallaxLayer = get_node("Clouds")

func _process(delta):
	clouds.motion_offset.x += 1 * delta
	if clouds.motion_offset.x > 128:
		clouds.motion_offset.x = 0

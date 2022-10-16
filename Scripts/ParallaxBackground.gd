extends ParallaxBackground

onready var clouds : ParallaxLayer = get_node("Clouds")
onready var clouds_2 : ParallaxLayer = get_node("Clouds2")


func _process(delta):
	clouds.motion_offset.x += 1 * delta
	if clouds.motion_offset.x > 128:
		clouds.motion_offset.x = 0
	clouds_2.motion_offset.x += 1.5 * delta
	if clouds_2.motion_offset.x > 128:
		clouds_2.motion_offset.x = 0

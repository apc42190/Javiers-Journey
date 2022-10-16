extends Node2D

onready var freeby : AudioStreamPlayer = get_node("Duty Free Baby")

onready var tween_in : Tween =  get_node("Tween_In")
onready var tween_out : Tween =  get_node("Tween_Out")


func fade_in(to):
	var stream_player = get_node(to)
	stream_player.play()
	tween_in.interpolate_property(stream_player, "volume_db", stream_player.volume_db, -10, 4.0, 0, Tween.EASE_IN, 0)
	tween_in.start()
	

func fade_out(from):
	var stream_player = get_node(from)
	tween_out.interpolate_property(stream_player, "volume_db", stream_player.volume_db, -80, 4.0, 0, Tween.EASE_OUT, 0)
	tween_out.start()


func _ready():
	freeby.play(0)
	print(get_tree().get_current_scene())


func _process(delta):
	pass

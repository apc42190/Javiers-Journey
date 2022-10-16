extends CanvasLayer

var button : String = "start"

var start_hovered = load("res://UI Elements/start_button_pressed.png") 
var start_normal = load("res://UI Elements/start_button.png") 
var quit_hovered = load("res://UI Elements/quit_button_pressed.png") 
var quit_normal = load("res://UI Elements/quit_button.png") 
var controls_hovered = load("res://UI Elements/controls_button_pressed.png") 
var controls_normal = load("res://UI Elements/controls_button.png") 


func _ready():
	OS.set_window_maximized(true)
	GlobalVariables.last_major_checkpoint_location = Vector2(0, 60)

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Character Select Screen.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Controls_pressed():
	get_tree().change_scene("res://Scenes/Controls Screen.tscn")
	
func _process(delta):
	if button == "start":
		get_node("Start").set_normal_texture(start_hovered)
		get_node("Quit").set_normal_texture(quit_normal)
		get_node("Controls").set_normal_texture(controls_normal)
		if Input.is_action_just_pressed("move_up"):
			button = "controls"
		elif Input.is_action_just_pressed("move_down"):
			button = "quit"
		if Input.is_action_just_pressed("jump"):
			_on_Start_pressed()
	elif button == "quit":
		get_node("Quit").set_normal_texture(quit_hovered)
		get_node("Start").set_normal_texture(start_normal)
		get_node("Controls").set_normal_texture(controls_normal)
		if Input.is_action_just_pressed("move_up"):
			button = "start"
		elif Input.is_action_just_pressed("move_down"):
			button = "controls"
		if Input.is_action_just_pressed("jump"):
			_on_Quit_pressed()
	elif button == "controls":
		get_node("Controls").set_normal_texture(controls_hovered)
		get_node("Start").set_normal_texture(start_normal)
		get_node("Quit").set_normal_texture(quit_normal)
		if Input.is_action_just_pressed("move_up"):
			button = "quit"
		elif Input.is_action_just_pressed("move_down"):
			button = "start"
		if Input.is_action_just_pressed("jump"):
			_on_Controls_pressed()

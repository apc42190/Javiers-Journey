extends KinematicBody2D


var vel : Vector2 = Vector2()
var input_direction : Vector2 = Vector2()

export var top_speed : int = 45
export var acceleration : int = 55
export var deceleration : int = 30
export var speed_power : float = 0.96

export var jump_force : int = 65
var jump_timer : float = 0.0
var coyote_time : float = 0.1
export var gravity : int = 135
export var jump_cut_mult : float = 0.4
export var fall_gravity_mult : float = 2.5
var max_fall_speed : int = 300

var double_jump_available : bool = true

export var slide_gravity : int = 5

var state : String = "idle"
var direction : String = "right"
onready var sprite : AnimatedSprite = get_node("AnimatedSprite")

var last_checkpoint_location : Vector2 = Vector2(0, 60)
var respawn_disable_time : float = 0.5
var respawn_timer : float = respawn_disable_time


func update_input_direction(delta):
	if respawn_timer < respawn_disable_time:
		input_direction = Vector2(0, 0)
		respawn_timer += delta
		return
	elif respawn_timer > 500:
		respawn_timer = 2
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	input_direction.x = round(input_direction.x)
	input_direction.y = round(input_direction.y)


func update_movement(delta):
	var desired_speed : float = top_speed * input_direction.x
	var speed_difference : float = desired_speed - vel.x
	var desired_acceleration : float = 0.0
	if sign(desired_speed) == sign(vel.x):
		desired_acceleration = acceleration
	else:
		desired_acceleration = deceleration
	vel.x += pow(abs(speed_difference) * desired_acceleration, speed_power) * sign(speed_difference) * delta
	if abs(vel.x) < 0.5:
		vel.x = 0.0

func jump_and_fall(delta):
	if is_on_floor():
		jump_timer = 0.0
	else:
		if is_on_wall():
			jump_timer = 0.0
		jump_timer += delta
		if vel.y < 0:
			vel.y += gravity * delta
			if !Input.is_action_pressed("jump"):
				vel.y += abs(vel.y * (1 - jump_cut_mult))
		elif vel.y <= max_fall_speed:
			vel.y += gravity * delta * fall_gravity_mult
	if jump_timer < coyote_time and Input.is_action_just_pressed("jump"):
		vel.y = -jump_force
		$Sound_Jump.play(0.2)
		
func double_jump():
	if is_on_floor() or is_on_wall():
		double_jump_available = true
	if Input.is_action_just_pressed("jump") and double_jump_available == true and jump_timer > coyote_time:
		if !is_on_wall() and !is_on_floor():
			vel.y = -jump_force
			double_jump_available = false
			$Sound_Double_Jump.play()
			
			
func wall_jump():
	if is_on_wall() and Input.is_action_just_pressed("jump"):
		vel.x = get_slide_collision(0).normal.x * jump_force * 2
		vel.y = -jump_force

func wall_slide():
	if state == "sliding":
		vel.y = slide_gravity

func update_direction():
	if vel.x > 0 and direction == "left":
		self.scale.x *= -1
		direction = "right"
	elif vel.x < 0 and direction == "right":
		self.scale.x *= -1
		direction = "left"

func update_state():
	if is_on_floor() and vel.x == 0:
		state = "idle"
	elif is_on_floor() and vel.x != 0:
		state = "running"
	elif is_on_wall() and -input_direction.x == get_slide_collision(0).normal.x and vel.y >= 0:
		state = "sliding"
	elif vel.y > 0:
		state = "falling"
	elif vel.y < 0:
		state = "jumping"
		
func update_animation():
	if state == "idle":
		sprite.play("Idle")
	elif state == "sliding" or is_on_wall():
		sprite.play("Sliding")
	elif state == "running":
		sprite.play("Running")
	elif state == "jumping":
		sprite.play("Jump Up")
	elif state == "falling":
		sprite.play("Fall Down")
		
func die():
	if get_slide_count() > 0:
		if get_slide_collision(0).collider.is_in_group("Spikes"):
			respawn_timer = 0.0
			global_position = last_checkpoint_location

func _ready():
	sprite.frames = GlobalVariables.character
	if sprite.frames != load("res://Animations/little_dude.res"):
		sprite.scale = Vector2(0.9, 0.9)
	if GlobalVariables.last_major_checkpoint_location:
		global_position = GlobalVariables.last_major_checkpoint_location

func _physics_process(delta):

	vel = move_and_slide_with_snap(vel, Vector2.DOWN, Vector2.UP)
	update_input_direction(delta)
	update_movement(delta)
	jump_and_fall(delta)
	double_jump()
	wall_slide()
	wall_jump()
	die()

	update_direction()
	update_state()
	update_animation()

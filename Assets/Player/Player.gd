extends KinematicBody2D

var motion = Vector2(0,0)
export var run_speed = 900
export var jump_speed = 2300


const GRAVITY = 100
const UP = Vector2(0,-1)

signal animate

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	move_and_slide(motion, UP)
	print("is on wall: %d", is_on_wall())
	print("is on floor: %d", is_on_floor())
	print("motion.y = %f", motion.y)
	print("motion.x = %f", motion.x)


func _process(delta):
	animate()


func apply_gravity():
	if is_on_floor() or is_on_ceiling():
		motion.y = GRAVITY
	else:
		motion.y += GRAVITY



func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= jump_speed


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -run_speed
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = run_speed
	else:
		motion.x = 0


func animate():
	emit_signal("animate",motion)

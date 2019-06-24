extends KinematicBody2D

const GRAVITY = 20
const SPEED = 150
const MAX_JUMP = 450
const UP = Vector2(0, -1)
var velocity = Vector2()
var motion = Vector2()


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move_player(delta)


func move_player(delta):
	var dir = 0
	var esq = 0
	
	if Input.is_action_pressed("move_dir"):
		dir = 1
		if is_on_floor():
			$sprite.play("run")
			$sprite.flip_h = false
	elif Input.is_action_pressed("move_esq"):
		esq = -1
		if is_on_floor():
			$sprite.play("run")
			$sprite.flip_h = true
	else:
		if is_on_floor():
			$sprite.play("idle")
	
	
	if !is_on_floor():
		velocity.y += GRAVITY
	else:
		velocity.y = 0

	if is_on_floor() && Input.is_action_pressed("jump"):
		velocity.y =  -MAX_JUMP
		$sprite.play("jump")
	
	if is_on_ceiling():
		velocity.y = GRAVITY
	
	velocity.x = SPEED * (dir + esq)
	motion = velocity * delta * 100
	motion = move_and_slide(motion, UP)


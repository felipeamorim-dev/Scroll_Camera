extends Camera2D

var prox_pos = Vector2()

func _ready():
	
	pass

func _process(delta):
	position = lerp(position, prox_pos, 6*delta)

func on_move_camera(position_sala):
	prox_pos = position_sala

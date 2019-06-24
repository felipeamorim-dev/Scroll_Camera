extends Area2D

onready var camera = get_parent().get_parent().get_node("camera")
const SALA_OFFSET = Vector2(160, 144)

signal move_camera(position_sala)

func _ready():
	self.connect("move_camera", camera, "on_move_camera")

func _on_sala_body_entered(body):
	if body.name == "cuphead":
		var sala_pos = position - SALA_OFFSET
		emit_signal("move_camera", sala_pos)
	pass

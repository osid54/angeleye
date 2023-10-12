extends Node2D

@export onready var target := ""
func _process(delta):
	look_at(get_global_mouse_position())

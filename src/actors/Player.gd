extends Area2D

@export var speed := 500.0
@export var turnSpeed := 1.0

var mouseDetected := false

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	if !mouseDetected:
		turnToMouse()
		moveToMouse(delta)
		GameData.playerPos = position

func mouseDetection(state:bool):
	mouseDetected = state

func moveToMouse(delta:float):
	var vel = GameData.mousePos - self.position
	vel = vel.normalized() * delta * speed 
	position += vel

func turnToMouse():
	look_at(get_global_mouse_position())

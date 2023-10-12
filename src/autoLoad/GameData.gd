extends Node

signal score_updated
signal player_died

@export var lives := 3: set = setLives

var score := 0: set = setScore
var playerPos : Vector2: set = setPos
var mousePos : Vector2: set = setMouse
var isAlive := true: set = setAlive

func reset():
	score = 0
	
func setScore(value: int):
	score = value
	emit_signal("score_updated")

func setPos(value: Vector2):
	playerPos = value
	
func setMouse(value: Vector2):
	mousePos = value
	
func setAlive(value: bool):
	isAlive = value
	
func setLives(value: int):
	lives = value
	
func _process(delta):
	if isAlive and lives <= 0:
		isAlive = false
		print("deth")
		emit_signal("player_died")

extends "res://src/projectiles/Projectile.gd"

func _ready():
	startVelocity = 75
	jitter = 10
	super._ready()

func onAreaEntered(area):
	hit(area)

extends "res://src/projectiles/Projectile.gd"

func _ready():
	startVelocity = 500
	jitter = 1
	super._ready()

func onAreaEntered(area):
	hit(area)

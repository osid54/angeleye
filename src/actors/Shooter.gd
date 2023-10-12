extends Node2D

@export var projectile : PackedScene

var shots := 0
var maxShots := 1 
var readyToShoot := false

func _ready():
	pass

func _process(delta):
	$Marker2D.look_at(GameData.playerPos)

func shoot():
	var p = projectile.instantiate()
	add_child(p)
	p.velocity = p.startVelocity * (1.0 + 0.01 * maxShots)
	shots += 1

func shotDelay():
	if readyToShoot and shots < maxShots:
		shoot()
	elif shots == maxShots:
		readyToShoot = false
		shots = 0
		maxShots += 1
		$reloadTimer.start(randf_range(1,5))
	
func isReloaded():
	readyToShoot = true

func onHit():
	shots = 0
	maxShots = 1
	$reloadTimer.start(randf_range(1,5))

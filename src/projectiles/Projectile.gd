extends Area2D

@export var deathParticles : PackedScene

var startVelocity := 0
var maxDist := 10000
var velocity := startVelocity
var jitter := 0.0
var alive := true

func _ready():
	rotation = get_parent().get_node("Marker2D").rotation
	jitter = jitter *PI/180
	rotation += randf_range(-jitter,jitter)
	
func _physics_process(delta):
	position += transform.x * velocity * delta
	if abs(position.x) > maxDist or abs(position.y) > maxDist:
		queue_free()

func hit(area):
	if alive:
		GameData.lives -= 1
		print("hit")
		var shooters = get_parent().get_parent().get_children();
		for s in shooters:
			if s.get_class() == "Node2D":
				s.onHit()
		death()
		alive = false

func death():
	$ProjectileSprite.visible = false
	var dp = deathParticles.instantiate()
	add_child(dp)
	velocity = 0
	$GPUParticles2D.emitting = false
	dp.emitting = true
	await get_tree().create_timer(1).timeout
	queue_free()

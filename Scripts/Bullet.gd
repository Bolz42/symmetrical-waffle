extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 500
const DAMAGE = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	linear_velocity.x = cos(rotation) * SPEED
	linear_velocity.y = sin(rotation) * SPEED

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Bullet_body_entered( body ):
	if body.has_method("damage"):
		body.damage(DAMAGE)
	if body.has_method("damage_on_tile"):
		body.damage_on_tile(get_node("HitPoint").global_position, DAMAGE)
	queue_free()
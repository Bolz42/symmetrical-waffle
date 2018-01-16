extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 500


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	linear_velocity.x = cos(rotation) * SPEED
	linear_velocity.y = sin(rotation) * SPEED

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

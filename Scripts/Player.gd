extends KinematicBody2D

const WALK_SPEED = 200
var direction = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# mouvement du personnage :
		
	if Input.is_action_pressed("ui_up"):
		direction.y = -WALK_SPEED
	elif Input.is_action_pressed("ui_down"):
		direction.y = WALK_SPEED
	else: 
		direction.y = 0

	if Input.is_action_pressed("ui_left"):
		direction.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		direction.x = WALK_SPEED
	else:
		direction.x = 0
	
	move_and_slide(direction)
	
	#Animation du personnage :
	if direction == Vector2():
		$AnimationPlayer.play("Idle")
	elif $AnimationPlayer.get_current_animation() != "Walk":
		$AnimationPlayer.play("Walk")
	
	#Visée du personnage :
	

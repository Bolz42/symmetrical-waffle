extends KinematicBody2D

const WALK_SPEED = 200

var Bullet = preload("res://Scenes/Bullet.tscn")

var direction = Vector2()
var aim = Vector2()
var aim_angle = 0

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
	set_rotation(PI+get_position().angle_to_point(get_viewport().get_mouse_position()))
#	aim.x = get_viewport().get_mouse_position().x - .get_position().x
#	aim.y = get_viewport().get_mouse_position().y - .get_position().y
#	if aim.y >= 0 : 
#		aim_angle = acos(aim.x/sqrt(aim.x*aim.x+aim.y*aim.y)) 
#	else: 
#		aim_angle = 2*PI-acos(aim.x/sqrt(aim.x*aim.x+aim.y*aim.y))
#	.set_rotation(aim_angle)
	
	#tir
	var shootcd = get_node("ShootCooldown")
	if Input.is_action_pressed("shoot") and shootcd.is_stopped():
		var newbullet = Bullet.instance()
		newbullet.rotation = rotation
		newbullet.position = get_node("ShootSpawn").global_position
		get_parent().add_child(newbullet)
		shootcd.start()

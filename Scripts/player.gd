extends CharacterBody2D

signal togglekillthingy(trueorfalse)
const KILLTHINGY = preload("res://Scenes/killthingy.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

const VENTMID = preload("res://Scenes/ventmid.tscn")
const WATERDOWN = preload("res://Scenes/waterdown.tscn")
@onready var spawnobstaclestimer = $spawnobstaclestimer
var timercounter = 0
var obstacletracker = 0

@onready var dieanim = $dieanim
@onready var gameover = $"../gameover"
var dying = false

func _ready():
	ventreset()
	waterreset()
	spawnobstaclestimer.start()
	gameover.hide()

func _physics_process(delta):
	# Handle jump.
	if not dying:
		if Input.is_action_pressed("ui_accept") and velocity.y > JUMP_VELOCITY:
			velocity.y -= 50
			emit_signal("togglekillthingy",true)
			#print("not maxd")
		elif Input.is_action_pressed("ui_accept") and velocity.y <= JUMP_VELOCITY:
			velocity.y = JUMP_VELOCITY
			emit_signal("togglekillthingy",true)
			#print("max")
		else:
			velocity.y += gravity * delta
			emit_signal("togglekillthingy",false)
		move_and_slide()

func waterreset():
	var upordown = randi() % 2 + 1 #random int of 1 or 2
	if upordown == 1:
		var up = WATERDOWN.instantiate()
		up.position.y = up.position.y * -1 -30
		get_parent().call_deferred("add_child",up)
	elif upordown == 2:
		var down = WATERDOWN.instantiate()
		get_parent().call_deferred("add_child",down)

func ventreset():
	var vent = VENTMID.instantiate()
	vent.position.y = randf_range(-128,128)
	get_parent().call_deferred("add_child",vent)

func _on_despawner_area_entered(area):
	print("contact")
	print(area)
	area.queue_free()
	if obstacletracker == 1:
		waterreset()
		obstacletracker -= 1
	else:
		ventreset()
		obstacletracker += 1
		
func _on_spawnobstaclestimer_timeout():
	ventreset()
	waterreset()
	if timercounter < 3:
		spawnobstaclestimer.start()
		timercounter += 1

func death():
	dying = true
	dieanim.play("death")
	print("playing")
	await dieanim.animation_finished
	print("played")
	gameover.gameoverfunc()
	

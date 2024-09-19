extends Area2D

#const GAME_SCENE = preload("res://Scenes/Game Scene.tscn")
@onready var gamescene = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("ui_accept"):
		queue_free()


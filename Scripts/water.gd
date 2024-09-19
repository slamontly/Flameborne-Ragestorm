extends Area2D
#FUCK WATERUP BRUH WTF THIS GUY JUST DOES NOT WANT TO WORK
# NAHHH BRUHHH IM REPLACING U WITH ONLY WATER TMR SCREW UUUUUUUUU >:C

@onready var player = get_parent().get_node("player")
@onready var game_scene = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
		if not player.dying:
			position.x -= 4
		if position.x <= -1500:
			queue_free()

func _on_body_entered(_body):
	player.death()
	print("u are dead by hydration")
	#save_to_file(game_scene.distance)

#func save_to_file(content):
	#var file = FileAccess.open("user://highscore.dat", FileAccess.WRITE)
	#file.store_string(content)


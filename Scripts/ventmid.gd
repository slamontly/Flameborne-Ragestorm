extends Area2D

@onready var player = get_parent().get_node("player")

func _physics_process(_delta):
	if not player.dying:
		position.x -= 4
	if position.x <= -1500:
		queue_free()

func _on_body_entered(_body):
	#print(self.name)
	#print(body.name)
	player.death()
	print("u are dead by amongus")

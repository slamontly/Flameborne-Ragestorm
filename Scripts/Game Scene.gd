extends Node2D

const KILLTHINGY = preload("res://Scenes/killthingy.tscn")
var numberofkillthingies = 0
@onready var score = $score
@onready var scoretimer = $scoretimer
@onready var player = $player
#const global = preload("res://Scripts/global.gd")
@onready var gameover = $gameover

var distance = 0
const SAVEFILE = "user://savefile.save"

func _ready():
	scoretimer.start()

#func load_from_file():
	#var file = FileAccess.open("C:/Users/User/Documents/godot projects/Flameborne Ragestorm (Project 2)", FileAccess.READ)
	#var content = file.get_as_text()
	#return content	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	score.text = "Score: " + str(distance) + "m \n" #+ "High score: " + str(highscore)\
	if distance > gameover.showscore():
		savehighscore()

func _on_player_togglekillthingy(trueorfalse):
	#print(numberofkillthingies)
	if trueorfalse == true and numberofkillthingies <= 0:
		var k = KILLTHINGY.instantiate()
		add_child(k)
		numberofkillthingies += 1
		#print("o shit")

func _on_child_exiting_tree(node):
	if node.name == "killthingy":
		numberofkillthingies -= 1

func _on_scoretimer_timeout():
	if not player.dying:
		distance += 1

func savehighscore():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(distance)

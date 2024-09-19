extends CanvasLayer
@onready var score = $"../score"

const GameScene = preload("res://Scripts/Game Scene.gd")
const SAVEFILE = "user://savefile.save"
var highscore = 0

func _on_retry_pressed():
	get_tree().reload_current_scene()

func gameoverfunc():
	highscore = showscore()
	$finalscore.text = score.text + "\n" + "High score: " + str(highscore)
	self.show()
	
func showscore():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		var highscore = file.get_32()
		return(highscore)

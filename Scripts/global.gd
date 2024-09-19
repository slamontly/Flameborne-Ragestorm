extends Node

const SAVEFILE = "user://savefile.save"
var defaultvalue : int = 0

func _ready():
	if not FileAccess.file_exists(SAVEFILE):
		var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
		file.store_32(defaultvalue)

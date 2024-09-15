extends Node2D

@onready var mainNode = $".."

func _on_visibility_changed() -> void:
	_update()

func _update():
	mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]]["objects"]

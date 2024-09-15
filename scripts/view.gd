extends Node2D

@onready var mainNode = $".."
var isReady = false

func _ready():
	isReady = true

func _on_visibility_changed() -> void:
	if !isReady:
		return
	_update()

func _update():
	for node in children():
		if node is Sprite2D:
			if node.name != "base"
	mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]]["objects"]

extends Node2D

@onready var cor = {
	"u":$doorNorth,
	"d":$doorSouth,
	"l":$doorEast,
	"r":$doorWest,
}

func update(mainNode):
	for node in get_children():
		if node is Sprite2D:
			if node.name != "compassbase":
				node.visible = false
	var canGo = mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]]["canGo"]
	for dir in cor.keys():
		if dir in canGo:
			cor[dir].visible=true

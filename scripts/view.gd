extends Node2D

@onready var mainNode = $".."
@onready var textenter = $"../message enter"
var isReady = false
var scaled = false

@onready var objList = {
	"pizza":$pizza,
	"table":$table,
	"sign":$sign,
	"hacker":$evil,
	"obj":$box,
	"objFloor":$boxFloor,
	"ldoor":$doorL,
	"rdoor":$doorR,
	"udoor":$doorF,
	"letter":$letter,
	"furnace":$furnace,
	"painting":$painting,
	"egg":$egg,
}

func _ready():
	isReady = true

func _input(event):
	if event.is_action_pressed("entermsg"):
		if textenter.viewing:
			scaled = !scaled
			_update()


func _on_visibility_changed() -> void:
	if !isReady:
		return
	_update()

func _update():
	var hasTable = false
	
	print(scaled)
	scale = Vector2(1+int(scaled),1+int(scaled))
	
	$compass.update(mainNode)
	for node in get_children():
		if node is Sprite2D:
			if node.name != "base":
				node.visible = false
	$doorL/barricadeL.visible = false
	$doorR/barricadeR.visible = false
	$doorF/barricadeF.visible = false
	var objects = mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]]["objects"]
	var paths = mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]]["canGo"]
	var barricades = mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]]["barricades"] 
	
	for obj in objList.keys():
		if obj in objects:
			objList[obj].visible=true #show all appropriate things
			if obj == "table":
				hasTable = true

	for door in objList.keys():
		if door.left(1) in paths:
			objList[door].visible=true #show all appropriate doors

	for barricade in objList.keys():
		if barricade.left(1) in barricades:
			objList[barricade].visible=true
			objList[barricade].get_child(0).visible=true#barricades overwrite
	

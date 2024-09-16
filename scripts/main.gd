extends Node2D

var inventory = [] #max 8 items  (?)

var playerLoc = [0,0] # Spawns the player at 0,0 (x,y). x=0 y=0 at topleft
	

func _process(delta: float) -> void:
	#musicHandler
	if $generalSoundPlayer.playing:
		$music.stream.set_sync_stream_volume(1,-60)
	else:
		$music.stream.set_sync_stream_volume(1,0)

# Defines the map. Quick overview of things you can put in objects:
# canGo - decides what directions the player can go, "r"-right,"u"-up,"d"-down,"l"-left
# objects - defines the objects in the room
var map = [ 
	[{"canGo":[],"objects":["pizza","table"],"barricades":["r"]},{"canGo":["l","r"],"objects":["sign","table","letter"],"barricades":[""]},{"canGo":["l","r"],"objects":["furnace"],"barricades":["d"]},{"canGo":["l"],"objects":["painting"],"barricades":[""]}],
	[{},{},{},{}],
	[{},{},{},{}],
	[{},{},{},{}]
]
var mapIDs = [ 
	[1,2,3,4],
	[5,6,7,8],
	[9,10,11,12],
	[13,14,15,16]
]
#Note: when checking the map, y goes first then x

func removeObject(objToRemove: String):
	var objects = map[playerLoc[1]][playerLoc[0]]["objects"]
	objects[objects.find(objToRemove)] = "empty" #set object to empty

func openWalls(wallsToRemove: Array):
	var canGo = map[playerLoc[1]][playerLoc[0]]["canGo"]
	var barricades = map[playerLoc[1]][playerLoc[0]]["barricades"]
	for wall in wallsToRemove:
		if wall not in canGo:
			canGo.append(wall)
			if wall in barricades:
				barricades.erase(wall)

func get_objects_in_current_room():
	var objects = map[playerLoc[1]][playerLoc[0]]["objects"]
	return objects

func get_room_by_id(room_id) -> Variant:
	for row in range(mapIDs.size()):
		for col in range(mapIDs[row].size()):
			if mapIDs[row][col] == room_id:
				return map[row][col] # Return the corresponding room from map
	return

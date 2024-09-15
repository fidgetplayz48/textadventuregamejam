extends Node2D

var inventory = [] #max 8 items  (?)

var playerLoc = [0,0] # Spawns the player at 0,0 (x,y). x=0 y=0 at topleft
	
# Defines the map. Quick overview of things you can put in objects:
# canGo - decides what directions the player can go, "r"-right,"u"-up,"d"-down,"l"-left
# objects - defines the objects in the room
var map = [ 
	[{"canGo":[],"objects":["pizza"]},{},{},{}],
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
	for wall in wallsToRemove:
		if wall not in canGo:
			canGo.append(wall)
			print(map)
			

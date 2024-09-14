extends Node2D

var inventory = [] #max 8 items  (?)


var playerLoc = [0,0] # Spawns the player at 0,0 (x,y). x=0 y=0 at topleft
	
# Defines the map. Quick overview of things you can put in objects:
# canGo - decides what directions the player can go, "r"-right,"u"-up,"d"-down,"l"-left
# objects - defines the objects in the room
var map = [ 
	[{"canGo":["r","d"],"objects":["something"]},{},{},{}],
	[{},{},{},{}],
	[{},{},{},{}],
	[{},{},{},{}]
]
#Note: when checking the map, y goes first then x

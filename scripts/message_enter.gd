extends LineEdit

var bannedLetters = [""]

var directions = {
	"down":"d","south":"d","backwards":"d","backward":"d","stern":"d",
	"up":"u","north":"u","forwards":"u","forward":"u","bow":"u",
	"left":"l","west":"l","leftwards":"l","leftward":"l","port":"l",
	"right":"r","east":"r","rightwards":"r","rightward":"r","starboard":"r",
}
var dirAddition = {
	"d":[0,1],
	"u":[0,-1],
	"l":[-1,0],
	"r":[1,0],
}
#other nodes
@onready var textDisplay = $"../textdisplay"
@onready var soundSys = $"../generalSoundPlayer"
@onready var mainNode = $".."

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass

func _on_text_changed(new_text: String) -> void:
	for letter in bannedLetters: #look for each letter in bannedLetters
		if letter in text:
			$"../textdisplay".attach(textres.dialogue["errorchar"])
			soundSys.playSound("error")
			var caretPos = caret_column #when reseting the text, save caret pos
			text = text.replace(letter,"")
			caret_column = caretPos #load caret pos so it doesnt fuck up eehehh

func _on_text_submitted(new_text: String) -> void:
	var currentTile = mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]] # Gets the current tile of the player
	var command = new_text.split(' ')[0].to_lower()
	var target = Array(new_text.split(" ").slice(1))
	var targetFixed : Array = []
	for i in target:
		i = i.dedent() #remove white spaces so you cant do empty msg
		if i != "":
			targetFixed.append(i.to_lower())
	target = targetFixed #apply white space removal
	var currentItem = ""
	for i in target:
		if i in currentTile.objects:
			currentItem = i # Makes it so the last item typed is the one you interact with
	
	soundSys.playSound("enter")
	text = ""
	var roomNum = mainNode.mapIDs[mainNode.playerLoc[1]][mainNode.playerLoc[0]]
	if command == "credits":
		textDisplay.attach(textres.dialogue["txt_credits"], command)
		return
	
	if command == "print": #fun
		var printed = new_text.erase(0, command.length()).strip_edges()
		textDisplay.attach(printed, new_text)
		return
	
	if command == "view":
		print('view') # Something so it doesn't display an error. remove later
		# add view to the screen

	if command in ["examine", "search", "look", "inspect"]:
		if target.size()>0:
			if currentItem in currentTile.objects: # always true if there is an item, probably fix this later
				textDisplay.attach(textres.dialogue["txt"+str(roomNum)+"_examine" + currentItem], new_text)
			else: 
				textDisplay.attach(textres.dialogue["txt_invalidFood"], new_text)
		else:
			textDisplay.attach(textres.dialogue["txt"+str(roomNum)+"_search"], new_text) #returns room number
		return
		
	if command in ["use", "utilize", "operate", "wield"]: #general use
		print(new_text)
		return
		
	if command in ["consume", "eat", "devour", "swallow", "munch"]: #food/edible
		if target.size() == 0:
			textDisplay.attach(textres.dialogue["txt_whatEat"], new_text)
			return
		if "empty" in get_room_by_id(roomNum)["objects"]:
			textDisplay.attach(textres.dialogue["txt"+str(roomNum)+"_eatfail"], new_text)
			return
		if target.size()>0:
			if "pizza" in target:
				if "pizza" in get_room_by_id(roomNum)["objects"]:
					mainNode.removeObject("pizza")
					mainNode.openWalls(["r"])
					textDisplay.attach(textres.dialogue["txt"+str(roomNum)+"_eat"], new_text)
					return
			#put elifs for each food here
			else:
				textDisplay.attach(textres.dialogue["txt_invalidFood"], new_text)
				return
	
	if command in ["inventory","items","supply","stock","reserve","purse"]: #inventory access
		print(new_text)
	#Movement: TODO optimize with array for directions n stuff

	if command in ["move","go","proceed","walk","advance"]:
		print(mainNode.map)
		var moveDir = null
		if target.size()<=0:
			textDisplay.attach(textres.dialogue["errormove"])
			soundSys.playSound("error")
			return
		for i in directions.keys():
			if i in target:
				moveDir = directions[i]
		if(currentTile["canGo"].has(moveDir)):
			mainNode.playerLoc[0]+=dirAddition[moveDir][0] #moves depending on directories defined at the top
			mainNode.playerLoc[1]+=dirAddition[moveDir][1] 
			$"../textdisplay".attach(textres.dialogue["txt"+str(mainNode.playerLoc[0]+mainNode.playerLoc[1]*4+1)+"_intro"], new_text) # posts the intro to the next room
			return
		else:
			textDisplay.attach(textres.dialogue["errormove"])
			soundSys.playSound("error")
			return

	$"../textdisplay".attach(textres.dialogue["errorcmd"])
	soundSys.playSound("error")
	
func get_room_by_id(room_id) -> Variant:
	for row in range(mainNode.mapIDs.size()):
		for col in range(mainNode.mapIDs[row].size()):
			if mainNode.mapIDs[row][col] == room_id:
				return mainNode.map[row][col] # Return the corresponding room from map
	return

func strip_bbcode(text: String) -> String:
	var result = text
	var open_bracket = result.find("[")
	while open_bracket != -1:
		var close_bracket = result.find("]", open_bracket)
		if close_bracket == -1:
			break
		result = result.substr(0, open_bracket) + result.substr(close_bracket + 1)
		open_bracket = result.find("[")
	return result

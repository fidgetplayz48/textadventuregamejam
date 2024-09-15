extends LineEdit

var bannedLetters = [""]
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
	
	soundSys.playSound("enter")
	text = ""
	var roomNum = mainNode.mapIDs[mainNode.playerLoc[1]][mainNode.playerLoc[0]]
	if command == "credits":
		textDisplay.attach(textres.dialogue["txt_credits"], command)
	
	if command == "view":
		print('view') # Something so it doesn't display an error. remove later
		# add view to the screen

	if command in ["examine", "search", "look", "inspect"]:
		#if target.size()>0:
		textDisplay.attach(textres.dialogue["txt"+str(roomNum)+"_search"], new_text) #returns room number
		
	if command in ["use", "utilize", "operate", "wield"]: #general use
		print(new_text)
		
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
					mainNode.openWalls(["r","d"])
					textDisplay.attach(textres.dialogue["txt"+str(roomNum)+"_eat"], new_text)
					return
			#put elifs for each food here
			else:
				textDisplay.attach(textres.dialogue["txt_invalidFood"], new_text)
				return
	
	if command in ["inventory","items","supply","stock","reserve","purse"]: #inventory access
		print(new_text)
	#Movement: TODO optimize with array for directions n stuff
	if command in ["down","south"]:
		if(currentTile["canGo"].has("d")):
			mainNode.playerLoc[1]+=1 #Adds 1 to the player's y, moving them down
			return
		else:
			textDisplay.attach(textres.dialogue["errormove"])
			soundSys.playSound("error")
			return
	elif command in ["up","north"]:
		if(currentTile["canGo"].has("u")):
			mainNode.playerLoc[1]-=1 #ditto, but opposite
			return
		else:
			textDisplay.attach(textres.dialogue["errormove"])
			soundSys.playSound("error")
			return
	elif command in ["right","east"]:
		if(currentTile["canGo"].has("r")):
			mainNode.playerLoc[0]+=1 #ditto but moves right instead on x axis
			return
		else:
			textDisplay.attach(textres.dialogue["errormove"])
			soundSys.playSound("error")
			return
	elif command in ["left","west"]:
		if(currentTile["canGo"].has("l")):
			mainNode.playerLoc[0]-=1 #ditto, but opposite
			return
		else:
			textDisplay.attach(textres.dialogue["errormove"])
			soundSys.playSound("error")
			return

	$"../textdisplay".attach(textres.dialogue["errorcmd"])
	soundSys.playSound("error")
	
func get_room_by_id(room_id):
	for row in range(mainNode.mapIDs.size()):
		for col in range(mainNode.mapIDs[row].size()):
			if mainNode.mapIDs[row][col] == room_id:
				return mainNode.map[row][col] # Return the corresponding room from map
	return

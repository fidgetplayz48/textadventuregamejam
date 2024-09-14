extends LineEdit


var bannedLetters = ["a"]
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
			soundSys.playSound("error")
			var caretPos = caret_column #when reseting the text, save caret pos
			text = text.replace(letter,"")
			caret_column = caretPos #load caret pos so it doesnt fuck up eehehh

func _on_text_submitted(new_text: String) -> void:
	var currentTile = mainNode.map[mainNode.playerLoc[1]][mainNode.playerLoc[0]] # Gets the current tile of the player
	var command = new_text.split(' ')[0]
	var target = Array(new_text.split(" ").slice(1))
	soundSys.playSound("enter")
	text = ""
	if command == "credits":
		textDisplay.attach(command, textres.dialogue["txt_credits"])
	
	if command == "view":
		print('view') # Something so it doesn't display an error. remove later
		# add view to the screen
	if command in ["examine", "search", "look", "inspect"]:
		if target.size()>0: #If array is empty the whole thing crashes lmao
			if command == "look" and target[0] == "around":
				print(new_text)
			else:
				for i in target:
					if(currentTile["objects"].has(i)):
					#If the tile at the player location has any of the words in the target. Fix later to only allow 1
						print("examination is legal!")
		
		
	if command in ["use", "utilize", "operate"]: #general use
		print(new_text)
		
	if command in ["use", "consume", "eat"]: #food/edible
		print(new_text)
		
	#Movement:
	if command in ["down","south"]:
		if(currentTile["canGo"].has("d")):
			mainNode.playerLoc[1]+=1 #Adds 1 to the player's y, moving them down
	if command in ["up","north"]:
		if(currentTile["canGo"].has("u")):
			mainNode.playerLoc[1]-=1 #ditto, but opposite
	if command in ["right","east"]:
		if(currentTile["canGo"].has("r")):
			mainNode.playerLoc[0]+=1 #ditto but moves right instead on x axis
	if command in ["left","west"]:
		if(currentTile["canGo"].has("l")):
			mainNode.playerLoc[0]-=1 #ditto, but opposite

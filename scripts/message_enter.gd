extends LineEdit

var bannedLetters = ["a"]
#other nodes
@onready var textDisplay = $"../textdisplay"
@onready var soundSys = $"../generalSoundPlayer"

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
	var command = new_text.split(' ')[0]
	var target = new_text.split(" ").slice(1)
	soundSys.playSound("enter")
	text = ""
	if command == "credits":
		textDisplay.attach(command, textres.dialogue["txt_credits"])
	
	if command == "view":
		print('view') # Something so it doesn't display an error. remove later
		# add view to the screen
	if command in ["examine", "search", "look", "search"]:
		if command == "look" and target == "around":
			print(new_text)
		else:
			print(new_text)

	if command in ["use", "utilize", "operate"]: #general use
		print(new_text)
		
	if command in ["use", "consume", "eat"]: #food/edible
		print(new_text)
	#Pseudocode: if command=="examine" && room.contains(target): print(description[target])

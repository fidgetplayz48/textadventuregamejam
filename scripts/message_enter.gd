extends LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_text_submitted(new_text: String) -> void:
	var command = new_text.split(' ')[0]
	var target = new_text.split(" ").slice(1)
	text = ""
	if command == "credits":
		$"../textdisplay".attach(command, textres.dialogue["txt_credits"])
	
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

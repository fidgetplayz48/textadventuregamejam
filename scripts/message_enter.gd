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
	self.text = ""
	if command == "view":
		print('view') # Something so it doesn't display an error. remove later
		# add view to the screen
	#Pseudocode: if command=="examine" && room.contains(target): print(description[target])

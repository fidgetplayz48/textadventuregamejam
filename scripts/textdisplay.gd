extends RichTextLabel

func _ready() -> void:
	text = textres.dialogue["txt1_intro"]

func attach(attachment: String, command = null) -> void:
	if command != null:
		text = text + "\n\n[color=#008000]> " + command + "[/color]\n\n" + attachment 
	else:
		text = text + "\n\n" + attachment 
	#example: First line \n > hello! i am the text! \n hello this is a response.

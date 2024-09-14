extends RichTextLabel

func _ready() -> void:
	text = textres.dialogue["txt1_intro"]

func attach(command: String, attachment: String) -> void:
	text = text + "\n\n[color=#008000]> " + command + "[/color]\n\n" + attachment #example: First line \n > hello! i am the text! \n hello this is a response.

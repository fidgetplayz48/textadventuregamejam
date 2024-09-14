extends RichTextLabel


func attach(command: String, attachment: String) -> void:
	text = text + "\n\n> " + command + "\n\n" + attachment #example: First line \n > hello! i am the text! \n hello this is a response.

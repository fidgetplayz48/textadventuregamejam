extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_text_submitted(new_text: String) -> void:
	var command = new_text.split(' ')[0]
	var target = " ".join(new_text.split(" ").slice(1))

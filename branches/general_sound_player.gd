extends AudioStreamPlayer

var soundlist := {
	"error":load("res://sounds/blip1.wav"),
	"enter":load("res://sounds/blip2.wav"),
}

func playSound(sound: String):
	stream = soundlist[sound]
	play()

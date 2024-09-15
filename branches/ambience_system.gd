extends AudioStreamPlayer

@export_range(0.01,1.0) var distIntensity := 0.1 ##the closer this value is to 1, the less it distorts.

func _process(delta: float) -> void:
	if !playing:
		return
	var zzz = (Time.get_ticks_msec()*0.2*delta)
	var distortion = abs((sin(zzz)*(0.258*sin(zzz*2.7))+cos(zzz)**2+1)*1.4*sin(zzz*0.277))
	$".".pitch_scale = lerp(distortion+0.1, 1.0, distIntensity)

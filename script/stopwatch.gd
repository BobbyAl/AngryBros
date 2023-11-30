extends Label

var elapsed_time: float = 0

func _process(delta: float) -> void:
	# Accumulate the elapsed time
	elapsed_time += delta
	# Format the elapsed time as minutes:seconds
	var minutes: int = int(elapsed_time / 60)
	var seconds: int = int(elapsed_time) % 60

	
	# Update the label text
	text = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)






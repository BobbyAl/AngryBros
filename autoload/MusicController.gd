extends Node

var intro_music = load("res://music/Audio-Bus256.wav")
var bg_music = load("res://music/eye-of-the-tiger.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_intro_music():
	$Music.stream = intro_music
	$Music.play()
	
func stop_music():
	$Music.stream_paused = true

func play_bg_music():
	$Music.stream = bg_music
	$Music.play()
	

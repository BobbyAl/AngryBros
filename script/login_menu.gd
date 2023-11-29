extends Node2D

var username = ""
var password
var created = false

func _on_create_button_down():
	if !created:
		if $Username.text != "" and $Password.text != "":
			username = $Username.text
			password = $Password.text.sha256_text()

			created = true
			$Create.text = "Login"
			$CreateD.text = "Login"
			$Username.text = ""
			$Password.text = ""
			print("Account Created!")
		else:
			print("Username and password cannot be blank.")
	else:
		if $Username.text == username:
			if $Password.text.sha256_text() == password:
				print("Login Success!")
				#get_tree().change_scene_to_file("res://CSE3310/Fall 2023/Team #11/main.tscn")
			else:
				print("Login Fail!")
		else:
				print("Login Fail!")

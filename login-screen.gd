extends Control

var email_line_edit: LineEdit
var password_line_edit: LineEdit

var webApiKey = "AIzaSyACLaGJkXmqz8Z98vKwS_AeXxg4Kn_hLWM"
var signupUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="
var loginUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="


func _ready():
	email_line_edit = $Email
	password_line_edit = $Password
	
func _loginSignup(url: String, email: String, password: String):
	var http = $HTTPRequest
	var jsonObject = JSON.new()
	var body = jsonObject.stringify({'email': email, 'password': password})
	var headers = ['Content-Type: applicaiton/json']
	var error = await http.request(url, headers, HTTPClient.METHOD_POST, body)
	


func _on_http_request_request_completed(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	if (response_code == 200):
		print(response)
		get_tree().change_scene_to_file("res://scene/Menu.tscn")
	else:
		print(response.error)
		$Error_label.text = response.error.message


func _on_register_pressed():
	var url = signupUrl + webApiKey
	var email: String = email_line_edit.text
	var password: String = password_line_edit.text
	_loginSignup(url, email, password)


func _on_login_pressed():
	var url = loginUrl + webApiKey
	var email: String = email_line_edit.text
	var password: String = password_line_edit.text
	_loginSignup(url, email, password)

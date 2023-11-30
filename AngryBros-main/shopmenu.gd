extends StaticBody2D



# Payment.gd

var item = 1

var item1price = 100

var item2price = 250

var item3price =200

var item4price =500
var item5price =50

var item6price=300


var item1owned = false
var item2owned = false
var item3owned =false
var item4owned =false
var item5owned =false
var item6owned = false

var price
# Called when the node enters the scene tree for the first time.

var total_coins = 1000

# ... rest of the script ...

var card_number = ""
var expiry
var cvv
var name_card = ""



func earn_coins(coins_earned: int):
		total_coins += coins_earned
		print("Coins earned: ", coins_earned)
		print("Total coins: ", total_coins)

func spend_coins(coins_spent: int):
		if total_coins >= coins_spent:
				total_coins -= coins_spent
				print("Coins spent: ", coins_spent)
				print("Total coins: ", total_coins)
		else:
				print("Not enough coins to make purchase")

func _on_submit_pressed():
	if card_number.length() > 14:
		if card_number.length() < 17:
			if cvv.length() < 4:
				print("Card Valid!")
			else:
				print("Card Invalid!")
		else:
			print("Card Invalid!")
	else:
		print("Card Invalid!")


func _ready():
	$icon.play("angrybull")
	item = 1

func _physics_process(_delta):
	if self.visible == true:
		if item == 1:
			$icon.play("angrybull")
			$pricelabel.text = "100"
			$"TabContainer/Welcome to the Gym Store".text = "\n   Angrybull energy drink, \n   provides mighty strength. \n "
		if item == 2:
			$icon.play("creatin")
			$pricelabel.text ="250"
			$"TabContainer/Welcome to the Gym Store".text ="\n   Creatin, enhances performance,\n   and supplies a longer life."
		if item == 3:
			$icon.play("protein")
			$pricelabel.text ="200"
			$"TabContainer/Welcome to the Gym Store".text = "\n  Super Protein, level up and gain bulky\n  arms.\n"
		if item == 4:
			$icon.play("AngryBrosuit")
			$pricelabel.text =" 500"
			$"TabContainer/Welcome to the Gym Store".text ="\n   Limited edition:\n   AngryBro suit Mega strength,\n   better watch out not even the gym\n   Chad can stop you.\n   "
			
		if item == 5:
			$icon.play("chicken")
			$pricelabel.text =" 50"
			$"TabContainer/Welcome to the Gym Store".text ="\n   Chicken, increase health."
		if item == 6:
			$icon.play("tren")
			$pricelabel.text =" 300"
			$"TabContainer/Welcome to the Gym Store".text ="\n   Tren, increase in muscles and\n   extra strength"
			

func _on_leftbutton_pressed():
	swap_item_back()

func _on_rightbutton_pressed():
	swap_item_forward()

func _on_buybutton_pressed():
	if item ==1:
		price = item1price
		if total_coins >= price:
			if item1owned ==false:
				buy()

	elif item == 2:
		price = item2price
		if total_coins >= price:
			if item2owned == false:
				buy()
	elif item == 3: 
		price = item3price
		if total_coins >+ price:
			if item3owned ==false:
				buy()
	elif item == 4: 
		price = item4price
		if total_coins >+ price:
			if item4owned ==false:
				buy()
	elif item == 5: 
		price = item5price
		if total_coins >+ price:
			if item5owned ==false:
				buy()
	elif item == 6: 
		price = item6price
		if total_coins >+ price:
			if item6owned ==false:
				buy()
		

	#if you have 9 items switch line 27 to 9
func swap_item_back():
	if item == 1:
		item = 6
	elif item == 6:
		item = 5
	elif item == 5:
		item = 4
	elif item == 4:
		item = 3
	elif item == 3:
		item = 2
	elif item == 2:
		item =1
func swap_item_forward():
	if item == 1:
		item = 2
	elif item ==2:
		item = 3
	elif item == 3:
			item =4
	elif item == 4:
		item = 5
	elif item == 5:
		item = 6
	elif item == 6:
		item = 1
		
func buy():
	total_coins -= price
	if item == 1:
		if not item1owned:
			item1owned = true
			$remaining_coins_label2.text = "   Item\n   purchased:\n   Energy drink"
	elif item==1 and item1owned==true:
			$remaining_coins_label3.text = "You already own this item."
	elif item == 2:
		if not item2owned:
			item2owned = true
			$remaining_coins_label2.text = "   Item\n   purchased:\n   Creatin"
		else:
			$remaining_coins_label3.text = "You already own this item."
	elif item == 3:
		if not item3owned:
			item3owned = true
			$remaining_coins_label2.text = "   Item\n   purchased:\n   Super Protein"
	elif item == 4:
		if not item4owned:
			item4owned = true
			$remaining_coins_label2.text = "   Item\n   purchased:\n   Angrybro suit"
		else:
			$remaining_coins_label3.text = "You already own this item."
	elif item == 5:
		if not item5owned:
			item5owned = true
			$remaining_coins_label2.text = "   Item\n   purchased:\n   Chicken"
		else:
			$remaining_coins_label3.text = "You already own this item."
	elif item == 6:
		if not item6owned:
			item6owned = true
			$remaining_coins_label2.text = "   Item\n   purchased:\n   Tren"
		else:
			$remaining_coins_label3.text = "You already own this item."
	$remaining_coins_label.text = " Remaining\n Coins:  " + str(total_coins)
	

	
	

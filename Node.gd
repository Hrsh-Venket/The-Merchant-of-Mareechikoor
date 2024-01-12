extends Node

var isholding = false
var currentitem
var shop_positions = []
var inrec = false

# Called when the node enters the scene tree for the first time.
func _ready():
	shop_positions.append($item1.position) 
	shop_positions.append($item2.position)
	shop_positions.append($item3.position) 
	shop_positions.append($item4.position)
	shop_positions.append($item5.position) 
	shop_positions.append($item6.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isholding:
		currentitem.position.x = get_global_mouse_position().x - 50
		currentitem.position.y = get_global_mouse_position().y - 50
	else:
		resetpositions()

func resetpositions():
	$item1.position = shop_positions[0]
	$item2.position = shop_positions[1]
	$item3.position = shop_positions[2]
	$item4.position = shop_positions[3]
	$item5.position = shop_positions[4]
	$item6.position = shop_positions[5]
	
func _on_color_rect_mouse_entered():
	inrec = true
	pass # Replace with function body.


func _on_color_rect_mouse_exited():
	inrec = false
	pass # Replace with function body.

		
func _on_item_1_button_down():
	isholding = true
	currentitem = get_node("item1")
	pass # Replace with function body.

func _on_item_1_button_up():
	isholding = false
	if inrec:
		print("item1")
	pass # Replace with function body.

func _on_item_2_button_down():
	isholding = true
	currentitem = get_node("item2")
	pass # Replace with function body.

func _on_item_2_button_up():
	isholding = false
	if inrec:
		print("item2")
	pass # Replace with function body.


func _on_item_3_button_down():
	isholding = true
	currentitem = get_node("item3")
	pass # Replace with function body.

func _on_item_3_button_up():
	isholding = false
	if inrec:
		print("item3")
	pass # Replace with function body.


func _on_item_4_button_down():
	isholding = true
	currentitem = get_node("item4")
	pass # Replace with function body.

func _on_item_4_button_up():
	isholding = false
	if inrec:
		print("item4")
	pass # Replace with function body.


func _on_item_5_button_down():
	isholding = true
	currentitem = get_node("item5")
	pass # Replace with function body.

func _on_item_5_button_up():
	isholding = false
	if inrec:
		print("item5")
	pass # Replace with function body.


func _on_item_6_button_down():
	isholding = true
	currentitem = get_node("item6")
	pass # Replace with function body.

func _on_item_6_button_up():
	isholding = false
	if inrec:
		print("item6")
	pass # Replace with function body.

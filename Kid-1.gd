extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.global_position = Vector2(-550, 300)
	Signals.sk1enter.connect(_on_enter)
	Signals.sk1exit.connect(_on_exit)

# Called when the "aunty1enter" signal is emitted
func _on_enter():
	self.global_position = Vector2(550, 300)  # Set the position to (100, 100)

func _on_exit():
	self.global_position = Vector2(1600, 300)

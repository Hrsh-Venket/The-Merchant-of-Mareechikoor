extends Node2D
signal story_not_running
var racism = 0
var week_num: int = 0
var num_cust: int = 0
var week_earnings: int = 0
var total_savings: int = 0
var dialogues = ["Game_start", "tutorial_interaction", "interaction1",  
"regular_interaction", "interaction2", "interaction3", "interaction4",  
"interaction9", "interaction8", "interaction5" , "interaction11", "interaction6", 
"interaction14", "interaction7", "interaction15", "ending_2"]
var currentdil = 0
var dil = load("res://main_dialogue.dialogue")
var PARTYTIME = false
var thing = false

# Called when 	the node enters the scene tree for the first time.
func _ready():
	Signals.butch.connect(_butcher_storyline)
	Signals.good_guy.connect(_good_guy_storyline)
	#$"title audio".playing = tru
	#$Titlepage.visible = true
	$Node2D.visible = false
	$MorningBg.visible = true
	await $Timer2.timeout
	$Node2D.visible = true
	$AudioStreamPlayer2D.play()
	print(dialogues)
	DialogueManager.show_example_dialogue_balloon(dil, dialogues[0])
	currentdil += 1
	await DialogueManager.dialogue_ended
	DialogueManager.show_example_dialogue_balloon(dil, dialogues[currentdil])
	currentdil += 1
	await Signals.tutorial_passed
	await DialogueManager.dialogue_ended
	$Timer.start()
	thing = true
	for i in range(1, 9):
		print(i)
		DialogueManager.show_example_dialogue_balloon(dil, "Week_start")
		await DialogueManager.dialogue_ended
		while currentdil < len(dialogues):
			DialogueManager.show_example_dialogue_balloon(dil, dialogues[currentdil])
			await DialogueManager.dialogue_ended
			currentdil += 1
			if PARTYTIME == true:
				PARTYTIME = false
				$Timer.stop()
				week_earnings = racism * 1 * num_cust
				total_savings = total_savings + week_earnings
				week_num += 1
				DialogueManager.show_example_dialogue_balloon(dil, "Week_end")
				week_earnings = 0
				num_cust = 0
				await DialogueManager.dialogue_ended
				$Timer.start()

func _butcher_storyline():
	dialogues = ["Game_start", "tutorial_interaction", "interaction1",  
"regular_interaction", "interaction2", "interaction3", "interaction4",  
"interaction9", "interaction8", "interaction5", "interaction6",
"interaction12", "interaction11", "interaction13"]
func _good_guy_storyline():
	dialogues = ["Game_start", "tutorial_interaction", "interaction1",  
"regular_interaction", "interaction2", "interaction3", "interaction4",  
"interaction9", "interaction8", "interaction5", "interaction6", "interaction11"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if thing == true:
		if ($Timer.time_left >= 60):
			$MorningBg.visible = true	
			$EveningBg.visible = false
			$NightBg.visible = false
		if ($Timer.time_left < 60):
			$MorningBg.visible = false
			$EveningBg.visible = true	
			$NightBg.visible = false
		if ($Timer.time_left < 20):
			$MorningBg.visible = false
			$EveningBg.visible = false
			$NightBg.visible = true
	# $Label.text = str($Timer.time_left)
	
	pass

func _on_timer_timeout():
	PARTYTIME = true
	pass # Replace with function body.



func _on_timer_2_timeout():
	$Titlepage.visible = false
	$"title audio".stop()
	# Replace with function body.


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()

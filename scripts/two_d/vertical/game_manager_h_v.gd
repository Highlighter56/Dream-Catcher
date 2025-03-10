extends Node2D

@onready var audio_left: AudioStreamPlayer2D = $Audio_Nodes/Go_Left
@onready var audio_right: AudioStreamPlayer2D = $Audio_Nodes/Go_Right
@onready var audio_coin: AudioStreamPlayer2D = $Audio_Nodes/Coin
@onready var audio_wrong_side: AudioStreamPlayer2D = $Audio_Nodes/Wrong_Side
@onready var player: CharacterBody2D = %Player

var score: int = 0:
	set(value):
		score_lable.text="Score: "+str(value)
		score=value
enum sides {LEFT, RIGHT}
var correct_side: sides

#Signal that sends out the side asteriods
# Left: -1, Right: 1
signal send_side_asteriods(value: int)

# --- Flags ---
@onready var score_lable: Label = $Flags/Score
@onready var asteriod_speed: Label = $Flags/AsteriodSpeed
# Display Asteriod Speed
func _on_asteriod_update_speed_display(value: int) -> void:
	asteriod_speed.text = "Speed: "+str(value)
# Switch Scene to Main Menu
func _on_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenses/main_menu.tscn")# --- Flags ---


func _ready() -> void:
	await get_tree().create_timer(1).timeout
	correct_side = choose_side()
	pass

func _process(delta: float) -> void:
	pass

#func chooseSide() -> int:
	#var num = randi_range(0,1)
	#if num==1:
		#return -1
	#return 1


func _on_progression_area_area_entered(area: Area2D) -> void:
	correct_side = choose_side()


func _on_check_sides_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteriod"):
		#print("Check Sides")
		if (correct_side == sides.LEFT):
#			If Correct side is left, send asteriod down Right path
			emit_signal("send_side_asteriods",1)
			if (player.position.x < 0):
				#print("Correct Side")
				audio_coin.play()
				score+=1
			else:
				#print("Wrong Side")
				audio_wrong_side.play()
		else:
#			If Correct side is right, send asteriod down Left path
			emit_signal("send_side_asteriods",-1)
			if (player.position.x > 0):
				#print("Correct Side")
				audio_coin.play()
				score+=1
			else:
				#print("Wrong Side")
				audio_wrong_side.play()

func on_correct_side():
	audio_coin.play()

func on_wrong_side():
	audio_wrong_side.play()


func choose_side() -> sides:
	if (randi_range(0,1) == 0):
#		Go Left
		audio_left.play()
		return sides.LEFT
	else:
#		Go Right
		audio_right.play()
		return sides.RIGHT

extends Node2D

@onready var audio_left: AudioStreamPlayer2D = $Go_Left
@onready var audio_right: AudioStreamPlayer2D = $Go_Right
@onready var audio_coin: AudioStreamPlayer2D = $Coin
@onready var audio_wrong_side: AudioStreamPlayer2D = $Wrong_Side
@onready var player: CharacterBody2D = %Player

var score: int = 0
enum sides {LEFT, RIGHT}
var correct_side: sides


# --- Flags ---
@onready var asteriod_speed: Label = $Flags/AsteriodSpeed

func _on_asteriod_update_speed_display(value: int) -> void:
	asteriod_speed.text = "Speed: "+str(value)



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
		print("Check Sides")
		if (correct_side == sides.LEFT):
			if (player.position.x < 0):
				print("Correct Side")
				audio_coin.play()
			else:
				print("Wrong Side")
				audio_wrong_side.play()
		else:
			if (player.position.x > 0):
				print("Correct Side")
				audio_coin.play()
			else:
				print("Wrong Side")
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

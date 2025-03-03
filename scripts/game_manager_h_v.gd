extends Node2D

@onready var audio_left: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_right: AudioStreamPlayer2D = $AudioStreamPlayer2D2

#var side: int = 0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

#func chooseSide() -> int:
	#var num = randi_range(0,1)
	#if num==1:
		#return -1
	#return 1


func _on_progression_area_area_entered(area: Area2D) -> void:
	if (randi_range(0,1) == 0):
#		Go Left
		audio_left.play()
	else:
#		Go Right
		audio_right.play()


func _on_check_sides_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteriod"):
		pass
#		Check which side player is on
#		either call the secon asteriod or not

extends CharacterBody3D



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		print("Right")
	if Input.is_action_just_pressed("ui_left"):
		print("Left")

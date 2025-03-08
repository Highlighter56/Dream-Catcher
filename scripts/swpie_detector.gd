extends Node2D

var isSwiping: bool = false
var startPos: Vector2
var currentPos: Vector2
var length: float = 50

signal swipeLeft
signal swipeRight

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("press"):
		if !isSwiping:
			isSwiping = true
			startPos = get_global_mouse_position()
	if isSwiping:
		currentPos = get_global_mouse_position()
		if startPos.distance_to(currentPos) >= length:
			isSwiping = false
			if startPos.x > currentPos.x:
				print("Swipe Left")
				swipeLeft.emit()
			else:
				print("Swipe Right")
				swipeRight.emit()
	else:
		isSwiping = false
	
	print(startPos, currentPos)

extends CharacterBody3D

const SWIPE_DISTANCE:float = 14
const SPEED := 4000
var lane: int = 0:
	set(value):
		lane = clamp(value,-1,1)


func _ready() -> void:
	pass

# Swipe Movment
func _on_swipe_detection_swipe_left() -> void:
	lane-=1
func _on_swipe_detection_swipe_right() -> void:
	lane+=1

func _process(delta: float) -> void:
#	Keyboard Movement
	if Input.is_action_just_pressed("ui_right"):
		#print("Move Right")
		lane+=1
	if Input.is_action_just_pressed("ui_left"):
		#print("Move Left")
		lane-=1


func _physics_process(delta: float) -> void:
#	Move Player
	match lane:
		1:
			if position.x<SWIPE_DISTANCE:
				velocity.x = SPEED*delta
		0:
			if position.x < -0.1 or position.x > 0.1:
				if position.x>0:
					velocity.x = -SPEED*delta
				else:
					velocity.x = SPEED*delta
		-1:
			if position.x>-SWIPE_DISTANCE:
				velocity.x = -SPEED*delta
	move_and_slide()
	velocity.x=0

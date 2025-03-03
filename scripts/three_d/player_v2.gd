extends CharacterBody3D

const SWIPE_DISTANCE:float = 14
const SPEED := 4000
var lane: int = 0:
	set(value):
		lane = clamp(value,-1,1)


func _ready() -> void:
	#	Set Screen Dementions
	#ProjectSettings.set_setting("display/window/size/viewport_width", 1280)
	#ProjectSettings.set_setting("display/window/size/viewport_height", 780)
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		print("Move Right")
		lane+=1
	if Input.is_action_just_pressed("ui_left"):
		print("Move Left")
		lane-=1


func _physics_process(delta: float) -> void:
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
	#print(str(lane)+", "+str(velocity)+", "+str(position.x))
	move_and_slide()
	velocity.x=0

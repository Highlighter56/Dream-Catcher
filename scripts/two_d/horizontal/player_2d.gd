extends CharacterBody2D

const SWIPE_DISTANCE:float = 55
const SPEED := 16000
var lane: int = 0:
	set(value):
		lane = clamp(value,-1,1)



func _ready() -> void:
#	Set Screen Dementions
	#ProjectSettings.set_setting("display/window/size/viewport_width", 1280)
	#ProjectSettings.set_setting("display/window/size/viewport_height", 780)
	#ProjectSettings.save()
	#print("Width: "+str(ProjectSettings.get_setting("display/window/size/viewport_width")))
	#print("Height: "+str(ProjectSettings.get_setting("display/window/size/viewport_height")))
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		print("Move Down")
		lane-=1
	if Input.is_action_just_pressed("ui_down"):
		print("Move Up")
		lane+=1
	#print(position)


func _physics_process(delta: float) -> void:
	match lane:
		1:
			if position.y<SWIPE_DISTANCE:
				velocity.y = SPEED*delta
		0:
			if position.y < -0.1 or position.y > 0.1:
				if position.y>0:
					velocity.y = -SPEED*delta
				else:
					velocity.y = SPEED*delta
		-1:
			if position.y>-SWIPE_DISTANCE:
				velocity.y = -SPEED*delta
	#print(str(lane)+", "+str(velocity)+", "+str(position.x))
	move_and_slide()
	velocity.y=0

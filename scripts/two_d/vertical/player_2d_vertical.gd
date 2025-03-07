extends CharacterBody2D

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

const SWIPE_DISTANCE:float = 55
const SPEED := 30000
var lane: int = 0:
	set(value):
		lane = clamp(value,-1,1)

# ---Flag Variables---
var canMoveTwoLanes: bool = false
var laneJump: int:
	get():
		if canMoveTwoLanes:
			return 2
		return 1

func _on_lane_jump_pressed() -> void:
	canMoveTwoLanes=!canMoveTwoLanes


func _ready() -> void:
	visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		#print("Move Left")
		lane-= laneJump
	if Input.is_action_just_pressed("ui_right"):
		#print("Move Right")
		lane+= laneJump
	#print(position)


func _physics_process(delta: float) -> void:
	
#	Testing Curve
	#time += delta
	#print(int(movment_curve.sample(time)*10))
	
#	Player Move
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


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteriod"):
		print("Player Takes Damage")
		audio_player.play()

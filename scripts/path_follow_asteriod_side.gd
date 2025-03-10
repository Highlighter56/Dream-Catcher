extends PathFollow2D
# Path Follwo Asteriod Side

var move_speed:float = 560

# This is so I can use the same script, but differentiate when
# the left and right asteriod should send.
# Left: -1, Right: 1
@export var my_side:int

var shouldMove:bool = false

func _ready() -> void:
	#print(my_side)
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
#	Movment
	if shouldMove:
		progress += move_speed*delta
	if progress_ratio > 0.95:
		shouldMove = false
		progress_ratio = 0

func _on_game_manager_send_side_asteriods(side_to_send: int) -> void:
	#print("Signal Sent",side_to_send)
	if my_side == side_to_send:
		shouldMove = true

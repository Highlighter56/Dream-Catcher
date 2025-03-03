extends Sprite2D


var max_rotation := PI/4
var min_rotation := PI/8
var rand_rotation:float

func _ready() -> void:
	setSpin()

func _process(delta: float) -> void:
	#print(randi_range(0,1))
	pass

func _physics_process(delta: float) -> void:
	rotate(rand_rotation*delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (!area.is_in_group("player")):
		print("Change Spin")
		setSpin()


func setSpin() -> void:
	rand_rotation = randSpin()
	print(rand_rotation)


func randSpin() -> float:
	var spin:float = randf_range(min_rotation, max_rotation)
	if(randi_range(0,1)==0):
		return spin
	return -spin

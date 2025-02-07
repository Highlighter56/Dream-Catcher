extends Area3D

@onready var mesh: MeshInstance3D = $MeshInstance3D

var max_rotation := PI/4
var min_rotation := PI/8
var randX:float
var randY:float
var randZ:float

func _ready() -> void:
	setSpin()

func _process(delta: float) -> void:
	#print(randi_range(0,1))
	pass

func _physics_process(delta: float) -> void:
	rotate_x(randX*delta)
	rotate_y(randY*delta)
	rotate_z(randZ*delta)

func _on_area_3d_area_entered(area: Area3D) -> void:
	setSpin()

func setSpin() -> void:
	randX = randSpin()
	randY = randSpin()
	randZ = randSpin()
	print(Vector3(randX, randY, randZ))


func randSpin() -> float:
	var spin:float = randf_range(min_rotation, max_rotation)
	if(randi_range(0,1)==0):
		return spin
	return spin*-1

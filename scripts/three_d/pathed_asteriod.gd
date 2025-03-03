extends PathFollow3D

@onready var asteroid: Area3D = $Asteroid


const MOVE_SPEED:float = 50


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
#	Movment
	progress += MOVE_SPEED*delta

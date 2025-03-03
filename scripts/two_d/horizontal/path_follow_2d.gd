extends PathFollow2D

@onready var asteroid: Area3D = $Asteroid

#70
@export var move_speed:float = 70


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
#	Movment
	progress += move_speed*delta

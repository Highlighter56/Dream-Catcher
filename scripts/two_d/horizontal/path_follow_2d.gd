extends PathFollow2D

@onready var asteroid: Area3D = $Asteroid

#70
@export var move_speed:float = 70

# ---Flags---
func _on_speed_up_pressed() -> void:
	move_speed+=10
	emit_signal("updateSpeedDisplay", move_speed)

func _on_slow_down_pressed() -> void:
	move_speed-=10
	emit_signal("updateSpeedDisplay", move_speed)

signal updateSpeedDisplay(value:int)
# ---Flags---


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
#	Movment
	progress += move_speed*delta

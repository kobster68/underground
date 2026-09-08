extends Camera2D

@onready var vehicle : VehicleController = get_parent()

func _process(delta: float) -> void:
	rotation = vehicle.rotation + (PI/2)

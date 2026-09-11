class_name VehicleController
extends Node2D

var throttle_input : float = 0.0
var brake_input : float = 0.0
var steering_input : float = 0.0

func _process(delta: float) -> void:
	throttle_input = Input.get_action_raw_strength("throttle")
	brake_input = Input.get_action_raw_strength("brake")
	steering_input = (Input.get_action_raw_strength("steering_right") -
		Input.get_action_raw_strength("steering_left"))
		
	position += transform.x * throttle_input * delta * 50.0
	rotation += steering_input * delta

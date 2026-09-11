class_name VehicleController
extends Node2D

var throttle_input : float = 0.0
var brake_input : float = 0.0
var steering_input : float = 0.0

var velocity : Vector2 = Vector2.ZERO
var acceleration : Vector2 = Vector2.ZERO

var engine_force : float = 32.0

# pixels
var wheelbase : float = 39.2

var max_steering_angle : float = deg_to_rad(30.0)

func _process(delta: float) -> void:
	throttle_input = Input.get_action_raw_strength("throttle")
	brake_input = Input.get_action_raw_strength("brake")
	steering_input = (Input.get_action_raw_strength("steering_right") -
		Input.get_action_raw_strength("steering_left"))

func _physics_process(delta: float) -> void:
	var forward : Vector2 = transform.x
	var right : Vector2 = -transform.y
		
	acceleration = forward * throttle_input * engine_force
	velocity += acceleration * delta
	
	var speed : float = velocity.length()
	var forward_speed : float = velocity.dot(forward)
		
	position += velocity * delta
	
	var steering_angle = max_steering_angle * steering_input
	var yaw_rate = forward_speed / wheelbase * tan(steering_angle)
	
	rotation += yaw_rate * delta

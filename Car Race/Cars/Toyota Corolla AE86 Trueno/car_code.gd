extends VehicleBody

const MAX_STEER_ANGLE = 0.35
const STEER_SPEED = 1

const MAX_ENGINE_FORCE = 200
const MAX_BRAKE_FORCE = 10
const MAX_SPEED = 1000

var steer_target = 0.0
var steer_angle = 0.0

func _physics_process(delta):
	drive(delta)


func drive(delta):
	steering= apply_steering(delta)
	engine_force= apply_throttle()
	brake = apply_brake()


func apply_steering(delta):
	var steer_val=0
	var left = Input.get_action_strength("left")
	var right = Input.get_action_strength("right")

	if left:
		steer_val = left
	elif right:
		steer_val = -right

	steer_target = steer_val * MAX_STEER_ANGLE
	if steer_target < steer_angle:
		steer_angle -= STEER_SPEED * delta
	elif steer_target > steer_angle:
		steer_angle += STEER_SPEED*delta

	return steer_angle


func apply_throttle():
	var throttle_val = 0
	var advance = Input.get_action_strength("advance")
	var back = Input.get_action_strength("back")

	if back:
		throttle_val = -back
	elif advance:
		throttle_val = advance
	return throttle_val*MAX_ENGINE_FORCE


func apply_brake():
	var brake_val = 0
	var brake_strength = Input.get_action_strength("brake")
	if brake_strength:
		brake_val = brake_strength
	return brake_val * MAX_BRAKE_FORCE


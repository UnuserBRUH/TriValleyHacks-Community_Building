extends Camera2D

var velocity = Vector2.ZERO

var speed = 100

func _physics_process(delta):
	var Direction : Vector2 = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	velocity = Direction.normalized() * speed * delta
	position += velocity

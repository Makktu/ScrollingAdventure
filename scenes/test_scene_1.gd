extends Control

@onready var cam_position_x = $Camera2D.position.x
@onready var cam_position_y = $Camera2D.position.y

var starting_location = 1

var walls = [
	[1, [0,0,0,0]],
	[2, [1,1,1,0]]
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		starting_location = 2
		movement(2)
	if Input.is_action_just_pressed("ui_left"):
		movement(4)
	if Input.is_action_just_pressed("ui_up"):
		movement(1)
	if Input.is_action_just_pressed("ui_down"):
		movement(3)
		
func movement(direction = 99):
	if direction == 99:
		print("no movement there")
	if direction == 1: # up
		cam_position_y += 1280
	if direction == 2: # right
		cam_position_x += 720
		starting_location = 2
	if direction == 3: # down
		cam_position_y -= 1280
	if direction == 4: # left
		# check for allowed move
		print(walls[starting_location - 1])
		if walls[starting_location - 1][1][3] == 0:
			print('all ok john')
			cam_position_x -= 720
		else:
			print('no exit')
	
	move_camera()
		
func move_camera():
	$Camera2D.position.x = cam_position_x
	$Camera2D.position.y = cam_position_y

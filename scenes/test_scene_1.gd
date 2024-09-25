extends Control

@onready var cam_position_x = $Camera2D.position.x
@onready var cam_position_y = $Camera2D.position.y
@onready var animation_player = $AnimationPlayer
@onready var this_area = $Area
@onready var move_timer = $MoveTimer

var current_location = 1

var input_given = false
var x_pos = 0
var y_pos = 0

# ###############################################
# KEY: Up, Right, Down, Left
# 0 = no wall - player can pass
# 1 = wall - player cannot pass
var rooms = {
	1: [2,3,4,5],
	2: [0,1,0,0],
	3: [0,0,0,1],
	4: [1,0,0,0],
	5: [0,1,0,0],
	6: [0,0,1,1],
	7: [1,0,0,0]
}
# ###############################################

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_right") and !input_given:
		input_given = true
		move_timer.start()
		movement(1)

	if Input.is_action_just_pressed("ui_left") and !input_given:
		input_given = true
		move_timer.start()
		movement(3)

	if Input.is_action_just_pressed("ui_up") and !input_given:
		input_given = true
		move_timer.start()
		movement(0)

	if Input.is_action_just_pressed("ui_down") and !input_given:
		input_given = true
		move_timer.start()
		movement(2)

		
func movement(direction = 99):
	move_camera(direction)
		
func move_camera(direction):
	if direction == null:
		print("no direction")
	var x_dir = 0
	var y_dir = 0
	if direction == 0:
		y_dir = -1280
	if direction == 1:
		x_dir = -720
	if direction == 2:
		y_dir = 1280
	if direction == 3:
		x_dir = 720
	x_pos += x_dir
	y_pos += y_dir
		
	# move the world
	var tween = create_tween()
	tween.tween_property(this_area, "position", Vector2(x_pos, y_pos), 0.45)


func _on_move_timer_timeout():
	input_given = false

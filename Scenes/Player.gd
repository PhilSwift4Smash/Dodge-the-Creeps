extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	screen_size = get_viewport_rect().size
	position = Vector2()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	var velcocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velcocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velcocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velcocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velcocity.x += 1	
	if velcocity.length() > 0:
		velcocity = velcocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velcocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velcocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velcocity.x < 0
	elif velcocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velcocity.y > 0
	

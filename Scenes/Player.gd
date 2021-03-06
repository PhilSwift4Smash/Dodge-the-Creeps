extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.
var velcocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	screen_size = get_viewport_rect().size
	position = Vector2()
	var velcocity = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	var velcocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velcocity.y += 1
	if Input.is_action_pressed("ui_down"):
		velcocity.y -= 1
	if Input.is_action_pressed("ui_left"):
		velcocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velcocity.x += 1	
	if velcocity.length() > 0:
		velcocity = velcocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

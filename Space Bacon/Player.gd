extends Area2D

signal eat

var speed = 500
var screen_size # Size of the game window.

var tex_right = preload("res://images/spr_brain_forwards_0.png")
var tex_left = preload("res://images/spr_brain_backwards_0.png")
var tex_up = preload("res://images/spr_brain_up_0.png")
var tex_down = preload("res://images/spr_brain_down_0.png")
var tex_still = preload("res://images/spr_brain_0.png")

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	$Sprite.set_texture(tex_still)
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$Sprite.set_texture(tex_right)
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$Sprite.set_texture(tex_left)
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		$Sprite.set_texture(tex_down)
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		$Sprite.set_texture(tex_up)

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_Player_area_entered(area):
	emit_signal("eat")

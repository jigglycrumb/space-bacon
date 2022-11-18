extends Area2D

var speed = 15

func _process(delta):
	self.position.x -= speed
	if self.position.x < -100:
		queue_free()	

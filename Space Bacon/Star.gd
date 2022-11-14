extends AnimatedSprite

func _ready():
	self.frame = randi() % 5

func _process(delta):
	self.position.x -= self.scale.x
	if self.position.x < -50:
		queue_free()

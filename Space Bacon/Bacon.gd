extends Area2D

var speed = 10

func _process(delta):
	self.rotation += deg2rad(2)
	self.position.x -= speed
	if self.position.x < -50:
		queue_free()	

func _on_Bacon_area_entered(player):
	if not player.frozen:
		queue_free()

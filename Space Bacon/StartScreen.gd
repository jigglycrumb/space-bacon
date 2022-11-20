extends CanvasLayer

signal new_game

func _ready():
	$AnimatedSprite.play()

func _on_NewGameButton_pressed():
	emit_signal("new_game")

func update_final_score(score):
	$FinalScoreLabel.text = "You ate " + str(score) + " delicious bacon"

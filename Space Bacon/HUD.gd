extends CanvasLayer

func update_score(score):
	$ScoreLabel.text = "Eaten: " + str(score)

func update_time_left(time_left):
	$TimeLabel.text = "Time: " + str(time_left)

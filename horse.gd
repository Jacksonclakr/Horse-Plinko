extends Node
var speed = 600
var direction = 1
var score = 0
signal game_end
# Called when the node enters the scene tree for the first time.
func _ready():
	_on_hud_new_round()
	$"../TextureRect2".play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.RIGHT*speed
	
	if $horsie.position.x >= 616:
		direction =-1
	elif $horsie.position.x <= 22:
		direction=1
	if Input.is_action_pressed("space"):
		$augh.play()
		$horsie.freeze = false
		set_process(not is_processing())
	$horsie.position += velocity * delta *direction
# move back and forth - done
 #terminate when space pressed - done
# calculate points by using a thing that shows when touching- done
# ui for score amd restart - done

func _on_end_body_entered(body):
	game_end.emit(10)
	print("1")

func _on_end_2_body_entered(body):
	game_end.emit(50)
	print("2")
func _on_end_3_body_entered(body):
	game_end.emit(100)
	print("3")
func _on_end_4_body_entered(body):
	game_end.emit(50)

func _on_end_5_body_entered(body):
	game_end.emit(10)

func _on_hud_new_round():
	$horsie.transform = Transform2D(0,Vector2(randf()*608 +20, 115))
	$horsie.freeze = true
	set_process(true)
	

func _on_horsie_body_entered(body):
	$bounce.play()

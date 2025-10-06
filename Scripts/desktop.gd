extends Control

@onready var button = $TextureRect/ColorRect/Button
@onready var tutorialScene = preload("res://Scenes/Tutorial.tscn")

var tutorial_app: Node = null

func openApp(scene: PackedScene):	
	if tutorial_app == null:
		tutorial_app = scene.instantiate()
		add_child(tutorial_app)
	else:
		tutorial_app.openWindow()

func _ready():
	button.focus_mode = Control.FOCUS_NONE # remove outline when you click on it
	button.pressed.connect(
		func(): openApp(tutorialScene) 
	) 

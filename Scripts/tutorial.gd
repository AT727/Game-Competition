extends Control

@onready var window = $Window

func _ready():
	window.close_requested.connect(closeWindow)

func closeWindow():
	window.hide()
	mouse_filter = Control.MOUSE_FILTER_IGNORE # stop intercepting clicks
	
func openWindow():
	window.show()
	mouse_filter = Control.MOUSE_FILTER_STOP  # can interact again
	window.grab_focus()

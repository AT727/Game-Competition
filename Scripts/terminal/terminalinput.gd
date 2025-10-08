extends Control

@onready var terminal_parent = $Window/Parent/VBoxContainer
@onready var original_terminal = $Window/Parent/VBoxContainer.find_child("Terminal Input", true, false)


# preload your TerminalInput scene
var TerminalInputScene = preload("res://scenes/terminal miscs/Input.tscn")

func _ready():
	# Connect the signal from the original LineEdit
	var input_field = original_terminal.get_node("Input")
	input_field.connect("text_submitted", Callable(self, "_on_command_entered"))


func _on_command_entered(text: String):
	if text.strip_edges() == "":
		return

	# --- Create a new terminal line ---
	var new_terminal = TerminalInputScene.instantiate()

	# Optionally copy the entered text into the new terminal's label

	# Clear the original input field for the next command
	original_terminal.get_node("Input").text = ""

	# Add the new terminal instance to the VBoxContainer
	terminal_parent.add_child(new_terminal)

	# Connect the new LineEdit signal as well
	var new_input_field = new_terminal.get_node("Input")
	new_input_field.connect("text_submitted", Callable(self, "_on_command_entered"))

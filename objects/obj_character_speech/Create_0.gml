dialogue = [
	"I am the test dialogue robot. I am programmed to be your friend.",
	"Let's race our spaceships.",
	"I grow tired of this game. Goodbye."
];

dialogue_idx = 0;
dialogue_char_idx = 0;
active_dialogue = "";
complete = false;
clickable = false;

STATE_ENTER = 0;
STATE_EXIT = 1;
STATE_SHOW_DIALOGUE = 2;

timer = 0;
time_to_enter = 0.5;

state = STATE_ENTER;

x = -500;
y = 0.6 * camera_get_view_height(view_camera[0]);

speech_y = -500;
speech_x = 500;

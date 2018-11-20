var _str = "";

for (var i=0; i<action.max_actions; i++)
{
	_str += string(button_held[i]) + " - " + string(button_pressed[i]) + " - " + string(button_released[i]) + "\n";
}

draw_text(0,0,_str);

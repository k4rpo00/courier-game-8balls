function trace() {
	var r = "";
	for (var i = 0; i < argument_count; i++) {
	    r += string(argument[i]) + " ";
	}
	//if (string_pos("towards", r)) window_set_caption(r);
	show_debug_message(r);



}

for (var i=0; i<num_instances; i++) {
	var _cur_inst = draw_queue[# 1, i];
	if (instance_exists(_cur_inst)) _cur_inst.draw_me();
}
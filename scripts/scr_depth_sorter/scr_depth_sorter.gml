function sort_instances() {
	ds_grid_clear(draw_queue, 100000);	
	
	num_instances = instance_number(obj_sortable);
	var _h = ds_grid_height(draw_queue);
	
	if (num_instances >= _h) {
		while (num_instances >= _h) {
			_h *= 2;
		}
		ds_grid_resize(draw_queue, 2, _h);
	}

	for (var i=0; i<num_instances; i++) {
		var _inst = instance_find(obj_sortable, i);
		
		draw_queue[# 0, i] = _inst.y;
		draw_queue[# 1, i] = _inst.id;
	}

	ds_grid_sort(draw_queue, 0, true);
}
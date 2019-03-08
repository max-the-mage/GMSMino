copy = ds_list_create();
ds_list_copy(copy, minos);

ds_list_shuffle(copy)

for(var i = 0; i < ds_list_size(copy); i++) {
	ds_queue_enqueue(piece_queue, copy[| i]);
}
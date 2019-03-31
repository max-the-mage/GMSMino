// randomize() randomizes seed every time pieces are generated, probably not needed

ds_list_shuffle(global.minos);

for(var i = 0; i < ds_list_size(global.minos); i++) {
	ds_queue_enqueue(global.queue, global.minos[| i]);
}

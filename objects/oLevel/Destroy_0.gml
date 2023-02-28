for (var i = 0; i < array_length(walls); i++)
	instance_destroy(walls[i]);

for (var i = 0; i < array_length(ropes); i++)
	instance_destroy(ropes[i]);

for (var i = 0; i < array_length(flora); i++)
	instance_destroy(flora[i]);

instance_destroy(global.player);
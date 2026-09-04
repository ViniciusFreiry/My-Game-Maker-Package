function initialize_lights_system(_layer, _shadow_colour = c_black, _shadow_alpha = 1) {
	if(!instance_exists(obj_lights_system)) {
		var _obj = instance_create_layer(0, 0, _layer, obj_lights_system);
		
		_obj.shadow_colour = _shadow_colour;
		_obj.shadow_alpha = _shadow_alpha;
	}
}

function add_light_to_object(_object, _light_size, _light_colour = c_white, _light_intencity = 1, _random_variation = 1, _off_set = [0, 0], _sprite = spr_simple_light, _auto_sprite = false) {
	var _light_sys = obj_lights_system;
	
	array_push(_light_sys.objects_with_light, _object);
	array_push(_light_sys.lights_size, _light_size);
	array_push(_light_sys.lights_colour, _light_colour);
	array_push(_light_sys.lights_intensity, _light_intencity);
	array_push(_light_sys.shadow_randow_variation, _random_variation);
	array_push(_light_sys.lights_offset, _off_set);
	array_push(_light_sys.lights_sprite, _sprite);
	array_push(_light_sys.lights_auto_sprite, _auto_sprite);
}

function change_lights_system(_shadow_colour, _shadow_alpha) {
	obj_lights_system.shadow_colour = _shadow_colour;
	obj_lights_system.shadow_alpha = _shadow_alpha;
}
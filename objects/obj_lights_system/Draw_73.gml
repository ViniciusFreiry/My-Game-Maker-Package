if(!surface_exists(shadow_surface)) {
	var _width = surface_get_width(application_surface),
	_height = surface_get_height(application_surface);
	
	shadow_surface = surface_create(_width, _height, surface_rgba16float);
}

surface_set_target(shadow_surface);

draw_set_colour(shadow_colour);
draw_set_alpha(shadow_alpha);

draw_rectangle(0, 0, surface_get_width(shadow_surface), surface_get_height(shadow_surface), false);

camera_apply(view_camera[0]);

gpu_set_blendmode(bm_add);

for(var _i = 0; _i < array_length(objects_with_light); _i++) {
	with(objects_with_light[_i]) {
		var _x = x + other.lights_offset[_i][0],
		_y = y + other.lights_offset[_i][1];
		
		if(other.lights_auto_sprite[_i]) {
			var _light_varition = random(other.shadow_randow_variation[_i]),
			_xscale = image_xscale * other.lights_size[_i] + _light_varition,
			_yscale = image_yscale * other.lights_size[_i] + _light_varition;
			
			repeat(floor(other.lights_intensity[_i])) draw_sprite_ext(sprite_index, image_number, _x, _y, _xscale, _yscale, image_angle, other.lights_colour[_i], 1);
			draw_sprite_ext(sprite_index, image_number, _x, _y, _xscale, _yscale, image_angle, other.lights_colour[_i], frac(other.lights_intensity[_i]));
		} else {
			var _scale = (other.lights_size[_i] + irandom(other.shadow_randow_variation[_i])) / sprite_get_width(other.lights_sprite[_i]);
		
			repeat(floor(other.lights_intensity[_i])) draw_sprite_ext(other.lights_sprite[_i], 0, _x, _y, _scale, _scale, 0, other.lights_colour[_i], 1);
			draw_sprite_ext(other.lights_sprite[_i], 0, _x, _y, _scale, _scale, 0, other.lights_colour[_i], frac(other.lights_intensity[_i]));
		}
	}
}

draw_set_colour(c_white);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

surface_reset_target();
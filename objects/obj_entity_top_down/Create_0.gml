hspd = 0;
vspd = 0;
spd = 1;

dir = 0;
start_moving = false;

apply_spd = function() {
	if(start_moving) {
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
	} else {
		hspd = 0;
		vspd = 0;
	}
}

move = function() {
	if(place_meeting(x + hspd, y, obj_ground_top_down)) {
		var _new_x = round(x + hspd),
		_walked_distance = _new_x - round(x);
		
		x = _new_x;
		
		if(!place_meeting(x, y + _walked_distance, obj_ground_top_down)) y += _walked_distance;
		if(!place_meeting(x, y - _walked_distance, obj_ground_top_down)) y -= _walked_distance;
		
		if(place_meeting(x, y, obj_ground_top_down)) {
			var _hspd = sign(hspd);
			
			do {
				x -= _hspd;
			} until(!place_meeting(x, y, obj_ground_top_down));
		
			hspd = 0;
		}
	} else {
		x += hspd;
		
		var _hspd = sign(hspd);
		
		if(_hspd > 0) {
			var _ceil_x = ceil(x);
			
			if(place_meeting(_ceil_x, y, obj_ground_top_down)) {
				if(!place_meeting(_ceil_x, y + 1, obj_ground_top_down)) y++;
				if(!place_meeting(_ceil_x, y - 1, obj_ground_top_down)) y--;
				
				if(place_meeting(_ceil_x, y, obj_ground_top_down)) {
					x = floor(x);
					hspd = 0;
				}
			}
		} else if(_hspd < 0) {
			var _floor_x = floor(x);
			
			if(place_meeting(_floor_x, y, obj_ground_top_down)) {
				if(!place_meeting(_floor_x, y + 1, obj_ground_top_down)) y++;
				if(!place_meeting(_floor_x, y - 1, obj_ground_top_down)) y--;
				
				if(place_meeting(_floor_x, y, obj_ground_top_down)) {
					x = ceil(x);
					hspd = 0
				}
			}
		}
	}
	
	if(place_meeting(x, y + vspd, obj_ground_top_down)) {
		var _new_y = round(y + vspd),
		_walked_distance = _new_y - round(y);
		
		y = _new_y;
		
		if(!place_meeting(x + _walked_distance, y, obj_ground_top_down)) x += _walked_distance;
		if(!place_meeting(x - _walked_distance, y, obj_ground_top_down)) x -= _walked_distance;
		
		if(place_meeting(x, y, obj_ground_top_down)) {
			var _vspd = sign(vspd);
			
			do {
				y -= _vspd;
			} until(!place_meeting(x, y, obj_ground_top_down));
		
			vspd = 0;
		}
	} else {
		y += vspd;
		
		var _vspd = sign(vspd);
		
		if(_vspd > 0) {
			var _ceil_y = ceil(y);
			
			if(place_meeting(x, _ceil_y, obj_ground_top_down)) {
				if(!place_meeting(x + 1, _ceil_y, obj_ground_top_down)) x++;
				if(!place_meeting(x - 1, _ceil_y, obj_ground_top_down)) x--;
				
				if(place_meeting(x, _ceil_y, obj_ground_top_down)) {
					y = floor(y);
					vspd = 0;
				}
			}
		} else if(_vspd < 0) {
			var _floor_y = floor(y);
			
			if(place_meeting(x, _floor_y, obj_ground_top_down)) {
				if(!place_meeting(x + 1, _floor_y, obj_ground_top_down)) x++;
				if(!place_meeting(x - 1, _floor_y, obj_ground_top_down)) x--;
				
				if(place_meeting(x, _floor_y, obj_ground_top_down)) {
					y = ceil(y);
					vspd = 0;
				}
			}
		}
	}
}
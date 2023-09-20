//==============================================================================================
//	This file works exactly as the normal one, except... :D
//==============================================================================================

// [ SECTOR INITIALIZATION HELPER ]
	
	if(!("in_pipe" in Level)){Level.in_pipe <- false;}
	
	if(Level.in_pipe){
		Effect.set_black(true);
	}else{
		Tux.set_visible(true); 
		Effect.set_black(false)
		Camera.set_mode("normal");
	}
	
// [ EXIT PIPE FUNCTION ]
	
	exit_pipe <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		if(Level.in_pipe){
			Level.in_pipe = false;
					
			Tux.deactivate();
			Tux.set_ghost_mode(true);
				
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
			local targ_s = oy + 16;
			local targ_e = oy - 64;
			
			local isbig = Tux.get_bonus();
			if(isbig == "none"){
			targ_e = oy - 32;
			}
			
			local dist = (targ_s - targ_e) / 2;
			
			wait(0);
			Tux.set_pos(ox, targ_s);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
			Effect.fade_in(0.7);
			
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local ny = Tux.get_y() - 2;
			Tux.set_pos(tx, ny);	
			}
			
			Tux.set_ghost_mode(false);
			Tux.activate();
			
		}
		
	}

// [ ENTER PIPE FUNCTION ]
	
	enter_pipe <- function(obj, sect, spn){
		obj.enable_gravity(false);
		local press = Tux.get_input_held("down");
		if(press){
			
			Tux.use_scripting_controller(true);
			wait(0.05);
			Tux.set_ghost_mode(true);
			Tux.use_scripting_controller(false);
			
			Tux.deactivate();
			
			Camera.set_mode("manual");
						
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
			local targ_s = oy - 64;
			local targ_e = oy + 16;
			
			local isbig = Tux.get_bonus();
			if(isbig == "none"){
			targ_s = oy - 32;
			}
			
			local dist = (targ_e - targ_s) / 2;
			
			wait(0);
			Tux.set_pos(ox, targ_s);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
						
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local ny = Tux.get_y() + 2;
			Tux.set_pos(tx, ny);	
			}
			
			Tux.set_visible(false);
			
			if(isbig == "none"){
			wait(0.2);
			}
			
			Effect.fade_out(0.5);
			wait(0.6);
			
			Tux.set_pos(ox, (targ_s - 2));
			Tux.set_ghost_mode(false);
			Tux.activate();
			
			Level.in_pipe = true;
			Level.spawn(sect, spn);
				
		}
	}
	
	
// [ TWO-WAY PIPE ]

	twoway_pipe <- function(obj, sect, spn){
		exit_pipe(obj);
		enter_pipe(obj, sect, spn);
	}
	
// [ ENTER RIGHT ]

	enter_pipe_r <- function(obj, sect, spn){
		obj.enable_gravity(false);
		local press = Tux.get_input_held("right");
		
		if(press){
			
			Tux.use_scripting_controller(true);
			wait(0.05);
			Tux.set_ghost_mode(true);
			Tux.use_scripting_controller(false);
			
			Tux.deactivate();
			
			Camera.set_mode("manual");
						
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
						
			
			local targ_s = ox - 32;
			local targ_e = ox + 16;
			local isbig = Tux.get_bonus();
			local adj_y = obj.get_pos_y()-8;
			if(isbig == "none"){
			adj_y += 16;
			}
						
			local dist = (targ_e - targ_s) / 2;
			
			wait(0);
			Tux.set_pos(targ_s, adj_y);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
						
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local nx = Tux.get_x() + 2;
			Tux.set_pos(nx, ty);	
			}
			
			Tux.set_visible(false);
			
			wait(0.2);
			Effect.fade_out(0.5);
			wait(0.6);
			
			Tux.set_pos((ox - 34), adj_y);
			Tux.set_ghost_mode(false);
			Tux.activate();
			
			Level.in_pipe = true;
			Level.spawn(sect, spn);
				
		}
	}
	
// [ EXIT RIGHT ]
	exit_pipe_r <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		
		if(Level.in_pipe){
			Level.in_pipe = false;
			Tux.deactivate();
			Tux.set_ghost_mode(true);
			Tux.set_dir(true);
			
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
			local adj_y = obj.get_pos_y()-8;
			
			local targ_s = ox - 16;
			local targ_e = ox + 32;
			local isbig = Tux.get_bonus();
			local adj_y = obj.get_pos_y()-8;
			if(isbig == "none"){
			adj_y += 16;
			}
			
			local dist = (targ_e - targ_s) / 2;
			
			wait(0);
			Tux.set_pos(targ_s, adj_y);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
			Effect.fade_in(0.7);
			
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local nx = Tux.get_x() + 2;
			Tux.set_pos(nx, adj_y);	
			}
			
			Tux.set_ghost_mode(false);
			Tux.activate();
			
		}
		
	}
	
// [ ENTER LEFT ]

	enter_pipe_l <- function(obj, sect, spn){
		obj.enable_gravity(false);
		local press = Tux.get_input_held("left");
		
		if(press){
			
			Tux.use_scripting_controller(true);
			wait(0.05);
			Tux.set_ghost_mode(true);
			Tux.use_scripting_controller(false);
			
			Tux.deactivate();
			
			Camera.set_mode("manual");
						
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
						
			
			local targ_s = ox + 32;
			local targ_e = ox - 16;
			local isbig = Tux.get_bonus();
			local adj_y = obj.get_pos_y()-8;
			if(isbig == "none"){
			adj_y += 16;
			}
						
			local dist = (targ_s - targ_e) / 2;
			
			wait(0);
			Tux.set_pos(targ_s, adj_y);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
						
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local nx = Tux.get_x() - 2;
			Tux.set_pos(nx, ty);	
			}
			
			Tux.set_visible(false);
			
			wait(0.2);
			Effect.fade_out(0.5);
			wait(0.6);
			
			Tux.set_pos((ox + 34), adj_y);
			Tux.set_ghost_mode(false);
			Tux.activate();
			
			Level.in_pipe = true;
			Level.spawn(sect, spn);
				
		}
	}
	
// [ EXIT LEFT ]
	exit_pipe_l <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		
		if(Level.in_pipe){
			Level.in_pipe = false;
			Tux.deactivate();
			Tux.set_ghost_mode(true);
			Tux.set_dir(false);
			
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
			local adj_y = obj.get_pos_y()-8;
			
			local targ_s = ox + 16;
			local targ_e = ox - 32;
			local isbig = Tux.get_bonus();
			local adj_y = obj.get_pos_y()-8;
			if(isbig == "none"){
			adj_y += 16;
			}
			
			local dist = (targ_s - targ_e) / 2;
			
			wait(0);
			Tux.set_pos(targ_s, adj_y);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
			Effect.fade_in(0.7);
			
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local nx = Tux.get_x() - 2;
			Tux.set_pos(nx, adj_y);	
			}
			
			Tux.set_ghost_mode(false);
			Tux.activate();
			
		}
		
	}
	
	
// [ ENTER UP ]
	
	enter_pipe_u <- function(obj, sect, spn){
		obj.enable_gravity(false);
		local press = Tux.get_input_held("up");
		if(press){
			
			Tux.use_scripting_controller(true);
			wait(0.05);
			Tux.set_ghost_mode(true);
			Tux.use_scripting_controller(false);
			
			Tux.deactivate();
			
			Camera.set_mode("manual");
						
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
			local targ_s = oy + 32;
			local targ_e = oy - 48;
			
			local isbig = Tux.get_bonus();
			if(isbig == "none"){
			targ_e = oy - 16;
			}
			
			local dist = (targ_s - targ_e) / 2;
			
			wait(0);
			Tux.set_pos(ox, targ_s);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
						
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local ny = Tux.get_y() - 2;
			Tux.set_pos(tx, ny);	
			}
			
			Tux.set_visible(false);
			
			if(isbig == "none"){
			wait(0.2);
			}
			
			Effect.fade_out(0.5);
			wait(0.6);
			
			Tux.set_pos(ox, (targ_s + 2));
			Tux.set_ghost_mode(false);
			Tux.activate();
			
			Level.in_pipe = true;
			Level.spawn(sect, spn);
				
		}
	}
	
// [ EXIT DOWN ]
	
	exit_pipe_d <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		if(Level.in_pipe){
			Level.in_pipe = false;
					
			Tux.deactivate();
			Tux.set_ghost_mode(true);
				
			local ox = obj.get_pos_x();
			local oy = obj.get_pos_y();
			local targ_s = oy - 48;
			local targ_e = oy + 32;
			
			local isbig = Tux.get_bonus();
			if(isbig == "none"){
			targ_s = oy - 16;
			}
			
			local dist = (targ_e - targ_s) / 2;
			
			wait(0);
			Tux.set_pos(ox, targ_s);
			wait(0.1);
			play_sound("sounds/_custom/best_sound_effect_you_will_ever_hear.wav");
			Effect.fade_in(0.7);
			
			local tx = Tux.get_x();
			local ty = Tux.get_y();
			
			for(local i = 0; i < dist; i++){
			wait(0);
			local ny = Tux.get_y() + 2;
			Tux.set_pos(tx, ny);	
			}
			
			Tux.set_ghost_mode(false);
			Tux.activate();
			
		}
		
	}
	
	
// [ DEBUG NOTIFICATION ]
	
	//play_sound("sounds/hop.ogg");
	display("[DEBUG] Pipe Functions v3.0 loaded successfully!");
	
// [ BLACK SCREEN PREVENTION ]

	prevent <- function(){
		wait(0.2);
		if(Level.in_pipe){
			play_sound("sounds/willocatch.wav");
			Level.in_pipe = false;
			Effect.fade_in(0.5);
			Tux.set_visible(true);
			Tux.activate();
			Camera.set_mode("normal");
		}
	}


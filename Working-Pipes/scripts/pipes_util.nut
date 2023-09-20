//
//	New Working Pipes - by Eauix
//
//==============================================================================================
//
//	Here you will find many different functions that must be written in the
//	"hit script" from the scripted object that you will place on the pipe
//	you want to make functional, or inside script triggers depending on how it.
//	has to be set up.
//
//	The scripted object must be solid and have physics disabled, 
//	it may or not be visible, and must be placed on the middle of the
//	top 2 tiles of the pipe. The pipe must be on a tilemap with Z > 50.
//
//	If the pipe direction is other than entering down and exiting up, the exit functions will
//	need to be written in a script trigger that is touching the desired spawnpoint.
//	The script trigger MUST NOT be in front of the pipe, you can place the spawnpoint and the
//	trigger somewhere else and mention the scripted object of the pipe, so Tux will come out
//	of the pipe even if he doesn't directly spawn on the pipe.
//
//	To use this file, you have to import it in every sector of the level.
//	Example: <   import("scripts/pipes_util.nut");   >
//
//==============================================================================================
//
//	Methods:
//
//	<   exit_pipe(object_name);   >
//	-
//	This will make Tux do an animation coming out of the pipe while the screen
//	fades in when he touches the scripted object, you want this to happen
//	immediately after he spawns in the destination spawnpoint. This will
//	only happen if he has entered a pipe before.
//
//	<   enter_pipe(object_name, "destination_sector", "destination_spawnpoint");   >
//	-
//	This will make Tux do an animation going inside the pipe while the screen
//	fades out. This will only happen if you press [DOWN] while touching the
//	scripted object. Then he will teleport to the destination spawnpoint. You want
//	the destination waypoint to be right above a scripted object with exit_pipe,
//	otherwise the screen might stay black and not fade in again.
//
//	<   twoway_pipe(object_name, "destination_sector", "destination_spawnpoint");   >
//	-
//	This is basically the 2 previous functions combined into one.
//
//	<   exit_pipe_l(object_name);   >
//	<   exit_pipe_r(object_name);   >
//	<   exit_pipe_d(object_name);   >
//	-
//	These will make Tux do animations coming out of the pipe in different directions,
//	those being Left, Right and Down, respectively. These functions above will need
//	separate script trigger to be activated, as Tux is only able to "step" on a scripted
//	object that is underneath him.
//
//	<   enter_pipe_l(object_name, "destination_sector", "destination_spawnpoint");   >
//	<   enter_pipe_r(object_name, "destination_sector", "destination_spawnpoint");   >
//	<   enter_pipe_u(object_name, "destination_sector", "destination_spawnpoint");   >
//	-
//	These will make Tux do animations going inside the pipe depending on which key
//	must be held while touching the scripted object, those being [Left], [Right]
//	and [Up], respectively.
//
//	<   prevent();   >
//	-
//	This function should be wrwitten right after the import function, it will prevent
//	you from becoming softlocked in a black screen if there is no proper exit to the
//	pipe you entered.
//
//==============================================================================================
//	
//	If you want a pipe to be a 2-way warp, you can write both functions in the
//	same scripted object. WARNING! for this to work properly, the exit_pipe
//	function MUST be written BEFORE the enter_pipe function, otherwise the
//	pipes will glitch out and Tux will die or go somewhere he shouldn't be.
//
//	Example: <   exit_pipe(pipe1); enter_pipe(pipe1, "main", "destination1"   >
//
// 	Alternatively, you can another the twoway_pipe(...) function.
//	Be aware that this functions only works for the default pipe directions
//	(entering down and exiting up).
//
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
			hpc();
					
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
			play_sound("sounds/warp.wav");
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
			play_sound("sounds/warp.wav");
						
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
			hpc();
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
			play_sound("sounds/warp.wav");
						
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
			hpc();
			Level.spawn(sect, spn);
				
		}
	}
	
// [ EXIT RIGHT ]
	exit_pipe_r <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		
		if(Level.in_pipe){
			Level.in_pipe = false;
			hpc();
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
			play_sound("sounds/warp.wav");
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
			play_sound("sounds/warp.wav");
						
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
			hpc();
			Level.spawn(sect, spn);
				
		}
	}
	
// [ EXIT LEFT ]
	exit_pipe_l <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		
		if(Level.in_pipe){
			Level.in_pipe = false;
			hpc();
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
			play_sound("sounds/warp.wav");
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
			play_sound("sounds/warp.wav");
						
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
			hpc();
			Level.spawn(sect, spn);
				
		}
	}
	
// [ EXIT DOWN ]
	
	exit_pipe_d <- function(obj){
		
		Tux.set_visible(true);
		Camera.set_mode("normal");
		
		if(Level.in_pipe){
			Level.in_pipe = false;
			hpc();
					
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
			play_sound("sounds/warp.wav");
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
	
// [ HEALTH-PIPE COMPATIBILITY ]

	hpc <- function(){
		try{
			if(Level.in_pipe){
				hide();
			}else{
				unhide();
				display("[DEBUG] Health-Pipe Compatibility applied.");
			}
		}catch(e){}
	}
	
// [ BLACK SCREEN PREVENTION ]

	prevent <- function(){
		wait(0.2);
		if(Level.in_pipe){
			play_sound("sounds/willocatch.wav");
			Level.in_pipe = false;
			hpc();
			Effect.fade_in(0.5);
			Tux.set_visible(true);
			Tux.activate();
			Camera.set_mode("normal");
		}
	}


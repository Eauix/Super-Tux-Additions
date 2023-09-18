

//===============
// TEST FUNCTION
//===============

	function test_pipe_nut(){
	play_sound("sounds/coin2.ogg");
	wait(0.2);
	play_sound("sounds/coin.wav");
	Tux.add_coins(50);
	}

// ONE FRAME
	fr <- 0.01;

//=============================
// PIPE WITHIN THE SAME SECTOR
//=============================

	pipe <- function(sect, ext, objA, objB){
	
	Tux.deactivate();
	Tux.set_dir(false);
	objA.set_visible(false);
	objB.set_visible(false);
	Camera.set_mode("manual");
	
	wait(0.2);
	Tux.do_duck();
	
	play_sound("sounds/warp.wav");
	
	objA.set_solid(false);
	objA.move(-48, -32);
	objA.set_solid(true);
	wait(fr);
	objA.move(16, 0);
	wait(fr);
	objA.move(80, 0);
	wait(fr);
	objA.move(-16, 0);
	wait(fr);
	objA.set_solid(false);
	objA.move(-32, 32);
	wait(0.8);
	objA.set_solid(true);
	
	Tux.set_visible(false);
	Effect.fade_out(0.5);
	wait(0.6);
	Level.spawn(sect, ext);
	Camera.set_mode("normal");
	Effect.fade_in(0.5);
	Tux.set_visible(true);
	Tux.set_dir(true);
	
	wait(0.01);
	
	objB.set_solid(false);
	objB.move(0, 96);
	objB.set_solid(true);
	wait(0.01);
	Tux.do_duck();
	
	for(local i = 0; i < 64; i++){
		objB.move(0, -1.5);
		if(i == 16){Tux.do_standup();}
		if(i == 32){play_sound("sounds/warp.wav");}
		wait(fr);
	}
	
	wait(0.05);
	Tux.activate();
	
	}

//========================
// PIPE TO ANOTHER SECTOR
//========================

	pipe_to <- function(sect, ext, objA){
	
		
		Tux.deactivate();
		Tux.set_dir(false);
		objA.set_visible(false);
		Camera.set_mode("manual");
		
		if(!("has_entered_pipe" in Level)){	
			Level.has_entered_pipe <- true;		
		}
		Level.has_entered_pipe = true;
		display("[DEBUG] has_entered_pipe is now " + Level.has_entered_pipe);
	
		wait(0.2);
		Tux.do_duck();
	
		play_sound("sounds/warp.wav");
	
		objA.set_solid(false);
		objA.move(-48, -32);
		objA.set_solid(true);
		wait(fr);
		objA.move(16, 0);
		wait(fr);
		objA.move(80, 0);
		wait(fr);
		objA.move(-16, 0);
		wait(fr);
		objA.set_solid(false);
		objA.move(-32, 32);
		wait(0.8);
		objA.set_solid(true);
	
		Tux.set_visible(false);
		Effect.fade_out(0.5);
		wait(0.6);
		Tux.set_visible(true);
		Tux.activate();
		Effect.fade_in(0.5);
		Camera.set_mode("normal");
		
		Level.spawn(sect, ext);

	}


//======================================
// INITIALIZE SECTOR COMING FROM A PIPE
//======================================

	pipe_from <- function(objB){
		objB.set_visible(false);
		
		if("has_entered_pipe" in Level){
			if(Level.has_entered_pipe == true){
				
				display("[DEBUG] Entering new sector from " + objB);
				
				Tux.deactivate();
				
				Camera.set_mode("normal");
				Effect.fade_in(0.5);
				Tux.set_visible(true);
				Tux.set_dir(true);
	
				wait(0.01);
	
				objB.set_solid(false);
				objB.move(0, 96);
				objB.set_solid(true);
				wait(0.01);
				Tux.do_duck();
	
				for(local i = 0; i < 64; i++){
					objB.move(0, -1.5);
					if(i == 16){Tux.do_standup();}
					if(i == 32){play_sound("sounds/warp.wav");}
					wait(fr);
				}
	
				wait(0.05);
				Tux.activate();
				
				Level.has_entered_pipe = false;
				display("[DEBUG] has_entered_pipe is now " + Level.has_entered_pipe);
									
			}
		}
	}

//========
// NOTIFY
//========
	
	//play_sound("sounds/hop.ogg");
	display("[DEBUG] Pipe functions loaded successfully!");
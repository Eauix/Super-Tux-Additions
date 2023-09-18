
add_fire <- function(){
	play_sound("sounds/fire-flower.wav");
	health_compatibility();
	for(local i = 0; i<5; i++){
		Tux.add_bonus("fireflower");
	}
}

add_ice <- function(){
	play_sound("sounds/fire-flower.wav");
	health_compatibility();
	for(local i = 0; i<5; i++){
		Tux.add_bonus("iceflower");
	}
}

add_air <- function(){
	play_sound("sounds/fire-flower.wav");
	health_compatibility();
	for(local i = 0; i<5; i++){
		Tux.add_bonus("airflower");
	}
}

add_earth <- function(){
	play_sound("sounds/fire-flower.wav");
	health_compatibility();
	for(local i = 0; i<5; i++){
		Tux.add_bonus("earthflower");
	}
}

collect_platinum <- function(){
	play_sound("sounds/coin2.ogg");
	Tux.add_coins(4);
}

hit_5coins <- function(){

	Tux.add_coins(4);
	for(local i = 0; i<4; i++){
		wait(0.05);
		play_sound("sounds/coin.wav");
	}
}

//add_star <- function(){
//	play_sound("sounds/invincible_start");
//}

display("[DEBUG] Extra Bonus Functions loaded successfully!");

try{
	import("scripts/health_util.nut");
}catch(e){
	display("[DEBUG] Warning! Health bar is not installed.");

	heal <- function(amount){
		
		amount = 1;
		Tux.add_bonus("grow");
		play_sound("sounds/grow.ogg");
	}
}

health_compatibility <- function(){
	try{
		if(Tux.get_bonus() == "none"){
			state.health = 2;
			Level.sfb = true;
			if(Level.health_in_use){
				wait(0.1);
			}
		}
	}catch(e){
		display("[DEBUG] Warning! Health bar is not installed.");
	}
}

//display("[DEBUG] Extra Bonus Functions loaded successfully!");
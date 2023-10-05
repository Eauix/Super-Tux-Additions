
// ==== HEALTH BAR'S POSITION ON SCREEN (CAN BE CHANGED BY SCRIPTING) ==========

// original barposx: -124
// original barposy: 10
// original baranch: ANCHOR_TOP_RIGHT

Level.barposx <- -124;
Level.barposy <- 10;
Level.baranch <- ANCHOR_TOP_RIGHT;

// =============================================================================





// ==== FLOATING IMAGE HANDLING AND INTERNAL VARIABLES =========================

testicon <- FloatingImage("images/custom_hud/test.png");
testicon.set_anchor_point(ANCHOR_MIDDLE);
testicon.set_visible(false);
testicon.set_pos(0, 0);

hbar <- FloatingImage("images/custom_hud/health_bar.sprite");
hbar.set_anchor_point(Level.baranch);
hbar.set_visible(false);
hbar.set_pos(Level.barposx, Level.barposy);
hbar.set_action("h5");
hbar.set_layer(501);

hicon <- FloatingImage("images/custom_hud/heart_icon.sprite");
hicon.set_anchor_point(Level.baranch);
hicon.set_visible(false);
hicon.set_pos(Level.barposx, Level.barposy);
hicon.set_action("h5");
hicon.set_layer(500);

if(!("sfb" in Level)){
Level.sfb <- false;
}

Level.dfb <- false;

if(!("health_in_use" in Level)){
Level.health_in_use <- false;
}

if(!("health" in state)){
state.health <- 5;
}

if(!("previous_health" in state)){
state.previous_health <- 5;
}

Level.hurtcooldown <- false;
Level.univ_dmg <- 1;

// =============================================================================





// ==== FUNCTIONS TO USE IN-EDITOR =============================================


// RESETS THE HEALTH.
// (USEFUL AS A SCRIPT TRIGGER AT THE BEGINNING OF THE LEVEL.)
reset_health <- function(){
	Tux.add_bonus("grow");
	state.health <- 5;
}


// HEALS OR DECREASES PLAYER HEALTH.
// (ACTS AS AN EGG IF THE HEALTH BAR IS NOT IN USE.)
// (USE THIS WITH CUSTOM POWERUPS.)
heal <- function(amount){
	if(Level.health_in_use == true){
		state.health += amount;
		if(amount > 0){
			play_sound("sounds/_custom/heal_item.wav");
		}
		if(amount < 0){
			play_sound("sounds/hurt.wav");
		}
	}else{
		if(amount > 0){
			Tux.add_bonus("grow");
			play_sound("sounds/grow.ogg");
		}
			if(amount < 0){
			Tux.kill(false);
		}
	}
}


// HURTS THE PLAYER BY A SET AMOUNT OF DAMAGE.
// (USE THIS IN SCRIPT TRIGGERS OR OBJECTS THAT ARE CONSIDERED HAZARDOUS.);
hurt <- function(damage){
	if(damage == 1){ 
		Tux.kill(false);
	}
	if(damage > 5){
		damage = 5;
	}
	if(damage > 1 && !Level.hurtcooldown){
		damage -= 1;
		Tux.kill(false);
		state.health -= damage;
		Level.hurtcooldown = true;
		wait(1.8);
		Level.hurtcooldown = false;
	}
}


// SETS THE AMOUNT OF DAMAGE THAT ANYTHING WILL CAUSE TO THE PLAYER.
// (USE THIS ON PLACES WHERE TUX SHOULD TAKE A DIFFERENT AMOUNT OF DAMAGE, E.G: LAVA.)
set_damage <- function(val){
	if(val < 0){
		val = 0;
	}
	if(val > 5){
		val = 5;
	}
	Level.univ_dmg = val;
}


// HIDES THE HEALTH BAR.
// USE THIS BEFORE THE "Level.spawn" FUNCTION
// TO PREVENT AN OVERLAPPING GLITCH
hide <- function(){
	hbar.set_visible(false);
	hicon.set_visible(false);
}


// UNHIDES THE HEALTH BAR.
unhide <- function(){
	if(Level.health_in_use){
		hbar.set_visible(true);
		hicon.set_visible(true);
	}
}


// STARTS OR STOPS THE USE OF THE HEALTH BAR
// (BE SURE TO MAKE THIS THE LAST FUNCTION IN THE SCRIPT)
use_health <- function(do_use){
	if(do_use){
		if(state.health <= 1){
			Level.sfb = true;
		}else{
			Tux.add_bonus("grow");
			Level.sfb = false;
		}
		hbar.set_pos(Level.barposx, Level.barposy);
		hicon.set_pos(Level.barposx, Level.barposy);
		hbar.set_anchor_point(Level.baranch);
		hicon.set_anchor_point(Level.baranch);
		Level.health_in_use = false;
		wait(0);
		Level.health_in_use = true;
	}else{
		Level.health_in_use = false;
	}
	
	hbar.set_visible(do_use);
	hicon.set_visible(do_use);
	
	while(Level.health_in_use){
	
		state.previous_health = state.health;
	
		if(Tux.get_action() == "grow-right" || Tux.get_action() == "grow-left"){
			state.health = 2;
			Level.sfb = true;
		}
		
		wait(0);
		
		if(Tux.get_bonus() == "none"){
			if(!Level.sfb){
				wait(0);
			}
			if(Tux.get_action != "gameover"){
				if(!Level.sfb){
					state.health -= Level.univ_dmg;
				}
			}
		}else{
			Level.sfb = false;
		}
		
		if(state.health > 1){
			Tux.add_bonus("grow");
		}
		if(state.health > 5){
			state.health = 5;
			anim_heal();
		}
		if(state.health < 0){
			state.health = 0;
		}
		
		switch(state.health){
			
			case 5:
			hbar.set_action("h5");

			break;
			
			case 4:
			hbar.set_action("h4");

			break;
			
			case 3:
			hbar.set_action("h3");
		
			break;
			
			case 2:
			hbar.set_action("h2");
			
			break;
			
			case 1:
			hbar.set_action("h1");
			
			Tux.set_bonus("none");
			Level.sfb = true;
			
			break;
			
			case 0:

			Tux.kill(true);
			hbar.set_action("h0");
			Level.sfb = true;
			Level.dfb = true;
			
			break;
			
			default:
			
		}
	
		if(Tux.get_action() == "gameover"){
			state.health = 0;
			state.previous_health = 0;
			hicon.set_action("dead");
			hbar.set_action("h0");
			anim_hurt();
			
			Level.health_in_use = false;
			state.health = 5;
			state.previous_health = 0;
			Level.sfb = true;
			
		}else{

			if(state.previous_health > state.health && Level.dfb == false){
				anim_hurt();
			}
			
			if(state.previous_health < state.health){
				anim_heal();
			}
			
			if(Tux.get_bonus() == "grow" && hicon.get_action() == "powerup"){
				if(Level.univ_dmg > 1){
					state.health -= (Level.univ_dmg - 1);
				}
				anim_hurt();	
			}
			
			if(Tux.get_bonus() != "none" && Tux.get_bonus() != "grow" && hicon.get_action() == "normal"){
				anim_heal();
			}
			
			if(Tux.get_bonus() != "none" && Tux.get_bonus() != "grow"){
				hicon.set_action("powerup");
			}else{
				hicon.set_action("normal");
			}
			
		}
		
	}
	
}

// =============================================================================






// ==== INTERNAL FUNCTIONS =====================================================

anim_hurt <- function(){
		hicon.set_action("hurt");
		hbar.set_pos(Level.barposx, Level.barposy + 3);
		hicon.set_pos(Level.barposx, Level.barposy + 3);
		wait(0.03);
		anim_set_correct_action();
		hbar.set_pos(Level.barposx, Level.barposy - 2);
		hicon.set_pos(Level.barposx, Level.barposy - 2);
		wait(0.03);
		hicon.set_action("hurt");
		hbar.set_pos(Level.barposx, Level.barposy + 1);
		hicon.set_pos(Level.barposx, Level.barposy + 1);
		wait(0.03);
		hbar.set_pos(Level.barposx, Level.barposy);
		hicon.set_pos(Level.barposx, Level.barposy);
		anim_set_correct_action();
}

anim_heal <- function(){
				
		hicon.set_action("heal");
		hicon.set_pos(Level.barposx, Level.barposy - 3);
		wait(0.03);
		hicon.set_pos(Level.barposx, Level.barposy - 1);
		wait(0.03);
		hicon.set_pos(Level.barposx, Level.barposy);
		
		anim_set_correct_action();
}

anim_set_correct_action <- function(){

	if(Tux.get_bonus() != "none" && Tux.get_bonus() != "grow"){
		hicon.set_action("powerup");
	}else{
		if(Tux.get_action() == "gameover"){
			hicon.set_action("dead");
		}else{
			hicon.set_action("normal");
		}
	}
}

//play_sound("sounds/hop.ogg");
display("[DEBUG] Health Bar Functions loaded successfully!");

// =============================================================================

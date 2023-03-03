vx = 0;
vy = 0;

grav = 0.3;
walkv = 7;

death_counter = -1;

flash = 0;

isHurt = false;

look_direction = true;

#macro strafe_cooldown 1 * 60;
strafe_cooldown_timer = 0;

#macro strafe_duration .5 * 60;
strafe_timer = 0;

money = 0;

global._score = 0;

_score = 0;

invisible = false;

damage_cooldown = 0;

damage = 1;

hp = 100;

ladder = false;
image_speed = 1;

_gun = instance_create_layer(x, y, "Gun", oGun);
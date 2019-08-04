/// @description Insert description here
// You can write your code in this editor

vel = [0, 0];
dead = false;
grounded = false;

can_catch = true;
is_catching = false;

impaled = undefined;

direction = -1;
key_catch = false;

image_speed = 0;

sIdle = sSpectreIdle;
sJump = sSpectreJump;
sWalk = sSpectreWalk;

game_set_speed(60, gamespeed_fps);

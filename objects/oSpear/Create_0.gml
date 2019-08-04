/// @description Insert description here
// You can write your code in this editor
thrown = false;
vel = [0, 0];
grounded = false;

holding = instance_find(oPlayer, 0);
throwing = undefined;
impaled = ds_list_create();

holdingXOffset = 20;
holdingYOffset = 5;

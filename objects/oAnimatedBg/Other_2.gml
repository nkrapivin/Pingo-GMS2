/// @description init
randomize(); // ask GMS2 to generate a random seed for random_ functions
image_index = irandom(2);
image_xscale = 0.5;
image_yscale = 0.5;
image_speed = 0;
bg = BGCOLOR1;

#macro BGCOLOR1 make_color_rgb(97,90,160)
#macro BGCOLOR2 make_color_rgb(47,98,52)
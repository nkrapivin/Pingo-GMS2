/// @description init
audio_group_stop_all(ag_bgm);
audio_play_sound(sndCreditsBgm,0,true);
x = room_width/2;
draw_set_font(fntMainfont);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_black);
str = @"Pingo development team:

Grzybojad - Programming, Level Design
Jumbocube - Art
nkrapivin - GameMaker Studio 2 Port, Cat

Music:

All music comes from soundimage.org, composed by Eric Matyas.

Sound Effects:

wubitog - Ball hit
Kenney - Menu click
Brandon Morris - Level finish
soundimage.org - Credits intro

Special Thanks:

Dragnu5 - Testing
Xerpi - LibVita2d
VitaSDK Team - VitaSDK
All the people on Discord who've helped me during development.
Extra Special thanks to RobDevs for creating pingo-edit.
It was a massive help during development.

Disclaimer!
Pingo is a free,
open source game distributed under the GPL-3.0 licence.
If you paid for it, you've been scammed.

Thank you very much for playing Pingo!

Beating the game is impressive enough,
but can you get 3 stars on every level?

If you got this far,
feel free to contact me on Twitter (@_grzybojad)
or on Discord (Grzybojad#7413).
I'd love to know what you think about Pingo!
TIP:
try inputing the following button combination in the main menu:
up, up, down, down, left, right, left, right, b, a.
(works only on PC)
or up, up, down, down, left, right, left, right
(on mobile or html5)

If you have encountered a bug in GameMaker Studio 2 version,
then please contact:
@nkrapivindev on Twitter or
nik#5351 on Discord
And then the almighty cat will help you.";
y = room_height+string_height(str)-850;
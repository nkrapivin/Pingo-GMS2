/// @desc scrCalcDirection(moveh,movev)
/// @arg moveh
/// @arg movev

// THIS SCRIPT IS NOT USED!




var _h = argument0;
var _v = argument1;
if (_h == 1) && (_v == 0) direction = 0;
else if (_h == -1) && (_v == 0) direction = 180;
else if (_h == 0) && (_v == 1) direction = 90;
else if (_h == 0) && (_v == -1) direction = 270;
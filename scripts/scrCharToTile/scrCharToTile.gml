/// @desc scrCharToTile(char)
/// @arg char
// takes char like "w" and turns it into a value from enum.
// easy huh?

enum TILES {
	WALL_TILE,
	FLOOR_TILE,
	START_TILE,
	STOP_TILE,
	DOUBLEFLOOR_TILE,
	CONVEYOR0_TILE,
	CONVEYOR1_TILE,
	CONVEYOR2_TILE,
	CONVEYOR3_TILE,
	TILE
}

var c = argument0; //temp variable, will be freed after return;
switch( c )
{
	case "w":
	case "#":
		return TILES.WALL_TILE; break;

	case "f":
	case ".":
		return TILES.FLOOR_TILE; break;

	case "s":
		return TILES.START_TILE; break;

	case "x":
		return TILES.STOP_TILE; break;

	case "d":
		return TILES.DOUBLEFLOOR_TILE; break;

	case "^":
		return TILES.CONVEYOR0_TILE; break;

	case ">":
		return TILES.CONVEYOR1_TILE; break;

	case "v":
		return TILES.CONVEYOR2_TILE; break;

	case "<":
		return TILES.CONVEYOR3_TILE; break;

	default:
		return TILES.TILE; break; //what?
}

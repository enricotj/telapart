var nx = x;
var ny = y;

// collision detection
var lx = nx - hOff;
var rx = nx + hOff;
var lCol = floor((nx - hOff) / TILE_SIZE);
var rCol = floor((nx + hOff) / TILE_SIZE);
var hRow = floor((ny + 14) / TILE_SIZE);
var left = obj_level.grid[# lCol, hRow];
var right = obj_level.grid[# rCol, hRow];

var vCol = floor(nx / TILE_SIZE);
var topRow = floor((ny - vOff) / TILE_SIZE);
var botRow = floor((ny + vOff) / TILE_SIZE);
var ground = obj_level.grid[# vCol, botRow];
for (var i = 0; i < ys; i += TILE_SIZE) {
    var ysRow = floor((ny + vOff + i) / TILE_SIZE);
    if (obj_level.grid[# vCol, ysRow] == 0) {
        ground = 0;
        ys += i;
    }
}

var slope = obj_level.grid[# vCol, botRow - 1];
var slope1 = obj_level.grid[# vCol, botRow - 2];
var wall = obj_level.grid[# vCol, botRow - 3];

var lSlope = obj_level.grid[# lCol, botRow - 1];
var lSlope1 = obj_level.grid[# lCol, botRow - 2];
var lWall = obj_level.grid[# lCol, botRow - 3];
var rSlope = obj_level.grid[# rCol, botRow - 1];
var rSlope1 = obj_level.grid[# rCol, botRow - 2];
var rWall = obj_level.grid[# rCol, botRow - 3];

// horizontal movement
if (keyboard_check(ord('A')))
{
    xs = -hsMax;
    if (left == 0 && (ground == -1 || !((lSlope == 0 || lSlope1 == 0) && lWall != 0))) {
        xs = 0;
    }
}
else if (keyboard_check(ord('D')))
{
    xs = hsMax;
    if (right == 0 && (ground == -1 || !((rSlope == 0 || rSlope1 == 0)&& rWall != 0))) {
        xs = 0;
    }
}
else
{
    xs = 0;
}

// vertical movement
if (ground == -1) {
    // in air
    ys += g;
}
else {
    // on ground
    ys = 0;
    var yy = botRow * TILE_SIZE;
    ny = yy - vOff;
    
    if (keyboard_check(ord('W'))) {
        ys = -vsMax;  
        ground = -1;
    }
    else if ((slope == 0 || slope1) && wall != 0) {
        ny -= TILE_SIZE;       
    }
}

if (keyboard_check_pressed(vk_escape)) {
    game_restart();
}

nx += xs;
ny += ys;

x = nx;
y = ny;

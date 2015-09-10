var nx = x;
var ny = y;

// collision detection
var lx = nx - hOff;
var rx = nx + hOff;
var lCol = floor((nx - hOff) / TILE_SIZE);
var rCol = floor((nx + hOff) / TILE_SIZE);
var hRow = floor((ny + 6) / TILE_SIZE);
var topRow = floor((ny - 10) / TILE_SIZE);
var left = ds_grid_get(grids[grid], lCol, hRow);
var right = ds_grid_get(grids[grid], rCol, hRow);
var top = -1;

var vCol = floor(nx / TILE_SIZE);
var topRow = floor((ny - vOff) / TILE_SIZE);
var botRow = floor((ny + vOff) / TILE_SIZE);
var ground = ds_grid_get(grids[grid], vCol, botRow);

for (var r = topRow; r <= hRow; r++)
{
    if (ds_grid_get(grids[grid], lCol, r) == 0)
    {
        left = 0;
    }
    if (ds_grid_get(grids[grid], rCol, r) == 0)
    {
        right = 0;
    }
}

if (ds_grid_get(grids[grid], vCol, topRow) == 0)
{
    top = 0;
}

for (var c = lCol; c <= rCol; c++) {
    if (ds_grid_get(grids[grid], c, topRow) == 0)
    {
        //top = 0;
    }
    if (ds_grid_get(grids[grid], c, botRow) == 0)
    {
        //ground = 0;
    }
}

for (var i = 0; i < ys; i += TILE_SIZE) {
    var ysRow = floor((ny + vOff + i) / TILE_SIZE);
    if (ds_grid_get(grids[grid], vCol, ysRow) == 0) {
        ground = 0;
        ys += i;
        xs = 0;
    }
}

var slope = ds_grid_get(grids[grid], vCol, botRow - 1);
var slope1 = ds_grid_get(grids[grid], vCol, botRow - 2);
var wall = ds_grid_get(grids[grid], vCol, botRow - 3);

var lSlope = ds_grid_get(grids[grid], lCol, botRow - 1);
var lSlope1 = ds_grid_get(grids[grid], lCol, botRow - 2);
var lWall = ds_grid_get(grids[grid], lCol, botRow - 3);
var rSlope = ds_grid_get(grids[grid], rCol, botRow - 1);
var rSlope1 = ds_grid_get(grids[grid], rCol, botRow - 2);
var rWall = ds_grid_get(grids[grid], rCol, botRow - 3);

// horizontal movement
if (keyboard_check(ord('A')))
{
    xs = -hsMax;
    if (left == 0 && (ground == -1 || !((lSlope == 0 || lSlope1 == 0) && lWall != 0))) {
        xs = 0;
    }
    if (left == 0 && ground == -1) {
        xs = 0;
    }
}
else if (keyboard_check(ord('D')))
{
    xs = hsMax;
    if (right == 0 && (ground == -1 || !((rSlope == 0 || rSlope1 == 0)&& rWall != 0))) {
        xs = 0;
    }
    if (right == 0 && ground == -1) {
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
    if (top == 0 && ys < 0) {
        ys = 0;
    }
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


if (xs != 0) {
    image_speed = 0.25;
    image_xscale = sign(xs);
}
else {
    image_speed = 0;
    image_index = 2;
}

if (ground == -1) {
    image_speed = 0;
    image_index = 5;
}

nx += xs;
ny += ys;

x = nx;
y = ny;

ViewMouseAdjust();

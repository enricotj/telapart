var w = 1024 / TILE_SIZE;
var h = 768 / TILE_SIZE;

globalvar grid, grids;

grid = 0;

grids[0] = ds_grid_create(w, h);
grids[1] = ds_grid_create(w, h);
grids[2] = ds_grid_create(w, h);

for (var gi = 0; gi < 3; gi++) {
    for (var i = 0; i < w; i++) 
    {
        for (var k = 0; k < h; k++)
        {
            ds_grid_set(grids[gi], i, k, -1);
        }
    }
}

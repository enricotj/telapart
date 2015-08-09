var w = 1024 / TILE_SIZE;
var h = 768 / TILE_SIZE;
grid = ds_grid_create(w, h);

for (i = 0; i < w; i++) 
{
    for (k = 0; k < h; k++)
    {
        grid[# i,k] = -1;
    }
}

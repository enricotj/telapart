draw_self();
draw_sprite_ext(spr_cursor, 0,
    floor(mouse_x / TILE_SIZE) * TILE_SIZE,
    floor(mouse_y / TILE_SIZE) * TILE_SIZE, 1, 1, 0, c_white, 0.75);

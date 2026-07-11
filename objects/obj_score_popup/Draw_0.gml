draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_arcade);
draw_sprite(asset_get_index("spr_score_" + string(value)), 0, x, y);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
var x_ = x;
var y_ = y;

var xscale = 1;
var yscale = 1;
var angle = 0;

switch (looking_at)
{
    case Direction.RIGHT:
        xscale = -1;
        x_ += sprite_width;
        break;

    case Direction.UP:
        angle = 270;
        x_ += sprite_width;
        break;

    case Direction.DOWN:
        angle = 90;
        y_ += sprite_height;
        break;
}

draw_sprite_ext(
    sprite_index,
    image_index,
    x_,
    y_,
    xscale,
    yscale,
    angle,
    image_blend,
    image_alpha
);
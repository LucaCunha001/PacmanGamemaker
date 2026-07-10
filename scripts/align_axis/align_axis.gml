function align_axis()
{
    switch (looking_at)
    {
        case Direction.LEFT:
        case Direction.RIGHT:
            var center = round((y - 24) / 4) * 4 + 24;
            y += (center - y) * 0.5;
            break;

        case Direction.UP:
        case Direction.DOWN:
            center = round(x / 4) * 4;
            x += (center - x) * 0.5;
            break;
    }
}
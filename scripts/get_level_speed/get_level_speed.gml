function get_level_speed(type)
{
    var lvl = get_level_data();

    switch(type)
    {
        case "pacman":
            return global.base_speed * lvl[1];

        case "ghost":
            return global.base_speed * lvl[3];

        case "tunnel":
            return global.base_speed * lvl[4];

        case "frightened":
            return global.base_speed * lvl[9];

        case "elroy1":
            return global.base_speed * lvl[6];

        case "elroy2":
            return global.base_speed * lvl[8];
    }

    return global.base_speed;
}
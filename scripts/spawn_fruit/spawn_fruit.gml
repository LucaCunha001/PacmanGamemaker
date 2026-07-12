function spawn_fruit()
{
    var fruit = instance_create_depth(112, 164, -1, obj_fruit);
	var info = get_level_fruit(global.level);
    fruit.fruit = info[$ "sprite"];
	fruit.image_index = fruit.fruit;
    fruit.fruit_score = info[$ "score"];
}
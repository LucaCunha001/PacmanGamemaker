function get_scores()
{
    var data_file = "scores.dat";

    global.high_scores = [];

    if (!file_exists(data_file)) {
		create_default_scores();
        return;
	}

    var data = file_text_open_read(data_file);

    for (var i = 0; i < 10 && !file_text_eof(data); i++)
    {
        var name = file_text_read_string(data);
        file_text_readln(data);

        var high_score = file_text_read_real(data);
        file_text_readln(data);

        array_push(global.high_scores,
        {
            "name": name,
            "score": high_score
        });
		
		if (i == 0) global.high_score = high_score;
    }

    file_text_close(data);
}


function create_default_scores()
{
	global.high_score = 10_000;
    global.high_scores =
    [
        { name: "AAA", score: 10000 },
        { name: "BBB", score: 8000 },
        { name: "CCC", score: 6000 },
        { name: "DDD", score: 4000 },
        { name: "EEE", score: 2000 },
        { name: "FFF", score: 1000 },
        { name: "GGG", score: 500 },
        { name: "HHH", score: 300 },
        { name: "III", score: 200 },
        { name: "JJJ", score: 100 }
    ];

    save_scores();
}

function save_scores()
{
    var data = file_text_open_write("scores.dat");

    for (var i = 0; i < array_length(global.high_scores); i++)
    {
        var entry = global.high_scores[i];

        file_text_write_string(data, entry.name);
        file_text_writeln(data);

        file_text_write_real(data, entry.score);
        file_text_writeln(data);
    }

    file_text_close(data);
}
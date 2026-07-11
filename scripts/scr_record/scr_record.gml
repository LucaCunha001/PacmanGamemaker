function demo_start_record()
{
    global.demo_recording = true;
    global.demo_frame = 0;
    global.demo_events = [];
}

function demo_stop_record()
{
    global.demo_recording = false;

    var file = file_text_open_write("demo.txt");

    for (var i = 0; i < array_length(global.demo_events); i++)
    {
        var e = global.demo_events[i];

        file_text_write_string(
            file,
            string(e.frame) + ";" + string(e.dir)
        );

        file_text_writeln(file);
    }

    file_text_close(file);
}
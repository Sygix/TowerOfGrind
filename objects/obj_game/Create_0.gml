countdown_duration = 60 * 5
start_time = current_time
countdown_active = true
doors_close_this_frame = false

for (var i = 0; i < instance_number(obj_doors); ++i;)
{
    doors[i] = instance_find(obj_doors, i);
}

doors_closing_interval = countdown_duration / array_length(doors)
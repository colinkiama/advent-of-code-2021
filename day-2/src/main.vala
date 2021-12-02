struct SubPosition {
    int horizontal;
    int depth;
}

int main (string[] args) {
    string input_contents;
    try {
        FileUtils.get_contents ("data/input.txt", out input_contents);
    } catch (Error e) {
        error (e.message);
    }

    string[] commands = input_contents.strip ().split ("\n");

    // Part 1
    SubPosition sub_position = calculate_sub_position (commands);
    print ("Position product: %d\n", sub_position.horizontal * sub_position.depth);

    // Part 2
    SubPosition complex_sub_position = calculate_complex_sub_position (commands);
    print ("Complex Position product: %d\n", complex_sub_position.horizontal * complex_sub_position.depth);


    return 0;
}

SubPosition calculate_sub_position (string[] commands) {
    int horizontal_val = 0;
    int depth_val = 0;

    foreach (string command in commands) {
        string[] command_parts = command.split (" ");
        switch (command_parts[0]) {
            case "forward":
                horizontal_val += int.parse (command_parts[1]);
                break;
            case "up":
                depth_val -= int.parse (command_parts[1]);
                break;
            case "down":
                depth_val += int.parse (command_parts[1]);
                break;
        }
    }

    return SubPosition () {
        horizontal = horizontal_val,
        depth = depth_val
    };
}

SubPosition calculate_complex_sub_position (string[] commands) {
    int aim_val = 0;
    int horizontal_val = 0;
    int depth_val = 0;

    foreach (string command in commands) {
        string[] command_parts = command.split (" ");
        int command_units = int.parse (command_parts[1]);
        switch (command_parts[0]) {
            case "forward":
                horizontal_val += command_units;
                depth_val += aim_val * command_units;
                break;
            case "up":
                aim_val -= command_units;
                break;
            case "down":
                aim_val += command_units;
                break;
        }
    }

    return SubPosition () {
        horizontal = horizontal_val,
        depth = depth_val,
    };
}

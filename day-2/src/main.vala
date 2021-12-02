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

    print ("%s\n", input_contents);

    // Part 1
    SubPosition sub_position = calculate_sub_position (input_contents.strip ().split ("\n"));
    print ("Horizontal position: %d\n", sub_position.horizontal);
    print ("Depth: %d\n", sub_position.depth);
    print ("Position product: %d\n", sub_position.horizontal * sub_position.depth);
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
                depth_val += -1 * int.parse (command_parts[1]);
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

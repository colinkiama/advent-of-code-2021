int main (string[] args) {
    string input_contents;

    try {
        FileUtils.get_contents ("data/input.txt", out input_contents);
    } catch (Error e) {
        error (e.message);
    }

    int[] depths = parse_nums_from_lines (input_contents.strip ().split ("\n"));
    int depth_increases = count_depth_increases (depths);
    print ("Depth increases: %d\n", depth_increases);

    return 0;
}

int[] parse_nums_from_lines (string[] lines) {
    int[] nums = new int[lines.length];
    for (int i = 0; i < lines.length; i++) {
        nums[i] = int.parse (lines[i]);
    }

    return nums;
}

int count_depth_increases (int[] depths) {
    int depth_increases = 0;

    for (int i = 0; i < depths.length - 1; i++) {
        if (depths[i + 1] > depths[i]) {
            depth_increases++;
        }
    }

    return depth_increases;
}

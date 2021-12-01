int main (string[] args) {
    string input_contents;
    try {
        FileUtils.get_contents ("data/input.txt", out input_contents);
    } catch (Error e) {
        error (e.message);
    }

    int[] depths = parse_nums_from_lines (input_contents.strip ().split ("\n"));

    // Part 1
    print ("Depth increases: %d\n", count_depth_increases (depths));

    // Part 2
    print ("Sliding window sum increases: %d\n", count_sliding_window_sum_increases (depths));

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

int count_sliding_window_sum_increases (int[] depths) {
    int sum_increases = 0;
    for (int i = 0; i < depths.length - 3; i++) {
        int sum_1 = depths[i] + depths[i + 1] + depths[i + 2];
        int sum_2 = depths[i + 1] + depths[i + 2] + depths[i + 3];

        if (sum_2 > sum_1) {
            sum_increases++;
        }
    }

    return sum_increases;
}

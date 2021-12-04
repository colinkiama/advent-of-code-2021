enum BitState {
    ON,
    OFF,
    UNKNOWN
}

struct BitCount {
    public uint on_count;
    public uint off_count;

    public BitCount () {
        on_count = 0;
        off_count = 0;
    }

    public BitState lowest_common_bit () {
        if (off_count < on_count) {
            return BitState.OFF;
        } else if (on_count < off_count) {
            return BitState.ON;
        }

        return BitState.UNKNOWN;
    }

    public BitState most_common_bit () {
        if (off_count > on_count) {
            return BitState.OFF;
        } else if (on_count > off_count) {
            return BitState.ON;
        }

        return BitState.UNKNOWN;
    }
}



int main (string[] args) {
    string input_contents;
    try {
        FileUtils.get_contents ("data/input.txt", out input_contents);
    } catch (Error e) {
        error (e.message);
    }

    string[] diagnostic_numbers = input_contents.strip ().split ("\n");

    // Part 1
    part_1_test ();
    print ("Power consumption: %d\n", calculate_power_consumption (diagnostic_numbers));
    return 0;
}

int calculate_power_consumption (string[] diagnostic_numbers) {
    BitCount[] bit_counts = new BitCount[diagnostic_numbers[0].length];

    foreach (string diagnostic_line in diagnostic_numbers) {
        for (int i = 0; i < diagnostic_line.length; i++) {
            int num = parse_num_from_char (diagnostic_line[i]);
            if (num == 0) {
                bit_counts[i].off_count++;
            } else {
                bit_counts[i].on_count++;
            }
        }
    }

    int gamma_rate = calculate_gamma_rate (bit_counts);
    int epsilon_rate = calculate_epsilon_rate (bit_counts);
    return gamma_rate * epsilon_rate;
}

int calculate_gamma_rate (BitCount[] bit_counts) {
    int gamma_val = 0;
    for (int i = 0; i < bit_counts.length; i++) {
        if (bit_counts[i].most_common_bit () == BitState.ON) {
            gamma_val += (int) Math.pow (2, bit_counts.length - 1 - i);
        }
    }

    return gamma_val;
}

int calculate_epsilon_rate (BitCount[] bit_counts) {
    int epsilon_val = 0;
    for (int i = 0; i < bit_counts.length; i++) {
        if (bit_counts[i].lowest_common_bit () == BitState.ON) {
            epsilon_val += (int) Math.pow (2, bit_counts.length - 1 - i);
        }
    }

    return epsilon_val;
}

int parse_num_from_char (char char_to_parse) {
    // https://stackoverflow.com/questions/239103/convert-char-to-int-in-c-sharp
    return (int)(char_to_parse - '0');
}

void part_1_test () {
    string[] test_data = {
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010"
    };

    assert (calculate_power_consumption (test_data) == 198);
}

int main (string[] args) {
    string input_contents;

    try {
        FileUtils.get_contents ("data/input.txt", out input_contents);
    } catch (Error e) {
        error (e.message);
    }

    print ("Input contents: %s", input_contents);

    return 0;
}

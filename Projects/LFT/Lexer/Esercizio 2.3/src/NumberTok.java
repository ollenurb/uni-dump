public class NumberTok extends Token {

    public int lexeme = 0;

    public NumberTok(int tag, int value) {
        super(tag);
        lexeme = value;
    }

    public String toString() {
        return "<" + tag + ", " + lexeme + ">";
    }

}

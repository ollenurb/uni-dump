public class Word extends Token {

    public String lexeme = "";

    public Word(int tag, String s) {
        super(tag);
        lexeme = s;
    }

    public String toString() {
        return "<" + tag + ", " + lexeme + ">";
    }

    public static final Word casetok = new Word(Tag.CASE, "case"),
                             when = new Word(Tag.WHEN, "when"),
                             then = new Word(Tag.THEN, "then"),
                             elsetok = new Word(Tag.ELSE, "else"),
                             whiletok = new Word(Tag.WHILE, "while"),
                             dotok = new Word(Tag.DO, "do"),
                             assign = new Word(Tag.ASSIGN, ":="),
                             print = new Word(Tag.PRINT, "print"),
                             read = new Word(Tag.READ, "read"),
                             or = new Word(Tag.OR, "||"),
                             and = new Word(Tag.AND, "&&"),
                             lt = new Word(Tag.RELOP, "<"),
                             gt = new Word(Tag.RELOP, ">"),
                             eq = new Word(Tag.RELOP, "=="),
                             le = new Word(Tag.RELOP, "<="),
                             ne = new Word(Tag.RELOP, "<>"),
                             ge = new Word(Tag.RELOP, ">=");
}

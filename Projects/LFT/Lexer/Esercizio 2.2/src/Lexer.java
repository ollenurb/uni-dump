import java.io.*;
import java.util.*;

public class Lexer {

    public static int line = 1;
    private char peek = ' ';

    private void readch(BufferedReader br) {
        try {
            peek = (char) br.read();
        } catch (IOException exc) {
            peek = (char) - 1; // ERROR
        }
    }

    public Token lexical_scan(BufferedReader br) {
        // Incremento lettura della linea solo in caso sia stato letto il ch di newline
        while (peek == ' ' || peek == '\t' || peek == '\n' || peek == '\r') {
            if (peek == '\n')
                line++;
            readch(br);
        }

        // Gestisco i casi in cui ottengo un carattere diverso da backspace, space, newline ecc...
        switch (peek) {
            case '!':
                peek = ' ';
                return Token.not;

            case '(':
                peek = ' ';
                return Token.lpt;

            case ')':
                peek = ' ';
                return Token.rpt;

            case '{':
                peek = ' ';
                return Token.lpg;

            case '}':
                peek = ' ';
                return Token.rpg;

            case '+':
                peek = ' ';
                return Token.plus;

            case '-':
                peek = ' ';
                return Token.minus;

            case '*':
                peek = ' ';
                return Token.mult;

            case '/':
                peek = ' ';
                return Token.div;

            case ';':
                peek = ' ';
                return Token.semicolon;

            case '&':
                readch(br);
                if (peek == '&') {
                    peek = ' ';
                    return Word.and;
                } else {
                    System.err.println("Erroneous character after & : " + peek + " at line " + (line + 1));
                    return null;
                }

            case '|':
                readch(br);
                if (peek == '|') {
                    peek = ' ';
                    return Word.or;
                } else {
                    System.err.println("Erroneous character after | : " + peek + " at line " + (line + 1));
                    return null;
                }

            // Greater than, Greater equals chars
            case '>':
                readch(br);
                if (peek == '=') {
                    peek = ' ';
                    return Word.ge;
                } else
                    return Word.gt;

                // Less than, less equals, not equals chars
            case '<':
                readch(br);
                if (peek == '=') {
                    peek = ' ';
                    return Word.le;
                } else if (peek == '>')
                    return Word.ne;
                else
                    return Word.lt;

                // Comp char
            case '=':
                readch(br);
                if (peek == '=') {
                    peek = ' ';
                    return Word.eq;
                } else {
                    System.err.println("Erroneous character after = : " + peek + " at line " + (line + 1));
                    return null;
                }

                // Assignment char
            case ':':
                readch(br);
                if (peek == '=') {
                    peek = ' ';
                    return Word.assign;
                } else {
                    System.err.println("Erroneous assignment character after : " + peek + " at line " + (line + 1));
                    return null;
                }

            case (char) - 1:
                return new Token(Tag.EOF);

            default:
                if (Character.isLetter(peek) || Character.isDigit(peek)) {
                    String id = "";

                    do {
                        id += peek;
                        readch(br);
                    } while (Character.isLetter(peek) || Character.isDigit(peek) || peek == '_');

                    // Controllo a quale identificatore appartiene la stringa letta
                    // se id \notIn Identificatori allora id e' un identificatore variabile
                    switch (id) {

                        case "case":
                            return Word.casetok;

                        case "when":
                            return Word.when;

                        case "then":
                            return Word.then;

                        case "else":
                            return Word.elsetok;

                        case "while":
                            return Word.whiletok;

                        case "do":
                            return Word.dotok;

                        case "read":
                            return Word.read;

                        case "print":
                            return Word.print;

                        default:
                            // This portion of program tests if the current word that have been read is a number or a valid variable name_
                            // Those particular tests are made using DFA's
                            if (idScanner(id))
                                return new Word(Tag.ID, id);
                            else if (numScanner(id))
                                return new NumberTok(Tag.NUM, Integer.parseInt(id));
                            else {
                                System.err.println("Invalid variable name " + id);
                                return null;
                            }

                    } // End  Switch

                } else {
                    System.err.println("Erroneous character: " + peek + " at line " + (line + 1));
                    return null;
                }
        } // End While

    } // End Method

    public static void main(String[] args) {
        Lexer lex = new Lexer();
        String path = "../prova.txt";
        try {
            BufferedReader br = new BufferedReader(new FileReader(path));
            Token tok;
            do {
                tok = lex.lexical_scan(br);
                System.out.println("Scan: " + tok);
            } while (tok.tag != Tag.EOF);
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static boolean idScanner(String s) {
        int state = 0, i = 0;

        while (state >= 0 && i < s.length()) {
            char curChar = s.charAt(i++);

            switch (state) {
                case 0:
                    if (Character.isLetter(curChar))
                        state = 3;
                    else if (curChar == '_')
                        state = 1;
                    else
                        state = -1;
                    break;

                case 1:
                    if (Character.isLetter(curChar))
                        state = 3;
                    else if (curChar == '_')
                        state = 1;
                    else
                        state = -1;
                    break;

                case 3:
                    if (Character.isLetter(curChar) || Character.isDigit(curChar) || curChar == '_')
                        state = 3;
                    else
                        state = -1;
                    break;
            }
        }

        return state == 3;
    }


    public static boolean numScanner(String s) {
        int i = 0;

        while (i < s.length()) {
            char curChar = s.charAt(i++);

            if (Character.isDigit(curChar)) {
                while (i < s.length()) {
                    curChar = s.charAt(i++);

                    if (!Character.isDigit(curChar))
                        return false;

                }
                return true;
            } else
                return false;

        }
        return false;
    }

}

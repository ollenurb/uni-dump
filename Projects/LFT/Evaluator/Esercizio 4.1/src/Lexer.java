import java.io.*;
import java.util.*;

public class Lexer {

    public static int line = 1;
    private char peek = ' ';

    private void readch(BufferedReader br) {
        try {
            peek = (char) br.read();
        } catch (IOException exc) {
            peek = (char) -1; // ERROR
        }
    }

    public Token lexical_scan(BufferedReader br) {

        while (peek == ' ' || peek == '\t' || peek == '\n'  || peek == '\r' || peek == '/') {
            if (peek == '\n')
                line++;
            /* To ignore comments the program tests if the current character is '/' AND the next character is '*':
            ** if the character after '/' is '*', then use a DFA to recognize the comment to be ignored.
            ** if the character after '/' is another '/', then ignore every character until a '\n' is read.
            ** if the character after '/' is not equal to '*' and '/', then return a div Token.
            */
            if(peek == '/') {
                readch(br);
                if(peek == '*') {
                    int state = 0;
                    // If the comment is not closed, the cycle will terminate when the file ends, throwing an error
                    while(state != 2 && peek != (char) -1) {
                        readch(br);
                        switch(state) {
                            case 0:
                                if(peek != '*')
                                    state = 0;
                                else if(peek == '*')
                                    state = 1;
                                else
                                    state = -1;
                            break;

                            case 1:
                                if(peek != '*' && peek != '/')
                                    state = 0;
                                else if(peek == '*')
                                    state = 1;
                                else if(peek == '/')
                                    state = 2;
                                else
                                    state = -1;
                            break;
                        } // End switch
                    } // End While
                    // If the cycle has't recognized a valid comment to be ignored, then "throw" an error
                    if(state != 2) {
                        System.err.println("Comment reached the end of file. (Comment not valid)");
                        return null;
                    }
                } else if(peek == '/') {
                    // Ignore every character until a '\n' is read
                    while(peek != '\n')
                        readch(br);

                } else {
                    // Returns a div token (we don't have any type of comment)
                    peek = ' ';
                    return Token.div;
                }
            } // End if (peek == '/')
            readch(br);
        }

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

            case ';':
                peek = ' ';
                return Token.semicolon;

            case '&':
                readch(br);
                if (peek == '&') {
                    peek = ' ';
                    return Word.and;
                } else {
                    System.err.println("Erroneous character after & : "  + peek + " at line " + (line + 1));
                    return null;
                }

            case '|':
                readch(br);
                if (peek == '|') {
                    peek = ' ';
                    return Word.or;
                } else {
                    System.err.println("Erroneous character after | : "  + peek + " at line " + (line + 1));
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
                } else if (peek == '>') {
                    peek = ' ';
                    return Word.ne;
                } else
                    return Word.lt;

            // Comp char
            case '=':
                readch(br);
                if (peek == '=') {
                    peek = ' ';
                    return Word.eq;
                } else {
                    System.err.println("Erroneous character after = : "  + peek + " at line " + (line + 1));
                    return null;
                }

            // Assignment char
            case ':':
                readch(br);
                if (peek == '=') {
                    peek = ' ';
                    return Word.assign;
                } else {
                    System.err.println("Erroneous assignment character after : "  + peek  + " at line " + (line + 1));
                    return null;
                }

            case (char)-1:
                return new Token(Tag.EOF);

            default:
                if (Character.isLetter(peek)) {
                    String id = "";
                    int state = 0;

                    do {
                        switch(state) {
                            case 0:
                                if(Character.isLetter(peek))
                                    state = 3;
                                else if(peek == '_')
                                    state = 1;
                                else
                                    state = -1;
                                break;

                            case 1:
                                if(Character.isLetter(peek))
                                    state = 3;
                                else if(peek == '_')
                                    state = 1;
                                else
                                    state = -1;
                                break;

                            case 3:
                                if(Character.isLetter(peek) || Character.isDigit(peek) || peek == '_')
                                    state = 3;
                                else
                                    state = -1;
                                break;
                        }
                        id += peek;
                        readch(br);
                    } while(Character.isLetter(peek) || Character.isDigit(peek) || peek == '_');

                    // Checks if the word that have been read corresponds to any of these keywords, then returns its corresponding token (Word in this case)
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
                            // Test if the DFA that recognize identifiers has reached its final state
                            if(state == 3)
                                return new Word(Tag.ID, id);
                            else {
                                System.err.println("Invalid variable name "  + id);
                                return null;
                            } // End if
                            
                    } // End  Switch

                } else if(Character.isDigit(peek)){
                    String num = "";
                    do {
                        num += peek;
                        readch(br);
                    } while(Character.isDigit(peek));
                    return new NumberTok(Tag.NUM, Integer.parseInt(num));
                } else {
                    System.err.println("Erroneous character: " + peek  + " at line " + (line + 1));
                    return null;
            }
        } // End Switch

    } // End Method

    public static void main(String[] args) {
        Lexer lex = new Lexer();
        String path = "./prova.txt";
        try {
            BufferedReader br = new BufferedReader(new FileReader(path));
            Token tok;
            do {
                tok = lex.lexical_scan(br);
                System.out.println("Scan: " + tok);
            } while (tok.tag != Tag.EOF);
            br.close();
        } catch (IOException e) {e.printStackTrace();}
    }

}

/* Fare riferimento alla slide n.20 degli insiemi guida e ricorsione sinistra
** nel corso di LFT di teoria (Corso A).
** Nella tabella, ad ogni simbolo vengono richiamati uno o piu' metodi corrispondenti
** alla variabili della produzione.
*/

import java.io.*;

public class Parser {
    private Lexer lex;
    private BufferedReader pbr;
    private Token look;

    public Parser(Lexer l, BufferedReader br) {
        lex = l;
        pbr = br;
        move();
    }

    void move() {
        look = lex.lexical_scan(pbr);
        System.out.println("token = " + look);
    }

    void error(String s) {
        throw new Error("near line " + lex.line + ": " + s);
    }

    void match(int t) {
      	if (look.tag == t) {
      	    if (look.tag != Tag.EOF) move();
      	} else error("syntax error");
    }

    public void prog() {
        switch(look.tag) {
            case Tag.ID:
            case Tag.PRINT:
            case Tag.READ:
            case Tag.CASE:
            case Tag.WHILE:
            case '{':
                statlist();
                match(Tag.EOF);
                break;

            default:
                error("prog syntax error");
        }
    }

    public void statlist() {
        switch(look.tag) {
            case Tag.ID:
            case Tag.PRINT:
            case Tag.READ:
            case Tag.CASE:
            case Tag.WHILE:
            case '{':
                stat();
                statlistp();
                break;

            default:
                error("statlist syntax error");
        }
    }

    public void statlistp() {
        if(look.tag == ';') {
            match(';');
            stat();
            statlistp();
        } else if (look.tag != '}' && look.tag != Tag.EOF)
            error("statlistp error");
    }

    public void stat() {
        switch(look.tag) {
            case Tag.ID:
                match(Tag.ID);
                match(Tag.ASSIGN);
                expr();
                break;

            case Tag.PRINT:
                match(Tag.PRINT);
                match('(');
                expr();
                match(')');
                break;

            case Tag.READ:
                match(Tag.READ);
                match('(');
                match(Tag.ID);
                match(')');
                break;

            case Tag.CASE:
                match(Tag.CASE);
                whenlist();
                match(Tag.ELSE);
                stat();
                break;

            case Tag.WHILE:
                match(Tag.WHILE);
                match('(');
                bexpr();
                match(')');
                stat();
                break;

            case '{':
                match('{');
                statlist();
                match('}');
                break;

            default:
                error("statement error");
        }
    }

    public void whenlist() {
        if(look.tag == Tag.WHEN) {
            whenitem();
            whenlistp();
        } else
            error("whenlist error");
    }

    public void whenlistp() {
        if(look.tag == Tag.WHEN) {
            whenitem();
            whenlistp();
        } else if(look.tag != Tag.ELSE)
            error("whenlistp error");
    }

    public void whenitem() {
        if(look.tag == Tag.WHEN) {
            match(Tag.WHEN);
            match('(');
            bexpr();
            match(')');
            stat();
        } else
            error("whenitem error");
    }

    public void bexpr() {
        switch(look.tag) {
            case '(':
            case Tag.NUM:
            case Tag.ID:
                expr();
                match(Tag.RELOP);
                expr();
                break;

            default:
                error("statement syntax error");
        }
    }

    private void expr() {
        switch(look.tag) {
            case '(':
            case Tag.NUM:
            case Tag.ID:
                term();
                exprp();
                break;

            default:
                error("expression error");
        }
    }

    private void exprp() {
        switch(look.tag) {
            case '+':
                match('+');
                term();
                exprp();
                break;

            case '-':
                match('-');
                term();
                exprp();
                break;

            // Epsilon transition
            case ')':
            case Tag.RELOP:
            case ';':
            case Tag.WHEN:
            case '}':
            case Tag.EOF:
            case Tag.ELSE:
                break;

            default:
                error("exprp error");
        }
    }

    private void term() {
        switch(look.tag) {
            case '(':
            case Tag.NUM:
            case Tag.ID:
                fact();
                termp();
                break;

            default:
                error("term error");
        }
    }

    private void termp() {
        switch(look.tag) {
            case '*':
                match('*');
                fact();
                termp();
                break;

            case '/':
                match('/');
                fact();
                termp();
                break;

            // Epsilon transition
            case ')':
            case Tag.RELOP:
            case ';':
            case Tag.WHEN:
            case '}':
            case Tag.EOF:
            case Tag.ELSE:
            case '+':
            case '-':
                break;

            default:
                error("termp error");
        }
    }

    private void fact() {
        if(look.tag == '(') {
            match('(');
            expr();
            match(')');
        } else if(look.tag == Tag.NUM)
            match(Tag.NUM);
        else if(look.tag == Tag.ID)
            match(Tag.ID);
        else
            error("factor error");
    }

    public static void main(String[] args) {
        Lexer lex = new Lexer();
        String path = "./test.pas"; // il percorso del file da leggere
        try {
            BufferedReader br = new BufferedReader(new FileReader(path));
            Parser parser = new Parser(lex, br);
            parser.prog();
            System.out.println("Input OK");
            br.close();
        } catch (IOException e) {e.printStackTrace();}
    }
}

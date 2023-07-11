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

    public void start() {
      	if(look.tag == Tag.NUM || look.tag == '(') {
            expr();
      	    match(Tag.EOF);
      	} else
            error("start error");
    }

    private void expr() {
        if(look.tag == Tag.NUM) {
            term();
            exprp();
        } else if(look.tag == '(') {
            term();
            exprp();
        } else
            error("expr error");
    }

    private void exprp() {
      	switch (look.tag) {
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

            // If tag == Tag.EOF || tag == ')'
            case Tag.EOF:
            case ')':
                break;

            default:
                error("exprp error");
      	}
    }

    private void term() {
        if(look.tag == '(') {
            fact();
            termp();
        } else if(look.tag == Tag.NUM) {
            fact();
            termp();
        } else
            error("term error");
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

                case ')':
                case '+':
                case '-':
                case Tag.EOF:
                    break;

                default:
                    error("termp error");
            }
    }

    private void fact() {
        if(look.tag == '(') {
            match('(');
            expr();
            if(look.tag == ')') {
                match(')');
            } else
                error("fact error, ')' expected");
        } else if(look.tag == Tag.NUM) {
            match(Tag.NUM);
        } else
            error("fact error, number or '(' expected");
    }

    public static void main(String[] args) {
        Lexer lex = new Lexer();
        String path = "./prova.txt"; // il percorso del file da leggere
        try {
            BufferedReader br = new BufferedReader(new FileReader(path));
            Parser parser = new Parser(lex, br);
            parser.start();
            System.out.println("Input OK");
            br.close();
        } catch (IOException e) {e.printStackTrace();}
    }
}

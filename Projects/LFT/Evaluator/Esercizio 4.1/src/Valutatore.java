import java.io.*;

public class Valutatore {
    private Lexer lex;
    private BufferedReader pbr;
    private Token look;

    public Valutatore(Lexer l, BufferedReader br) {
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
    	int expr_val;

    	if(look.tag == Tag.NUM || look.tag == '(') {
            expr_val = expr();
        	match(Tag.EOF);
            System.out.println(expr_val);
        } else
            error("start error");
    }

    private int expr() {
    	int term_val, exprp_val = 0;

        if(look.tag == Tag.NUM) {
            term_val = term();
            exprp_val = exprp(term_val);
        } else if(look.tag == '(') {
            term_val = term();
            exprp_val = exprp(term_val);
        } else
            error("expr error");

    	return exprp_val;
    }

    private int exprp(int exprp_i) {
        int term_val, exprp_val = 0;

        switch (look.tag) {
          	case '+':
                match('+');
                term_val = term();
                exprp_val = exprp(exprp_i + term_val);
                break;

            case '-':
                match('-');
                term_val = term();
                exprp_val = exprp(exprp_i - term_val);
                break;

            // If tag == Tag.EOF || tag == ')'
            case Tag.EOF:
            case ')':
                exprp_val = exprp_i;
                break;

            default:
                error("exprp error");
      	}
        return exprp_val;
    }

    private int term() {
        int termp_val = 0, fact_val;

        if(look.tag == '(') {
            fact_val = fact();
            termp_val = termp(fact_val);
        } else if(look.tag == Tag.NUM) {
            fact_val = fact();
            termp_val = termp(fact_val);
        } else
            error("term error");

        return termp_val;
    }

    private int termp(int termp_i) {
        int termp_val = 0, fact_val;

        switch(look.tag) {
            case '*':
                match('*');
                fact_val = fact();
                termp_val = termp(termp_i * fact_val);
                break;

            case '/':
            match('/');
            fact_val = fact();
            termp_val = termp(termp_i / fact_val);
                break;

            case ')':
            case '+':
            case '-':
            case Tag.EOF:
                termp_val = termp_i;
                break;

            default:
                error("termp error");
        }
        return termp_val;
    }

    private int fact() {
        int expr_val = 0;

        if(look.tag == '(') {
            match('(');
            expr_val = expr();
            if(look.tag == ')') {
                match(')');
            } else
                error("fact error, ')' expected");
        } else if(look.tag == Tag.NUM) {
            expr_val = ((NumberTok)look).lexeme;
            match(Tag.NUM);
        } else
            error("fact error, number or '(' expected");

        return expr_val;
    }

    public static void main(String[] args) {
        Lexer lex = new Lexer();
        String path = "./prova.txt"; // il percorso del file da leggere
        try {
            BufferedReader br = new BufferedReader(new FileReader(path));
            Valutatore valutatore = new Valutatore(lex, br);
            valutatore.start();
            br.close();
        } catch (IOException e) {e.printStackTrace();}
    }
}

import java.io.*;

public class Translator {

    public static String filePath = "./test.pas";

    private Lexer lex;
    private BufferedReader pbr;
    private Token look;
    private SymbolTable st = new SymbolTable();
    private CodeGenerator code = new CodeGenerator();
    private int count = 0;
    private boolean printTokens;

    public Translator(Lexer l, BufferedReader br, boolean printTokens) {
        lex = l;
        pbr = br;
        this.printTokens = printTokens;
        move();
    }

    void move() {
        look = lex.lexical_scan(pbr);
        if(printTokens)
            System.out.println("token = " + look);
    }

    void error(String s) {
        throw new Error("near line " + lex.line + ": " + s);
    }

    void match(int t) {
        if(look.tag == t) {
            if(look.tag != Tag.EOF) move();
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
                int lnext_prog = code.newLabel();
                statlist(lnext_prog);
                code.emitLabel(lnext_prog);
                match(Tag.EOF);
                try {
                    code.toJasmin();
                }
                catch(java.io.IOException e) {
                    System.out.println("IO error\n");
                };
                break;

            default:
                error("syntax error in 'prog' method");
        }
    }

    public void statlist(int lnext) {
        switch(look.tag) {
            case Tag.ID:
            case Tag.PRINT:
            case Tag.READ:
            case Tag.CASE:
            case Tag.WHILE:
            case '{':
                int stat_next = code.newLabel();
                stat(stat_next);
                code.emitLabel(stat_next);
                statlistp(lnext);
                break;

            default:
                error("statlist syntax error");
        }
    }

    public void statlistp(int lnext) {
        if(look.tag == ';') {
            match(';');
            int stat_next = code.newLabel();
            stat(stat_next);
            code.emitLabel(stat_next);
            statlistp(lnext);
        } else if (look.tag != '}' && look.tag != Tag.EOF)
            error("statlistp error");
    }

    public void stat(int lnext) {
        switch(look.tag) {

    	    case Tag.ID:
                if(look.tag == Tag.ID) {
                    int id_addr_id = st.lookupAddress(((Word) look).lexeme);
                    if (id_addr_id == -1) {                                             // Add the current variable to symbol table
                        id_addr_id = count;
                        st.insert(((Word)look).lexeme, count++);
                    }
                    match(Tag.ID);
                    if(look.tag == Tag.ASSIGN) {
                        match(Tag.ASSIGN);
                        expr();
                        code.emit(OpCode.istore, id_addr_id);
                    } else {
                        error("expected assignment after ID");
                    }
                }
                break;

            case Tag.PRINT:
                match(Tag.PRINT);
                match('(');
                expr();
                code.emit(OpCode.invokestatic, 1);
                match(')');
                break;

            case Tag.READ:
                match(Tag.READ);
                match('(');
                if (look.tag == Tag.ID) {
                    int read_id_addr = st.lookupAddress(((Word)look).lexeme);
                    if (read_id_addr == -1) {                                             // Add the current variable to symbol table
                        read_id_addr = count;
                        st.insert(((Word)look).lexeme, count++);
                    }
                    match(Tag.ID);
                    match(')');
                    code.emit(OpCode.invokestatic, 0);
                    code.emit(OpCode.istore, read_id_addr);
                } else
                    error("Error in grammar (stat) after read( with " + look);
                break;

            case Tag.CASE:
                match(Tag.CASE);
                whenlist(lnext);
                match(Tag.ELSE);
                stat(lnext);
                break;

            case Tag.WHILE:
                match(Tag.WHILE);
                match('(');
                int bexpr_true = code.newLabel(), stat_here = code.newLabel();
                code.emitLabel(stat_here); // Ogni volta che termino un'iterazione del ciclo devo verificare la condizione, cioe' qui
                b_expr(bexpr_true, lnext);
                match(')');
                code.emitLabel(bexpr_true);
                stat(stat_here);
                code.emit(OpCode.GOto, stat_here);
                break;

	        case '{':
                match('{');
                statlist(lnext);
                match('}');
                break;

            default:
                error("stat procedure error input character: " + look.tag);
            }
        }

    public void whenlist(int lnext) {
        if(look.tag == Tag.WHEN) {
            int lnext_when = code.newLabel();
            whenitem(lnext, lnext_when);
            code.emitLabel(lnext_when);
            whenlistp(lnext);
        } else
            error("whenlist error");
    }

    public void whenlistp(int lnext) {
        if(look.tag == Tag.WHEN) {
            int lnext_when = code.newLabel();
            whenitem(lnext, lnext_when);
            code.emitLabel(lnext_when);
            whenlistp(lnext);
        } else if(look.tag != Tag.ELSE)
            error("whenlistp error" + look);
    }

    public void whenitem(int lnext, int lnext_when) {
        if(look.tag == Tag.WHEN) {
            match(Tag.WHEN);
            match('(');
            int bexpr_true = code.newLabel();
            b_expr(bexpr_true, lnext_when);
            match(')');
            code.emitLabel(bexpr_true);
            stat(lnext);
            code.emit(OpCode.GOto, lnext);
        } else
            error("whenitem error");
    }

    private void b_expr(int ltrue, int lfalse) {
        switch(look.tag) {
            case '(' :
            case Tag.NUM :
            case Tag.ID :
      	        expr();
    		        if(look == Word.eq) { //==
                    match(Tag.RELOP);
                    expr();
                    code.emit(OpCode.if_icmpeq, ltrue);
                    code.emit(OpCode.GOto, lfalse);
    	         	} else if (look == Word.le) { // <=
                    match(Tag.RELOP);
                    expr();
                    code.emit(OpCode.if_icmple, ltrue);
                    code.emit(OpCode.GOto, lfalse);
              	} else if (look == Word.lt) { // <
                    match(Tag.RELOP);
                    expr();
                    code.emit(OpCode.if_icmplt, ltrue);
                    code.emit(OpCode.GOto, lfalse);
              	} else if (look == Word.ne) { // <>
                    match(Tag.RELOP);
                    expr();
                    code.emit(OpCode.if_icmpne, ltrue);
                    code.emit(OpCode.GOto, lfalse);
               	} else if (look == Word.ge) { // >=
                    match(Tag.RELOP);
                    expr();
                    code.emit(OpCode.if_icmpge, ltrue);
                    code.emit(OpCode.GOto, lfalse);
              	} else if (look == Word.gt) { // >
                    match(Tag.RELOP);
                    expr();
                    code.emit(OpCode.if_icmpgt, ltrue);
                    code.emit(OpCode.GOto, lfalse);
              	} else error("invalid boolean operator");
            break;
        }
    }

    private void expr() {
        switch(look.tag) {
            case '(':
            case Tag.ID:
            case Tag.NUM:
                term();
                exprp();
           	 	break;

           	default:
               error("expr syntax error");
        }
    }

    private void exprp() {
        switch(look.tag) {
            case '+':
                match('+');
                term();
                code.emit(OpCode.iadd);
                exprp();
                break;

            case '-':
                match('-');
                term();
                code.emit(OpCode.isub);
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
                code.emit(OpCode.imul);
                termp();
                break;

            case '/':
                match('/');
                fact();
                code.emit(OpCode.idiv);
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
        } else if(look.tag == Tag.NUM) {
            code.emit(OpCode.ldc, ((NumberTok)look).lexeme);
            match(Tag.NUM);
        } else if(look.tag == Tag.ID) {
            int read_id_addr = st.lookupAddress(((Word)look).lexeme);
            if(read_id_addr == -1)
                error("undeclared variable " + ((Word)look).lexeme);
            code.emit(OpCode.iload, read_id_addr);
            match(Tag.ID);
        } else
            error("factor error");
    }

    public static void main(String[] args) {
        Lexer lex = new Lexer();
        try {
            BufferedReader br = new BufferedReader(new FileReader(filePath));
            Translator et = new Translator(lex, br, false);
            et.prog();
            System.out.println("\nFile Output.j generato!");
            System.out.println("Digita 'java -jar jasmin.jar Output.j' per il file Output.class e 'java Output' per eseguirlo.\n");
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    } // end main

}

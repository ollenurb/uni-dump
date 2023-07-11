public class Esercizio10 {

    public static boolean scan(String s) {
        int state = 0, i = 0;

        while(state >= 0 && i < s.length()) {
            char ch = s.charAt(i++);

            switch(state) {
          	    case 0:
            		    if(ch == '/')
            			    state = 1;
            		    else
            			    state = -1;
          	    break;

                case 1:
            		    if(ch == '*')
                    		  state = 2;
            		    else
                   		  state = -1;
          	    break;

                case 2:
                    if(ch == '*')
                      state = 4;
                    else if(ch == 'a')
                      state = 3;
                    else
                      state = -1;
                break;

                case 3:
                    if(ch == '*')
                      state = 4;
                    else if(ch == 'a')
                      state = 3;
                    else
                      state = -1;
                break;

                case 4:
                    if(ch == '*')
                      state = 4;
                    else if(ch == '/')
                      state = 5;
                    else
                      state = -1;
                break;
            } // End switch
            System.out.println(state);
        } // End While
        return state == 5;
    } // End scan function

    public static void main(String[] args) {
	    System.out.println(scan(args[0]) ? "Accettata" : "Rifiutata");
    }


}

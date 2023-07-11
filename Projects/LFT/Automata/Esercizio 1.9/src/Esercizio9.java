public class Esercizio9 {

    public static boolean scan(String s) {
        int state = 0, i = 0;

        while(state >= 0 && i < s.length()) {
            char ch = s.charAt(i++);

            switch(state) {
                case 0:
                    if(ch == 'm')
                        state = 1;
                    else
                        state = 7;
                break;

                case 1:
                    if(ch == 'a')
                        state = 2;
                    else if(ch == 'b')
                        state = 8;
                break;

                case 2:
                    if(ch == 't')
                        state = 3;
                    else
                        state = 9;
                break;

                case 3:
                    if(ch == 't')
                        state = 4;
                    else
                        state = 10;
                break;

                case 4:
                    if(ch == 'e')
                        state = 5;
                    else
                        state = 11;
                break;

                case 5:
                    state = 6;
                break;

                case 7:
                    if(ch == 'a')
                        state = 8;
                    else
                        state = -1;
                break;

                case 8:
                    if(ch == 't')
                        state = 9;
                    else
                        state = -1;
                break;

                case 9:
                    if(ch == 't')
                        state = 10;
                    else
                        state = -1;
                break;

                case 10:
                    if(ch == 'e')
                        state = 11;
                    else
                        state = -1;
                break;

                case 11:
                    if(ch == 'o')
                        state = 6;
                    else
                        state = -1;
                break;

            } // End switch

        } // End While

        return state == 6;

    } // End scan function

    public static void main(String[] args) {
        System.out.println(scan(args[0]) ? "Accettata" : "Rifiutata");
    }

}

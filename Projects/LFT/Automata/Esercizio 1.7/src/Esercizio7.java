
public class Esercizio7 {

  public static boolean scan(String s) {
    int state = 0, i = 0;

    while(state >= 0 && i < s.length()) {
        char ch = s.charAt(i++);

        switch(state) {

          case 0:
            if(ch == 'a')
              state = 3;
            else if(ch == 'b')
              state = 1;
            else
              state = -1;
          break;

          case 1:
            if(ch == 'a')
              state = 3;
            else if(ch == 'b')
              state = 2;
            else
              state = -1;
          break;

          case 2:
            if(ch == 'a')
              state = 3;
            else
              state = -1;
          break;

          case 3:
            if(ch != 'a' && ch != 'b')
              state = -1;
          break;

        } // End switch

    } // End While

    return state == 3;

  } // End scan function

  public static void main(String[] args) {
    System.out.println(scan(args[0]) ? "Correct" :  "Wrong");
  }

}

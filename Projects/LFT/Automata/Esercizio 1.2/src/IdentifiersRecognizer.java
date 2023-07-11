public class IdentifiersRecognizer {

  public static boolean scan(String s) {
    int state = 0, i = 0;

    while(state >= 0 && i < s.length()) {
      char ch = s.charAt(i++);

      switch(state) {

        case 0:
        if((ch >= 97 && ch <= 122) || (ch >= 65 && ch <= 90)) // è una lettera maiusc / minusc
          state = 1;
        else // è un numero o un'altro carattere
          state = -1;
        break;

        case 1:
        if((ch >= 48 && ch <= 57) ||
           (ch >= 97 && ch <= 122) ||
           (ch >= 65 && ch <= 90) || (ch == 95)) // Appartiene all'insieme dei caratteri ammissibili
          state = 1;
        else // Non appartiene, ad esempio (9)
          state = -1;
        break;
      }
    }
    return state == 1;
  }


  public static void main(String[] args) {
    System.out.println(scan(args[0]) ? "OK" : "NOPE");
  }

}

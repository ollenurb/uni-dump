public class ComplementarLabRecognizer {

  public static boolean scan(String s) {

    int i = 0, state = 0;

    while(state >= 0 && i < s.length()) {
      char ch = s.charAt(i++);

      switch(state){

        case 0:
          if(isCaps(ch))
            state = 1;
          else
            state = -1;
        break;

        case 1:
          if(isNumber(ch))
            state = isEven(Character.getNumericValue(ch)) ? 2 : 3;
          else if(!isInAlphabet(ch))
            state = -1;
        break;

        case 2:
          if(isNumber(ch))
            state = isEven(Character.getNumericValue(ch)) ? 2 : 3;
          else
            state = -1;
        break;

        case 3:
          if(isNumber(ch))
            state = isEven(Character.getNumericValue(ch)) ? 2 : 3;
          else
            state = -1;
        break;

      } // end Siwtch

    } // end While
    return state == 2;
  } // end Function

  // True <=> c is a number, false if not
  public static boolean isNumber(char c) {
    return ((c >= 49) && (c <= 57));
  }

  // True <=> c is a valid alphabet character, false if not
  public static boolean isInAlphabet(char c) {
    return (((c >= 65) && (c <= 90)) || ((c >= 97) && (c <= 122)));
  }

  // True <=> i is an even number, false if not
  public static boolean isEven(int i) {
    return i % 2 == 0;
  }

  // True <=> c is upper case, false if not
  public static boolean isCaps(char c) {
    return ((c >= 65) && (c <= 90));
  }

  public static void main(String[] args) {
    System.out.println("You have inserted the string " + args[0]);
    System.out.println(scan(args[0]) ? "YES" : "NOPE" );
  }

}

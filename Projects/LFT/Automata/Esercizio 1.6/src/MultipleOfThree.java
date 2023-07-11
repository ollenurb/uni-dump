public class MultipleOfThree {

  public static boolean scan(String s) {

    int i = 0, state = 0;

    while(state >= 0 && i < s.length()) {
      char ch = s.charAt(i++);

      switch(state) {

        case 0:
          if(ch == '1' || ch == '0')
            state = (ch == '1') ? 1 : 0;
        break;

        case 1:
          if(ch == '0')
            state = 1;
          else if(ch == '1')
            state = 0;
          else state = -1;
        break;

        case 2:
        if(ch == '1' || ch == '0')
          state = (ch == '1') ? 2 : 1;
        break;

      }

    }
  return state == 2;
  }

  public static void main(String[] args) {
    System.out.println(scan(args[0]) ? "YES" : "NOPE");
  }

}

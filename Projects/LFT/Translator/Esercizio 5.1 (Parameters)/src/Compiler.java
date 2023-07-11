import java.io.*;

class Compiler {
  public static void main(String[] args) {
      if(args.length == 1) {
      // Create the new filename by removing the extension and adding the new extension ".j"
      String outputFileName = args[0].replaceFirst("[.][^.]+$", "") + ".j";
      try {
        Lexer lex = new Lexer();
        BufferedReader br = new BufferedReader(new FileReader(args[0]));
        PrintWriter pwr = new PrintWriter(new FileWriter(outputFileName));
        Translator et = new Translator(lex, br, pwr, false);                    // Disable buffering 
        et.prog();
        System.out.println("\nFile " + outputFileName + " generato!");
        br.close();
        Process proc = Runtime.getRuntime().exec("java -jar jasmin.jar " + outputFileName);

        System.out.println("File Output.class generato.");

      } catch (IOException e) {e.printStackTrace(); }
    } else {
      System.err.println("The number of arguments provided isn't valid.");
      System.err.println("Try: java Compiler [PATH/Program.p]");
    }
  } // end main
}

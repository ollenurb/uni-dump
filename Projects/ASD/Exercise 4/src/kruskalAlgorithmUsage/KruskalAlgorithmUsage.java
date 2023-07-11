package kruskalAlgorithmUsage;


import graph.LabeledGraph;
import kruskalAlgorithm.KruskalAlgorithm;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

/**
 * @author Brunello Matteo, Caresio Lorenzo
 */
public class KruskalAlgorithmUsage {

  public static void main(String[] args) {

    if (args.length < 1) {
      System.err.println("Invalid argument");
      System.err.println("Usage: java kruskalAlgorithmUsage.KruskalAlgorithmUsage <csv_file_path>");
      System.exit(0);
    }

    LabeledGraph<String, Double> graph = new LabeledGraph<>();
    HashMap<String, Boolean> insertedVerticesList = new HashMap<>(); // Used in order to know if a given vertex is already part of the graph

    graph.setIsWeighted(true);

    // Vertices and corresponding edges are parsed from the csv file
    System.out.println("Loading file into the memory...");
    loadGraphFromFile(args[0], graph, insertedVerticesList);

    // Execute the algorithm
    KruskalAlgorithm<String, Double> kruskalAlgorithm = new KruskalAlgorithm<>();
    System.out.println("Executing Kruskal's algorithm...\n");
    long timestampBeforeExecution = System.currentTimeMillis();
    LabeledGraph<String, Double> graphMST = kruskalAlgorithm.execute(graph);
    long timestampAfterExecution = System.currentTimeMillis();

    System.out.println("Original Graph: \n\tNodes: " + graph.getVertices().size() + "\n\tEdges: " + graph.getEdgesSize() + "\n\tWeight: " + String.format("%.2f", graph.getGraphWeight() / 1000) + "km");

    System.out.println("MST Graph: \n\tNodes: " + graphMST.getVertices().size() + "\n\tEdges: " + graphMST.getEdgesSize() + "\n\tWeight: " + String.format("%.2f", graphMST.getGraphWeight() / 1000) + "km");

    System.out.println("\n\nExecution ended in " + (timestampAfterExecution - timestampBeforeExecution) + " milliseconds");

  }

  private static void loadGraphFromFile(String filePath, LabeledGraph<String, Double> graph, HashMap<String, Boolean> insertedVerticesList) {
    int rowsCount = 0;
    try {
      FileReader fr = new FileReader(filePath);
      BufferedReader br = new BufferedReader(fr);
      String currentFileLine;

      while ((currentFileLine = br.readLine()) != null) {
        String[] lineContents = currentFileLine.split(","); // In CSV values are separated by commas

        // A vertex has to be inserted in the graph if it isn't part of it yet
        if (insertedVerticesList.get(lineContents[0]) == null) {
          graph.addVertex(lineContents[0]);
          insertedVerticesList.put(lineContents[0], Boolean.TRUE);
        }

        // A vertex has to be inserted in the graph if it isn't part of it yet
        if (insertedVerticesList.get(lineContents[1]) == null) {
          graph.addVertex(lineContents[1]);
          insertedVerticesList.put(lineContents[1], Boolean.TRUE);
        }

        graph.addVertex(lineContents[1]);
        graph.addEdge(Double.parseDouble(lineContents[2]), lineContents[0], lineContents[1]);
        rowsCount++;
      }
    } catch (FileNotFoundException e) {
      System.err.println("The dataset file doesn't exists");
      e.printStackTrace();
      System.exit(-1);
    } catch (IOException e) {
      System.err.println("An error has occurred while trying to parse the dataset");
      e.printStackTrace();
      System.exit(-1);
    }
    System.out.println(rowsCount + " file rows has been successfully loaded into the memory.");
  }
}

package graph;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * @param <T>: vertices label type
 * @param <U>: edges label type
 * @author Brunello Matteo, Caresio Lorenzo
 * <p>
 * <p>
 * The class has been developed according to the guidelines stated on the project assignment:
 * LabeledGraph: Creazione di un grafo vuoto – O(1)
 * addVertex: Aggiunta di un nodo – O(1)
 * addEdge: Aggiunta di un arco – O(1)
 * isDirected: Verifica se il grafo è diretto – O(1)
 * containsVertex: Verifica se il grafo contiene un dato nodo – O(1)
 * containsEdge: Verifica se il grafo contiene un dato arco – O(1) quando il grafo è veramente sparso
 * removeNode: Cancellazione di un nodo – O(n)
 * removeEdge: Cancellazione di un arco – O(1) quando il grafo è veramente sparso
 * getVerticesSize: Determinazione del numero di nodi – O(n)
 * getEdgesSize: Determinazione del numero di archi – O(n)
 * getVertices: Recupero dei nodi del grafo – O(n)
 * getEdges: Recupero degli archi del grafo – O(n)
 * getAdjacentVertices: Recupero nodi adiacenti di un dato nodo – O(n)
 * getLabelByVertices: Recupero etichetta associata a una coppia di nodi – O(1) quando il grafo è veramente sparso.
 */
public class LabeledGraph<T, U> {

  private HashMap<T, Vertex<T>> vertices;
  private HashMap<Vertex<T>, HashMap<Vertex<T>, LabeledEdge<T, U>>> adjacencyList;

  private int edgesNumber;
  private boolean isWeighted;
  private boolean isDirected;

  public LabeledGraph() {

    isWeighted = false;
    isDirected = false;

    adjacencyList = new HashMap<>();
    vertices = new HashMap<>();
  }

  /**
   * Setter for the isWeighted variable.
   *
   * @param isWeighted: the value to set the variable to
   */
  public void setIsWeighted(boolean isWeighted) {
    this.isWeighted = isWeighted;
  }

  /**
   * Setter for the isDirected variable.
   *
   * @param isDirected: the value to set the variable to
   */
  public void setIsDirected(boolean isDirected) {
    this.isDirected = isDirected;
  }

  /**
   * Getter for the isWeighted variable.
   */
  public boolean isWeighted() {
    return isWeighted;
  }

  /**
   * Getter for the isDirected variable.
   */
  public boolean isDirected() {
    return isDirected;
  }

  /**
   * Adds a vertex to the graph using its label.
   *
   * @param vertexLabel: the label of the vertex to be added to the graph
   * @return the newly added vertex, null if a vertex with the same label is already part of the graph
   */
  public Vertex<T> addVertex(T vertexLabel) {

    if (vertices.get(vertexLabel) == null) {

      Vertex<T> newVertex = new Vertex<>(vertexLabel);
      vertices.put(vertexLabel, newVertex);

      HashMap<Vertex<T>, LabeledEdge<T, U>> adjacentToThisVertex = new HashMap<>();
      adjacencyList.put(newVertex, adjacentToThisVertex);

      return newVertex;
    } else {
      return null;
    }
  }

  /**
   * Adds an edge to the graph using its label and its two corresponding vertices.
   *
   * @param edgeLabel:    the label of the edge to be added to the graph
   * @param xVertexLabel: the first vertex label
   * @param yVertexLabel: the second vertex label
   * @return the newly added edge, null if vertices aren't not valid
   */
  public LabeledEdge<T, U> addEdge(U edgeLabel, T xVertexLabel, T yVertexLabel) {

    Vertex<T> xVertex = vertices.get(xVertexLabel);
    Vertex<T> yVertex = vertices.get(yVertexLabel);

    if (xVertex != null && yVertex != null) {

      LabeledEdge<T, U> xToYEdge = new LabeledEdge<>(edgeLabel, xVertex, yVertex);
      HashMap<Vertex<T>, LabeledEdge<T, U>> adjacentToXVertex = adjacencyList.get(xVertex);
      adjacentToXVertex.put(yVertex, xToYEdge);
      edgesNumber++;

      // As suggested on the slides, an undirected graph can be represented with the same data structure
      // of a directed graph but instead of adding a single edge (from the first vertex to the second)
      // a supplementary edge has to be added (from the second vertex to the first)
      if (!isDirected) {
        LabeledEdge<T, U> yToXEdge = new LabeledEdge<>(edgeLabel, yVertex, xVertex);
        HashMap<Vertex<T>, LabeledEdge<T, U>> adjacentToYVertex = adjacencyList.get(yVertex);
        adjacentToYVertex.put(xVertex, yToXEdge);
        edgesNumber++;
      }

      return xToYEdge;
    } else {
      return null;
    }
  }

  /**
   * @param vertexLabel: the label of the vertex to be found in the graph
   * @return true if the vertex is part of the graph, false otherwise
   */
  public boolean containsVertex(T vertexLabel) {
    return (vertices.get(vertexLabel) != null);
  }

  /**
   * @param edge: the edge to be found in the graph
   * @return true if the vertex is part of the graph, false otherwise
   */
  public boolean containsEdge(LabeledEdge<T, U> edge) {
    return (adjacencyList.get(edge.getXVertex()) != null) || (adjacencyList.get(edge.getYVertex()) != null);
  }

  /**
   * @param vertex the vertex to be removed
   * @return true if the vertex has been removed, false otherwise
   */
  public boolean removeVertex(Vertex<T> vertex) {

    if (vertex != null) {

      HashMap<Vertex<T>, LabeledEdge<T, U>> adjacentToVertex = adjacencyList.get(vertex);
      HashMap<Vertex<T>, LabeledEdge<T, U>> adjacentVertexAdjacencyList;

      // If the graph is directed, the supplementary edges in the adjacent vertices have to be removed
      if (isDirected) {
        for (LabeledEdge<T, U> edge : adjacentToVertex.values()) {
          adjacentVertexAdjacencyList = adjacencyList.get(edge.getYVertex());
          adjacentVertexAdjacencyList.remove(vertex);
          edgesNumber--;
        }
      }

      // All the edges corresponding to the vertex are removed
      edgesNumber = edgesNumber - adjacentToVertex.size();
      adjacencyList.remove(vertex);

      vertices.remove(vertex.getVertexLabel());

      return true;
    } else {
      return false;
    }

  }

  /**
   * @param edge: the edge to be removed
   * @return true if the edge has been removed, false otherwise
   */
  public boolean removeEdge(LabeledEdge<T, U> edge) {

    if (edge != null) {

      HashMap<Vertex<T>, LabeledEdge<T, U>> xVertexAdjacencyList = adjacencyList.get(edge.getXVertex());
      xVertexAdjacencyList.remove(edge.getYVertex());

      // If the graph is directed, the supplementary edge in the adjacent vertex has to be removed
      if (isDirected) {
        HashMap<Vertex<T>, LabeledEdge<T, U>> yVertexAdjacencyList = adjacencyList.get(edge.getYVertex());
        yVertexAdjacencyList.remove(edge.getXVertex());
      }

      return true;
    } else {
      return false;
    }
  }

  /**
   * @return the number of vertices contained in the graph
   */
  public int getVerticesSize() {
    return vertices.size();
  }

  /**
   * @return the number of edges contained in the graph.
   */
  public int getEdgesSize() {

    int edgesSize = 0;
    for (HashMap<Vertex<T>, LabeledEdge<T, U>> edges : adjacencyList.values()) {
      edgesSize = edgesSize + edges.size();
    }

    return isDirected ? edgesSize : edgesSize / 2;
  }

  /**
   * @return the vertices contained in the graph as an ArrayList
   */
  public ArrayList<Vertex<T>> getVertices() {
    return new ArrayList<>(vertices.values());
  }

  /**
   * @return the edges contained in the graph as an ArrayList
   */
  public ArrayList<LabeledEdge<T, U>> getEdges() {
    ArrayList<LabeledEdge<T, U>> edges = new ArrayList<>();

    for (HashMap<Vertex<T>, LabeledEdge<T, U>> relatedVertex : adjacencyList.values()) {
      edges.addAll(relatedVertex.values());
    }

    return edges;
  }

  /**
   * @param vertex the vertex to use to compute its adjacent vertices
   * @return the adject vertices (as an ArrayList) of the given vertex
   */
  public ArrayList<Vertex<T>> getAdjacentVertices(Vertex<T> vertex) {

    return vertex != null ? new ArrayList<>(adjacencyList.get(vertex).keySet()) : null;
  }

  /**
   * @param xVertex the first vertex of the edge to be found
   * @param yVertex the second vertex of the edge to be found
   * @return the label of the found vertex, null otherwise
   */
  public U getLabelByVertices(Vertex<T> xVertex, Vertex<T> yVertex) {
    return (xVertex != null && yVertex != null) ? adjacencyList.get(xVertex).get(yVertex).getLabel() : null;
  }

  /**
   * Sums every edge weight in order to get the overall graph weight.
   *
   * @return the graph weight as a double value
   */
  public double getGraphWeight() {
    double graphWeight = 0;

    for (HashMap<Vertex<T>, LabeledEdge<T, U>> adjacentVerticesList : adjacencyList.values())
      for (LabeledEdge<T, U> edge : adjacentVerticesList.values())
        graphWeight = graphWeight + edge.getWeight();

    return isDirected ? graphWeight : graphWeight / 2;
  }

  /**
   * Prints the graph to the command line.
   */
  public void printGraph() {
    for (Vertex<T> vertex : vertices.values()) {
      System.out.println("(" + vertex + ")");
      for (LabeledEdge<T, U> edge : adjacencyList.get(vertex).values()) {
        System.out.println("\t" + edge);
      }
    }
  }

}

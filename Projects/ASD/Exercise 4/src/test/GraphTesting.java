package test;

import graph.*;
import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

/**
 * The methods to be tested are the following:
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
public class GraphTesting {

  private LabeledGraph<String, Double> graph;

  @Before
  public void createGraph() {
    graph = new LabeledGraph<>();
  }

  @Test
  public void testSizeOfGraph_zeroVer() {
    assertEquals(0, graph.getVerticesSize());
  }

  @Test
  public void testSizeOfGraph_oneVer() {
    graph.addVertex("A");
    assertEquals(1, graph.getVerticesSize());
  }

  @Test
  public void testSizeOfGraph_twoVer() {
    graph.addVertex("A");
    graph.addVertex("B");
    assertEquals(2, graph.getVerticesSize());
  }

  @Test
  public void testgetEdgesSize_zeroEd() {
    assertEquals(0, graph.getEdgesSize());
  }

  @Test
  public void testgetEdgesSize_oneEd() {
    graph.addVertex("A");
    graph.addVertex("B");
    graph.addEdge(1.0, "A", "B");
    assertEquals(1, graph.getEdgesSize());
  }

  @Test
  public void testgetEdgesSize_twoEd() {
    graph.addVertex("A");
    graph.addVertex("B");
    graph.addVertex("C");
    graph.addEdge(1.0, "A", "B");
    graph.addEdge(1.1, "B", "C");
    assertEquals(2, graph.getEdgesSize());
  }

  @Test
  public void testIsDirected_true() {
    graph.setIsDirected(true);
    assertTrue(graph.isDirected());
  }

  @Test
  public void testIsDirected_false() {
    graph.setIsDirected(false);
    assertFalse(graph.isDirected());
  }

  @Test
  public void testContainsVertex_false() {
    assertFalse(graph.containsVertex("A"));
  }

  @Test
  public void testContainsVertex_true() {
    graph.addVertex("A");
    assertTrue(graph.containsVertex("A"));
  }

  @Test
  public void testContainsEdge_false() {
    Vertex<String> aVertex = new Vertex("A");
    Vertex<String> bVertex = new Vertex("B");
    LabeledEdge<String, Double> edgeNotContained = new LabeledEdge(1.0, aVertex, bVertex);
    assertFalse(graph.containsEdge(edgeNotContained));
  }

  @Test
  public void testContainsEdge_true() {
    graph.addVertex("A");
    graph.addVertex("B");
    LabeledEdge<String, Double> edgeNotContained = graph.addEdge(1.0, "A", "B");
    assertTrue(graph.containsEdge(edgeNotContained));
  }

  @Test
  public void testRemoveVertex() {
    Vertex aVertex = graph.addVertex("A");
    graph.addVertex("B");
    graph.addVertex("C");
    graph.removeVertex(aVertex);
    Object[] actualVertices = new Object[2];
    actualVertices[0] = new Vertex<>("B");
    actualVertices[1] = new Vertex<>("C");
    assertArrayEquals(actualVertices, graph.getVertices().toArray(new Object[0]));
  }

  @Test
  public void testRemoveEdge_sizeTest() {
    graph.setIsDirected(true);
    graph.addVertex("A");
    graph.addVertex("B");
    graph.addVertex("C");
    graph.addVertex("D");
    LabeledEdge aToBEdge = graph.addEdge(1.0d, "A", "B");
    graph.addEdge(1.1d, "B", "C");
    graph.addEdge(1.2d, "C", "D");
    LabeledEdge dToAEdge = graph.addEdge(1.3d, "D", "A");
    int numberOfEdgesBeforeRemoval = graph.getEdgesSize(); // = 4
    graph.removeEdge(aToBEdge);
    graph.removeEdge(dToAEdge);
    assertEquals(numberOfEdgesBeforeRemoval, graph.getEdgesSize() + 2); // 4 = 2 + 2
  }

  // Since the order of the returned ArrayList is random a test with more than one element is not reliable
  @Test
  public void testGetAdjacentVertices() {
    graph.setIsDirected(true);
    Vertex aVertex = graph.addVertex("A");
    graph.addVertex("B");
    graph.addEdge(1.0d, "A", "B");
    Object[] adjacentVertices = new Object[1];
    adjacentVertices[0] = new Vertex<>("B");
    assertArrayEquals(adjacentVertices, graph.getAdjacentVertices(aVertex).toArray(new Object[0]));
  }

  @Test
  public void testGetLabelByVertices() {
    Vertex aVertex = graph.addVertex("A");
    Vertex bVertex = graph.addVertex("B");
    graph.addEdge(1.0d, "A", "B");
    assertEquals(1.0d, graph.getLabelByVertices(aVertex, bVertex), 0.0);
  }

}

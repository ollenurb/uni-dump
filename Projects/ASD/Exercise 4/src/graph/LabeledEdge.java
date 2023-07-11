package graph;

/**
 * @param <T>: vertex label type
 * @param <U>: edge label type
 * @author Brunello Matteo, Caresio Lorenzo
 */
public class LabeledEdge<T, U> {

  private Vertex<T> xVertex;
  private Vertex<T> yVertex;

  private U edgeLabel;
  private boolean isWeighted = false;
  private Double edgeWeight;

  /**
   * Constructor of the LabeledEdge class.
   *
   * @param edgeLabel: the edge label
   * @param xVertex:   the first vertex object
   * @param yVertex:   the second vertex object
   */
  public LabeledEdge(U edgeLabel, Vertex<T> xVertex, Vertex<T> yVertex) {

    this.xVertex = xVertex;
    this.yVertex = yVertex;
    this.edgeLabel = edgeLabel;

    if (edgeLabel instanceof Double) {
      isWeighted = true;
      edgeWeight = (Double) edgeLabel;
    }
  }

  /**
   * Getter of the first vertex object.
   */
  public Vertex<T> getXVertex() {
    return xVertex;
  }

  /**
   * Getter of the second vertex object.
   */
  public Vertex<T> getYVertex() {
    return yVertex;
  }

  /**
   * Getter of the edge label.
   */
  public U getLabel() {
    return edgeLabel;
  }

  /**
   * Getter for the isWeighted variable.
   */
  public boolean isWeighted() {
    return isWeighted;
  }

  /**
   * Returns the edge weight as a double value.
   */
  public double getWeight() {
    if (isWeighted) {
      return edgeWeight;
    } else {
      throw new UnsupportedOperationException("The edge isn't weighted.");
    }
  }

  /**
   * Returns the current object values as "LABEL: X_VERTEX_LABEL -
   * Y_VERTEX_LABEL"
   */
  @Override
  public String toString() {
    return edgeLabel.toString() + ": " + xVertex.toString() + " - " + yVertex.toString();
  }
}
package unionfindset;

import java.util.HashMap;

/**
 * This is a generic implementation of a union-find set, implemented using HashMap in order to achieve good performances.
 * The find operation is implemented using the path compression method.
 *
 * @param <T>: Type of the set elements
 * @author Brunello Matteo, Caresio Lorenzo
 */
public class UnionFind<T> {

  private HashMap<T, T> parenthoodList = new HashMap<>();

  /**
   * Creates a new set using the argument. The element "points" (in the parenthood list) to itself since
   * at this stage it's a singleton.
   *
   * @param element the element used to create a new set
   */
  public void makeSet(T element) {
    parenthoodList.put(element, element);
  }

  /**
   * Implements the path compression find. Even tough the reference implementation is recursive we opted for
   * an iterative version in order to increase performance (we detected a performance gap superior to 50 seconds)
   *
   * @param elementToFind the element to be found
   * @return the element found
   */
  public T find(T elementToFind) {

    T element = parenthoodList.get(elementToFind);

    while (element != parenthoodList.get(element)) {
      element = parenthoodList.get(element);
    }

    T previousElement = parenthoodList.get(elementToFind);
    T supportElement;

    while (previousElement != parenthoodList.get(previousElement)) {
      supportElement = parenthoodList.get(previousElement);
      parenthoodList.put(previousElement, element);
      previousElement = supportElement;
    }

    parenthoodList.put(elementToFind, element);
    return element;
  }

  /**
   * Creates a Union using the two elements passed as arguments.
   *
   * @param aElement the first element used to create the new union
   * @param bElement the second element used to create the new union
   */
  public void union(T aElement, T bElement) {

    T aRoot = find(aElement);
    T bRoot = find(bElement);

    if (aRoot != bRoot) {
      parenthoodList.put(aRoot, bRoot);
    }
  }

}

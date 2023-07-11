package test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import unionfindset.UnionFind;

import static org.junit.Assert.assertTrue;

public class UnionFindTest {

  private UnionFind<Integer> unionFind;

  @Before
  public void createUnionFind() {
    unionFind = new UnionFind<>();
  }

  @Test
  public void makeSetTest_true(){
    unionFind.makeSet(1);
    assertEquals(Integer.valueOf(1), unionFind.find(1));
  }

  @Test
  public void makeSetTest_false(){
    assertNotEquals(Integer.valueOf(1),unionFind.find(1));
  }

  @Test
  public void unionTest_true(){
    unionFind.makeSet(1);
    unionFind.makeSet(2);
    unionFind.union(1, 2);
    assertEquals(unionFind.find(1) ,unionFind.find(2));
  }

  @Test
  public void unionTest_false(){
    unionFind.makeSet(1);
    unionFind.makeSet(2);
    assertNotEquals(unionFind.find(1) ,unionFind.find(2));
  }
  
}
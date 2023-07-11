x := 0;
y := 0;
z := 5;

case
  when(x>0) {
    print(x)
  }
  when(y>0)
    print(y)
  else {
    while(z <= 10) {
      print(z);
      z := z + 1
    }

  }

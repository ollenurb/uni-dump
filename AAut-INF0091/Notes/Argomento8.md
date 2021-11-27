\newpage
# Modelli Probabilistici

* Molta dell'inferenza probabilistica sfrutta il teorema di Bayes:
  $$
  P(Y = y | X) = \frac{P(X | Y = y) \cdot P(Y = y)}{P(X)}
  $$

  > *"Avendo osservato i valori delle features $X$ che descrivono un'istanza,
  qual'e' la probabilita' che gli esempi che hanno quei valori delle features
  appartengano alla classe $y$? ($Y = y$)*"

* Il vettore $X$ e' un vettore composto da variabili casuali che rappresentano
  la probabilita' che il valore di una certa feature sia uguale a quello. Cioe'
  rappresentano la probabilita' che supponendo di prendere un'istanza qualsiasi
  dal dataset, quella feature abbia proprio quel vaore.
* Anche $Y$ e' una variabile casuale, che indica invece la probabilita' che il
  valore di target sia effettivamente quello
* 

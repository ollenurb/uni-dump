% Equazioni non lineari 
# Equazioni non lineari

Sono tutte quelle funzioni la cui equazione non e' nella forma  $f(x) = ax + b$.
In generale, per trovare la soluzione di queste equazioni si ricorre ad un algoritmo numerico iterativo per l'approssimazione 
numerica della soluione. (Di fatto anche le calcolatrici ricorrono a tale metodo per il calcolo di alcune funzioni)
Un problema di equazione non lineare e' rappresentato come: 
$$
f(x) = 0
$$
Risolvere questo problema significa trovare gli zeri della funzione $f$. 

**Algoritmo iterativo**: Algoritmo che, a partire da un punto iniziale $x_0$, fornisce una regola per costruire una successione 
$\{x_{1}, x_{2}, ..., x_{k}, ...\}$ che converge ad una radice $\alpha$ tale che $f(\alpha) = 0$

**Errore al passo $k$**: Avviene in corrispondenza di un'approssimazione al passo $k$, definito come $e_k = x_k - \alpha$

**Convergenza**: Un algoritmo e' convergente quando $\lim_{k \rightarrow \infty} |e_{k}| = 0$

#### Definizione 
>Un metodo iterativo convergente **ha ordine** $p$ se esiste una costante finita $C$ tale che 
>$$
>\lim_{k \rightarrow \infty} \frac{|e_{k+1}|}{|e_{k}|^p} = C
>$$

Intuitivamente, maggiore e' l'ordine $p$, maggiore e' la riduzione dell'errore che si verifica ad ogni passo, per cui 
e' minore il numero di iterazioni totali necessarie per raggiungere la precisione richiesta.
In sostanza, indica la velocita' con cui il metodo si avvicina alla soluzione. (Allo stesso modo, indica anche quanto velocemente 
l'errore si avvicina allo $0$) 

**Costante asintotica dell'errore**: $C$ 

* Quando ordine $p=1$ allora $C \leq 1$
* Nessuna limitazione quando $p \gt 1$
* Si dice metodo **superlineare** quando $p = 1$ e $C = 0$

#### Teorema (Serie di Taylor)
>Sia $f \in C^{(n+1) [a,b]}$. Allora $\forall x_0 \in [a,b]$ e per ogni intero $n$ esiste un polinomio 
>$t_n$ di grado $n$ (detto **polinomio di Taylor**) tale che: 
>$$
>f(x) = t_n(x) + R_{n+1}(x), x \in [a,b]
>$$
>Il polinomio $t_n$ e' dato da: 
>$$
>t_n(x) = \sum_{k=0}^{n} \frac{f^{(k)}(x_0)}{k!} (x - x_0)^k
>$$
>e il resto e' definito come: 
>$$
>R_{n+1}(x) = \frac{f^{n+1} (\xi) }{(n+1)!}(x - x_0)^{n+1}
>$$
>per un certo $\xi$ (dipendente da $x$) apparenente all'intervallo $I_{(x_0, x)} di estremi $x_0$ e $x$. 


#### Definizione
>$\alpha$ e' **radice semplice di un'equazione** se si puo' scrivere 
>$$
>f(x) = (x-\alpha)h(x), \text{ con } h(\alpha) \neq 0 
>$$
>$\alpha$ e' invece **radice multipla di un'equazione** con molteplicita' $m \geq 2$ se
>$$
>f(x) = (x-\alpha)^{m}h(x), \text{ con } h(\alpha) \neq 0 
>$$


In generale, per determinare la radice di una funzione (o equazione) si puo' usare il seguente 
#### Teorema 
> TODO: Teorema su radici e derivate $k$ esime
>  
> 

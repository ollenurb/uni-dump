\newpage
# Quadratura Numerica 
Un problema di quadratura consiste nel determinare il valore un integrale definito del tipo 
$$
I(f) = \int_{a}^{b} f(x) dx
$$
una **formula di quadratura** e' un'espressione del tipo
$$
I_n(f) = \sum^{n}_{j=0} \alpha_j f(x_j), 
$$
ossia una combinazione lineare dei valori assunti dalla funzione integranda su $n+1$ punti. 
$a_i$ sono detti **pesi** mentre i punti $x_j$ sono i **nodi** della formula. 

Per determinare i pesi si possono utilizzare i polinomi interpolanti Lagrangiani $L_j$, 
per cui, ponendo $\alpha_j = \int^a_b L_j(x) dx$ e per la linearita' dell'integrale si ottiene
$$
I_n(x) = \sum^{n}_{j=0} \int^a_b L_j(x) dx, 
$$

#### Formule di Newton-Cotes
Sono costruite su nodi equispaziati 
$$
x_j = x_0 + jh, \text{  } j = 0,1,...,n.
$$

Possono essere di due tipi: 

* Formule chiuse: L'intervallo di nodi comprende $a$ e $b$, e quindi $h = \frac{b-a}{n}$
* Formule aperte: L'intervallo di nodi non comprende $a$ e $b$, percio' $h = \frac{b-a}{n+2}$

Alcuni esempi degni di nota di formule di quadratura di NC sono: 
1. **Formula dei trapezi**: $n=1$, formula chiusa
2. **Formula di Simpson**: $n=2$, fomula chiusa
3. **Formula del punto medio:** $n=0$, formula aperta 

#### Calcolo dei coefficienti $\alpha_j$
Per calcolare i coefficienti $\alpha_j$ (come detto in precedenza) si possono utilizzare i 
polinomi caratteristi di Lagrange. 
L'idea e' che la funzione $f$ sia approssimata nei punti $x_j$, percio' vale
$$
f(x) \approx f(x_0) L_0(x) + f(x_1) L_1(x) + ... + f(x_n) L_n(x) = \sum^n_{j=0} f(x_j) L_j(x)
$$

Quindi, per esempio nella formula dei Trapezi (n=1), basta sostituire a $f$ la relazione 
precedente, e sempre per la linearita' dell'integrale si ottiene
$$
\begin{aligned}
\int^a_b f(x) dx & \approx f(x_0) \int^a_b L_0(x) dx + f(x_1) \int^a_b L_1(x) dx \\
                 & \approx f(x_0) \int^a_b \frac{x - x_1}{x_0 - x_1} dx + f(x_1) \int^a_b 
                 \frac{x - x_0}{x_1 - x_0} dx \\
                 & \text{...alcuni passaggi algebrici sul foglio della lezione..} \\
                 & \approx \frac{b-a}{2}[f(a) + f(b)]
\end{aligned}
$$

Riassumendo, applicando questo tipo di derivazioni si ottengono le corrispettive formule dei 
metodi: 
* **Formula dei trapezi (n=1)**:
$$
\int^a_b f(x) dx = \frac{b-a}{2}[f(a) + f(b)]
$$

* **Formula di Simpson (n=2)**
$$
\int^a_b f(x) dx = \frac{h}{3} [f(a) + 4 f(\frac{a+b}{2}) + f(b)], \text{ con } h = \frac{b-a}{2}
$$

* **Formula del rettangolo (n=0)**
$$
\int^a_b f(x) dx = b-a f(\frac{a+b}{2})
$$

Un'altra possibilita' per il calcolo dei coefficienti e' utilizzare il meotodo dei coefficienti 
indeterminati. Tale metodo si basa sull'osservazione che se $f(x) \in \mathbb{P}_n \rightarrow 
f(x) = \sum^n_{i=0} f(x_i) L_i(x)$ con $E_n(f) = 0$ quindi anche l'integrazione e' esatta. 


#### Formule composte 
Sfruttano la proprieta' della linearita' degli integrali per rappresentare le formule come: 
$$
\int^b_a f(x) dx = \sum^n_i=1 \int^{x_i}_{x_{i-1}} f(x) dx 
$$

L'idea e' quindi quella di "spezzare" l'intervallo per cui bisogna valutare l'integrale in 
singoli integrali la cui ampiezza dell'intervallo e' $h$. 
Il ragionamento puo' essere applicato alle formule di quadratura esposte in precedenza, ottenendo: 

* **Formula composta dei trapezi**: 
$$
I_1^{(c)}(f) = \frac{h}{2} [f(a) + 2 \sum^{n-1}_{i=1} f(x_i) + f(b)]
$$

* **Formula composta di Simpson**:
$$
I_2^{(c)}(f) = \frac{h}{2} [f(a) + 2 \sum^{n-1}_{i=1} f(a + 2ih) + 4 \sum^n_{i=1}
f(a + (2i-1)h) + f(b)]
$$

* **Formula composta del Rettangolo**
$$
I_0^{(c)} = h \sum^{n-1}_{i=0} f(\frac{x_i + x_{i+1}}{2})
$$

#### Definizione
>Una formula ha grado di precisione $r$ se e' esatta per $f(x) \in \mathbb{P}_r$ e non e' piu' 
>esatta quando $f(x) \in \mathbb{P}_{r+1}$.

#### Errori delle formule 
* **Formula dei Trapezi**
    * Elementare: $-f''(\eta) \frac{(b-a)^3}{12}$
    * Composta:   $-f''(\eta) \frac{b-a}{12} h^2$

* **Formula di Simpson**
    * Elementare: $-f^{(4)}(\eta) \frac{[(b-a)/2]^5}{90}$
    * Composta:   $-f^{(4)}(\eta) \frac{(b-a)}{180} h^4$

* **Formula del Rettangolo**
    * Elementare: $f''(\eta) \frac{(b-a)^3}{24}$
    * Composta:   $f''(\eta) \frac{b-a}{24} h^2$

### Esercizi

#### Esercizio 1
Si dimostri che la seguente formula di quadratura 
$$
\int^{1}_{-1} f(x) dx \approx \frac{1}{9} [5 f(\sqrt{\frac{3}{5}})+ 8 f(0) + 5 
f(-\sqrt{\frac{3}{5}})] 
$$

* Ha grado di precisione $r=5$
* Si applichi tale formula per valutare 

$$
I = \int^{1}_{0} \frac{sin x}{1+x} dx
$$

#### Soluzione
Per verificare che abbia grado $r=5$ basta verificare che ponendo $f(x) = x^5$ si ottiene 
$\int^1_{-1} f(x) dx = \frac{1}{9} [5 f(\sqrt{\frac{3}{5}})+ 8 f(0) + 5 f(-\sqrt{\frac{3}{5}})]$.   
Mentre per $f(x) = x^6$ l'uguaglianza non e' verificata. 

Per il punto 2 bisogna cambiare l'intervallo di integrazione da $[0, 1]$ a $[1, -1]$


#### Esercizio 2
Determinare i pesi della formula di quadratura
$$
\int^{1}_{0} f(x) dx = \alpha_0 f(0) + \alpha_1 f'(0) + \alpha_2 f(1)
$$
e calcolare il grado di precisione. 

#### Soluzione 
Ci sono 3 $\alpha$, quindi sappiamo che deve essere esatta per $f(x) = 1, x, x^2$
Hint: Poni a sistema le varie sostituzioni nell'uguaglianza ed esplicita gli $\alpha$

#### Esercizio 3 
Calcolare con la formula di Simpson semplice e con quella composta su due intervalli l'integrale 
$$
I = \int^2_1 \sqrt{x} dx
$$

e valutare gli errori. 

#### Soluzione 
Applico la formula semplice e ottengo: 
$$
I_1 = \frac{1}{6} [f(1) + f(\frac{3}{2}) + f(2)] \approx 1.2188655
$$

Applico la formula composta su 2 intervalli e ottengo: 
$$

$$

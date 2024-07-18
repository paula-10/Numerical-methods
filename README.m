Task 1------------------------------------------------------------------------

1. Functia parse_labyrinth
- prima instructiune deschide fisierul din care se citesc dimensiunile matricii
si elementele acesteia;
- se verifica daca fisierul a fost deschis cu succes, iar in caz contrar, se
afiseaza mesajul "Nu s-a putut deschide fisierul pentru citire!";
- se citesc din fisier elementele de pe prima linie cu ajutorul functiei fscanf
- dupa citire, sizes va fi un vector coloana, iar cu ajutorul acestuia se 
salveaza in variabilele row si col numarul de linii, respectiv de coloane ale
 matricii;
- se citeste matricea Labyrinth, avand grija sa se transpuna matricea citita, 
fiindca functia fscanf citeste din fisier linie cu linie, dar completeaza 
matricea pe coloane, astfel ajungandu-se la o matrice transpusa;
- la final, se inchide fisierul din care s-a citit.

2. Functia get_adjacency_matrix
- funcția începe prin determinarea dimensiunii matricei Labyrinth și calcularea
 numărului total de noduri din graful corespunzător labirintului, inclusiv două
 noduri speciale pentru stările de câștig și pierdere (WIN și LOSE);
- pentru fiecare celulă din labirint, funcția construiește legăturile către 
celelalte celule și către nodurile WIN si LOSE; in funcție de direcțiile în
care există sau nu ziduri în jurul celulei curente,se calculează indexul 
nodului corespunzător și se marchează legătura în matricea de adiacență;
- dacă există o iesire LOSE pe partea stângă a matricei (adică primul bit al
numărului asociat unei celule este 0), atunci se marchează legătura dintre 
nodul corespunzător acestei celule și nodul LOSE în matricea de adiacență; 
Același lucru se întâmplă și pentru iesirile LOSE de pe partea dreaptă a 
matricei, cat si pentru iesirile de tip WIN, verificandu-se insa bitii 
corespunzatori;
- se utilizeaza functia bitget pentru a verifica daca un anumit bit din codi-
ficarea unui element.

3. Functia get_link_matrix
- functia se foloseste de matricea de adiacenta rezultata de functia
implementata anterior si cu ajutorul ei se construieste noua matrice;
- se parcurge matricea de adianceta si se numara elementele nenule pe fiecare
linie, iar suma pentru fiecare linie este salvata intr-un vector;
- se parcurge inca o data matricea de adiacenta si pentru fiecare element nenul
se adauga in matricea Link, pe aceeasi pozitie, probabilitea nodului de a trece
in alta stare.

4. Functia get_Jacobi_parameters
- functia primeste ca parametru matricea legaturilor si prin intermediul ei se
determina matricea, respectiv vectorul de iteratie;
- matricea de iteratie este o submatrice a matricei Link, in care nu exista
liniile, respectiv coloanele pentru starile de WIN si LOSE;
- vectorul de iteratie coincide cu coloana starii WIN din matricea Link.

5. Functia perform_iterative
- functia initializeaza valorile care urmeaza a fi returnate;
- cat timp nu este atinsa toleranta sau numarul maxim de pasi, solutia este
calculata in functie de solutia anterioara, pe baza algoritmului Jacobi;
- la fiecar pas se actualizeaza eroarea si numarul de pasi;

6. Functia heuristic_greedy
- functia determină dimensiunile matricei de adiacență și se inițializează un
vector visited care marchează dacă un nod a fost vizitat sau nu;
- se adaugă poziția de start în calea path și se marchează ca vizitată;
- in timp ce calea path are cel puțin un nod, algoritmul începe să caute;
- se ia ultimul element din calea path și se verifică dacă aceasta este
poziția finală, iar dacă este, algoritmul se oprește;
- dacă poziția curentă nu este poziția finală, algoritmul găsește vecinii
nevizitați ai poziției curente și îi adaugă în vectorul neighbors; 
- dacă poziția curentă nu are vecini nevizitați, se elimină din cale;
- dacă există vecini nevizitați, algoritmul caută vecinul cu cea mai mare 
probabilitate de câștig (reprezentată de vectorul probabilities); 
- se marchează vecinul găsit ca vizitat și se adaugă în vectorul path;
- acest proces continuă până când calea path ajunge la poziția finală sau nu
mai există noduri nevizitate în graf; funcția returnează calea găsită.

7. Functia decoded_path
- functia parcurge vectorul caii pana la pozitia de win si pentru fiecare
element determina coordonatele, tinand cont ca formula prin care se calculeaza
indexul este (i - 1) * cols + j;
- apoi valorile sunt adaugate in matrice, pe linia corespunzatoare;
- functia foloseste functiile ceil si mod pentru a calcula numarul liniei,
respectiv al coloanei;

Task2-------------------------------------------------------------------------
1. Functia parse_data_set_file
- functia citeste din fisier dimensiunile matricii care urmeaza sa fie citita;
- se foloseste tipul cell la initializarea matricii pentru ca urmeaza sa fie
stocate tipuri diferite de date;
- se ia fiecare linie din fisier si se citeste primul element, pentru
constructia vecotrului Y;
- apoi se citesc restul elementelor de pe linie si sunt adaugate in matricea
care trebuie returnata;

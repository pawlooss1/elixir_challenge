# ElixirChallenge

# Zasady konkursu

Uczestnikami konkursu mogą by tylko uczestniczy wiosennej edycji Szkoły Elixira 2024.
Zadanie polega na zaimplementowaniu funkcji `find_number_with_factors_sum` w module `ElixirChallenge.PrimeFactorsSumFinder`.
Funkcja przyjmuje listę liczb naturalnych oraz sumę czynników pierwszych jednej z nich.
Jej zadaniem jest znaleźć liczbę dla której ta suma się zgadza i zwrócić ją.
Rozwiązanie zadania prosimy wysłać jako Pull Request do repozytorium.
Rozwiązanie jest sprawdzane automatycznie przez GitHub Actions i testy znajdujące się w module `ElixirChallengeTest`.

Założenia i informacje:

- Przyjmowane są rozwiązania wyłącznie w jęzku Elixir.
- Rozwiązanie należy wysłać jako Pull Request do repozytorium.
- Rozwiązania przyjmujemy do końca 28.04.2024, jakiekolwiek commity wysłane po tym terminie nie będą brane pod uwagę.
- Można tworzyć dowolną liczbę modułów i wykorzysytwać dowolne biblioteki.
- Można dopisać własne testy do implementacji (tylko w nowych modułach).
- Zabronione jest tworzenie implementacji, która wyciąga rozwiązanie z datasetu.
- Nie można w jakikolwiek sposób modyfikować modułu `ElixirChallengeTest`.
- GitHub Actions wykorzystuje Elixir 1.16.2 oraz Erlang 26.2.4.
- Wygrywa osoba, która zaimplementuje poprawne oraz najbardziej wydajne rozwiązanie.
- Sprawdzany jest średni czas wykonania dla 10 testów.
- Brany pod uwagę jest rezultat z ostatniego commita, który przechodzi testy.
- Wszelkie niejasności i wątpliwości będą rozstrzygnięte przez organizatora konkursu.

Porada:

- aby uzyskać najszybciej działający algorytm, prawdopodobnie trzeba go zrównoleglić przy użyciu procesów


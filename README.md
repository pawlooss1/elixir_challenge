# ElixirChallenge

# Zasady konkursu

Uczestnikami konkursu mogą by tylko uczestniczy wiosennej edycji Szkoły Elixira 2024.
Zadanie polega na zaimplementowaniu funkcji `find_number_with_factors_sum` w module `ElixirChallenge.PrimeFactorsSumFinder`.
Funkcja przyjmuje listę liczb naturalnych oraz sumę czynników pierwszych jednej z nich.
Jej zadaniem jest znaleźć liczbę dla której ta suma się zgadza i zwrócić ją.
Rozwiązanie zadania prosimy wysłać jako Pull Request do repozytorium.
Rozwiązanie jest sprawdzane automatycznie przez GitHub Actions i testy znajdujące się w module `ElixirChallengeTest`

Założenia i informacje:

- przyjmowane są rozwiązania wyłącznie w jęzku Elixir
- można tworzyć dowolną liczbę modułów i wykorzysytwać dowolne biblioteki
- można dopisać własne testy do implementacji (tylko w nowych modułach)
- zabronione jest tworzenie implementacji, która wyciąga rozwiązanie z datasetu
- nie można w jakikolwiek sposób modyfikować modułu `ElixirChallengeTest`
- GitHub Actions wykorzystuje Elixir 1.14.3 oraz Erlang 25.2.2

Wygrywaja osoba, która zaimplementuje poprawne oraz najbardziej wydajne rozwiązanie, sprawdzamy średni czas wykonania dla 10 testów.
Wszelkie niejasności i wątpliwości będą rozstrzygnięte przez organizatora konkursu.

PORADA:
- aby uzyskać najszybciej działający algorytm, prawdopodobnie trzeba go zrównoleglić przy użyciu procesów


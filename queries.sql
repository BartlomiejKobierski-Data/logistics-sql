-- 1. Którzy kierowcy obsłużyli najwięcej przesyłek?
SELECT k.imie, k.nazwisko, COUNT(*) AS liczba_przesylek
FROM przesylki p
JOIN kierowcy k ON p.id_kierowcy = k.id
GROUP BY k.imie, k.nazwisko
ORDER BY liczba_przesylek DESC;

-- 2. Średni czas dostawy per firma (w dniach)
SELECT f.nazwa, ROUND(AVG(p.data_dostawy - p.data_nadania), 1) AS sredni_czas_dni
FROM przesylki p
JOIN kierowcy k ON p.id_kierowcy = k.id
JOIN firmy f ON k.id_firmy = f.id
WHERE p.data_dostawy IS NOT NULL
GROUP BY f.nazwa
ORDER BY sredni_czas_dni;

-- 3. Które trasy są najbardziej obciążone?
SELECT t.miasto_start, t.miasto_cel, t.dystans_km, COUNT(*) AS liczba_przesylek
FROM przesylki p
JOIN trasy t ON p.id_trasy = t.id
GROUP BY t.miasto_start, t.miasto_cel, t.dystans_km
ORDER BY liczba_przesylek DESC;

-- 4. Top klienci według łącznej wagi
SELECT k.nazwa, k.typ, SUM(p.waga) AS laczna_waga, COUNT(*) AS liczba_zamowien
FROM przesylki p
JOIN klienci k ON p.id_klienta = k.id
GROUP BY k.nazwa, k.typ
ORDER BY laczna_waga DESC;

-- 5. Analiza statusów przesyłek
SELECT status, COUNT(*) AS ilosc,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS procent
FROM przesylki
GROUP BY status
ORDER BY ilosc DESC;

-- 6. Kierowcy z opóźnieniami (dostawa ponad 1 dzień)
SELECT k.imie, k.nazwisko, COUNT(*) AS opoznione
FROM przesylki p
JOIN kierowcy k ON p.id_kierowcy = k.id
WHERE (p.data_dostawy - p.data_nadania) > 1
GROUP BY k.imie, k.nazwisko
ORDER BY opoznione DESC;

-- 7. Ranking kierowców według łącznej wagi (window function)
SELECT k.imie, k.nazwisko,
SUM(p.waga) AS laczna_waga,
RANK() OVER (ORDER BY SUM(p.waga) DESC) AS ranking
FROM przesylki p
JOIN kierowcy k ON p.id_kierowcy = k.id
GROUP BY k.imie, k.nazwisko;

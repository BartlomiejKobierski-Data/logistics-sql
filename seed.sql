-- Klienci
INSERT INTO klienci (nazwa, miasto, typ) VALUES
('Orlen SA', 'Warszawa', 'firma'),
('Jan Kowalski', 'Kraków', 'osoba'),
('Allegro Sp. z o.o.', 'Poznań', 'firma'),
('Anna Nowak', 'Gdańsk', 'osoba'),
('PKN Orlen', 'Płock', 'firma');

-- Firmy przewozowe
INSERT INTO firmy (nazwa, miasto) VALUES
('SpeedCargo', 'Warszawa'),
('TransPol', 'Kraków'),
('FastLogistics', 'Gdańsk');

-- Kierowcy
INSERT INTO kierowcy (imie, nazwisko, id_firmy) VALUES
('Marek', 'Lis', 1),
('Adam', 'Maj', 2),
('Piotr', 'Kos', 1),
('Tomasz', 'Wójcik', 3),
('Krzysztof', 'Nowak', 2);

-- Trasy
INSERT INTO trasy (miasto_start, miasto_cel, dystans_km) VALUES
('Warszawa', 'Kraków', 295),
('Warszawa', 'Gdańsk', 340),
('Kraków', 'Wrocław', 270),
('Gdańsk', 'Poznań', 310),
('Warszawa', 'Poznań', 310);

-- Przesyłki
INSERT INTO przesylki (data_nadania, data_dostawy, waga, status, id_klienta, id_kierowcy, id_trasy) VALUES
('2024-01-05', '2024-01-06', 12.5, 'dostarczona', 1, 1, 1),
('2024-01-07', '2024-01-08', 4.2, 'dostarczona', 2, 2, 2),
('2024-01-10', NULL, 8.0, 'w_trasie', 3, 1, 3),
('2024-01-12', '2024-01-13', 15.7, 'dostarczona', 4, 3, 4),
('2024-01-15', NULL, 3.5, 'oczekuje', 5, NULL, 5),
('2024-01-18', '2024-01-19', 22.0, 'dostarczona', 1, 4, 1),
('2024-01-20', '2024-01-21', 9.8, 'dostarczona', 2, 5, 2),
('2024-01-22', NULL, 6.3, 'anulowana', 3, 2, 3),
('2024-01-25', '2024-01-26', 18.4, 'dostarczona', 4, 1, 4),
('2024-01-28', NULL, 5.1, 'w_trasie', 5, 3, 5);

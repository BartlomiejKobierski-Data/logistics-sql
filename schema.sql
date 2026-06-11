-- Tabela klientów
CREATE TABLE klienci (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    miasto VARCHAR(50) NOT NULL,
    typ VARCHAR(20) CHECK (typ IN ('firma', 'osoba'))
);

-- Tabela firm przewozowych
CREATE TABLE firmy (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    miasto VARCHAR(50) NOT NULL
);

-- Tabela kierowców
CREATE TABLE kierowcy (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    id_firmy INT REFERENCES firmy(id)
);

-- Tabela tras
CREATE TABLE trasy (
    id SERIAL PRIMARY KEY,
    miasto_start VARCHAR(50) NOT NULL,
    miasto_cel VARCHAR(50) NOT NULL,
    dystans_km INT NOT NULL
);

-- Tabela przesyłek
CREATE TABLE przesylki (
    id SERIAL PRIMARY KEY,
    data_nadania DATE NOT NULL,
    data_dostawy DATE,
    waga DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('oczekuje', 'w_trasie', 'dostarczona', 'anulowana')),
    id_klienta INT REFERENCES klienci(id),
    id_kierowcy INT REFERENCES kierowcy(id),
    id_trasy INT REFERENCES trasy(id)
);

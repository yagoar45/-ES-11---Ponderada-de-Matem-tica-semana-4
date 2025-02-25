-- Criação das tabelas
CREATE TABLE Mecanicos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Nivel VARCHAR(50),
    Especialidade VARCHAR(100)
);

CREATE TABLE Carros (
    ID INT PRIMARY KEY,
    Placa VARCHAR(20),
    Modelo VARCHAR(100),
    Categoria VARCHAR(50),
    MecanicoID INT,
    FOREIGN KEY (MecanicoID) REFERENCES Mecanicos(ID)
);

CREATE TABLE Pecas (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10,2),
    Fabricante VARCHAR(100)
);

CREATE TABLE CarrosPecas (
    CarroID INT,
    PecaID INT,
    FOREIGN KEY (CarroID) REFERENCES Carros(ID),
    FOREIGN KEY (PecaID) REFERENCES Pecas(ID),
    PRIMARY KEY (CarroID, PecaID)
);

-- Consulta solicitada
SELECT COUNT(c.ID), a.Nome
FROM Mecanicos a
JOIN Carros b ON a.ID = b.MecanicoID
JOIN Pecas c ON b.ID = c.CarroID
WHERE a.Nivel = 'Júnior'
AND b.Categoria = 'Compacto'
AND c.Preco BETWEEN 100 AND 200
GROUP BY a.Nome; 

-- Consulta 1: Selecionar o nome do mecânico e o número de carros que ele reparou, considerando que um mecânico pode ter reparado mais de um carro.
SELECT m.Nome, COUNT(c.ID) AS NumeroCarros
FROM Mecanicos m    
JOIN Carros c ON m.ID = c.MecanicoID
GROUP BY m.Nome;

-- Consulta 2: Selecionar o nome da peça e o número de carros que usam a peça, considerando que uma peça pode ser usada em mais de um carro.
SELECT p.Nome, COUNT(cp.CarroID) AS NumeroCarros
FROM Pecas p
JOIN CarrosPecas cp ON p.ID = cp.PecaID
GROUP BY p.Nome;

-- Consulta 3: Selecionar o nome do mecânico e o número de peças que ele usou, considerando que um mecânico pode ter usado mais de uma peça.
SELECT m.Nome, COUNT(cp.PecaID) AS NumeroPecas
FROM Mecanicos m    
JOIN Carros c ON m.ID = c.MecanicoID
JOIN CarrosPecas cp ON c.ID = cp.CarroID
GROUP BY m.Nome;


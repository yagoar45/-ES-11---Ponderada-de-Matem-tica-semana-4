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
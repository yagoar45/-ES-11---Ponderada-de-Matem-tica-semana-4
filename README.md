# [ES-11] Ponderada de Matemática semana 4

## Descrição

Este projeto apresenta uma análise aprofundada de modelagem de dados focando em relações 1:N e N:N em um sistema de oficina mecânica.

## Estrutura do Projeto

- `oficina.sql`: Contém as definições das tabelas e consultas SQL
- `README.md`: Documentação do projeto

## Modelo de Dados

### Diagrama de Relacionamento

<img src="ponderada.drawio.png" alt="Diagrama de Relacionamento">

## Tabelas

### Mecanicos

| Campo | Tipo | Descrição |
|-------|------|-----------|
| ID | INT | Identificador único do mecânico |
| Nome | VARCHAR(100) | Nome do mecânico |
| Nivel | VARCHAR(50) | Nível de experiência do mecânico |
| Especialidade | VARCHAR(100) | Especialidade do mecânico |

### Carros


| Campo | Tipo | Descrição |
|-------|------|-----------|
| ID | INT | Identificador único do carro |
| Placa | VARCHAR(20) | Placa do carro |
| Modelo | VARCHAR(100) | Modelo do carro |
| Categoria | VARCHAR(50) | Categoria do carro |    

### Pecas

| Campo | Tipo | Descrição |
|-------|------|-----------|
| ID | INT | Identificador único da peça |
| Nome | VARCHAR(100) | Nome da peça |
| Preco | DECIMAL(10,2) | Preço da peça |
| Fabricante | VARCHAR(100) | Fabricante da peça |

### CarrosPecas

| Campo | Tipo | Descrição |    
|-------|------|-----------|
| CarroID | INT | Identificador único do carro |
| PecaID | INT | Identificador único da peça |

## Consultas SQL    

1. Selecionar o nome do mecânico e o número de carros que ele reparou, considerando que um mecânico pode ter reparado mais de um carro.

```sql
SELECT m.Nome, COUNT(c.ID) AS NumeroCarros
FROM Mecanicos m    
JOIN Carros c ON m.ID = c.MecanicoID
GROUP BY m.Nome;
```

2. Selecionar o nome da peça e o número de carros que usam a peça, considerando que uma peça pode ser usada em mais de um carro.    

```sql
SELECT p.Nome, COUNT(cp.CarroID) AS NumeroCarros
FROM Pecas p
JOIN CarrosPecas cp ON p.ID = cp.PecaID
GROUP BY p.Nome;
``` 

3. Selecionar o nome do mecânico e o número de peças que ele usou, considerando que um mecânico pode ter usado mais de uma peça.

```sql
SELECT m.Nome, COUNT(cp.PecaID) AS NumeroPecas
FROM Mecanicos m    
JOIN Carros c ON m.ID = c.MecanicoID
JOIN CarrosPecas cp ON c.ID = cp.CarroID
GROUP BY m.Nome;
```


##  SQL em uma equação usando álgebra relacional






/*Desafio: declaração de variáveis*/
DECLARE @Cliente VARCHAR(10)
DECLARE @Idade INT
DECLARE @DataNascimento DATE
DECLARE @Custo float

/*Desafio: atribuição de valores*/
SET @Cliente = 'João'
SET @Idade = 10
SET @DataNascimento = '2007-01-10'
SET @Custo = 10.23

/*Desafio: exibindo os valores das variáveis*/
PRINT @Cliente
PRINT @Idade
PRINT @DataNascimento
PRINT @Custo
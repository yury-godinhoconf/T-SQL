/*Desafio: usando SELECT para atribuir valores*/
DECLARE @NumNotas INT

SELECT @NumNotas = COUNT(*) FROM [NOTAS FISCAIS] WHERE (DATA = '2017-01-01')

PRINT @NumNotas
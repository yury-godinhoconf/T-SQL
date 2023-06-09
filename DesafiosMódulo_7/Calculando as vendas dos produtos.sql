/*Desafio: calculando as vendas dos produtos*/
DECLARE @CODIGO VARCHAR(10)
DECLARE @NOME VARCHAR(50)
DECLARE @NUMERO_PRODUTOS INT
DECLARE @I INT
DECLARE @MES INT, @ANO INT
DECLARE @TOTAL_VENDAS FLOAT

SET @MES = 1
SET @ANO = 2015

SELECT @NUMERO_PRODUTOS = COUNT(*) FROM [TABELA DE PRODUTOS]

SET @I = 1

WHILE @I <= @NUMERO_PRODUTOS
BEGIN
   SELECT @CODIGO = TP.[CODIGO DO PRODUTO], @NOME = TP.[NOME DO PRODUTO]
   FROM ( SELECT Row_Number() Over (Order By [CODIGO DO PRODUTO]) as RowNum, * from [TABELA DE PRODUTOS]) TP
   WHERE TP.RowNum = @I

   SELECT @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PRE�O]) 
   FROM [NOTAS FISCAIS] INNER JOIN [ITENS NOTAS FISCAIS] ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
   WHERE  [ITENS NOTAS FISCAIS].[CODIGO DO PRODUTO] = @CODIGO AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES

   PRINT @CODIGO + ' - ' + @NOME + ' DATA ' + CONVERT(VARCHAR(2), @MES) + '/' + CONVERT(VARCHAR(4), @ANO) + ' FOI ' +  CONVERT(VARCHAR(20), @TOTAL_VENDAS)
   SET @I = @I + 1
END
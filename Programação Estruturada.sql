--Exerc�cios: Fazer em SQL Server os seguintes algoritmos:

--a) Fazer um algoritmo que leia 1 n�mero e mostre se s�o m�ltiplos de 2,3,5 ou nenhum deles
DECLARE @num	INT
SET @num = 15

IF (@num % 2 = 0)
	BEGIN
	PRINT 'multiplo de 2'
END
IF (@num % 3 = 0)
	BEGIN
	PRINT 'multiplo de 3'
END
IF(@num % 5 = 0)
	BEGIN
	PRINT 'multiplo de 5'
END
ELSE 
BEGIN
	PRINT 'multiplo de nenhum deles'
END


--b) Fazer um algoritmo que leia 3 n�meros e mostre o maior e o menor
DECLARE @num1 INT, @num2 INT, @num3 INT
SET @num1 = 5
SET @num2 = 8
SET @num3 = 3

IF (@num1 >= @num2 and @num1 >= @num3 )
BEGIN
	PRINT CAST(@num1 AS VARCHAR)+ ' � o maior numero'
END
ELSE IF (@num2 >= @num1 and @num2 >= @num3 )
BEGIN
	PRINT CAST(@num2 AS VARCHAR)+ ' � o maior numero'
END
ELSE IF (@num3 >= @num1 and @num3 >= @num2 )
BEGIN
	PRINT CAST(@num3 AS VARCHAR)+ ' � o maior numero'
END

IF (@num1 <= @num2 and @num1 <= @num3 )
BEGIN
	PRINT CAST(@num1 AS VARCHAR)+ ' � o menor numero'
END
ELSE IF (@num2 <= @num1 and @num2 <= @num3 )
BEGIN
	PRINT CAST(@num2 AS VARCHAR)+ ' � o menor numero'
END
ELSE IF (@num3 <= @num1 and @num3 <= @num2 )
BEGIN
	PRINT CAST(@num3 AS VARCHAR)+ ' � o menor numero'
END


--c) Fazer um algoritmo que calcule os 15 primeiros termos da s�rie 1,1,2,3,5,8,13,21,... E calcule a soma dos 15 termos
DECLARE @numx INT, @numy INT, @numTotal INT, @aux INT, @cont INT
SET @numx = 1
SET @numy = 1
SET @cont = 1

WHILE (@cont <=15)
BEGIN
SET @aux = @numx + @numy
PRINT @numx
SET @numTotal = @numTotal + @numx + @numy
SET @cont = @cont + 1
SET @numx = @numy
SET @numy = @aux

END
PRINT  CAST(@numTotal AS VARCHAR)+ '***soma dos 15 termos***'

--d) Fazer um algoritmo que separa uma frase, colocando todas as letras em mai�sculo e em min�sculo (Usar fun��es UPPER e LOWER)
DECLARE @frase VARCHAR(MAX) = 'Vai Corinthians'
PRINT UPPER(@frase)
PRINT LOWER(@frase)

--e) Fazer um algoritmo que inverta uma palavra (Usar a fun��o SUBSTRING)
DECLARE @frase_normal VARCHAR(MAX) = 'Subi no onibus',
		@frase_invert VARCHAR(MAX) = '',
		@tamanho INT
SET @tamanho = LEN(@frase_normal)
WHILE (@tamanho >= 0)
BEGIN
	SET @frase_invert = @frase_invert + SUBSTRING(@frase_normal, @tamanho, 1) 
	SET @tamanho = @tamanho - 1
END
PRINT @frase_invert

--Considerando a tabela abaixo, gere uma massa de dados, com 100 registros, para fins de teste com as regras estabelecidas (N�o usar constraints na cria��o da tabela)

--Computador
--ID	Marca	QtdRAM	TipoHD	QtdHD	FreqCPU
--INT (PK)	VARCHAR(40)	INT	VARCHAR(10)	INT	DECIMAL(7,2)
--ID incremental a iniciar de 10001

--Marca segue o padr�o simples, Marca 1, Marca 2, Marca 3, etc.

--QtdRAM � um n�mero aleat�rio* dentre os valores permitidos (2, 4, 8, 16)

--TipoHD segue o padr�o:

--Se o ID dividido por 3 der resto 0, � HDD
--Se o ID dividido por 3 der resto 1, � SSD
--Se o ID dividido por 3 der resto 2, � M2 NVME
--QtdHD segue o padr�o:

--Se o TipoHD for HDD, um valor aleat�rio* dentre os valores permitidos (500, 1000 ou 2000)
--Se o TipoHD for SSD, um valor aleat�rio* dentre os valores permitidos (128, 256, 512)
--FreqHD � um n�mero aleat�rio* entre 1.70 e 3.20

--Fun��o RAND() gera n�meros aleat�rios entre 0 e 0,9999...
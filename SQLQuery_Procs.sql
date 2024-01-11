--DROP DATABASE SO_TREINOS
--CREATE DATABASE SO_TREINOS
--USE SO_TREINOS
--CREATE DATABASE EXCLUISAO
--USE EXCLUISAO


CREATE PROCEDURE SP_CADASTRO_USUARIO
	@NOME_USUARIO VARCHAR(200),
	@SENHA_USUARIO VARCHAR(20),
	@CHAVE_USUARIO varchar(200)
AS
BEGIN
	INSERT INTO TB_USUARIO 
		(NOME_USUARIO, SENHA_USUARIO, CHAVE_USUARIO)
	VALUES
		(@NOME_USUARIO, @SENHA_USUARIO, @CHAVE_USUARIO)
END

GO

CREATE PROCEDURE SP_ALTERA_USUARIO
	@ID_USUARIO INT,
	@NOME_USUARIO VARCHAR(200),
	@SENHA_USUARIO VARCHAR(20),
	@FLAG_ATIVO BIT
AS
BEGIN
	UPDATE 
		TB_USUARIO
	SET
		NOME_USUARIO = @NOME_USUARIO,
		SENHA_USUARIO = @SENHA_USUARIO,
		FLAG_ATIVO = @FLAG_ATIVO
	WHERE
		ID_USUARIO = @ID_USUARIO
END

GO

CREATE PROCEDURE SP_LOGIN_USUARIO
	@ID_USUARIO INT,
	@NOME_USUARIO VARCHAR(200),
	@SENHA_USUARIO VARCHAR(20)
AS
BEGIN
	SELECT 
		* 
	FROM 
		TB_USUARIO
	WHERE 
		NOME_USUARIO = @NOME_USUARIO AND
		SENHA_USUARIO = @SENHA_USUARIO AND
		FLAG_ATIVO = 1
END

GO

CREATE PROCEDURE SP_CADASTRO_ALUNO
	@ID_ALUNO INT,
    @NOME_ALUNO VARCHAR(255),
    @DATA_NASCIMENTO_ALUNO DATE,
    @SEXO_ALUNO CHAR(1),
    @ALTURA_ALUNO NUMERIC(5, 2),
    @PESO_ALUNO NUMERIC(5, 2),
    @OBJETIVO_ALUNO VARCHAR(255),
    @NIVEL_ATIVIDADE_ALUNO INT,
    @FOTO_ALUNO VARBINARY(MAX)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_DADOS_PESSOAIS_ALUNO WHERE ID_ALUNO = @ID_ALUNO AND FLAG_ATIVO = 1)
	BEGIN
		INSERT INTO TB_DADOS_PESSOAIS_ALUNO
			(
				NOME_ALUNO,
				DATA_NASCIMENTO_ALUNO,
				SEXO_ALUNO,
				ALTURA_ALUNO,
				PESO_ALUNO,
				OBJETIVO_ALUNO,
				NIVEL_ATIVIDADE_ALUNO,
				FOTO_ALUNO
			)
		VALUES
		(
			@NOME_ALUNO,
			@DATA_NASCIMENTO_ALUNO,
			@SEXO_ALUNO,
			@ALTURA_ALUNO,
			@PESO_ALUNO,
			@OBJETIVO_ALUNO,
			@NIVEL_ATIVIDADE_ALUNO,
			@FOTO_ALUNO
		)
	END
	ELSE 
	BEGIN
		UPDATE TB_DADOS_PESSOAIS_ALUNO
		SET
				NOME_ALUNO = @NOME_ALUNO,
				DATA_NASCIMENTO_ALUNO = @DATA_NASCIMENTO_ALUNO,
				SEXO_ALUNO = @SEXO_ALUNO,
				ALTURA_ALUNO = @ALTURA_ALUNO,
				PESO_ALUNO = @PESO_ALUNO,
				OBJETIVO_ALUNO = @OBJETIVO_ALUNO,
				NIVEL_ATIVIDADE_ALUNO = @NIVEL_ATIVIDADE_ALUNO,
				FOTO_ALUNO = @FOTO_ALUNO
		WHERE ID_ALUNO = @ID_ALUNO
	END
END

GO

CREATE PROCEDURE SP_CADASTRO_ANAMNESE_ALUNO
	@ID_ANAMNESE_MEDICA INT,
	@ID_ALUNO INT,
    @CONDICOES_MEDICAS_ALUNO TEXT,
    @MEDICAMENTOS_ALUNO TEXT,
    @RESTRICOES_ALIMENTARES_ALUNO TEXT,
    @HISTORICO_EXERCICIOS_ALUNO TEXT,
    @FREQUENCIA_CARDIACA_REPOUSO_ALUNO INT,
    @PRESSAO_ARTERIAL_ALUNO VARCHAR(20),
    @OUTRAS_OBSERVACOES_ALUNO TEXT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_ANAMNESE_MEDICA_ALUNO WHERE ID_ANAMNESE_MEDICA = @ID_ANAMNESE_MEDICA AND FLAG_ATIVO = 1)
	BEGIN
		INSERT INTO TB_ANAMNESE_MEDICA_ALUNO
		(
			ID_ALUNO,
			CONDICOES_MEDICAS_ALUNO,
			MEDICAMENTOS_ALUNO,
			RESTRICOES_ALIMENTARES_ALUNO,
			HISTORICO_EXERCICIOS_ALUNO,
			FREQUENCIA_CARDIACA_REPOUSO_ALUNO,
			PRESSAO_ARTERIAL_ALUNO,
			OUTRAS_OBSERVACOES_ALUNO
		)
		VALUES
		(
			@ID_ALUNO,
			@CONDICOES_MEDICAS_ALUNO,
			@MEDICAMENTOS_ALUNO,
			@RESTRICOES_ALIMENTARES_ALUNO,
			@HISTORICO_EXERCICIOS_ALUNO,
			@FREQUENCIA_CARDIACA_REPOUSO_ALUNO,
			@PRESSAO_ARTERIAL_ALUNO,
			@OUTRAS_OBSERVACOES_ALUNO
		)
	END
	ELSE
	BEGIN
		UPDATE TB_ANAMNESE_MEDICA_ALUNO
		SET
			ID_ALUNO = @ID_ALUNO,
			CONDICOES_MEDICAS_ALUNO = @CONDICOES_MEDICAS_ALUNO,
			MEDICAMENTOS_ALUNO = @MEDICAMENTOS_ALUNO,
			RESTRICOES_ALIMENTARES_ALUNO = @RESTRICOES_ALIMENTARES_ALUNO,
			HISTORICO_EXERCICIOS_ALUNO = @HISTORICO_EXERCICIOS_ALUNO,
			FREQUENCIA_CARDIACA_REPOUSO_ALUNO = @FREQUENCIA_CARDIACA_REPOUSO_ALUNO,
			PRESSAO_ARTERIAL_ALUNO = @PRESSAO_ARTERIAL_ALUNO,
			OUTRAS_OBSERVACOES_ALUNO = @OUTRAS_OBSERVACOES_ALUNO
		WHERE ID_ANAMNESE_MEDICA = @ID_ANAMNESE_MEDICA
	END
END

GO

-- Execu��o 1SELECT '2023-12-09 18:46:00'
/*
EXEC SP_CADASTRO_ANAMNESE_ALUNO 'Jo�o Silva', '1990-05-15', 'M', 1.80, 75.5, 'Ganhar massa muscular', 3, 'Nenhuma', 'Nenhum', 'Nenhuma', 'Pratica esportes regularmente', 65, '120/80', 'Nenhuma', NULL

-- Execu��o 2
EXEC SP_CADASTRO_ANAMNESE_ALUNO 'Maria Oliveira', '1988-11-22', 'F', 1.65, 60.2, 'Manter-se saud�vel', 2, 'Nenhuma', 'Nenhum', 'Vegetariana', 'Caminhadas di�rias', 70, '130/75', 'Nenhuma', NULL

-- Execu��o 3
EXEC SP_CADASTRO_ANAMNESE_ALUNO 'Carlos Mendes', '1985-08-10', 'M', 1.75, 80.0, 'Perder peso', 2, 'Hipertens�o', 'Anti-hipertensivos', 'Nenhuma', 'Treino de resist�ncia', 75, '140/90', 'Nenhuma', NULL

-- Execu��o 4
EXEC SP_CADASTRO_ANAMNESE_ALUNO 'Ana Rodrigues', '1992-03-20', 'F', 1.68, 55.5, 'Melhorar condicionamento f�sico', 1, 'Alergia a frutos do mar', 'Nenhum', 'Nenhuma', 'Yoga regularmente', 60, '110/70', 'Nenhuma', NULL

-- Execu��o 5
EXEC SP_CADASTRO_ANAMNESE_ALUNO 'Ricardo Oliveira', '1980-12-10', 'M', 1.78, 90.0, 'Ganhar massa muscular', 3, 'Nenhuma', 'Nenhum', 'Nenhuma', 'Levantamento de peso', 70, '125/85', 'Nenhuma', NULL

-- Execu��o 6
EXEC SP_CADASTRO_ANAMNESE_ALUNO 'Camila Santos', '1995-06-25', 'F', 1.60, 58.0, 'Manter-se ativa', 2, 'Nenhuma', 'Nenhum', 'Intoler�ncia a lactose', 'Corrida ocasional', 68, '120/75', 'Nenhuma', NULL
*/
GO


	SELECT *FROM TB_ANAMNESE_MEDICA_ALUNO

GO

CREATE PROCEDURE SP_CONSULTA_DADOS_PESSOAIS_ALUNO
AS
BEGIN
	SELECT 
		ID_ALUNO,
		NOME_ALUNO,
		DATA_NASCIMENTO_ALUNO,
		SEXO_ALUNO,
		ALTURA_ALUNO,
		PESO_ALUNO,
		OBJETIVO_ALUNO,
		FOTO_ALUNO
	FROM 
		TB_DADOS_PESSOAIS_ALUNO 
	WHERE 
		FLAG_ATIVO = 1
END

GO

CREATE PROCEDURE SP_CADASTRO_GRUPO_MUSCULAR
	@NOME_GRUPO_MUSCULAR VARCHAR(50)
AS
BEGIN
	INSERT INTO TB_GRUPO_MUSCULAR (NOME_GRUPO_MUSCULAR) 
	VALUES
	(@NOME_GRUPO_MUSCULAR)
END
GO
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'PEITORAL'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'COSTAS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'OMBROS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'TRAP�ZIO'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'ANTEBRA�OS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'B�CEPS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'TR�CEPS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'QUADRICEPS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'POSTERIORES DE COXA'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'PANTURRILHAS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'GL�TEOS'
	EXEC SP_CADASTRO_GRUPO_MUSCULAR 'ABD�MEN'

GO

SELECT *FROM TB_GRUPO_MUSCULAR

GO

/*ALTER PROCEDURE SP_GRAVA_EXERCICIO
	@NOME_EXERCICIO VARCHAR(100),
	@DESCRICAO_EXERCICIO TEXT,
	@GRUPO_MUSCULAR INT
AS
BEGIN

	--IF NOT EXISTS(SELECT 1 FROM TB_EXERCICIO WHERE NOME_EXERCICIO = @NOME_EXERCICIO AND FLAG_ATIVO = 1)
	--BEGIN
		INSERT INTO TB_EXERCICIO (NOME_EXERCICIO, DESCRICAO_EXERCICIO, GRUPO_MUSCULAR) 
		VALUES
		(
			@NOME_EXERCICIO,
			@DESCRICAO_EXERCICIO,
			@GRUPO_MUSCULAR
		)
	--END
	ELSE
	BEGIN
		DECLARE @ID_EXERCICIO INT;
		UPDATE TB_EXERCICIO
		SET
			@ID_EXERCICIO = ID_EXERCICIO,
			NOME_EXERCICIO = @NOME_EXERCICIO,
			DESCRICAO_EXERCICIO = @DESCRICAO_EXERCICIO,
			GRUPO_MUSCULAR = @GRUPO_MUSCULAR
		WHERE
			ID_EXERCICIO = @ID_EXERCICIO
	END
END */

CREATE PROCEDURE SP_GRAVA_EXERCICIO
	@NOME_EXERCICIO VARCHAR(100),
	@DESCRICAO_EXERCICIO TEXT,
	@GRUPO_MUSCULAR INT
AS
BEGIN
		INSERT INTO TB_EXERCICIO (NOME_EXERCICIO, DESCRICAO_EXERCICIO, GRUPO_MUSCULAR) 
		VALUES
		(
			@NOME_EXERCICIO,
			@DESCRICAO_EXERCICIO,
			@GRUPO_MUSCULAR
		)
END

GO
EXEC SP_GRAVA_EXERCICIO 'SUPINO RETO COM BARRA', 'SUPINO NO BANCO RETO COM BARRA', 1
EXEC SP_GRAVA_EXERCICIO 'SUPINO INCLINADO COM HALTERES', 'SUPINO NO BANCO INCLINADO COM HALTERES', 1
EXEC SP_GRAVA_EXERCICIO 'VOADOR INCLINADO COM HALTERES', 'VOADOR NO BANCO INCLINADO COM HALTERES', 1
EXEC SP_GRAVA_EXERCICIO 'CRUCIFIXO RETO', 'CRUCIFIXO NO BANCO RETO COM HALTERES', 1
EXEC SP_GRAVA_EXERCICIO 'REMADA CURVADA', 'REMADA CURVADA COM BARRA RETA', 2
EXEC SP_GRAVA_EXERCICIO 'REMADA SERROTE COM HALTERES', 'REMADA SERROTE COM HALTERES EM P� OU APOIADO NO BANCO', 2
EXEC SP_GRAVA_EXERCICIO 'PULL DOWN', 'PULL DOWN COM PEGADA NEUTRA', 2
EXEC SP_GRAVA_EXERCICIO 'TRICEPS FRANC�S CORDA', 'TRICEPS FRANC�S NO CROSS COM CORDA', 7
EXEC SP_GRAVA_EXERCICIO 'TRICEPS TESTA COM BARRA W', 'TRICEPS TESTA NO BANCO INCLINADO COM BARRA W', 7
EXEC SP_GRAVA_EXERCICIO 'TRICEPS PULLEY', 'TRICEPS NO CROSS COM BARRA RETA E PEGADA PRONADA', 7
EXEC SP_GRAVA_EXERCICIO 'TRICEPS SUPINADO', 'TRICEPS SUPINADO NO BANCO RETO COM BARRA RETA', 7

GO
SELECT *FROM TB_EXERCICIO
GO

CREATE PROCEDURE SP_GRAVA_TREINO
	@ALUNO_TREINO VARCHAR(255),
	@NR_TREINO_ALUNO INT,
	--@DATA_TREINO DATE,
	@FOCO_TREINO TEXT,
	@MODELO_TREINO VARCHAR(255),
	@OBS_TREINO TEXT
AS
BEGIN
	
	INSERT INTO TB_TREINO (ALUNO_TREINO, NR_TREINO_ALUNO, /*DATA_TREINO,*/ FOCO_TREINO, MODELO_TREINO, OBS_TREINO) 
	VALUES
	(
		@ALUNO_TREINO,
		@NR_TREINO_ALUNO,
		--@DATA_TREINO,
		@FOCO_TREINO,
		@MODELO_TREINO,
		@OBS_TREINO
	)

END
GO
EXEC SP_GRAVA_TREINO 'RENAN GUILHERME', 1, /*'2023-12-29 11:00:00',*/ 'HIPERTROFIA', 'ABCD', NULL

GO

CREATE PROCEDURE SP_GRAVA_TREINO_DIA
	@TREINO_TREINO_DIA INT,
	--@DATA_TREINO_DIA DATE,
	@GRUPO_MUSCULAR_TREINO_DIA VARCHAR(255)
AS
BEGIN
	INSERT INTO TB_TREINO_DIA (TREINO_TREINO_DIA, GRUPO_MUSCULAR_TREINO_DIA)
	VALUES
	(
		@TREINO_TREINO_DIA,
		@GRUPO_MUSCULAR_TREINO_DIA
	)
END
GO
EXEC SP_GRAVA_TREINO_DIA 1, 'PEITO E TR�CEPS'

GO

CREATE PROCEDURE SP_GRAVA_EXERCICIO_TREINO
	@TREINO_EXERCICIO_TREINO INT,
	@TREINO_DIA_EXERCICIO_TREINO INT,
	@EXERCICIO_EXERCICIO_TREINO INT,
	@SERIES_EXERCICIO_TREINO INT,
	@REPETICOES_EXERCICIO_TREINO VARCHAR(10),
	@TEMPO_EXERCICIO_TREINO NUMERIC(5,2),
	@CARGA_EXERCICIO_TREINO NUMERIC(5,2),
	@OBS_EXERCICIO_TREINO TEXT
AS
BEGIN
	INSERT INTO  TB_EXERCICIO_TREINO(TREINO_EXERCICIO_TREINO, TREINO_DIA_EXERCICIO_TREINO, EXERCICIO_EXERCICIO_TREINO, 
									SERIES_EXERCICIO_TREINO, REPETICOES_EXERCICIO_TREINO,
									TEMPO_EXERCICIO_TREINO, CARGA_EXERCICIO_TREINO, OBS_EXERCICIO_TREINO)
	VALUES
	(
		@TREINO_EXERCICIO_TREINO,
		@TREINO_DIA_EXERCICIO_TREINO,
		@EXERCICIO_EXERCICIO_TREINO,
		@SERIES_EXERCICIO_TREINO,
		@REPETICOES_EXERCICIO_TREINO,
		@TEMPO_EXERCICIO_TREINO,
		@CARGA_EXERCICIO_TREINO,
		@OBS_EXERCICIO_TREINO
	)
END
GO
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 1, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 2, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 3, 4, '6 ~ 10', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 10, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 9, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 8, 4, '8 ~ 12', NULL, NULL, NULL

GO
SELECT *FROM TB_EXERCICIO_TREINO

GO

/*ALTER PROCEDURE SP_MONTA_TREINO
	@ID_TREINO INT
AS
BEGIN
	IF @ID_TREINO IS NOT NULL
	BEGIN
			SELECT
				EXT.TREINO_EXERCICIO_TREINO AS ID_TREINO,
				/*TRE.ALUNO_TREINO,
				TRE.DATA_TREINO,
				TRE.FOCO_TREINO,
				TRE.OBS_TREINO,*/
				GRM.NOME_GRUPO_MUSCULAR,
				EXE.NOME_EXERCICIO,
				EXE.DESCRICAO_EXERCICIO,
				EXT.SERIES_EXERCICIO_TREINO,
				EXT.REPETICOES_EXERCICIO_TREINO,
				EXT.TEMPO_EXERCICIO_TREINO,
				EXT.CARGA_EXERCICIO_TREINO,
				EXT.OBS_EXERCICIO_TREINO
			FROM
				TB_EXERCICIO_TREINO EXT
			INNER JOIN
				TB_TREINO TRE ON EXT.TREINO_EXERCICIO_TREINO = TRE.ID_TREINO
			INNER JOIN
				TB_EXERCICIO EXE ON EXT.EXERCICIO_EXERCICIO_TREINO = EXE.ID_EXERCICIO
			INNER JOIN
				TB_GRUPO_MUSCULAR GRM ON EXE.GRUPO_MUSCULAR = GRM.ID_GRUPO_MUSCULAR
			WHERE
				EXT.TREINO_EXERCICIO_TREINO = @ID_TREINO
	END
END*/

/*ALTER PROCEDURE SP_MONTA_TREINO
	@ID_TREINO INT
AS
BEGIN
    -- Vari�veis para armazenar informa��es do cabe�alho
    DECLARE @NOME_ALUNO VARCHAR(255);
    DECLARE @DATA_TREINO DATE;
    DECLARE @FOCO_TREINO VARCHAR(255);
    DECLARE @OBS_TREINO VARCHAR(255);

    -- Obter informa��es do cabe�alho do treino
    SELECT
        @NOME_ALUNO = T.ALUNO_TREINO,
        @DATA_TREINO = T.DATA_TREINO,
        @FOCO_TREINO = T.FOCO_TREINO,
        @OBS_TREINO = T.OBS_TREINO
    FROM
        TB_TREINO T
    WHERE
        T.ID_TREINO = @ID_TREINO;

    -- Exibir cabe�alho
    PRINT '----------------------------------------';
    PRINT '              FICHA DE TREINO            ';
    PRINT '----------------------------------------';
    PRINT 'Data: ' + CONVERT(VARCHAR, @DATA_TREINO, 103);
    PRINT 'Aluno: ' + @NOME_ALUNO;
    PRINT 'Foco do Treino: ' + @FOCO_TREINO;
    PRINT 'Observa��es: ' + ISNULL(@OBS_TREINO, '');
    PRINT '----------------------------------------';

    -- Exibir lista de exerc�cios
    PRINT 'EXERC�CIOS:';
    PRINT '----------------------------------------';
    PRINT '   Exerc�cio            S�ries   Repeti��es   Tempo (s)   Carga (kg)   Observa��es';
    PRINT '----------------------------------------';

    -- Vari�veis para armazenar informa��es dos exerc�cios
    DECLARE @NOME_EXERCICIO VARCHAR(100);
    DECLARE @SERIES INT;
    DECLARE @REPETICOES VARCHAR(10);
    DECLARE @TEMPO NUMERIC(5, 2);
    DECLARE @CARGA NUMERIC(5, 2);
    DECLARE @OBS_EXERCICIO_TREINO VARCHAR(255);

    -- Obter informa��es dos exerc�cios do treino
    DECLARE exercicio_cursor CURSOR FOR
    SELECT
        E.NOME_EXERCICIO,
        ET.SERIES_EXERCICIO_TREINO,
        ET.REPETICOES_EXERCICIO_TREINO,
        ET.TEMPO_EXERCICIO_TREINO,
        ET.CARGA_EXERCICIO_TREINO,
        ET.OBS_EXERCICIO_TREINO
    FROM
        TB_EXERCICIO_TREINO ET
    INNER JOIN
        TB_EXERCICIO E ON ET.EXERCICIO_EXERCICIO_TREINO = E.ID_EXERCICIO
    WHERE
        ET.TREINO_EXERCICIO_TREINO = @ID_TREINO;

    OPEN exercicio_cursor;

    FETCH NEXT FROM exercicio_cursor INTO
        @NOME_EXERCICIO,
        @SERIES,
        @REPETICOES,
        @TEMPO,
        @CARGA,
        @OBS_EXERCICIO_TREINO;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT '   ' + @NOME_EXERCICIO + REPLICATE(' ', 23 - LEN(@NOME_EXERCICIO)) +
              CAST(@SERIES AS VARCHAR) + REPLICATE(' ', 8 - LEN(CAST(@SERIES AS VARCHAR))) +
              CAST(@REPETICOES AS VARCHAR) + REPLICATE(' ', 13 - LEN(CAST(@REPETICOES AS VARCHAR))) +
              CAST(ISNULL(@TEMPO, 0) AS VARCHAR) + REPLICATE(' ', 11 - LEN(CAST(ISNULL(@TEMPO, 0) AS VARCHAR))) +
              CAST(ISNULL(@CARGA, 0) AS VARCHAR) + REPLICATE(' ', 14 - LEN(CAST(ISNULL(@CARGA, 0) AS VARCHAR))) +
              ISNULL(@OBS_EXERCICIO_TREINO, '');

        FETCH NEXT FROM exercicio_cursor INTO
            @NOME_EXERCICIO,
            @SERIES,
            @REPETICOES,
            @TEMPO,
            @CARGA,
            @OBS_EXERCICIO_TREINO;
    END;

    CLOSE exercicio_cursor;
    DEALLOCATE exercicio_cursor;

    PRINT '----------------------------------------';
END;

*/

CREATE PROCEDURE SP_GERA_FICHA_TREINO
    @ID_TREINO INT
AS
BEGIN
    DECLARE @GRUPO_MUSCULAR_TREINO_DIA VARCHAR(255),
            @NOME_ALUNO VARCHAR(255),
            @FOCO_TREINO VARCHAR(255),
            @MODELO_TREINO VARCHAR(255);

    -- Obter informa��es do treino do dia
    SELECT @GRUPO_MUSCULAR_TREINO_DIA = GRUPO_MUSCULAR_TREINO_DIA
    FROM TB_TREINO_DIA
    WHERE ID_TREINO_DIA = @ID_TREINO;

    -- Obter informa��es gerais do treino
    SELECT @NOME_ALUNO = ALUNO_TREINO,
           @FOCO_TREINO = FOCO_TREINO,
           @MODELO_TREINO = MODELO_TREINO
    FROM TB_TREINO
    WHERE ID_TREINO = @ID_TREINO;

    -- Imprimir cabe�alho
    PRINT '----------------------------------------------';
    PRINT 'Treino do Dia: ' + CAST(@ID_TREINO AS VARCHAR(10));
    PRINT 'Grupo Muscular do Treino: ' + @GRUPO_MUSCULAR_TREINO_DIA;
    PRINT 'Aluno: ' + @NOME_ALUNO;
    PRINT 'Foco do Treino: ' + @FOCO_TREINO;
    PRINT 'Modelo do Treino: ' + @MODELO_TREINO;
    PRINT '----------------------------------------------';

    -- Listar exerc�cios associados ao treino
    SELECT 
        NOME_EXERCICIO,
        DESCRICAO_EXERCICIO,
        SERIES_EXERCICIO_TREINO,
        REPETICOES_EXERCICIO_TREINO,
        TEMPO_EXERCICIO_TREINO,
        CARGA_EXERCICIO_TREINO,
        OBS_EXERCICIO_TREINO
    FROM TB_EXERCICIO_TREINO et
    INNER JOIN TB_EXERCICIO e ON et.EXERCICIO_EXERCICIO_TREINO = e.ID_EXERCICIO
    WHERE TREINO_DIA_EXERCICIO_TREINO = @ID_TREINO;

END

GO


EXEC SP_GERA_FICHA_TREINO 1

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
EXEC SP_CADASTRO_USUARIO 'PAULO', '123456', 'ASFASGADGDHADAHDH'
GO


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
	IF @ID_ALUNO IS NULL OR NOT EXISTS (SELECT 1 FROM TB_DADOS_PESSOAIS_ALUNO WHERE ID_ALUNO = @ID_ALUNO AND FLAG_ATIVO = 1)
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
EXEC SP_CADASTRO_ALUNO 1, 'Jo�o Silva', '1990-05-15', 'M', 1.80, 75.5, 'Ganhar massa muscular', 3, NULL
EXEC SP_CADASTRO_ALUNO 2, 'Maria Oliveira', '1985-09-20', 'F', 1.65, 60.0, 'Perder peso', 2, NULL
EXEC SP_CADASTRO_ALUNO 3, 'Carlos Santos', '1993-07-10', 'M', 1.75, 70.8, 'Manter forma f�sica', 4, NULL
EXEC SP_CADASTRO_ALUNO 4, 'Ana Souza', '1988-03-25', 'F', 1.70, 68.5, 'Ganhar resist�ncia', 3, NULL
EXEC SP_CADASTRO_ALUNO 5, 'Jos� Lima', '1995-12-15', 'M', 1.82, 78.2, 'Melhorar condicionamento', 5, NULL

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
	IF @ID_ANAMNESE_MEDICA IS NULL OR NOT EXISTS (SELECT 1 FROM TB_ANAMNESE_MEDICA_ALUNO WHERE ID_ANAMNESE_MEDICA = @ID_ANAMNESE_MEDICA AND FLAG_ATIVO = 1)
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

CREATE PROCEDURE SP_CADASTRO_CIRCUNFERENCIAS
    @ALUNO_ID_DIMENSOES_CORPORAIS INT,
    @DATA_MEDICAO_DIMENSOES_CORPORAIS DATE,
    @ALTURA_DIMENSOES_CORPORAIS NUMERIC(5,2),
    @PESO_DIMENSOES_CORPORAIS NUMERIC(5,2),
    @CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS NUMERIC(5,2),
    @CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS NUMERIC(5,2),
    @CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS NUMERIC(5,2),
    @CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS NUMERIC(5,2),
    @CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS NUMERIC(5,2), -- ADICIONANDO CIRCUNFER�NCIA ABDOMINAL
	@CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@OUTRAS_MEDICOES_DIMENSOES_CORPORAIS TEXT

AS
BEGIN
	INSERT INTO TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS
	(
		ALUNO_ID_DIMENSOES_CORPORAIS,
		DATA_MEDICAO_DIMENSOES_CORPORAIS,
		ALTURA_DIMENSOES_CORPORAIS,
		PESO_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS,
		OUTRAS_MEDICOES_DIMENSOES_CORPORAIS
	)
	VALUES
	(
		@ALUNO_ID_DIMENSOES_CORPORAIS,
		@DATA_MEDICAO_DIMENSOES_CORPORAIS,
		@ALTURA_DIMENSOES_CORPORAIS,
		@PESO_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS,
		@CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS,
		@OUTRAS_MEDICOES_DIMENSOES_CORPORAIS
	)
END

GO

CREATE PROCEDURE SP_CADASTRO_DOBRAS_CULTANEAS
	@ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS INT,
    @DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS DATE,
	@DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	@OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS TEXT
AS
BEGIN
	INSERT INTO TB_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS
	(
		ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS 
	)
	VALUES
	(
		@ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		@OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS 
	)
END

GO

CREATE PROCEDURE SP_EXCLUI_FICHA_ALUNO
	@ID_ANAMNESE_MEDICA INT,
	@ID_DIMENSOES_CORPORAIS INT,
	@ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS INT
AS
BEGIN
	IF @ID_ANAMNESE_MEDICA IS NOT NULL
	BEGIN
		UPDATE TB_ANAMNESE_MEDICA_ALUNO
		SET FLAG_ATIVO = 0
		WHERE ID_ANAMNESE_MEDICA = @ID_ANAMNESE_MEDICA AND FLAG_ATIVO = 1
	END

	IF @ID_DIMENSOES_CORPORAIS IS NOT NULL
	BEGIN
		UPDATE TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS
		SET FLAG_ATIVO = 0
		WHERE ID_DIMENSOES_CORPORAIS = @ID_DIMENSOES_CORPORAIS AND FLAG_ATIVO = 1
	END

	IF @ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS IS NOT NULL
	BEGIN
		UPDATE TB_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS
		SET FLAG_ATIVO = 0
		WHERE ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS = @ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS AND FLAG_ATIVO = 1
	END
END

GO

CREATE PROCEDURE SP_SITUACAO_ALUNO
	@ID_ALUNO INT,
	@FLAG_ATIVO BIT
AS
BEGIN
	IF @FLAG_ATIVO = 1
	BEGIN
		UPDATE TB_DADOS_PESSOAIS_ALUNO
		SET 
			FLAG_ATIVO = 0
		WHERE
			ID_ALUNO = @ID_ALUNO AND FLAG_ATIVO = 1
	END

	IF @FLAG_ATIVO = 0
	BEGIN
		UPDATE TB_DADOS_PESSOAIS_ALUNO
		SET 
			FLAG_ATIVO = 1
		WHERE
			ID_ALUNO = @ID_ALUNO AND FLAG_ATIVO = 0
	END
END

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

CREATE PROCEDURE SP_CONSULTA_COMPLETA_ALUNO
    @ID_ALUNO INT
AS
BEGIN
	DECLARE @ID_ALUNO_RETORNO INT

    SELECT 
		A.ID_ALUNO,
		NOME_ALUNO,
		DATA_NASCIMENTO_ALUNO,
		SEXO_ALUNO,
		ALTURA_ALUNO,
		PESO_ALUNO,
		OBJETIVO_ALUNO,
		NIVEL_ATIVIDADE_ALUNO,
		FOTO_ALUNO,
		A.DATA_INCLUSAO,
		A.FLAG_ATIVO,
		ID_ANAMNESE_MEDICA,
		CONDICOES_MEDICAS_ALUNO,
		MEDICAMENTOS_ALUNO,
		RESTRICOES_ALIMENTARES_ALUNO,
		HISTORICO_EXERCICIOS_ALUNO,
		FREQUENCIA_CARDIACA_REPOUSO_ALUNO,
		PRESSAO_ARTERIAL_ALUNO,
		OUTRAS_OBSERVACOES_ALUNO,
		ID_DIMENSOES_CORPORAIS,
		DATA_MEDICAO_DIMENSOES_CORPORAIS,
		ALTURA_DIMENSOES_CORPORAIS,
		PESO_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS,
		CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS,
		OUTRAS_MEDICOES_DIMENSOES_CORPORAIS,
		ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,
		OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS

    FROM TB_DADOS_PESSOAIS_ALUNO AS A
    INNER JOIN TB_ANAMNESE_MEDICA_ALUNO AS B ON A.ID_ALUNO = B.ID_ALUNO
    INNER JOIN TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS AS C ON A.ID_ALUNO = C.ALUNO_ID_DIMENSOES_CORPORAIS
    INNER JOIN TB_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS AS D ON A.ID_ALUNO = D.ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS
    WHERE A.ID_ALUNO = @ID_ALUNO
      AND C.DATA_INCLUSAO = (SELECT MIN(DATA_INCLUSAO) FROM TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS WHERE ALUNO_ID_DIMENSOES_CORPORAIS = @ID_ALUNO)
      AND D.DATA_INCLUSAO = (SELECT MIN(DATA_INCLUSAO) FROM TB_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS WHERE ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS = @ID_ALUNO)
    ORDER BY C.DATA_INCLUSAO

    -- Armazenar o ID do aluno de sa�da
    SET @ID_ALUNO_RETORNO = @ID_ALUNO

	RETURN @ID_ALUNO_RETORNO

END

GO

-- Agora, @ID_ALUNO_RETORNO_PROC conter� o ID do aluno retornado pelo procedimento.

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

CREATE PROCEDURE SP_ALTERA_EXERCICIO
	@ID_EXERCICIO INT,
	@NOME_EXERCICIO VARCHAR(100),
	@DESCRICAO_EXERCICIO TEXT,
	@GRUPO_MUSCULAR INT
AS
BEGIN
		UPDATE 
			TB_EXERCICIO
		SET
			NOME_EXERCICIO = @NOME_EXERCICIO,
			DESCRICAO_EXERCICIO = @DESCRICAO_EXERCICIO,
			GRUPO_MUSCULAR = @GRUPO_MUSCULAR
		WHERE
			ID_EXERCICIO = @ID_EXERCICIO AND FLAG_ATIVO = 1
END

GO

CREATE PROCEDURE SP_EXCLUI_EXERCICIO
	@ID_EXERCICIO INT
AS
BEGIN
	UPDATE 
		TB_EXERCICIO
	SET
		FLAG_ATIVO = 0
	WHERE 
		ID_EXERCICIO = @ID_EXERCICIO AND FLAG_ATIVO = 1
END

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

	DECLARE @ID_TREINO INT;
	SET @ID_TREINO = (SELECT SCOPE_IDENTITY());
	RETURN @ID_TREINO

END

GO

--EXEC SP_GRAVA_TREINO 'RENAN GUILHERME', 1, /*'2023-12-29 11:00:00',*/ 'HIPERTROFIA', 'ABCD', NULL

--GO

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

	DECLARE @TREINO INT;
	SET @TREINO = (SELECT SCOPE_IDENTITY());
	RETURN @TREINO
END

GO

CREATE PROCEDURE SP_ESPECIFICA_TREINO_DIA
	--@TREINO_TREINO_DIA INT,
	--@DATA_TREINO_DIA DATE,
	@ID_TREINO_DIA INT,
	@GRUPO_MUSCULAR_TREINO_DIA VARCHAR(255)
AS
BEGIN
	UPDATE TB_TREINO_DIA 
	SET 
		GRUPO_MUSCULAR_TREINO_DIA = @GRUPO_MUSCULAR_TREINO_DIA
	WHERE 
		ID_TREINO_DIA = @ID_TREINO_DIA
END

GO
--EXEC SP_GRAVA_TREINO_DIA 1, 'PEITO E TR�CEPS'

--GO

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
/*
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 1, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 2, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 3, 4, '6 ~ 10', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 10, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 9, 4, '8 ~ 12', NULL, NULL, NULL
EXEC SP_GRAVA_EXERCICIO_TREINO 1, 1, 8, 4, '8 ~ 12', NULL, NULL, NULL

GO
*/
SELECT *FROM TB_EXERCICIO_TREINO

GO

CREATE PROCEDURE SP_EXCLUI_TREINO
		@ID_TREINO INT
AS
BEGIN
	DELETE 
		TB_TREINO
	WHERE 
		ID_TREINO = @ID_TREINO
END
exec SP_EXCLUI_TREINO 1

select *from tb_treino
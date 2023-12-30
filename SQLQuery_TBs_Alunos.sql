/*create database so_treinos
use so_treinos
*/
-- DROP DATABASE SO_TREINOS


-- Criação da Tabela AnamneseAluno
CREATE TABLE TB_DADOS_PESSOAIS_ALUNO 
(
    ID_ALUNO INT IDENTITY PRIMARY KEY NOT NULL,
    NOME_ALUNO VARCHAR(255) NOT NULL,
    DATA_NASCIMENTO_ALUNO DATE NOT NULL,
    SEXO_ALUNO CHAR(1),
    ALTURA_ALUNO NUMERIC(5, 2),
    PESO_ALUNO NUMERIC(5, 2),
    OBJETIVO_ALUNO VARCHAR(255),
    NIVEL_ATIVIDADE_ALUNO INT,
    FOTO_ALUNO VARBINARY(MAX),
    DATA_INCLUSAO DATETIME,
    FLAG_ATIVO BIT
)

GO

CREATE TABLE TB_ANAMNESE_MEDICA_ALUNO 
(
    ID_ANAMNESE_MEDICA INT IDENTITY PRIMARY KEY NOT NULL,
    ID_ALUNO INT FOREIGN KEY REFERENCES TB_DADOS_PESSOAIS_ALUNO(ID_ALUNO),
    CONDICOES_MEDICAS_ALUNO TEXT,
    MEDICAMENTOS_ALUNO TEXT,
    RESTRICOES_ALIMENTARES_ALUNO TEXT,
    HISTORICO_EXERCICIOS_ALUNO TEXT,
    FREQUENCIA_CARDIACA_REPOUSO_ALUNO INT,
    PRESSAO_ARTERIAL_ALUNO VARCHAR(20),
    OUTRAS_OBSERVACOES_ALUNO TEXT,
    DATA_INCLUSAO DATETIME,
    FLAG_ATIVO BIT
)

GO

-- Tabela DIMENSOESCORPORAIS
CREATE TABLE TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS 
(
    ID_DIMENSOES_CORPORAIS INT PRIMARY KEY,
    ALUNO_ID_DIMENSOES_CORPORAIS INT FOREIGN KEY REFERENCES TB_DADOS_PESSOAIS_ALUNO(ID_ALUNO),
    DATA_MEDICAO_DIMENSOES_CORPORAIS DATE,
    ALTURA_DIMENSOES_CORPORAIS NUMERIC(5,2),
    PESO_DIMENSOES_CORPORAIS NUMERIC(5,2),
    CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS NUMERIC(5,2),
    CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS NUMERIC(5,2),
    CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS NUMERIC(5,2),
    CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS NUMERIC(5,2),
	CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS NUMERIC(5,2),
	CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS NUMERIC(5,2),
    CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS NUMERIC(5,2), -- Adicionando Circunferência Abdominal
	CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS NUMERIC(5,2),
	CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS NUMERIC(5,2),
	CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS NUMERIC(5,2),
	OUTRAS_MEDICOES_DIMENSOES_CORPORAIS TEXT,
	DATA_INCLUSAO DATETIME,
	FLAG_ATIVO BIT
)

GO

CREATE TABLE DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS
(
	ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS INT PRIMARY KEY,
    ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS INT FOREIGN KEY REFERENCES TB_DADOS_PESSOAIS_ALUNO(ID_ALUNO),
    DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS DATE,
	DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS NUMERIC(5,2),
	OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS TEXT,
	DATA_INCLUSAO DATETIME,
	FLAG_ATIVO BIT
)

GO
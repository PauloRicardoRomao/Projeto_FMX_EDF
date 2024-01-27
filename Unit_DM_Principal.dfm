object dm_principal: Tdm_principal
  Height = 584
  Width = 1364
  object ado_connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SO_TREINOS;Data Source=LAPTOP-FCR3HP98\' +
      'SQLEXPRESS'
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 224
  end
  object ado_proc_cad_aluno_info_basic: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CADASTRO_ALUNO;1'
    Parameters = <>
    Left = 184
    Top = 32
  end
  object ado_proc_cad_aluno_anamnese: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CADASTRO_ANAMNESE_ALUNO;1'
    Parameters = <>
    Left = 392
    Top = 32
  end
  object ado_proc_cad_aluno_info_circ: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CADASTRO_CIRCUNFERENCIAS;1'
    Parameters = <>
    Left = 600
    Top = 32
  end
  object ado_proc_cad_aluno_db_cut_corp: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CADASTRO_DOBRAS_CULTANEAS;1'
    Parameters = <>
    Left = 800
    Top = 32
  end
  object ado_proc_consulta_alunos: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CONSULTA_DADOS_PESSOAIS_ALUNO'
    Parameters = <>
    Left = 184
    Top = 152
  end
  object ado_proc_consulta_completa_alunos: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CONSULTA_COMPLETA_ALUNO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 384
    Top = 152
  end
  object ado_query_consulta_completa_aluno: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'DECLARE @ID_ALUNO INT'
      'SELECT'
      #9#9'A.ID_ALUNO,'
      #9#9'NOME_ALUNO,'
      #9#9'DATA_NASCIMENTO_ALUNO,'
      #9#9'SEXO_ALUNO,'
      #9#9'ALTURA_ALUNO,'
      #9#9'PESO_ALUNO,'
      #9#9'OBJETIVO_ALUNO,'
      #9#9'NIVEL_ATIVIDADE_ALUNO,'
      #9#9'FOTO_ALUNO,'
      #9#9'A.DATA_INCLUSAO,'
      #9#9'A.FLAG_ATIVO,'
      #9#9'ID_ANAMNESE_MEDICA,'
      #9#9'CONDICOES_MEDICAS_ALUNO,'
      #9#9'MEDICAMENTOS_ALUNO,'
      #9#9'RESTRICOES_ALIMENTARES_ALUNO,'
      #9#9'HISTORICO_EXERCICIOS_ALUNO,'
      #9#9'FREQUENCIA_CARDIACA_REPOUSO_ALUNO,'
      #9#9'PRESSAO_ARTERIAL_ALUNO,'
      #9#9'OUTRAS_OBSERVACOES_ALUNO,'
      #9#9'ID_DIMENSOES_CORPORAIS,'
      #9#9'DATA_MEDICAO_DIMENSOES_CORPORAIS,'
      #9#9'ALTURA_DIMENSOES_CORPORAIS,'
      #9#9'PESO_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS,'
      #9#9'OUTRAS_MEDICOES_DIMENSOES_CORPORAIS,'
      #9#9'ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      ''
      '    FROM TB_DADOS_PESSOAIS_ALUNO AS A'
      
        '    INNER JOIN TB_ANAMNESE_MEDICA_ALUNO AS B ON A.ID_ALUNO = B.I' +
        'D_ALUNO'
      
        '    INNER JOIN TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS AS C ON A.' +
        'ID_ALUNO = C.ALUNO_ID_DIMENSOES_CORPORAIS'
      
        '    INNER JOIN TB_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS AS D ON A' +
        '.ID_ALUNO = D.ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      '    WHERE A.ID_ALUNO = :ID_ALUNO'
      
        '      AND C.DATA_INCLUSAO = (SELECT MIN(DATA_INCLUSAO) FROM TB_C' +
        'IRCUNFERENCIAS_DIMENSOES_CORPORAIS WHERE ALUNO_ID_DIMENSOES_CORP' +
        'ORAIS = @ID_ALUNO)'
      
        '      AND D.DATA_INCLUSAO = (SELECT MIN(DATA_INCLUSAO) FROM TB_D' +
        'OBRAS_CULTANEAS_DIMENSOES_CORPORAIS WHERE ALUNO_ID_DOBRAS_CULTAN' +
        'EAS_DIMENSOES_CORPORAIS = @ID_ALUNO)'
      '    ORDER BY C.DATA_INCLUSAO')
    Left = 152
    Top = 440
    object ado_query_consulta_completa_alunoID_ALUNO: TAutoIncField
      FieldName = 'ID_ALUNO'
      ReadOnly = True
    end
    object ado_query_consulta_completa_alunoNOME_ALUNO: TStringField
      FieldName = 'NOME_ALUNO'
      Size = 255
    end
    object ado_query_consulta_completa_alunoDATA_NASCIMENTO_ALUNO: TWideStringField
      FieldName = 'DATA_NASCIMENTO_ALUNO'
      Size = 10
    end
    object ado_query_consulta_completa_alunoSEXO_ALUNO: TStringField
      FieldName = 'SEXO_ALUNO'
      FixedChar = True
      Size = 1
    end
    object ado_query_consulta_completa_alunoALTURA_ALUNO: TBCDField
      FieldName = 'ALTURA_ALUNO'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoPESO_ALUNO: TBCDField
      FieldName = 'PESO_ALUNO'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoOBJETIVO_ALUNO: TStringField
      FieldName = 'OBJETIVO_ALUNO'
      Size = 255
    end
    object ado_query_consulta_completa_alunoNIVEL_ATIVIDADE_ALUNO: TIntegerField
      FieldName = 'NIVEL_ATIVIDADE_ALUNO'
    end
    object ado_query_consulta_completa_alunoFOTO_ALUNO: TBlobField
      FieldName = 'FOTO_ALUNO'
    end
    object ado_query_consulta_completa_alunoDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object ado_query_consulta_completa_alunoFLAG_ATIVO: TBooleanField
      FieldName = 'FLAG_ATIVO'
    end
    object ado_query_consulta_completa_alunoID_ANAMNESE_MEDICA: TAutoIncField
      FieldName = 'ID_ANAMNESE_MEDICA'
      ReadOnly = True
    end
    object ado_query_consulta_completa_alunoCONDICOES_MEDICAS_ALUNO: TMemoField
      FieldName = 'CONDICOES_MEDICAS_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_completa_alunoMEDICAMENTOS_ALUNO: TMemoField
      FieldName = 'MEDICAMENTOS_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_completa_alunoRESTRICOES_ALIMENTARES_ALUNO: TMemoField
      FieldName = 'RESTRICOES_ALIMENTARES_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_completa_alunoHISTORICO_EXERCICIOS_ALUNO: TMemoField
      FieldName = 'HISTORICO_EXERCICIOS_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_completa_alunoFREQUENCIA_CARDIACA_REPOUSO_ALUNO: TIntegerField
      FieldName = 'FREQUENCIA_CARDIACA_REPOUSO_ALUNO'
    end
    object ado_query_consulta_completa_alunoPRESSAO_ARTERIAL_ALUNO: TStringField
      FieldName = 'PRESSAO_ARTERIAL_ALUNO'
    end
    object ado_query_consulta_completa_alunoOUTRAS_OBSERVACOES_ALUNO: TMemoField
      FieldName = 'OUTRAS_OBSERVACOES_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_completa_alunoID_DIMENSOES_CORPORAIS: TIntegerField
      FieldName = 'ID_DIMENSOES_CORPORAIS'
    end
    object ado_query_consulta_completa_alunoDATA_MEDICAO_DIMENSOES_CORPORAIS: TWideStringField
      FieldName = 'DATA_MEDICAO_DIMENSOES_CORPORAIS'
      Size = 10
    end
    object ado_query_consulta_completa_alunoALTURA_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'ALTURA_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoPESO_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'PESO_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoCIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoOUTRAS_MEDICOES_DIMENSOES_CORPORAIS: TMemoField
      FieldName = 'OUTRAS_MEDICOES_DIMENSOES_CORPORAIS'
      BlobType = ftMemo
    end
    object ado_query_consulta_completa_alunoID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TIntegerField
      FieldName = 'ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
    end
    object ado_query_consulta_completa_alunoDATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TWideStringField
      FieldName = 'DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Size = 10
    end
    object ado_query_consulta_completa_alunoDOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoDOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoDOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoDOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoDOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoDOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoDOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_completa_alunoOUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TMemoField
      FieldName = 'OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      BlobType = ftMemo
    end
  end
  object ado_query_consulta_aluno: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      #9#9'ID_ALUNO,'
      #9#9'NOME_ALUNO,'
      #9#9'DATA_NASCIMENTO_ALUNO,'
      #9#9'SEXO_ALUNO,'
      #9#9'ALTURA_ALUNO,'
      #9#9'PESO_ALUNO,'
      #9#9'OBJETIVO_ALUNO,'
      '    NIVEL_ATIVIDADE_ALUNO,'
      #9#9'FOTO_ALUNO'
      #9'FROM'
      #9#9'TB_DADOS_PESSOAIS_ALUNO'
      #9'WHERE'
      '    ID_ALUNO = :ID_ALUNO AND'
      #9#9'FLAG_ATIVO = 1')
    Left = 336
    Top = 440
    object ado_query_consulta_alunoID_ALUNO: TAutoIncField
      FieldName = 'ID_ALUNO'
      ReadOnly = True
    end
    object ado_query_consulta_alunoNOME_ALUNO: TStringField
      FieldName = 'NOME_ALUNO'
      Size = 255
    end
    object ado_query_consulta_alunoDATA_NASCIMENTO_ALUNO: TWideStringField
      FieldName = 'DATA_NASCIMENTO_ALUNO'
      Size = 10
    end
    object ado_query_consulta_alunoSEXO_ALUNO: TStringField
      FieldName = 'SEXO_ALUNO'
      FixedChar = True
      Size = 1
    end
    object ado_query_consulta_alunoALTURA_ALUNO: TBCDField
      FieldName = 'ALTURA_ALUNO'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_alunoPESO_ALUNO: TBCDField
      FieldName = 'PESO_ALUNO'
      Precision = 5
      Size = 2
    end
    object ado_query_consulta_alunoOBJETIVO_ALUNO: TStringField
      FieldName = 'OBJETIVO_ALUNO'
      Size = 255
    end
    object ado_query_consulta_alunoNIVEL_ATIVIDADE_ALUNO: TIntegerField
      FieldName = 'NIVEL_ATIVIDADE_ALUNO'
    end
    object ado_query_consulta_alunoFOTO_ALUNO: TBlobField
      FieldName = 'FOTO_ALUNO'
    end
  end
  object ado_query_consulta_anamnese: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    TOP 1'
      '    ID_ANAMNESE_MEDICA,'
      #9#9'CONDICOES_MEDICAS_ALUNO,'
      #9#9'MEDICAMENTOS_ALUNO,'
      #9#9'RESTRICOES_ALIMENTARES_ALUNO,'
      #9#9'HISTORICO_EXERCICIOS_ALUNO,'
      #9#9'FREQUENCIA_CARDIACA_REPOUSO_ALUNO,'
      #9#9'PRESSAO_ARTERIAL_ALUNO,'
      #9#9'OUTRAS_OBSERVACOES_ALUNO'
      #9'FROM'
      #9#9'TB_ANAMNESE_MEDICA_ALUNO'
      #9'WHERE'
      '    ID_ALUNO = :ID_ALUNO AND'
      #9#9'FLAG_ATIVO = 1'
      '  ORDER BY DATA_INCLUSAO ASC')
    Left = 512
    Top = 440
    object ado_query_consulta_anamneseID_ANAMNESE_MEDICA: TAutoIncField
      FieldName = 'ID_ANAMNESE_MEDICA'
      ReadOnly = True
    end
    object ado_query_consulta_anamneseCONDICOES_MEDICAS_ALUNO: TMemoField
      FieldName = 'CONDICOES_MEDICAS_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_anamneseMEDICAMENTOS_ALUNO: TMemoField
      FieldName = 'MEDICAMENTOS_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_anamneseRESTRICOES_ALIMENTARES_ALUNO: TMemoField
      FieldName = 'RESTRICOES_ALIMENTARES_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_anamneseHISTORICO_EXERCICIOS_ALUNO: TMemoField
      FieldName = 'HISTORICO_EXERCICIOS_ALUNO'
      BlobType = ftMemo
    end
    object ado_query_consulta_anamneseFREQUENCIA_CARDIACA_REPOUSO_ALUNO: TIntegerField
      FieldName = 'FREQUENCIA_CARDIACA_REPOUSO_ALUNO'
    end
    object ado_query_consulta_anamnesePRESSAO_ARTERIAL_ALUNO: TStringField
      FieldName = 'PRESSAO_ARTERIAL_ALUNO'
    end
    object ado_query_consulta_anamneseOUTRAS_OBSERVACOES_ALUNO: TMemoField
      FieldName = 'OUTRAS_OBSERVACOES_ALUNO'
      BlobType = ftMemo
    end
  end
  object ado_query_dim_circunferencias: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    TOP 1'
      '    ID_DIMENSOES_CORPORAIS,'
      #9#9'DATA_MEDICAO_DIMENSOES_CORPORAIS,'
      #9#9'ALTURA_DIMENSOES_CORPORAIS,'
      #9#9'PESO_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS,'
      #9#9'CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS,'
      #9#9'OUTRAS_MEDICOES_DIMENSOES_CORPORAIS'
      #9'FROM'
      #9#9'TB_CIRCUNFERENCIAS_DIMENSOES_CORPORAIS'
      #9'WHERE'
      '    ALUNO_ID_DIMENSOES_CORPORAIS = :ID_ALUNO AND'
      #9#9'FLAG_ATIVO = 1'
      '  ORDER BY DATA_INCLUSAO ASC')
    Left = 688
    Top = 440
    object ado_query_dim_circunferenciasID_DIMENSOES_CORPORAIS: TIntegerField
      FieldName = 'ID_DIMENSOES_CORPORAIS'
    end
    object ado_query_dim_circunferenciasDATA_MEDICAO_DIMENSOES_CORPORAIS: TWideStringField
      FieldName = 'DATA_MEDICAO_DIMENSOES_CORPORAIS'
      Size = 10
    end
    object ado_query_dim_circunferenciasALTURA_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'ALTURA_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasPESO_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'PESO_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasCIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'CIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_circunferenciasOUTRAS_MEDICOES_DIMENSOES_CORPORAIS: TMemoField
      FieldName = 'OUTRAS_MEDICOES_DIMENSOES_CORPORAIS'
      BlobType = ftMemo
    end
  end
  object ado_query_dim_dobras: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    TOP 1'
      '    ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS,'
      #9#9'OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      #9'FROM'
      #9#9'TB_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      #9'WHERE'
      
        '    ALUNO_ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS = :ID_ALUNO AN' +
        'D'
      #9#9'FLAG_ATIVO = 1'
      '  ORDER BY DATA_INCLUSAO ASC')
    Left = 848
    Top = 440
    object ado_query_dim_dobrasID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TIntegerField
      FieldName = 'ID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
    end
    object ado_query_dim_dobrasDATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TWideStringField
      FieldName = 'DATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Size = 10
    end
    object ado_query_dim_dobrasDOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasDOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasDOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasDOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasDOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasDOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasDOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField
      FieldName = 'DOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      Precision = 5
      Size = 2
    end
    object ado_query_dim_dobrasOUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TMemoField
      FieldName = 'OUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS'
      BlobType = ftMemo
    end
  end
  object ado_proc_cad_exercicio: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_GRAVA_EXERCICIO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NOME_EXERCICIO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@DESCRICAO_EXERCICIO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@GRUPO_MUSCULAR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 616
    Top = 152
  end
  object ado_query_login: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NOME_USUARIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 200
        Value = Null
      end
      item
        Name = 'SENHA_USUARIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '    ID_USUARIO, NOME_USUARIO, SENHA_USUARIO, CHAVE_USUARIO'
      'FROM'
      '  TB_USUARIO'
      'WHERE'
      '  NOME_USUARIO = :NOME_USUARIO AND'
      '  SENHA_USUARIO = :SENHA_USUARIO AND'
      '  FLAG_ATIVO = 1')
    Left = 152
    Top = 352
    object ado_query_loginID_USUARIO: TAutoIncField
      FieldName = 'ID_USUARIO'
      ReadOnly = True
    end
    object ado_query_loginNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Size = 200
    end
    object ado_query_loginSENHA_USUARIO: TStringField
      FieldName = 'SENHA_USUARIO'
    end
    object ado_query_loginCHAVE_USUARIO: TStringField
      FieldName = 'CHAVE_USUARIO'
      Size = 200
    end
  end
  object ado_proc_cad_usuario: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CADASTRO_USUARIO;1'
    Parameters = <>
    Left = 152
    Top = 288
  end
  object ado_query_consulta_agendamentos: TADOQuery
    Active = True
    Connection = ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DATA_CONSULTA_AGENDAMENTO'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '    A.ID_AGENDAMENTO,'
      '    A.ID_ALUNO,'
      '    DPA.NOME_ALUNO,'
      '    A.DATA_HORA_CONSULTA_AGENDAMENTO,'
      '    A.OBS_CONSULTA_AGENDAMENTO'
      'FROM'
      '    TB_AGENDAMENTOS A'
      'INNER JOIN'
      '    TB_DADOS_PESSOAIS_ALUNO DPA ON A.ID_ALUNO = DPA.ID_ALUNO'
      
        'WHERE A.DATA_HORA_CONSULTA_AGENDAMENTO = :DATA_CONSULTA_AGENDAME' +
        'NTO')
    Left = 1056
    Top = 440
    object ado_query_consulta_agendamentosID_AGENDAMENTO: TAutoIncField
      FieldName = 'ID_AGENDAMENTO'
      ReadOnly = True
    end
    object ado_query_consulta_agendamentosNOME_ALUNO: TStringField
      FieldName = 'NOME_ALUNO'
      Size = 255
    end
    object ado_query_consulta_agendamentosDATA_HORA_CONSULTA_AGENDAMENTO: TDateTimeField
      FieldName = 'DATA_HORA_CONSULTA_AGENDAMENTO'
    end
    object ado_query_consulta_agendamentosOBS_CONSULTA_AGENDAMENTO: TMemoField
      FieldName = 'OBS_CONSULTA_AGENDAMENTO'
      BlobType = ftMemo
    end
    object ado_query_consulta_agendamentosID_ALUNO: TIntegerField
      FieldName = 'ID_ALUNO'
    end
  end
  object dt_consulta_agendamentos: TDataSource
    DataSet = ado_query_consulta_agendamentos
    Left = 1056
    Top = 512
  end
  object ado_proc_cad_agendamento: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_GRAVA_AGENDAMENTO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DATA_HORA_CONSULTA_AGENDAMENTO'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DATA_HORA_REALIZA_AGENDAMENTO'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@OBS_CONSULTA_AGENDAMENTO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end>
    Left = 368
    Top = 288
  end
  object ado_proc_grava_consulta: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_GRAVA_CONSULTA;1'
    Parameters = <>
    Left = 664
    Top = 280
  end
end

object dm_principal: Tdm_principal
  Height = 480
  Width = 937
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
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@ID_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@NOME_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@DATA_NASCIMENTO_ALUNO'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
      end
      item
        Name = '@SEXO_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
      end
      item
        Name = '@ALTURA_ALUNO'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 5
      end
      item
        Name = '@PESO_ALUNO'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 5
      end
      item
        Name = '@OBJETIVO_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@NIVEL_ATIVIDADE_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@FOTO_ALUNO'
        Attributes = [paNullable]
        DataType = ftVarBytes
        Size = 2147483647
      end>
    Left = 176
    Top = 136
  end
  object ado_proc_cad_aluno_anamnese: TADOStoredProc
    Connection = ado_connection
    ProcedureName = 'SP_CADASTRO_ANAMNESE_ALUNO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@ID_ANAMNESE_MEDICA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@ID_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@CONDICOES_MEDICAS_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
      end
      item
        Name = '@MEDICAMENTOS_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
      end
      item
        Name = '@RESTRICOES_ALIMENTARES_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
      end
      item
        Name = '@HISTORICO_EXERCICIOS_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
      end
      item
        Name = '@FREQUENCIA_CARDIACA_REPOUSO_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@PRESSAO_ARTERIAL_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
      end
      item
        Name = '@OUTRAS_OBSERVACOES_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
      end>
    Left = 384
    Top = 136
  end
  object ado_proc_cad_aluno_info_circ: TADOStoredProc
    Connection = ado_connection
    Parameters = <>
    Left = 584
    Top = 136
  end
  object ado_proc_cad_aluno_dim_corp: TADOStoredProc
    Connection = ado_connection
    Parameters = <>
    Left = 784
    Top = 136
  end
end

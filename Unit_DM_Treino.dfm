object dm_treino: Tdm_treino
  Height = 480
  Width = 1015
  object ado_proc_cad_info_basic_treino: TADOStoredProc
    Connection = dm_principal.ado_connection
    ProcedureName = 'SP_GRAVA_TREINO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ALUNO_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@NR_TREINO_ALUNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@FOCO_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@MODELO_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@OBS_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
        Value = Null
      end>
    Left = 128
    Top = 128
  end
  object ado_query_consulta_nr_treinos: TADOQuery
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      '  MAX(NR_TREINO_ALUNO) + 1 AS PROXIMO_NR_TREINO'
      'FROM'
      '  TB_TREINO'
      'WHERE'
      '  ALUNO_TREINO = :ID_ALUNO AND FLAG_ATIVO = 1')
    Left = 64
    Top = 312
    object ado_query_consulta_nr_treinosPROXIMO_NR_TREINO: TIntegerField
      FieldName = 'PROXIMO_NR_TREINO'
      ReadOnly = True
    end
  end
  object ado_query_verifica_ficha_treino_dia: TADOQuery
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TREINO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    ID_TREINO_DIA,'
      '    TD.GRUPO_MUSCULAR_TREINO_DIA,'
      '    TD.DATA_INCLUSAO_TREINO_DIA'
      'FROM'
      '    TB_TREINO T'
      'INNER JOIN'
      '    TB_TREINO_DIA TD ON T.ID_TREINO = TD.TREINO_TREINO_DIA'
      'WHERE'
      '    T.ID_TREINO = :ID_TREINO'
      '    AND T.FLAG_ATIVO = 1'
      '    AND TD.FLAG_ATIVO = 1;'
      '')
    Left = 264
    Top = 312
    object ado_query_verifica_ficha_treino_diaID_TREINO_DIA: TAutoIncField
      FieldName = 'ID_TREINO_DIA'
      ReadOnly = True
    end
    object ado_query_verifica_ficha_treino_diaGRUPO_MUSCULAR_TREINO_DIA: TStringField
      FieldName = 'GRUPO_MUSCULAR_TREINO_DIA'
      Size = 255
    end
    object ado_query_verifica_ficha_treino_diaDATA_INCLUSAO_TREINO_DIA: TDateTimeField
      FieldName = 'DATA_INCLUSAO_TREINO_DIA'
    end
  end
  object ado_proc_exclui_treino: TADOStoredProc
    Connection = dm_principal.ado_connection
    ProcedureName = 'SP_EXCLUI_TREINO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TREINO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 304
    Top = 128
  end
  object ado_query_hist_treinos: TADOQuery
    Active = True
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_ALUNO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  ID_TREINO,'
      #9'ALUNO_TREINO,'
      #9'NR_TREINO_ALUNO,'
      #9'FOCO_TREINO,'
      #9'MODELO_TREINO,'
      #9'OBS_TREINO,'
      #9'DATA_INCLUSAO_TREINO'
      'FROM'
      '  TB_TREINO'
      'WHERE'
      '  ALUNO_TREINO = :ID_ALUNO')
    Left = 448
    Top = 312
    object ado_query_hist_treinosID_TREINO: TAutoIncField
      FieldName = 'ID_TREINO'
      ReadOnly = True
    end
    object ado_query_hist_treinosALUNO_TREINO: TStringField
      FieldName = 'ALUNO_TREINO'
      Size = 255
    end
    object ado_query_hist_treinosNR_TREINO_ALUNO: TIntegerField
      FieldName = 'NR_TREINO_ALUNO'
    end
    object ado_query_hist_treinosFOCO_TREINO: TMemoField
      FieldName = 'FOCO_TREINO'
      BlobType = ftMemo
    end
    object ado_query_hist_treinosMODELO_TREINO: TStringField
      FieldName = 'MODELO_TREINO'
      Size = 255
    end
    object ado_query_hist_treinosOBS_TREINO: TMemoField
      FieldName = 'OBS_TREINO'
      BlobType = ftMemo
    end
    object ado_query_hist_treinosDATA_INCLUSAO_TREINO: TDateTimeField
      FieldName = 'DATA_INCLUSAO_TREINO'
    end
  end
  object dt_source_hist_treinos: TDataSource
    DataSet = ado_query_hist_treinos
    Left = 448
    Top = 400
  end
  object dt_source_hist_fichas: TDataSource
    Left = 616
    Top = 400
  end
  object ado_query_hist_fich_treino: TADOQuery
    Active = True
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TREINO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      #9'TREINO_TREINO_DIA,'
      #9'GRUPO_MUSCULAR_TREINO_DIA'
      'FROM '
      #9'TB_TREINO AS TRE'
      
        'INNER JOIN TB_TREINO_DIA AS TRD ON TRE.ID_TREINO = TRD.TREINO_TR' +
        'EINO_DIA'
      'WHERE'
      #9'ID_TREINO = :ID_TREINO'
      '')
    Left = 616
    Top = 320
    object ado_query_hist_fich_treinoTREINO_TREINO_DIA: TIntegerField
      FieldName = 'TREINO_TREINO_DIA'
    end
    object ado_query_hist_fich_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField
      FieldName = 'GRUPO_MUSCULAR_TREINO_DIA'
      Size = 255
    end
  end
end

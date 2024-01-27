object dm_treino: Tdm_treino
  Height = 645
  Width = 1363
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
    Left = 56
    Top = 128
  end
  object ado_query_consulta_nr_treinos: TADOQuery
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
    Left = 248
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
    Left = 624
    Top = 312
    object ado_query_hist_fich_treinoTREINO_TREINO_DIA: TIntegerField
      FieldName = 'TREINO_TREINO_DIA'
    end
    object ado_query_hist_fich_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField
      FieldName = 'GRUPO_MUSCULAR_TREINO_DIA'
      Size = 255
    end
  end
  object ado_query_consulta_grup_musc: TADOQuery
    Active = True
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  ID_GRUPO_MUSCULAR,'
      '  NOME_GRUPO_MUSCULAR'
      'FROM'
      '  TB_GRUPO_MUSCULAR')
    Left = 808
    Top = 312
    object ado_query_consulta_grup_muscID_GRUPO_MUSCULAR: TAutoIncField
      FieldName = 'ID_GRUPO_MUSCULAR'
      ReadOnly = True
    end
    object ado_query_consulta_grup_muscNOME_GRUPO_MUSCULAR: TStringField
      FieldName = 'NOME_GRUPO_MUSCULAR'
      Size = 50
    end
  end
  object dt_source_lista_exer_grup_musc: TDataSource
    DataSet = ado_query_lista_exe_grp_musc
    Left = 1008
    Top = 392
  end
  object ado_proc_add_exec_ficha_treino: TADOStoredProc
    Connection = dm_principal.ado_connection
    ProcedureName = 'SP_GRAVA_EXERCICIO_TREINO;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@TREINO_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@TREINO_DIA_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@EXERCICIO_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@SERIES_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@REPETICOES_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
      end
      item
        Name = '@TEMPO_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
      end
      item
        Name = '@CARGA_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@OBS_EXERCICIO_TREINO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2147483647
      end>
    Left = 752
    Top = 128
  end
  object ado_proc_cad_treino_dia: TADOStoredProc
    Connection = dm_principal.ado_connection
    ProcedureName = 'SP_GRAVA_TREINO_DIA'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@TREINO_TREINO_DIA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@GRUPO_MUSCULAR_TREINO_DIA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 424
    Top = 128
  end
  object ado_proc_grup_treino_dia: TADOStoredProc
    Connection = dm_principal.ado_connection
    ProcedureName = 'SP_ESPECIFICA_TREINO_DIA;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TREINO_DIA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@GRUPO_MUSCULAR_TREINO_DIA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end>
    Left = 576
    Top = 128
  end
  object ado_query_ficha_treino: TADOQuery
    Active = True
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'TREINO_DIA'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    ET.ID_EXERCICIO_TREINO,'
      '    ET.TREINO_EXERCICIO_TREINO,'
      '    ET.TREINO_DIA_EXERCICIO_TREINO,'
      '    ET.EXERCICIO_EXERCICIO_TREINO,'
      '    ET.SERIES_EXERCICIO_TREINO,'
      '    ET.REPETICOES_EXERCICIO_TREINO,'
      '    ET.TEMPO_EXERCICIO_TREINO,'
      '    ET.CARGA_EXERCICIO_TREINO,'
      '    ET.OBS_EXERCICIO_TREINO,'
      #9'TD.GRUPO_MUSCULAR_TREINO_DIA,'
      #9'EX.NOME_EXERCICIO,'
      #9'EX.DESCRICAO_EXERCICIO,'
      #9'EX.GRUPO_MUSCULAR'
      'FROM'
      '    TB_EXERCICIO_TREINO ET'
      
        'INNER JOIN TB_TREINO_DIA TD ON ET.TREINO_DIA_EXERCICIO_TREINO = ' +
        'TD.ID_TREINO_DIA'
      
        'INNER JOIN TB_EXERCICIO EX ON ET.EXERCICIO_EXERCICIO_TREINO = ID' +
        '_EXERCICIO'
      ''
      'WHERE ID_TREINO_DIA = :TREINO_DIA')
    Left = 1200
    Top = 296
    object ado_query_ficha_treinoID_EXERCICIO_TREINO: TAutoIncField
      FieldName = 'ID_EXERCICIO_TREINO'
      ReadOnly = True
    end
    object ado_query_ficha_treinoTREINO_EXERCICIO_TREINO: TIntegerField
      FieldName = 'TREINO_EXERCICIO_TREINO'
    end
    object ado_query_ficha_treinoTREINO_DIA_EXERCICIO_TREINO: TIntegerField
      FieldName = 'TREINO_DIA_EXERCICIO_TREINO'
    end
    object ado_query_ficha_treinoEXERCICIO_EXERCICIO_TREINO: TIntegerField
      FieldName = 'EXERCICIO_EXERCICIO_TREINO'
    end
    object ado_query_ficha_treinoSERIES_EXERCICIO_TREINO: TIntegerField
      FieldName = 'SERIES_EXERCICIO_TREINO'
    end
    object ado_query_ficha_treinoREPETICOES_EXERCICIO_TREINO: TStringField
      FieldName = 'REPETICOES_EXERCICIO_TREINO'
      Size = 10
    end
    object ado_query_ficha_treinoTEMPO_EXERCICIO_TREINO: TStringField
      FieldName = 'TEMPO_EXERCICIO_TREINO'
      Size = 12
    end
    object ado_query_ficha_treinoCARGA_EXERCICIO_TREINO: TIntegerField
      FieldName = 'CARGA_EXERCICIO_TREINO'
    end
    object ado_query_ficha_treinoOBS_EXERCICIO_TREINO: TMemoField
      FieldName = 'OBS_EXERCICIO_TREINO'
      BlobType = ftMemo
    end
    object ado_query_ficha_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField
      FieldName = 'GRUPO_MUSCULAR_TREINO_DIA'
      Size = 255
    end
    object ado_query_ficha_treinoNOME_EXERCICIO: TStringField
      FieldName = 'NOME_EXERCICIO'
      Size = 100
    end
    object ado_query_ficha_treinoDESCRICAO_EXERCICIO: TMemoField
      FieldName = 'DESCRICAO_EXERCICIO'
      BlobType = ftMemo
    end
    object ado_query_ficha_treinoGRUPO_MUSCULAR: TIntegerField
      FieldName = 'GRUPO_MUSCULAR'
    end
  end
  object dt_source_ficha_treino: TDataSource
    DataSet = ado_query_ficha_treino
    Left = 1200
    Top = 400
  end
  object ado_query_lista_exe_grp_musc: TADOQuery
    Active = True
    Connection = dm_principal.ado_connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'GRUPO_MUSCULAR'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      #9'ID_EXERCICIO,'
      #9'NOME_EXERCICIO,'
      #9'DESCRICAO_EXERCICIO,'
      #9'GRUPO_MUSCULAR'
      'FROM'
      '  TB_GRUPO_MUSCULAR AS GRM'
      
        'INNER JOIN TB_EXERCICIO AS EXE ON GRM.ID_GRUPO_MUSCULAR = EXE.GR' +
        'UPO_MUSCULAR'
      'WHERE'
      '  NOME_GRUPO_MUSCULAR = :GRUPO_MUSCULAR')
    Left = 1008
    Top = 288
    object ado_query_lista_exe_grp_muscID_EXERCICIO: TAutoIncField
      FieldName = 'ID_EXERCICIO'
      ReadOnly = True
    end
    object ado_query_lista_exe_grp_muscNOME_EXERCICIO: TStringField
      FieldName = 'NOME_EXERCICIO'
      Size = 100
    end
    object ado_query_lista_exe_grp_muscDESCRICAO_EXERCICIO: TMemoField
      FieldName = 'DESCRICAO_EXERCICIO'
      BlobType = ftMemo
    end
    object ado_query_lista_exe_grp_muscGRUPO_MUSCULAR: TIntegerField
      FieldName = 'GRUPO_MUSCULAR'
    end
  end
  object dt_source_consulta_grup_musc: TDataSource
    DataSet = ado_query_consulta_grup_musc
    Left = 808
    Top = 400
  end
end

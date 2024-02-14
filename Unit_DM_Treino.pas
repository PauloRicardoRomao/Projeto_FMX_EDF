unit Unit_DM_Treino;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  Tdm_treino = class(TDataModule)
    ado_proc_cad_info_basic_treino: TADOStoredProc;
    ado_query_consulta_nr_treinos: TADOQuery;
    ado_query_consulta_nr_treinosPROXIMO_NR_TREINO: TIntegerField;
    ado_query_verifica_ficha_treino_dia: TADOQuery;
    ado_query_verifica_ficha_treino_diaID_TREINO_DIA: TAutoIncField;
    ado_query_verifica_ficha_treino_diaGRUPO_MUSCULAR_TREINO_DIA: TStringField;
    ado_query_verifica_ficha_treino_diaDATA_INCLUSAO_TREINO_DIA: TDateTimeField;
    ado_proc_exclui_treino: TADOStoredProc;
    ado_query_hist_treinos: TADOQuery;
    ado_query_hist_treinosID_TREINO: TAutoIncField;
    ado_query_hist_treinosALUNO_TREINO: TStringField;
    ado_query_hist_treinosNR_TREINO_ALUNO: TIntegerField;
    ado_query_hist_treinosFOCO_TREINO: TMemoField;
    ado_query_hist_treinosMODELO_TREINO: TStringField;
    ado_query_hist_treinosOBS_TREINO: TMemoField;
    ado_query_hist_treinosDATA_INCLUSAO_TREINO: TDateTimeField;
    dt_source_hist_treinos: TDataSource;
    dt_source_hist_fichas: TDataSource;
    ado_query_hist_fich_treino: TADOQuery;
    ado_query_hist_fich_treinoTREINO_TREINO_DIA: TIntegerField;
    ado_query_hist_fich_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField;
    ado_query_consulta_grup_musc: TADOQuery;
    ado_query_consulta_grup_muscID_GRUPO_MUSCULAR: TAutoIncField;
    ado_query_consulta_grup_muscNOME_GRUPO_MUSCULAR: TStringField;
    dt_source_lista_exer_grup_musc: TDataSource;
    ado_proc_add_exec_ficha_treino: TADOStoredProc;
    ado_proc_cad_treino_dia: TADOStoredProc;
    ado_proc_grup_treino_dia: TADOStoredProc;
    ado_query_ficha_treino: TADOQuery;
    dt_source_ficha_treino: TDataSource;
    ado_query_lista_exe_grp_musc: TADOQuery;
    ado_query_lista_exe_grp_muscID_EXERCICIO: TAutoIncField;
    ado_query_lista_exe_grp_muscNOME_EXERCICIO: TStringField;
    ado_query_lista_exe_grp_muscDESCRICAO_EXERCICIO: TMemoField;
    ado_query_lista_exe_grp_muscGRUPO_MUSCULAR: TIntegerField;
    dt_source_consulta_grup_musc: TDataSource;
    ado_query_ficha_treinoID_EXERCICIO_TREINO: TAutoIncField;
    ado_query_ficha_treinoTREINO_EXERCICIO_TREINO: TIntegerField;
    ado_query_ficha_treinoTREINO_DIA_EXERCICIO_TREINO: TIntegerField;
    ado_query_ficha_treinoEXERCICIO_EXERCICIO_TREINO: TIntegerField;
    ado_query_ficha_treinoSERIES_EXERCICIO_TREINO: TIntegerField;
    ado_query_ficha_treinoREPETICOES_EXERCICIO_TREINO: TStringField;
    ado_query_ficha_treinoTEMPO_EXERCICIO_TREINO: TStringField;
    ado_query_ficha_treinoCARGA_EXERCICIO_TREINO: TStringField;
    ado_query_ficha_treinoOBS_EXERCICIO_TREINO: TMemoField;
    ado_query_ficha_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField;
    ado_query_ficha_treinoNOME_EXERCICIO: TStringField;
    ado_query_ficha_treinoDESCRICAO_EXERCICIO: TMemoField;
    ado_query_ficha_treinoGRUPO_MUSCULAR: TIntegerField;
    ado_proc_cancela_treino: TADOStoredProc;
    ado_proc_consulta_treino_atual: TADOStoredProc;
    ado_query_consulta_aluno_auxiliar: TADOQuery;
    ado_query_hist_fich_treinoID_TREINO_DIA: TAutoIncField;
    ado_query_consulta_ficha_treino_exp: TADOQuery;
    ado_query_consulta_ficha_treino_expGRUPO_MUSCULAR_TREINO_DIA: TStringField;
    ado_query_consulta_ficha_treino_expNOME_EXERCICIO: TStringField;
    ado_query_consulta_ficha_treino_expSERIES_EXERCICIO_TREINO: TIntegerField;
    ado_query_consulta_ficha_treino_expREPETICOES_EXERCICIO_TREINO: TStringField;
    ado_query_consulta_ficha_treino_expTEMPO_EXERCICIO_TREINO: TStringField;
    ado_query_consulta_ficha_treino_expCARGA_EXERCICIO_TREINO: TStringField;
    ado_query_consulta_ficha_treino_expOBS_EXERCICIO_TREINO: TMemoField;
    ado_query_consulta_ficha_treino_expDESCRICAO_EXERCICIO: TMemoField;
    ado_query_verifica_ficha_treino_diaFICHA_TREINO_DIA: TStringField;
    ado_query_hist_fich_treinoFICHA_TREINO_DIA: TStringField;
    ado_query_ficha_treinoFICHA_TREINO_DIA: TStringField;
    ado_query_consulta_ficha_treino_expFICHA_TREINO_DIA: TStringField;
    ado_query_consulta_aluno_auxiliarID_ALUNO: TAutoIncField;
    ado_query_consulta_aluno_auxiliarNOME_ALUNO: TStringField;
    ado_query_consulta_aluno_auxiliarDATA_NASCIMENTO_ALUNO: TWideStringField;
    ado_query_consulta_aluno_auxiliarSEXO_ALUNO: TStringField;
    ado_query_consulta_aluno_auxiliarALTURA_ALUNO: TBCDField;
    ado_query_consulta_aluno_auxiliarPESO_ALUNO: TBCDField;
    ado_query_consulta_aluno_auxiliarOBJETIVO_ALUNO: TStringField;
    ado_query_consulta_aluno_auxiliarNIVEL_ATIVIDADE_ALUNO: TStringField;
    ado_query_consulta_aluno_auxiliarFOTO_ALUNO: TBlobField;
    ado_query_consulta_aluno_auxiliarDATA_INCLUSAO: TDateTimeField;
    ado_query_consulta_aluno_auxiliarFLAG_ATIVO: TBooleanField;
    ado_query_dia_treino: TADOQuery;
    ado_query_dia_treinoID_TREINO_DIA: TAutoIncField;
    ado_query_dia_treinoTREINO_TREINO_DIA: TIntegerField;
    ado_query_dia_treinoFICHA_TREINO_DIA: TStringField;
    ado_query_dia_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField;
    ado_query_dia_treinoDATA_INCLUSAO_TREINO_DIA: TDateTimeField;
    ado_query_dia_treinoFLAG_ATIVO: TBooleanField;
    ado_query_grup_musc_auxiliar: TADOQuery;
    ado_query_grup_musc_auxiliarID_GRUPO_MUSCULAR: TAutoIncField;
    ado_query_grup_musc_auxiliarNOME_GRUPO_MUSCULAR: TStringField;
    ado_proc_remove_exerc_ficha: TADOStoredProc;
    ado_query_consulta_treino: TADOQuery;
    ado_query_consulta_treinoID_TREINO: TAutoIncField;
    ado_query_consulta_treinoALUNO_TREINO: TStringField;
    ado_query_consulta_treinoNR_TREINO_ALUNO: TIntegerField;
    ado_query_consulta_treinoMODELO_TREINO: TStringField;
    ado_query_consulta_treinoFOCO_TREINO: TMemoField;
    ado_query_consulta_treinoNOME_ALUNO: TStringField;
    ado_query_consulta_treinoID_TREINO_DIA: TAutoIncField;
    ado_query_consulta_treinoFICHA_TREINO_DIA: TStringField;
    ado_query_consulta_treinoGRUPO_MUSCULAR_TREINO_DIA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_treino: Tdm_treino;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Unit_DM_Principal;

{$R *.dfm}

end.

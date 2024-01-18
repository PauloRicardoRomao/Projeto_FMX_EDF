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

unit Unit_DM_Principal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, Data.Win.ADODB;

type
  Tdm_principal = class(TDataModule)
    ado_connection: TADOConnection;
    ado_proc_cad_aluno_info_basic: TADOStoredProc;
    ado_proc_cad_aluno_anamnese: TADOStoredProc;
    ado_proc_cad_aluno_info_circ: TADOStoredProc;
    ado_proc_cad_aluno_db_cut_corp: TADOStoredProc;
    ado_proc_consulta_alunos: TADOStoredProc;
    ado_proc_consulta_completa_alunos: TADOStoredProc;
    ado_query_consulta_completa_aluno: TADOQuery;
    ado_query_consulta_completa_alunoID_ALUNO: TAutoIncField;
    ado_query_consulta_completa_alunoNOME_ALUNO: TStringField;
    ado_query_consulta_completa_alunoDATA_NASCIMENTO_ALUNO: TWideStringField;
    ado_query_consulta_completa_alunoSEXO_ALUNO: TStringField;
    ado_query_consulta_completa_alunoALTURA_ALUNO: TBCDField;
    ado_query_consulta_completa_alunoPESO_ALUNO: TBCDField;
    ado_query_consulta_completa_alunoOBJETIVO_ALUNO: TStringField;
    ado_query_consulta_completa_alunoNIVEL_ATIVIDADE_ALUNO: TIntegerField;
    ado_query_consulta_completa_alunoFOTO_ALUNO: TBlobField;
    ado_query_consulta_completa_alunoDATA_INCLUSAO: TDateTimeField;
    ado_query_consulta_completa_alunoFLAG_ATIVO: TBooleanField;
    ado_query_consulta_completa_alunoID_ANAMNESE_MEDICA: TAutoIncField;
    ado_query_consulta_completa_alunoCONDICOES_MEDICAS_ALUNO: TMemoField;
    ado_query_consulta_completa_alunoMEDICAMENTOS_ALUNO: TMemoField;
    ado_query_consulta_completa_alunoRESTRICOES_ALIMENTARES_ALUNO: TMemoField;
    ado_query_consulta_completa_alunoHISTORICO_EXERCICIOS_ALUNO: TMemoField;
    ado_query_consulta_completa_alunoFREQUENCIA_CARDIACA_REPOUSO_ALUNO: TIntegerField;
    ado_query_consulta_completa_alunoPRESSAO_ARTERIAL_ALUNO: TStringField;
    ado_query_consulta_completa_alunoOUTRAS_OBSERVACOES_ALUNO: TMemoField;
    ado_query_consulta_completa_alunoID_DIMENSOES_CORPORAIS: TIntegerField;
    ado_query_consulta_completa_alunoDATA_MEDICAO_DIMENSOES_CORPORAIS: TWideStringField;
    ado_query_consulta_completa_alunoALTURA_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoPESO_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoCIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoOUTRAS_MEDICOES_DIMENSOES_CORPORAIS: TMemoField;
    ado_query_consulta_completa_alunoID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TIntegerField;
    ado_query_consulta_completa_alunoDATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TWideStringField;
    ado_query_consulta_completa_alunoDOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoDOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoDOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoDOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoDOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoDOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoDOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_consulta_completa_alunoOUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TMemoField;
    ado_query_consulta_aluno: TADOQuery;
    ado_query_consulta_alunoID_ALUNO: TAutoIncField;
    ado_query_consulta_alunoNOME_ALUNO: TStringField;
    ado_query_consulta_alunoDATA_NASCIMENTO_ALUNO: TWideStringField;
    ado_query_consulta_alunoSEXO_ALUNO: TStringField;
    ado_query_consulta_alunoALTURA_ALUNO: TBCDField;
    ado_query_consulta_alunoPESO_ALUNO: TBCDField;
    ado_query_consulta_alunoOBJETIVO_ALUNO: TStringField;
    ado_query_consulta_alunoFOTO_ALUNO: TBlobField;
    ado_query_consulta_alunoNIVEL_ATIVIDADE_ALUNO: TIntegerField;
    ado_query_consulta_anamnese: TADOQuery;
    ado_query_consulta_anamneseID_ANAMNESE_MEDICA: TAutoIncField;
    ado_query_consulta_anamneseCONDICOES_MEDICAS_ALUNO: TMemoField;
    ado_query_consulta_anamneseMEDICAMENTOS_ALUNO: TMemoField;
    ado_query_consulta_anamneseRESTRICOES_ALIMENTARES_ALUNO: TMemoField;
    ado_query_consulta_anamneseHISTORICO_EXERCICIOS_ALUNO: TMemoField;
    ado_query_consulta_anamneseFREQUENCIA_CARDIACA_REPOUSO_ALUNO: TIntegerField;
    ado_query_consulta_anamnesePRESSAO_ARTERIAL_ALUNO: TStringField;
    ado_query_consulta_anamneseOUTRAS_OBSERVACOES_ALUNO: TMemoField;
    ado_query_dim_circunferencias: TADOQuery;
    ado_query_dim_circunferenciasID_DIMENSOES_CORPORAIS: TIntegerField;
    ado_query_dim_circunferenciasDATA_MEDICAO_DIMENSOES_CORPORAIS: TWideStringField;
    ado_query_dim_circunferenciasALTURA_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasPESO_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_BRACO_ESQ_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_BRACO_DIR_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_PERNA_ESQ_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_PERNA_DIR_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_PANTURRILHA_ESQ_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_PANTURRILHA_DIR_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_ABDOMINAL_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_CINTURA_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_QUADRIL_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasCIRCUNFERENCIA_PEITORAL_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_circunferenciasOUTRAS_MEDICOES_DIMENSOES_CORPORAIS: TMemoField;
    ado_query_dim_dobras: TADOQuery;
    ado_query_dim_dobrasID_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TIntegerField;
    ado_query_dim_dobrasDATA_MEDICAO_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TWideStringField;
    ado_query_dim_dobrasDOBRA_TRICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasDOBRA_BICEPS_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasDOBRA_SUBESCAPULAR_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasDOBRA_SUPRAILIACA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasDOBRA_ABDOMEN_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasDOBRA_AXILAR_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasDOBRA_PERNA_MEDIA_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TBCDField;
    ado_query_dim_dobrasOUTRAS_MEDICOES_DOBRAS_CULTANEAS_DIMENSOES_CORPORAIS: TMemoField;
    ado_proc_cad_exercicio: TADOStoredProc;
    ado_query_login: TADOQuery;
    ado_query_loginID_USUARIO: TAutoIncField;
    ado_query_loginNOME_USUARIO: TStringField;
    ado_query_loginSENHA_USUARIO: TStringField;
    ado_query_loginCHAVE_USUARIO: TStringField;
    ado_proc_cad_usuario: TADOStoredProc;
    ado_query_consulta_agendamentos: TADOQuery;
    dt_consulta_agendamentos: TDataSource;
    ado_query_consulta_agendamentosID_AGENDAMENTO: TAutoIncField;
    ado_query_consulta_agendamentosNOME_ALUNO: TStringField;
    ado_query_consulta_agendamentosDATA_HORA_CONSULTA_AGENDAMENTO: TDateTimeField;
    ado_query_consulta_agendamentosOBS_CONSULTA_AGENDAMENTO: TMemoField;
    ado_proc_cad_agendamento: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_principal: Tdm_principal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.

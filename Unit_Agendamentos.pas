unit Unit_Agendamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Calendar,
  System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Controls, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.Components, Fmx.Bind.Navigator, Data.Bind.Grid, FMX.ScrollBox,
  FMX.Grid, Data.Bind.DBScope;

type
  Tform_agendamentos = class(TForm)
    pnl_fundo: TRectangle;
    scr_box: TScrollBox;
    cld_agenda: TCalendar;
    pnl_fundo_agenda: TRectangle;
    pnl_header: TRectangle;
    pnl_fundo_consultas_agendadas: TRectangle;
    tit_fund_agendamentos: TLabel;
    btn_novo_agendamento: TRectangle;
    lbl_btn_novo_agendamento: TLabel;
    pnl_fund_menu_consultas: TRectangle;
    btn_finaliza_consulta: TRectangle;
    lbl_btn_finaliza_consulta: TLabel;
    lbl_tit_fun_agendamentos: TLabel;
    BindSourceDB1: TBindSourceDB;
    grid_agendamentos: TStringGrid;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    StyleBook1: TStyleBook;
    rb_ag_abertos: TRadioButton;
    rb_ag_todos: TRadioButton;
    pnl_filtro: TRectangle;
    Layout1: TLayout;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    layout_conteudo: TLayout;
    procedure btn_novo_agendamentoMouseEnter(Sender: TObject);
    procedure btn_novo_agendamentoMouseLeave(Sender: TObject);
    procedure btn_finaliza_consultaMouseEnter(Sender: TObject);
    procedure btn_finaliza_consultaMouseLeave(Sender: TObject);
    procedure cld_agendaDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grid_agendamentosCellClick(const Column: TColumn;
      const Row: Integer);
    procedure btn_novo_agendamentoClick(Sender: TObject);
    procedure btn_finaliza_consultaClick(Sender: TObject);
    procedure rb_ag_abertosChange(Sender: TObject);
    procedure rb_ag_todosChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    data_selecionada : TDate;
    agendamento, aluno : integer;
    data_consulta : TDateTime;
    obs_consulta : string;
  end;

var
  form_agendamentos: Tform_agendamentos;

implementation

{$R *.fmx}

uses Unit_DM_Principal, Unit_Cards_Alunos, Unit_Menu_Principal, Unit_Menu_Novo;


procedure Tform_agendamentos.FormCreate(Sender: TObject);
var
  dia, mes, ano : string;
begin
  cld_agenda.Date := Now;
  data_selecionada := cld_agenda.Date;
  data_selecionada := cld_agenda.Date;
  dia := Copy(DateToStr(cld_agenda.Date),1,2);
  mes := Copy(DateToStr(cld_agenda.Date),4,2);
  ano := Copy(DateToStr(cld_agenda.Date),7,4);
  try
    with dm_principal do
    begin
      ado_query_consulta_agendamentos.Close;
      ado_query_consulta_agendamentos.Parameters.ParamByName('ANO').Value := ano;
      ado_query_consulta_agendamentos.Parameters.ParamByName('MES').Value := mes;
      ado_query_consulta_agendamentos.Parameters.ParamByName('DIA').Value := dia;
      ado_query_consulta_agendamentos.Open;
    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Lista de Exercícios.');
  end;
  rb_ag_abertos.IsChecked := True;
  rb_ag_todos.IsChecked := False;
end;

procedure Tform_agendamentos.cld_agendaDayClick(Sender: TObject);
var
  dia, mes, ano : string;
begin
  data_selecionada := cld_agenda.Date;
  dia := Copy(DateToStr(cld_agenda.Date),1,2);
  mes := Copy(DateToStr(cld_agenda.Date),4,2);
  ano := Copy(DateToStr(cld_agenda.Date),7,4);
  try
    with dm_principal do
    begin
      ado_query_consulta_agendamentos.Close;
      ado_query_consulta_agendamentos.Parameters.ParamByName('ANO').Value := ano;
      ado_query_consulta_agendamentos.Parameters.ParamByName('MES').Value := mes;
      ado_query_consulta_agendamentos.Parameters.ParamByName('DIA').Value := dia;
      ado_query_consulta_agendamentos.Open;
    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Consulta de Agendamentos Marcados.');
  end;
end;

procedure Tform_agendamentos.btn_novo_agendamentoMouseEnter(Sender: TObject);
begin
  btn_novo_agendamento.Fill.Color := $FF214358;
  lbl_btn_novo_agendamento.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_agendamentos.btn_novo_agendamentoMouseLeave(Sender: TObject);
begin
  btn_novo_agendamento.Fill.Color := $FF03223F;
  lbl_btn_novo_agendamento.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_agendamentos.btn_novo_agendamentoClick(Sender: TObject);
begin
  form_cards_alunos := Tform_cards_alunos.Create(Application);
  form_cards_alunos.v_agendamento := 1;
  form_cards_alunos.ShowModal;
end;

procedure Tform_agendamentos.grid_agendamentosCellClick(const Column: TColumn;
  const Row: Integer);
begin
  try
    with dm_principal do
    begin
      if (ado_query_consulta_agendamentos.RecNo > 0) then
      begin
        agendamento := ado_query_consulta_agendamentosID_AGENDAMENTO.AsInteger;
        aluno := ado_query_consulta_agendamentosID_ALUNO.AsInteger;
        data_consulta := ado_query_consulta_agendamentosDATA_HORA_CONSULTA_AGENDAMENTO.AsDateTime;
        obs_consulta := ado_query_consulta_agendamentosOBS_CONSULTA_AGENDAMENTO.AsString;
        btn_finaliza_consulta.Enabled := True;
      end
      else
      begin
        btn_finaliza_consulta.Enabled := False;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;

end;

procedure Tform_agendamentos.rb_ag_abertosChange(Sender: TObject);
var
  dia, mes, ano : string;
begin
  data_selecionada := cld_agenda.Date;
  dia := Copy(DateToStr(cld_agenda.Date),1,2);
  mes := Copy(DateToStr(cld_agenda.Date),4,2);
  ano := Copy(DateToStr(cld_agenda.Date),7,4);

  with dm_principal.ado_query_consulta_agendamentos do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('    A.ID_AGENDAMENTO,');
    SQL.Add('    A.ID_ALUNO,');
    SQL.Add('    DPA.NOME_ALUNO,');
    SQL.Add('    A.DATA_HORA_CONSULTA_AGENDAMENTO,');
    SQL.Add('    A.OBS_CONSULTA_AGENDAMENTO');
    SQL.Add('FROM');
    SQL.Add('    TB_AGENDAMENTOS A');
    SQL.Add('INNER JOIN');
    SQL.Add('    TB_DADOS_PESSOAIS_ALUNO DPA ON A.ID_ALUNO = DPA.ID_ALUNO');
    SQL.Add('WHERE');
    SQL.Add('DATEPART(YEAR, A.DATA_HORA_CONSULTA_AGENDAMENTO) = :ANO AND');
    SQL.Add('DATEPART(MONTH, A.DATA_HORA_CONSULTA_AGENDAMENTO) = :MES AND');
    SQL.Add('DATEPART(DAY, A.DATA_HORA_CONSULTA_AGENDAMENTO) = :DIA');
    SQL.Add('AND A.FLAG_ATIVO = 1');
    Parameters.ParamByName('ANO').Value := ano;
    Parameters.ParamByName('MES').Value := mes;
    Parameters.ParamByName('DIA').Value := dia;
    Open;
  end;
end;

procedure Tform_agendamentos.rb_ag_todosChange(Sender: TObject);
var
  dia, mes, ano : string;
begin
  data_selecionada := cld_agenda.Date;
  dia := Copy(DateToStr(cld_agenda.Date),1,2);
  mes := Copy(DateToStr(cld_agenda.Date),4,2);
  ano := Copy(DateToStr(cld_agenda.Date),7,4);

  with dm_principal.ado_query_consulta_agendamentos do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('    A.ID_AGENDAMENTO,');
    SQL.Add('    A.ID_ALUNO,');
    SQL.Add('    DPA.NOME_ALUNO,');
    SQL.Add('    A.DATA_HORA_CONSULTA_AGENDAMENTO,');
    SQL.Add('    A.OBS_CONSULTA_AGENDAMENTO');
    SQL.Add('FROM');
    SQL.Add('    TB_AGENDAMENTOS A');
    SQL.Add('INNER JOIN');
    SQL.Add('    TB_DADOS_PESSOAIS_ALUNO DPA ON A.ID_ALUNO = DPA.ID_ALUNO');
    SQL.Add('WHERE');
    SQL.Add('DATEPART(YEAR, A.DATA_HORA_CONSULTA_AGENDAMENTO) = :ANO AND');
    SQL.Add('DATEPART(MONTH, A.DATA_HORA_CONSULTA_AGENDAMENTO) = :MES AND');
    SQL.Add('DATEPART(DAY, A.DATA_HORA_CONSULTA_AGENDAMENTO) = :DIA');
    Parameters.ParamByName('ANO').Value := ano;
    Parameters.ParamByName('MES').Value := mes;
    Parameters.ParamByName('DIA').Value := dia;
    Open;
  end;
end;

procedure Tform_agendamentos.btn_finaliza_consultaMouseEnter(Sender: TObject);
begin
  btn_finaliza_consulta.Fill.Color := $FF214358;
  lbl_btn_finaliza_consulta.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_agendamentos.btn_finaliza_consultaMouseLeave(Sender: TObject);
begin
  btn_finaliza_consulta.Fill.Color := $FF03223F;
  lbl_btn_finaliza_consulta.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_agendamentos.btn_finaliza_consultaClick(Sender: TObject);
begin
  Try
    with dm_principal do
    begin
      with ado_proc_grava_consulta do
      begin
        Parameters.ParamByName('@AGENDAMENTO_CONSULTA').Value := agendamento;
        Parameters.ParamByName('@ALUNO_CONSULTA').Value := aluno;
        Parameters.ParamByName('@DATA_HORA_CONSULTA').Value := data_consulta;
        Parameters.ParamByName('@OBS_CONSULTA').Value := obs_consulta;
        ExecProc;
      end;
      cld_agendaDayClick(Self);
      ShowMessage('Confirmação de Consulta Realizada');
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
  btn_finaliza_consulta.Enabled := False;
  rb_ag_abertos.IsChecked := True;
  rb_ag_todos.IsChecked := False;
end;

procedure Tform_agendamentos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(form_agendamentos);
end;

procedure Tform_agendamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormDestroy(form_agendamentos);
  form_menu_novo.ShowModal;
end;

end.

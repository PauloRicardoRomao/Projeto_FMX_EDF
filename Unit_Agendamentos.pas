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
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    StyleBook1: TStyleBook;
    procedure btn_novo_agendamentoMouseEnter(Sender: TObject);
    procedure btn_novo_agendamentoMouseLeave(Sender: TObject);
    procedure btn_finaliza_consultaMouseEnter(Sender: TObject);
    procedure btn_finaliza_consultaMouseLeave(Sender: TObject);
    procedure cld_agendaDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grid_agendamentosCellClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    data_selecionada : TDate;
  end;

var
  form_agendamentos: Tform_agendamentos;

implementation

{$R *.fmx}

uses Unit_DM_Principal;


procedure Tform_agendamentos.FormCreate(Sender: TObject);
begin
  cld_agenda.Date := Now;
  data_selecionada := cld_agenda.Date;
  try
    with dm_principal do
    begin
      ado_query_consulta_agendamentos.Close;
      ado_query_consulta_agendamentos.Parameters.ParamByName('DATA_CONSULTA_AGENDAMENTO').Value := data_selecionada;
      ado_query_consulta_agendamentos.Open;
    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Lista de Exercícios.');
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

procedure Tform_agendamentos.cld_agendaDayClick(Sender: TObject);
begin
  data_selecionada := cld_agenda.Date;
  try
    with dm_principal do
    begin
      ado_query_consulta_agendamentos.Close;
      ado_query_consulta_agendamentos.Parameters.ParamByName('DATA_CONSULTA_AGENDAMENTO').Value := data_selecionada;
      ado_query_consulta_agendamentos.Open;
    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Consulta de Agendamentos Marcados.');
  end;
end;

procedure Tform_agendamentos.grid_agendamentosCellClick(const Column: TColumn;
  const Row: Integer);
begin
  Try
    with dm_principal do
    begin
      if ado_query_consulta_agendamentos.RecNo > 0 then
      begin
        btn_finaliza_consulta.Enabled := True;

      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

procedure Tform_agendamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_agendamentos := nil;
  form_agendamentos.Free;
end;

end.

unit Unit_Cadastro_Agendamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.DateTimeCtrls;

type
  Tform_cadastro_agendamento = class(TForm)
    pnl_fun_cad_agendamento: TRectangle;
    lbl_dt_hr_consulta: TLabel;
    lbl_obs: TLabel;
    mmo_obs: TMemo;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_treino: TLabel;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    edt_data: TDateEdit;
    edt_hora: TTimeEdit;
    procedure btn_gravarMouseEnter(Sender: TObject);
    procedure btn_gravarMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_cadastro_agendamento: Tform_cadastro_agendamento;

implementation

{$R *.fmx}

uses Unit_Cliente;


procedure LimparControlesDentroDoRectangle(Rectangle: TRectangle);
var
  i, j: Integer;
begin
  for i := 0 to Rectangle.ChildrenCount - 1 do
  begin
    if Rectangle.Children[i] is TLabel then
    begin
      for j := 0 to TLabel(Rectangle.Children[i]).ChildrenCount - 1 do
      begin
        if TLabel(Rectangle.Children[i]).Children[j] is TEdit then
          TEdit(TLabel(Rectangle.Children[i]).Children[j]).Text := ''
        else if TLabel(Rectangle.Children[i]).Children[j] is TMemo then
          TMemo(TLabel(Rectangle.Children[i]).Children[j]).Lines.Clear;
      end;
    end;
  end;
end;

procedure Tform_cadastro_agendamento.btn_gravarClick(Sender: TObject);
var
  id_aluno : integer;
  data_hora_agendamento, data_realiza_agendamento : TDateTime;
  obs, dia, mes, ano, horas, minutos : string;
begin

  id_aluno := form_aluno.id_aluno;
  dia := Copy(edt_data.Text, 1,2);
  mes := Copy(edt_data.Text, 4,2);
  ano := Copy(edt_data.Text, 6,4);
  horas := Copy(edt_hora.Text, 1,2);
  minutos := Copy(edt_hora.Text, 4,2);

  data_hora_agendamento := StrToDateTime(ano +'-'+mes+'-'+dia+' '+ horas +':'+ minutos);

  data_realiza_agendamento := Now;
  obs := mmo_obs.Lines.Text;

  try
    with dm_principal do
    begin
       with ado_proc_cad_agendamento do
       begin
         Parameters.ParamByName('@ID_ALUNO').Value := id_aluno;
         Parameters.ParamByName('@DATA_HORA_CONSULTA_AGENDAMENTO').Value := data_hora_agendamento;
         Parameters.ParamByName('@DATA_HORA_REALIZA_AGENDAMENTO').Value := data_realiza_agendamento;
         Parameters.ParamByName('@OBS_CONSULTA_AGENDAMENTO').Value := obs;
         ExecProc;
       end;
    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Cadastro de Agendamento.');
  end;
end;

procedure Tform_cadastro_agendamento.btn_gravarMouseEnter(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF214358;
  lbl_btn_gravar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_cadastro_agendamento.btn_gravarMouseLeave(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF03223F;
  lbl_btn_gravar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_cadastro_agendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LimparControlesDentroDoRectangle(pnl_fun_cad_agendamento);
  form_cadastro_agendamento := Nil;
  form_cadastro_agendamento.Free;
end;

end.

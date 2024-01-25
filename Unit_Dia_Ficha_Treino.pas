unit Unit_Dia_Ficha_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  Tform_dia_ficha_treino = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_treino: TLabel;
    lbl_edt_espc_grup: TLabel;
    edt_espc_grup: TEdit;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    procedure btn_gravarMouseEnter(Sender: TObject);
    procedure btn_gravarMouseLeave(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    grupo_musc_dia : string;
    id_treino_dia : integer;
  end;

var
  form_dia_ficha_treino: Tform_dia_ficha_treino;

implementation

{$R *.fmx}

uses Unit_Monta_Treino, Unit_DM_Treino;


procedure Tform_dia_ficha_treino.FormCreate(Sender: TObject);
begin
  id_treino_dia := form_monta_treino.treino_dia;
end;

procedure Tform_dia_ficha_treino.btn_gravarClick(Sender: TObject);
begin
  if edt_espc_grup.Text = '' then
  begin
    ShowMessage('Campo NÃO obrigatório está vazio.');
    Close;
  end;

  try
    grupo_musc_dia := edt_espc_grup.Text;
    with dm_treino.ado_proc_grup_treino_dia do
    begin
      Parameters.ParamByname('@ID_TREINO_DIA').Value := id_treino_dia;
      Parameters.ParamByname('@GRUPO_MUSCULAR_TREINO_DIA').Value := grupo_musc_dia;
      ExecProc;
    end;
    edt_espc_grup.Text := grupo_musc_dia;
    form_dia_ficha_treino.Close;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Especificação de Treino.');
  end;
end;

procedure Tform_dia_ficha_treino.btn_gravarMouseEnter(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF214358;
  lbl_btn_gravar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_dia_ficha_treino.btn_gravarMouseLeave(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF03223F;
  lbl_btn_gravar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_dia_ficha_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  edt_espc_grup.Text := '';
  form_dia_ficha_treino := nil;
  form_dia_ficha_treino.Free;
end;

end.

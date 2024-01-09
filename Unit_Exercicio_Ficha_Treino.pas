unit Unit_Exercicio_Ficha_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects;

type
  Tform_exercicio_ficha_treino = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_treino: TLabel;
    lbl_carga: TLabel;
    edt_carga: TEdit;
    lbl_exercicio: TLabel;
    edt_exercicio: TEdit;
    lbl_obs: TLabel;
    mmo_obs: TMemo;
    lbl_repeticoes: TLabel;
    edt_repeticoes: TEdit;
    lbl_series: TLabel;
    edt_series: TEdit;
    lbl_tempo: TLabel;
    edt_tempo: TEdit;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    procedure btn_gravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_gravarMouseEnter(Sender: TObject);
    procedure btn_gravarMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_exercicio_ficha_treino: Tform_exercicio_ficha_treino;

implementation

{$R *.fmx}

procedure Tform_exercicio_ficha_treino.btn_gravarClick(Sender: TObject);
var
  series, rep : integer;
  carga, temp : Currency;
  obs : string;
begin

  if edt_series.Text = '' then
  begin
    ShowMessage('Necessário preencher à quantidade de SÉRIES!');
    edt_series.SetFocus;
    Exit;
  end;

  if (edt_repeticoes.Text = '') and (edt_tempo.Text = '')  then
  begin
    ShowMessage('Necessário que um dos dois campos REPETIÇÕES ou TEMPO esteja preenchido!');
    edt_series.SetFocus;
    Exit;
  end;

  if (edt_series.Text <> '')  and ((edt_repeticoes.Text <> '') or (edt_tempo.Text <> '')) then
  begin

    series := StrToInt(edt_series.Text);
    rep := StrToInt(edt_repeticoes.Text);
    carga := StrToCurr(edt_carga.Text);
    temp := StrToCurr(edt_tempo.Text);
    obs := mmo_obs.Lines.Text;

    form_exercicio_ficha_treino.Close;
  end;

end;

procedure Tform_exercicio_ficha_treino.btn_gravarMouseEnter(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF214358;
  lbl_btn_gravar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_exercicio_ficha_treino.btn_gravarMouseLeave(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF03223F;
  lbl_btn_gravar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_exercicio_ficha_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_exercicio_ficha_treino := nil;
  form_exercicio_ficha_treino.Free;
end;

end.

unit Unit_Popup_Card_Aluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  Tform_popup_card_aluno = class(TForm)
    pnl_ppp_card_aluno: TRectangle;
    btn_inf_aluno_ppp: TRectangle;
    lbl_btn_inf_aluno_ppp: TLabel;
    btn_cad_ficha_aluno_ppp: TRectangle;
    lbl_btn_cad_ficha_aluno_ppp: TLabel;
    procedure btn_cad_ficha_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_cad_ficha_aluno_pppMouseLeave(Sender: TObject);
    procedure btn_inf_aluno_pppMouseLeave(Sender: TObject);
    procedure btn_inf_aluno_pppMouseEnter(Sender: TObject);
    procedure btn_inf_aluno_pppClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cad_ficha_aluno_pppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_popup_card_aluno: Tform_popup_card_aluno;

implementation

{$R *.fmx}

uses Unit_Cards_Alunos, Unit_Cliente, Unit_Ficha_Consulta;


procedure Tform_popup_card_aluno.btn_cad_ficha_aluno_pppMouseEnter(
  Sender: TObject);
begin
  btn_cad_ficha_aluno_ppp.Fill.Color := $FF214358;
  lbl_btn_cad_ficha_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_cad_ficha_aluno_pppMouseLeave(
  Sender: TObject);
begin
  btn_cad_ficha_aluno_ppp.Fill.Color := $FF03223F;
  lbl_btn_cad_ficha_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_inf_aluno_pppMouseEnter(Sender: TObject);
begin
  btn_inf_aluno_ppp.Fill.Color := $FF214358;
  lbl_btn_inf_aluno_ppp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_popup_card_aluno.btn_inf_aluno_pppMouseLeave(Sender: TObject);
begin
  btn_inf_aluno_ppp.Fill.Color := $FF03223F;
  lbl_btn_inf_aluno_ppp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_popup_card_aluno.btn_inf_aluno_pppClick(Sender: TObject);
begin
  Unit_Cliente.form_aluno.ShowModal;
  //form_popup_card_aluno.Close;
end;

procedure Tform_popup_card_aluno.btn_cad_ficha_aluno_pppClick(Sender: TObject);
begin
  Unit_Ficha_Consulta.form_ficha_consulta.ShowModal;
  //form_popup_card_aluno.Close;
end;

procedure Tform_popup_card_aluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_popup_card_aluno := Nil;
  form_popup_card_aluno.Free;
end;

end.

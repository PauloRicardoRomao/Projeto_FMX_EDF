unit Unit_Monta_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.Objects, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts;

type
  Tform_monta_treino = class(TForm)
    pnl_fundo: TRectangle;
    scr_box_fundo: TScrollBox;
    pnl_info: TRectangle;
    scr_box: TScrollBox;
    pnl_fundo_info_basic: TRectangle;
    lbl_repeticoes: TLabel;
    edt_repeticoes: TEdit;
    lbl_exercicio: TLabel;
    lbl_grup_muscular: TLabel;
    lbl_carga: TLabel;
    lbl_obs: TLabel;
    mmo_obs: TMemo;
    lbl_tempo: TLabel;
    edt_tempo: TEdit;
    lbl_series: TLabel;
    btn_grava_inf_bsc: TRectangle;
    lbl_btn_grava_inf_bsc: TLabel;
    btn_lmp_inf_bsc: TRectangle;
    lbl_btn_lmp_inf_bsc: TLabel;
    lbl_tit_fun_ficha_treino: TLabel;
    cbx_grup_muscular: TComboBox;
    cbx_exercicio: TComboBox;
    edt_carga: TEdit;
    edt_series: TEdit;
    lbl_mdl_treino: TLabel;
    lbl_fco_treino: TLabel;
    MenuBar1: TMenuBar;
    btn_menu_add_ficha_a: TRectangle;
    lbl_dsc_menu: TLabel;
    lbl_btn_menu_add_ficha_a: TLabel;
    Rectangle1: TRectangle;
    Label1: TLabel;
    StyleBook1: TStyleBook;
    procedure btn_grava_inf_bscMouseEnter(Sender: TObject);
    procedure btn_grava_inf_bscMouseLeave(Sender: TObject);
    procedure btn_lmp_inf_bscMouseLeave(Sender: TObject);
    procedure btn_lmp_inf_bscMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_menu_add_ficha_aMouseEnter(Sender: TObject);
    procedure btn_menu_add_ficha_aMouseLeave(Sender: TObject);
    procedure btn_grava_inf_bscClick(Sender: TObject);
  private
    { Private declarations }
    procedure CardMouseEnter(Sender: TObject);
    procedure CardMouseLeave(Sender: TObject);
    procedure CardClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  form_monta_treino: Tform_monta_treino;

implementation

{$R *.fmx}

procedure Tform_monta_treino.btn_grava_inf_bscClick(Sender: TObject);
var
  letra: Char;
  i : integer;
  Card : TRectangle;
  lbl_card : TLabel;
begin
  for letra := 'A' to 'Z' do
  begin
    Card := TRectangle.Create(Self);
    Card.Parent := MenuBar1;
    Card.Align := TAlignLayout.Left;
    Card.Height := 43;
    Card.Width := 120;
    Card.Margins.Top := 3;
    Card.Margins.Left := 10;
    Card.Margins.Right := 10;
    Card.Margins.Bottom := 3;
    Card.Fill.DefaultColor := TAlphaColors.White;
    Card.Stroke.Color := TAlphaColors.Null;
    Card.Stroke.Thickness := 0;

    Card.OnMouseEnter := CardMouseEnter;
    Card.OnMouseLeave := CardMouseLeave;
    Card.OnClick := CardClick;

    lbl_card := TLabel.Create(Self);
    lbl_card.Parent := Card;
    lbl_card.Align := TAlignLayout.Client;
    lbl_card.Size.Height := 20;
    lbl_card.AutoSize := False;
    lbl_card.TextSettings.Font.Size := 18;
    lbl_card.Margins.Top := 3;
    lbl_card.Margins.Bottom := 3;
    lbl_card.Margins.Left := 3;
    lbl_card.Margins.Right := 3;


    lbl_card.TextSettings.HorzAlign := TTextAlign.Leading;
    lbl_card.TextSettings.VertAlign := TTextAlign.Center;
    lbl_card.TextSettings.WordWrap := True;
    lbl_card.TextSettings.Trimming := TTextTrimming.None;

    //letra := Chr(i);
    lbl_card.StyleLookup :=  'lbl_btn_menu_add_ficha_style';

    lbl_card.Text := 'Ficha '+letra;
  end;

end;

procedure Tform_monta_treino.btn_grava_inf_bscMouseEnter(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_monta_treino.btn_grava_inf_bscMouseLeave(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_monta_treino.btn_lmp_inf_bscMouseEnter(Sender: TObject);
begin
  btn_lmp_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_lmp_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_monta_treino.btn_lmp_inf_bscMouseLeave(Sender: TObject);
begin
  btn_lmp_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_lmp_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_monta_treino.btn_menu_add_ficha_aMouseEnter(Sender: TObject);
begin
  //btn_menu_add_ficha_a.Fill.Color := $3498dbFF;
  btn_menu_add_ficha_a.Fill.Color := $FFE0EEF8;
  lbl_btn_menu_add_ficha_a.TextSettings.FontColor := $00000080;
  //$FFFFFF80;
end;

procedure Tform_monta_treino.btn_menu_add_ficha_aMouseLeave(Sender: TObject);
begin
  btn_menu_add_ficha_a.Fill.Color := $FFFFFFFF;
  lbl_btn_menu_add_ficha_a.TextSettings.FontColor := $00000080;
end;

procedure Tform_monta_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_monta_treino := nil;
  form_monta_treino.Free;
end;

procedure Tform_monta_treino.CardMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FFE0EEF8;
  TLabel(Sender).TextSettings.FontColor := $00000080;
end;

procedure Tform_monta_treino.CardMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FFFFFFFF;
  TLabel(Sender).TextSettings.FontColor := $00000080;
end;

procedure Tform_monta_treino.CardClick(Sender: TObject);
begin

end;


end.

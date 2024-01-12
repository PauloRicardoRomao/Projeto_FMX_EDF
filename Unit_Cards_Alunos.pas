unit Unit_Cards_Alunos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.DialogService,
  FMX.Menus;

type
  Tform_cards_alunos = class(TForm)
    pnl_header: TPanel;
    btn_filtro: TRectangle;
    lbl_btn_filtro: TLabel;
    edt_filtro: TEdit;
    lbl_filtro: TLabel;
    pnl_fundo: TRectangle;
    scr_box: TScrollBox;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure btn_filtroMouseEnter(Sender: TObject);
    procedure btn_filtroMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CriaCards;
    procedure CardMouseEnter(Sender: TObject);
    procedure CardMouseLeave(Sender: TObject);
    procedure CardClick(Sender: TObject);
    procedure img_cardClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  form_cards_alunos: Tform_cards_alunos;

implementation

{$R *.fmx}

uses Unit_Cliente, Unit_Popup_Card_Aluno, Unit_Menu_Principal;


procedure Tform_cards_alunos.btn_filtroMouseEnter(Sender: TObject);
begin
  btn_filtro.Fill.Color := $FF214358;
  lbl_btn_filtro.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_cards_alunos.btn_filtroMouseLeave(Sender: TObject);
begin
  btn_filtro.Fill.Color := $FF03223F;
  lbl_btn_filtro.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_cards_alunos.CriaCards;
var
  i : integer;
  Card : TRectangle;
  img_card : TImage;
  lbl_card : TLabel;

  ImageFilePath: string;
  Bitmap: TBitmap;
begin
  for i := 0 to 5 do
  begin
    Card := TRectangle.Create(Self);
    Card.Parent := scr_box;
    //////VER DEPOIS PROVAVELMENTE VAI GERAR O ULTIMO COMO PRIMEIRO DA LISTA
    Card.Align := TAlignLayout.Top;
    Card.Height := 200;
    Card.Margins.Top := 15;
    Card.Margins.Left := 10;
    Card.Margins.Right := 5;
    Card.Fill.Color := $FF2E4347;

    Card.OnMouseEnter := CardMouseEnter;
    Card.OnMouseLeave := CardMouseLeave;
    Card.OnClick := CardClick;

    img_card := TImage.Create(Card);
    img_card.Parent := Card;
    img_card.Align := TAlignLayout.MostLeft;
    img_card.Margins.Top := 3;
    img_card.Margins.Left := 10;
    img_card.Margins.Bottom := 3;

    img_card.OnClick := img_cardClick;

    ImageFilePath := 'C:\Users\ADM\Desktop\Imagens TESTE WP\iconegg.png';
    Bitmap := TBitmap.Create;
    Bitmap.LoadFromFile(ImageFilePath);
    img_card.Bitmap.Assign(Bitmap);
    Bitmap.Free;

    lbl_card := TLabel.Create(Self);
    lbl_card.Parent := Card;
    lbl_card.Align := TAlignLayout.Client;
    lbl_card.Size.Height := 20;
    lbl_card.AutoSize := False;
    lbl_card.TextSettings.Font.Size := 14;

    lbl_card.Margins.Left := 10;

    lbl_card.TextSettings.HorzAlign := TTextAlign.Leading;
    lbl_card.TextSettings.VertAlign := TTextAlign.Center;
    lbl_card.TextSettings.WordWrap := True;
    lbl_card.TextSettings.Trimming := TTextTrimming.None;

    lbl_card.StyleLookup :=  'lbl_card_style';

    lbl_card.Text := 'Nome do Cliente';

  end;
end;

procedure Tform_cards_alunos.CardMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FF942222;
end;

procedure Tform_cards_alunos.CardMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Color := $FF2E4347;
end;

procedure Tform_cards_alunos.CardClick(Sender: TObject);
begin
  form_popup_card_aluno := Tform_popup_card_aluno.Create(Application);
  Unit_Popup_Card_Aluno.form_popup_card_aluno.ShowModal;
end;

procedure Tform_cards_alunos.img_cardClick(Sender: TObject);
begin
  form_popup_card_aluno := Tform_popup_card_aluno.Create(Application);
  Unit_Popup_Card_Aluno.form_popup_card_aluno.ShowModal;
end;

procedure Tform_cards_alunos.FormCreate(Sender: TObject);
begin
  CriaCards;
end;

procedure Tform_cards_alunos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_cards_alunos := nil;
  form_cards_alunos.Free;
end;

end.

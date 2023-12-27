unit Unit_Cards_Alunos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

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
  private
    { Private declarations }
    procedure CriaCards;
    procedure CardMouseEnter(Sender: TObject);
    procedure CardMouseLeave(Sender: TObject);
    procedure CardClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  form_cards_alunos: Tform_cards_alunos;

implementation

{$R *.fmx}

uses Unit_Cliente;


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
    Card.Align := TAlignLayout.Top;
    Card.Height := 200;
    Card.Margins.Top := 15;
    Card.Margins.Left := 10;
    Card.Margins.Right := 5;
    //Card.Fill.Color := $FFBFD6C7;
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

    ImageFilePath := 'C:\Users\ADM\Desktop\Imagens TESTE WP\iconegg.png';
    Bitmap := TBitmap.Create;
    Bitmap.LoadFromFile(ImageFilePath);
    img_card.Bitmap.Assign(Bitmap);
    Bitmap.Free;

    lbl_card := TLabel.Create(Self);
    lbl_card.Parent := Card;
    lbl_card.Align := TAlignLayout.Client; // Ocupa o restante do espaço à direita da imagem
    lbl_card.Size.Height := 20;
    lbl_card.AutoSize := False;
    //lbl_card.TextSettings.Font.Family := 'Arial';
    lbl_card.TextSettings.Font.Size := 14;
    //lbl_card.TextSettings.Font.Style := [TFontStyle.fsBold]; // Adicione outros estilos conforme necessário
    //lbl_card.TextSettings.FontColor := TAlphaColors.Black; // Cor do texto

    // Espaçamento entre a imagem e o label
    lbl_card.Margins.Left := 10;

    // Configurações de texto
    lbl_card.TextSettings.HorzAlign := TTextAlign.Leading;
    lbl_card.TextSettings.VertAlign := TTextAlign.Center;
    lbl_card.TextSettings.WordWrap := True;
    lbl_card.TextSettings.Trimming := TTextTrimming.None;

    lbl_card.StyleLookup :=  'lbl_card_style';

    // Texto do Label (exemplo: Nome do Cliente)
    lbl_card.Text := 'Nome do Cliente';


  end;
end;

procedure Tform_cards_alunos.CardMouseEnter(Sender: TObject);
begin
  // Altere a cor de fundo ou adicione efeitos quando o mouse entra
  TRectangle(Sender).Fill.Color := $FF942222; // Substitua pela cor desejada
end;

procedure Tform_cards_alunos.CardMouseLeave(Sender: TObject);
begin
  // Restaure a cor de fundo quando o mouse sai
  TRectangle(Sender).Fill.Color := $FF2E4347; // Ou retorne à cor original
end;

procedure Tform_cards_alunos.CardClick(Sender: TObject);
begin
  Unit_Cliente.form_aluno.ShowModal;
end;

procedure Tform_cards_alunos.FormCreate(Sender: TObject);
begin
  CriaCards;
end;

end.

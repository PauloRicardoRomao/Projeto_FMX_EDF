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
    id_aluno, v_agendamento : integer;
  end;

var
  form_cards_alunos: Tform_cards_alunos;

implementation

{$R *.fmx}

uses Unit_Cliente, Unit_Popup_Card_Aluno, Unit_Menu_Principal,
  Unit_DM_Principal, Unit_Agendamentos, Unit_Cadastro_Agendamento;


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
  Card: TRectangle;
  img_card: TImage;
  lbl_card: TLabel;
  ImageFilePath: string;
  Bitmap: TBitmap;
begin
  try
    dm_principal.ado_proc_consulta_alunos.Open;

    while not dm_principal.ado_proc_consulta_alunos.Eof do
    begin
      Card := TRectangle.Create(Self);
      Card.Parent := scr_box;
      Card.Align := TAlignLayout.Top;
      Card.Height := 200;
      Card.Margins.Top := 15;
      Card.Margins.Left := 10;
      Card.Margins.Right := 5;
      Card.Fill.Color := $FF2E4347;

      Card.Tag := dm_principal.ado_proc_consulta_alunos.FieldByName('ID_ALUNO').AsInteger;

      Card.OnMouseEnter := CardMouseEnter;
      Card.OnMouseLeave := CardMouseLeave;
      Card.OnClick := CardClick;
      {
      img_card := TImage.Create(Card);
      img_card.Parent := Card;
      img_card.Align := TAlignLayout.MostLeft;
      img_card.Margins.Top := 3;
      img_card.Margins.Left := 10;
      img_card.Margins.Bottom := 3;
      img_card.OnClick := img_cardClick;

      // Verifica se há uma imagem válida no campo FOTO_ALUNO
      if not dm_principal.ado_proc_consulta_alunos.FieldByName('FOTO_ALUNO').IsNull then
        ImageFilePath := dm_principal.ado_proc_consulta_alunos.FieldByName('FOTO_ALUNO').AsString
      else
        ImageFilePath := 'C:\Caminho\Para\Imagem\Padrão\iconegg.png';

      Bitmap := TBitmap.Create;
      try
        Bitmap.LoadFromFile(ImageFilePath);
        img_card.Bitmap.Assign(Bitmap);
      finally
        Bitmap.Free;
      end;    }

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
      lbl_card.StyleLookup := 'lbl_card_style';
      lbl_card.Text := dm_principal.ado_proc_consulta_alunos.FieldByName('NOME_ALUNO').AsString;

      dm_principal.ado_proc_consulta_alunos.Next;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao executar a stored procedure: ' + E.Message);
    end;
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
var
  SelectedCard: TRectangle;
begin
  if v_agendamento = 0 then
  begin
    if Sender is TRectangle then
    begin
      SelectedCard := TRectangle(Sender);
      form_popup_card_aluno := Tform_popup_card_aluno.Create(Application);
      id_aluno := SelectedCard.Tag;
      form_popup_card_aluno.id_aluno := id_aluno;
      Unit_Popup_Card_Aluno.form_popup_card_aluno.ShowModal;
    end;
  end
  else if v_agendamento = 1 then
  begin
    if Sender is TRectangle then
    begin
      SelectedCard := TRectangle(Sender);
      form_cadastro_agendamento := Tform_cadastro_agendamento.Create(Application);
      id_aluno := SelectedCard.Tag;
      form_cadastro_agendamento.id_aluno := id_aluno;
      Unit_Cadastro_Agendamento.form_cadastro_agendamento.ShowModal;
    end;
  end;
end;

procedure Tform_cards_alunos.img_cardClick(Sender: TObject);
begin
  form_popup_card_aluno := Tform_popup_card_aluno.Create(Application);
  form_popup_card_aluno.id_aluno := dm_principal.ado_proc_consulta_alunos.FieldByName('ID_ALUNO').AsInteger;
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

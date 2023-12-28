unit Unit_Menu_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  Tform_menu_principal = class(TForm)
    pnl_fundo: TRectangle;
    pnl_header: TPanel;
    scr_box: TScrollBox;
    StyleBook1: TStyleBook;
    Rectangle2: TRectangle;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    Image3: TImage;
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_menu_principal: Tform_menu_principal;

implementation

{$R *.fmx}

uses Unit_Cards_Alunos, Unit_Cliente, Unit_Ficha_Consulta,
  Unit_Popup_Card_Aluno;

procedure Tform_menu_principal.Rectangle1Click(Sender: TObject);
begin
  Unit_Cards_Alunos.form_cards_alunos.ShowModal;
end;

end.

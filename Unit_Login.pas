unit Unit_Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Menus;

type
  Tform_login = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    lbl_usuario: TLabel;
    lbl_senha: TLabel;
    StyleBook1: TStyleBook;
    btn_entrar: TRectangle;
    lbl_btn_entrar: TLabel;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    img_logo: TImage;
    pnl_logo: TRectangle;
    MainMenu1: TMainMenu;
    btn_menu_prim_acesso: TMenuItem;
    btn_menu_ajuda: TMenuItem;
    procedure btn_entrarMouseEnter(Sender: TObject);
    procedure btn_entrarMouseLeave(Sender: TObject);
    procedure btn_entrarClick(Sender: TObject);
    procedure btn_menu_prim_acessoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario, senha : string;
  end;

var
  form_login: Tform_login;

implementation

{$R *.fmx}

uses Unit_Cadastro_Usuario;

procedure Tform_login.btn_entrarClick(Sender: TObject);
begin
  if (edt_usuario.Text = '') or (edt_senha.Text = '') then
  begin
    ShowMessage('Necessário preencher USUÁRIO e SENHA!');
    edt_usuario.SetFocus;
    Exit;
  end;

  if (edt_usuario.Text <> '') and (edt_senha.Text <> '') then
  begin
    usuario := edt_usuario.Text;
    senha := edt_senha.Text;

    //sql



  end;
end;

procedure Tform_login.btn_entrarMouseEnter(Sender: TObject);
begin
  btn_entrar.Fill.Color := $FF214358;
  lbl_btn_entrar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_login.btn_entrarMouseLeave(Sender: TObject);
begin
  btn_entrar.Fill.Color := $FF03223F;
  lbl_btn_entrar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_login.btn_menu_prim_acessoClick(Sender: TObject);
begin
  form_cadastro_usuario := Tform_cadastro_usuario.Create(Application);
  form_cadastro_usuario.ShowModal;
end;

end.

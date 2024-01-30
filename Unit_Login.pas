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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
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

uses Unit_Cadastro_Usuario, Unit_Menu_Principal, Unit_DM_Principal;


procedure Tform_login.FormCreate(Sender: TObject);
begin
  edt_usuario.Text := 'Paulo';
  edt_senha.Text := '123456';
end;

procedure Tform_login.btn_menu_prim_acessoClick(Sender: TObject);
begin
  form_cadastro_usuario := Tform_cadastro_usuario.Create(Application);
  form_login.Hide;
  form_cadastro_usuario.ShowModal;
  form_login.Close;
end;

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
    Try
      with dm_principal do
      begin
        ado_query_login.Close;
        ado_query_login.Parameters.ParamByName('NOME_USUARIO').Value := usuario;
        ado_query_login.Parameters.ParamByName('SENHA_USUARIO').Value := senha;
        ado_query_login.Open;
        if ado_query_login.RecordCount > 0 then
        begin
          form_menu_principal := Tform_menu_principal.Create(Application);
          //form_login.Hide;
          form_menu_principal.ShowModal;
          form_login.Close;
        end
        else
        begin
          ShowMessage('Usuário ou senha INCORRETOS!');
          edt_usuario.Text := '';
          edt_senha.Text := '';
          Exit;
        end;
      end;
    except
        on E: Exception do
          ShowMessage('Erro: ' + E.Message + ' Login Usuário.');
      end;


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

procedure Tform_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form_login := nil;
  form_login.Free;
end;

end.

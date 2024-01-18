unit Unit_Cadastro_Usuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit;

type
  Tform_cadastro_usuario = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    lbl_usuario: TLabel;
    lbl_senha: TLabel;
    lbl_chave_acesso: TLabel;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_treino: TLabel;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    edt_senha: TEdit;
    edt_usuario: TEdit;
    edt_chave_acesso: TEdit;
    procedure btn_gravarMouseEnter(Sender: TObject);
    procedure btn_gravarMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_gravarClick(Sender: TObject);
  private
    { Private declarations }
    const
      TamanhoChave = 80;
    class function GerarCaractereUnico: Char;
    class function ChaveValida(const Chave: string): Boolean;
  public
    { Public declarations }
    usuario, senha, chave_acesso : string;
    class function GerarChaveAcesso: string;
    class function VerificarChaveAcesso(const Chave: string): Boolean;
  end;

var
  form_cadastro_usuario: Tform_cadastro_usuario;

implementation

{$R *.fmx}

uses Unit_Login, Unit_DM_Principal;

class function Tform_cadastro_usuario.GerarCaractereUnico: Char;
var
  Caractere: Char;
begin
  repeat
    Caractere := Chr(Random(26) + Ord('A')); // Gera letra maiúscula aleatória
  until not (Caractere in ['0'..'9', 'A'..'Z']);
  Result := Caractere;
end;

class function Tform_cadastro_usuario.ChaveValida(const Chave: string): Boolean;
var
  // Implemente aqui a lógica para verificar a validade da chave no servidor local
  // Pode ser uma consulta em um banco de dados local ou outro método de verificação
  // Aqui, por enquanto, sempre retorna True (simulando uma verificação bem-sucedida)
  // Você deve adaptar isso conforme a lógica real do seu servidor local
  ServerChave: string;
begin
  // Simulando uma chave válida no servidor local
  ServerChave := '123ABC';

  // Comparando a chave gerada pelo cliente com a chave válida do servidor local
  Result := Chave = ServerChave;
end;

class function Tform_cadastro_usuario.GerarChaveAcesso: string;
var
  i: Integer;
  Caractere: Char;
begin
  Result := '';
  for i := 1 to TamanhoChave do
  begin
    Caractere := GerarCaractereUnico;
    Result := Result + Caractere;
  end;
end;

class function Tform_cadastro_usuario.VerificarChaveAcesso(const Chave: string): Boolean;
begin
  // Chama o método ChaveValida para verificar a validade da chave no servidor local
  Result := ChaveValida(Chave);
end;

procedure Tform_cadastro_usuario.btn_gravarClick(Sender: TObject);
begin
  if (edt_usuario.Text <> '') and (edt_senha.Text <> '') and (edt_chave_acesso.Text <> '') then
  begin
    usuario := edt_usuario.Text;
    senha := edt_senha.Text;
    chave_acesso := edt_chave_acesso.Text;


    with dm_principal do
    begin
      ado_proc_cad_usuario.Parameters.ParamByName('@NOME_USUARIO').Value := usuario;
      ado_proc_cad_usuario.Parameters.ParamByName('@SENHA_USUARIO').Value := senha;
      ado_proc_cad_usuario.Parameters.ParamByName('@CHAVE_USUARIO').Value := chave_acesso;
      ado_proc_cad_usuario.ExecProc;
    end;
    ShowMessage('Usuário cadastrado com sucesso! Voltando a tela de login.');

    form_login := Tform_login.Create(Application);
    form_login.ShowModal;
    form_cadastro_usuario.Close;
  end
  else
  begin
    ShowMessage('É necessário preencher todos os campos!');
    Exit;
  end;
end;

procedure Tform_cadastro_usuario.btn_gravarMouseEnter(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF214358;
  lbl_btn_gravar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_cadastro_usuario.btn_gravarMouseLeave(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF03223F;
  lbl_btn_gravar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_cadastro_usuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  edt_usuario.Text := '';
  edt_senha.Text := '';
  edt_chave_acesso.Text := '';
  form_cadastro_usuario := nil;
  form_cadastro_usuario.Free;
end;

end.

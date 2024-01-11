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
  private
    { Private declarations }
    const
      TamanhoChave = 80;
    class function GerarCaractereUnico: Char;
    class function ChaveValida(const Chave: string): Boolean;
  public
    { Public declarations }
    class function GerarChaveAcesso: string;
    class function VerificarChaveAcesso(const Chave: string): Boolean;
  end;

var
  form_cadastro_usuario: Tform_cadastro_usuario;

implementation

{$R *.fmx}

class function TGeradorChaveAcesso.GerarCaractereUnico: Char;
var
  Caractere: Char;
begin
  repeat
    Caractere := Chr(Random(26) + Ord('A')); // Gera letra maiúscula aleatória
  until not (Caractere in ['0'..'9', 'A'..'Z']);
  Result := Caractere;
end;

class function TGeradorChaveAcesso.ChaveValida(const Chave: string): Boolean;
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

class function TGeradorChaveAcesso.GerarChaveAcesso: string;
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

class function TGeradorChaveAcesso.VerificarChaveAcesso(const Chave: string): Boolean;
begin
  // Chama o método ChaveValida para verificar a validade da chave no servidor local
  Result := ChaveValida(Chave);
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

end.

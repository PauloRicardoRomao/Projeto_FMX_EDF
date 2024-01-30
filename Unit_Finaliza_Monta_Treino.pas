unit Unit_Finaliza_Monta_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  Tform_finaliza_treino = class(TForm)
    pnl_fundo: TRectangle;
    btn_exportar_comp: TRectangle;
    lbl_btn_exportar_comp: TLabel;
    btn_exportar_enviar: TRectangle;
    lbl_btn_exportar_enviar: TLabel;
    btn_exportar_ficha_dia: TRectangle;
    lbl_btn_exportar_ficha_dia: TLabel;
    btn_salvar: TRectangle;
    lbl_btn_salvar: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_finaliza_treino: Tform_finaliza_treino;

implementation

{$R *.fmx}

uses Unit_Monta_Treino;

procedure Tform_finaliza_treino.btn_salvarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_finaliza_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_finaliza_treino := nil;
  form_monta_treino.Release;
  form_finaliza_treino.Free;
end;

end.

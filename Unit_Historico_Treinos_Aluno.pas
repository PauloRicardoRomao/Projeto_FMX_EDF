unit Unit_Historico_Treinos_Aluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, FMX.Layouts;

type
  Tform_hist_treinos_aluno = class(TForm)
    pnl_fundo: TRectangle;
    scr_box_fundo: TScrollBox;
    pnl_info: TRectangle;
    scr_box: TScrollBox;
    pnl_fundo_info_basic: TRectangle;
    lbl_tit_fun_inf_bsc: TLabel;
    pnl_fun_treinos: TRectangle;
    pnl_grid_treinos: TRectangle;
    lbl_fun_treinos: TLabel;
    pnl_fundo_fichas_treino: TRectangle;
    pnl_grid_fichas: TRectangle;
    lbl_fun_fichas_treino: TLabel;
    pnl_grid_exe_ficha: TRectangle;
    lbl_fun_exe_ficha: TLabel;
    pnl_fun_ficha_exe_treino: TRectangle;
    pnl_fun_exe_ficha_treino: TRectangle;
    btn_imp_ficha: TRectangle;
    lbl_btn_imp_ficha: TLabel;
    procedure btn_imp_fichaMouseEnter(Sender: TObject);
    procedure btn_imp_fichaMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_hist_treinos_aluno: Tform_hist_treinos_aluno;

implementation

{$R *.fmx}

procedure Tform_hist_treinos_aluno.btn_imp_fichaMouseEnter(Sender: TObject);
begin
  btn_imp_ficha.Fill.Color := $FF214358;
  lbl_btn_imp_ficha.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_hist_treinos_aluno.btn_imp_fichaMouseLeave(Sender: TObject);
begin
  btn_imp_ficha.Fill.Color := $FF03223F;
  lbl_btn_imp_ficha.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

end.

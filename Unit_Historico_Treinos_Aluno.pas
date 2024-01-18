unit Unit_Historico_Treinos_Aluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, FMX.Layouts,
  System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, FMX.Grid, Data.Bind.DBScope, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

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
    btn_exp_treino: TRectangle;
    lbl_btn_exp_treino: TLabel;
    BindSourceDB1: TBindSourceDB;
    grid_hist_treinos: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    StyleBook1: TStyleBook;
    BindSourceDB2: TBindSourceDB;
    BindSourceDB3: TBindSourceDB;
    procedure btn_imp_fichaMouseEnter(Sender: TObject);
    procedure btn_imp_fichaMouseLeave(Sender: TObject);
    procedure btn_exp_treinoMouseEnter(Sender: TObject);
    procedure btn_exp_treinoMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grid_hist_treinosCellClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    id_aluno, id_treino : integer;
  end;

var
  form_hist_treinos_aluno: Tform_hist_treinos_aluno;

implementation

{$R *.fmx}

uses Unit_DM_Treino, Unit_Popup_Card_Aluno;

procedure Tform_hist_treinos_aluno.btn_exp_treinoMouseEnter(Sender: TObject);
begin
  btn_exp_treino.Fill.Color := $FF214358;
  lbl_btn_exp_treino.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_hist_treinos_aluno.btn_exp_treinoMouseLeave(Sender: TObject);
begin
  btn_exp_treino.Fill.Color := $FF03223F;
  lbl_btn_exp_treino.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

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

procedure Tform_hist_treinos_aluno.FormCreate(Sender: TObject);
begin
  id_aluno := form_popup_card_aluno.id_aluno;
  with dm_treino do
  begin
    ado_query_hist_treinos.Close;
    ado_query_hist_treinos.Parameters.ParamByName('ID_ALUNO').Value := id_aluno;
    ado_query_hist_treinos.Open;
  end;
end;

procedure Tform_hist_treinos_aluno.grid_hist_treinosCellClick(
  const Column: TColumn; const Row: Integer);
begin
  with dm_treino do
  begin
    id_treino := ado_query_hist_treinosID_TREINO.AsInteger;
    ado_query_hist_fich_treino.Close;
    ado_query_hist_fich_treino.Parameters.ParamByName('ID_TREINO').Value := id_treino;
    ado_query_hist_fich_treino.Open;
  end;
end;

end.

unit Unit_Historico_Treinos_Aluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, FMX.Layouts,
  System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, FMX.Grid, Data.Bind.DBScope;

type
  Tform_hist_treinos_aluno = class(TForm)
    pnl_fundo: TRectangle;
    scr_box_fundo: TScrollBox;
    pnl_info: TRectangle;
    scr_box: TScrollBox;
    pnl_fundo_info_basic: TRectangle;
    pnl_fun_treinos: TRectangle;
    lbl_fun_treinos: TLabel;
    pnl_fundo_fichas_treino: TRectangle;
    pnl_grid_fichas: TRectangle;
    lbl_fun_fichas_treino: TLabel;
    pnl_grid_exe_ficha: TRectangle;
    lbl_fun_exe_ficha: TLabel;
    pnl_fun_ficha_exe_treino: TRectangle;
    pnl_fun_exe_ficha_treino: TRectangle;
    btn_imp_treino: TRectangle;
    lbl_btn_imp_treino: TLabel;
    BindSourceDB1: TBindSourceDB;
    grid_treinos: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    grid_fichas: TStringGrid;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    grid_exercicios_ficha: TStringGrid;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    lbl_tit_fun_hist_treino: TLabel;
    lbl_aluno_treino: TLabel;
    btn_exp_ficha: TRectangle;
    lbl_btn_exp_ficha: TLabel;
    btn_exp_treino: TRectangle;
    lbl_btn_exp_treino: TLabel;
    procedure btn_imp_treinoMouseEnter(Sender: TObject);
    procedure btn_imp_treinoMouseLeave(Sender: TObject);
    procedure grid_treinosCellClick(const Column: TColumn; const Row: Integer);
    procedure grid_fichasCellClick(const Column: TColumn; const Row: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_exp_fichaMouseEnter(Sender: TObject);
    procedure btn_exp_treinoMouseEnter(Sender: TObject);
    procedure btn_exp_fichaMouseLeave(Sender: TObject);
    procedure btn_exp_treinoMouseLeave(Sender: TObject);
    procedure btn_imp_treinoClick(Sender: TObject);
    procedure btn_exp_fichaClick(Sender: TObject);
    procedure btn_exp_treinoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_aluno : integer;
  end;

var
  form_hist_treinos_aluno: Tform_hist_treinos_aluno;

implementation

{$R *.fmx}

uses Unit_DM_Treino, Unit_Consulta_Treino_Atual, Unit_Popup_Card_Aluno;


procedure Tform_hist_treinos_aluno.FormCreate(Sender: TObject);
begin
  id_aluno := form_popup_card_aluno.id_aluno;
  lbl_aluno_treino.Text := lbl_aluno_treino.Text+' '+ form_popup_card_aluno.nome_aluno;
  with dm_treino do
  begin
    ado_query_hist_treinos.Close;
    ado_query_hist_treinos.Parameters.ParamByName('ID_ALUNO').Value := id_aluno;
    ado_query_hist_treinos.Open;
  end;
end;

procedure Tform_hist_treinos_aluno.btn_exp_fichaClick(Sender: TObject);
begin
  try
    if dm_treino.ado_query_hist_fich_treino.RecordCount > 0 then
    begin

    end
    else
    begin
      ShowMessage('Não há fichas para exportar.');
    end;
  except
    on E: Exception do
        ShowMessage('Erro: ' + E.Message);
  end;
end;

procedure Tform_hist_treinos_aluno.btn_exp_fichaMouseEnter(Sender: TObject);
begin
  btn_exp_ficha.Fill.Color := $FF214358;
  lbl_btn_exp_ficha.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_hist_treinos_aluno.btn_exp_fichaMouseLeave(Sender: TObject);
begin
  btn_exp_ficha.Fill.Color := $FF03223F;
  lbl_btn_exp_ficha.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_hist_treinos_aluno.btn_exp_treinoClick(Sender: TObject);
begin
  try
    if dm_treino.ado_query_hist_treinos.RecordCount > 0 then
    begin

    end
    else
    begin
      ShowMessage('Não há fichas para realizar impressão');
    end;
  except
    on E: Exception do
        ShowMessage('Erro: ' + E.Message);
  end;
end;

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

procedure Tform_hist_treinos_aluno.btn_imp_treinoClick(Sender: TObject);
begin
  try
    if dm_treino.ado_query_hist_fich_treino.RecordCount > 0 then
    begin

    end
    else
    begin
      ShowMessage('Não há fichas para realizar impressão.');
    end;
  except
    on E: Exception do
        ShowMessage('Erro: ' + E.Message);
  end;

end;

procedure Tform_hist_treinos_aluno.btn_imp_treinoMouseEnter(Sender: TObject);
begin
  btn_imp_treino.Fill.Color := $FF214358;
  lbl_btn_imp_treino.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_hist_treinos_aluno.btn_imp_treinoMouseLeave(Sender: TObject);
begin
  btn_imp_treino.Fill.Color := $FF03223F;
  lbl_btn_imp_treino.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_hist_treinos_aluno.grid_treinosCellClick(const Column: TColumn;
  const Row: Integer);
var
  id_treino : integer;
begin
  with dm_treino do
  begin
    id_treino := ado_query_hist_treinosID_TREINO.AsInteger;
    ado_query_hist_fich_treino.Close;
    ado_query_hist_fich_treino.Parameters.ParamByName('ID_TREINO').Value := id_treino;
    ado_query_hist_fich_treino.Open;
  end;
end;

procedure Tform_hist_treinos_aluno.grid_fichasCellClick(const Column: TColumn;
  const Row: Integer);
var
  treino_dia : integer;
begin
  with dm_treino do
  begin
    treino_dia := ado_query_hist_fich_treinoID_TREINO_DIA.AsInteger;
    ado_query_ficha_treino.Close;
    ado_query_ficha_treino.Parameters.ParamByName('TREINO_DIA').Value := treino_dia;
    ado_query_ficha_treino.Open;
  end;
end;

procedure Tform_hist_treinos_aluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_hist_treinos_aluno := Nil;
  form_hist_treinos_aluno.Free;
end;

end.

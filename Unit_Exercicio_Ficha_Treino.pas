unit Unit_Exercicio_Ficha_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Objects;

type
  Tform_exercicio_ficha_treino = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_treino: TLabel;
    lbl_carga: TLabel;
    edt_carga: TEdit;
    lbl_exercicio: TLabel;
    edt_exercicio: TEdit;
    lbl_obs: TLabel;
    mmo_obs: TMemo;
    lbl_repeticoes: TLabel;
    edt_repeticoes: TEdit;
    lbl_series: TLabel;
    edt_series: TEdit;
    lbl_tempo: TLabel;
    edt_tempo: TEdit;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    procedure btn_gravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_gravarMouseEnter(Sender: TObject);
    procedure btn_gravarMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    treino, treino_dia, exercicio : integer;
  end;

var
  form_exercicio_ficha_treino: Tform_exercicio_ficha_treino;

implementation

{$R *.fmx}

uses Unit_DM_Treino, Unit_Monta_Treino;


procedure Tform_exercicio_ficha_treino.FormCreate(Sender: TObject);
begin
    treino := form_monta_treino.id_treino;
    //    treino_dia := ; }
    exercicio := form_monta_treino.exercicio_i;
    edt_exercicio.Text := form_monta_treino.nome_exercicio;
end;

procedure Tform_exercicio_ficha_treino.btn_gravarClick(Sender: TObject);
var
  series, rep : integer;
  carga, temp : Currency;
  obs : string;
begin

  if edt_series.Text = '' then
  begin
    ShowMessage('Necessário preencher à quantidade de SÉRIES!');
    edt_series.SetFocus;
    Exit;
  end;

  if (edt_repeticoes.Text = '') and (edt_tempo.Text = '')  then
  begin
    ShowMessage('Necessário que um dos dois campos REPETIÇÕES ou TEMPO esteja preenchido!');
    edt_series.SetFocus;
    Exit;
  end;

  if (edt_series.Text <> '')  and ((edt_repeticoes.Text <> '') or (edt_tempo.Text <> '')) then
  begin

    series := StrToInt(edt_series.Text);
    rep := StrToInt(edt_repeticoes.Text);
    carga := StrToCurr(edt_carga.Text);
    temp := StrToCurr(edt_tempo.Text);
    obs := mmo_obs.Lines.Text;

    Try
      with dm_treino.ado_proc_add_exec_ficha_treino do
      begin
        Parameters.ParamByName('@TREINO_EXERCICIO_TREINO').Value := treino;
        Parameters.ParamByName('@TREINO_DIA_EXERCICIO_TREINO').Value := treino_dia;
        Parameters.ParamByName('@EXERCICIO_EXERCICIO_TREINO').Value := exercicio;
        Parameters.ParamByName('@SERIES_EXERCICIO_TREINO').Value := series;
        Parameters.ParamByName('@REPETICOES_EXERCICIO_TREINO').Value := rep;
        Parameters.ParamByName('@TEMP_EXERCICIO_TREINO').Value := temp;
        Parameters.ParamByName('@CARGA_EXERCICIO_TREINO').Value := carga;
        Parameters.ParamByName('@OBS_EXERCICIO_TREINO').Value := obs;
        ExecProc;
      end;

      form_exercicio_ficha_treino.Close;

    except
      on E: Exception do
        ShowMessage('Erro: ' + E.Message + ' Inserção de Exercício na Ficha de Treino.');
    end;
  end;

end;

procedure LimparControlesDentroDoRectangle(Rectangle: TRectangle);
var
  i, j: Integer;
begin
  for i := 0 to Rectangle.ChildrenCount - 1 do
  begin
    if Rectangle.Children[i] is TLabel then
    begin
      for j := 0 to TLabel(Rectangle.Children[i]).ChildrenCount - 1 do
      begin
        if TLabel(Rectangle.Children[i]).Children[j] is TEdit then
          TEdit(TLabel(Rectangle.Children[i]).Children[j]).Text := ''
        else if TLabel(Rectangle.Children[i]).Children[j] is TMemo then
          TMemo(TLabel(Rectangle.Children[i]).Children[j]).Lines.Clear;
      end;
    end;
  end;
end;

procedure Tform_exercicio_ficha_treino.btn_gravarMouseEnter(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF214358;
  lbl_btn_gravar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_exercicio_ficha_treino.btn_gravarMouseLeave(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF03223F;
  lbl_btn_gravar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_exercicio_ficha_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LimparControlesDentroDoRectangle(pnl_fun_cad_treino);
  form_exercicio_ficha_treino := nil;
  form_exercicio_ficha_treino.Free;
end;

end.

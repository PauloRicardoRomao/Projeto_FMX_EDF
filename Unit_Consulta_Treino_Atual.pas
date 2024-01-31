unit Unit_Consulta_Treino_Atual;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator,
  FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Menus, FMX.Objects, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, System.Win.ComObj;

type
  Tform_consulta_treino_atual = class(TForm)
    pnl_fundo: TRectangle;
    scr_box_fundo: TScrollBox;
    pnl_info: TRectangle;
    MenuBar1: TMenuBar;
    btn_menu_add_ficha_a: TRectangle;
    lbl_btn_menu_add_ficha_a: TLabel;
    lbl_dsc_menu: TLabel;
    lbl_tit_fun_consulta_treino: TLabel;
    lbl_fco_treino: TLabel;
    lbl_mdl_treino: TLabel;
    scr_box: TScrollBox;
    S: TRectangle;
    pnl_fundo_exercicios: TRectangle;
    pnl_grup_muscular: TRectangle;
    lbl_edt_grup_dia: TLabel;
    edt_grup_dia: TEdit;
    btn_add_espec_ficha: TRectangle;
    lbl_btn_add_espec_ficha: TLabel;
    pnl_fun_ficha_treino: TRectangle;
    tit_fund_ficha: TLabel;
    pnl_fund_menu_ficha: TRectangle;
    btn_alt_ord_exe: TRectangle;
    lbl_btn_alt_ord_exe: TLabel;
    btn_rem_ficha: TRectangle;
    lbl_btn_rem_ficha: TLabel;
    grid_ficha_treino: TStringGrid;
    NavigatorBindSourceDB2: TBindNavigator;
    StyleBook1: TStyleBook;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    btn_exportar_comp: TRectangle;
    lbl_btn_exportar_comp: TLabel;
    btn_exportar_enviar: TRectangle;
    lbl_btn_exportar_enviar: TLabel;
    btn_exportar_ficha_dia: TRectangle;
    lbl_btn_exportar_ficha_dia: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_add_espec_fichaClick(Sender: TObject);
    procedure btn_exportar_compClick(Sender: TObject);
    procedure btn_exportar_ficha_diaClick(Sender: TObject);
    procedure btn_rem_fichaMouseEnter(Sender: TObject);
    procedure btn_alt_ord_exeMouseEnter(Sender: TObject);
    procedure btn_exportar_enviarMouseEnter(Sender: TObject);
    procedure btn_exportar_compMouseEnter(Sender: TObject);
    procedure btn_exportar_ficha_diaMouseEnter(Sender: TObject);
    procedure btn_exportar_enviarMouseLeave(Sender: TObject);
    procedure btn_exportar_compMouseLeave(Sender: TObject);
    procedure btn_exportar_ficha_diaMouseLeave(Sender: TObject);
    procedure btn_rem_fichaMouseLeave(Sender: TObject);
    procedure btn_alt_ord_exeMouseLeave(Sender: TObject);
    procedure btn_add_espec_fichaMouseLeave(Sender: TObject);
    procedure btn_add_espec_fichaMouseEnter(Sender: TObject);
  private
    { Private declarations }
    SelectedButton : TRectangle;
    FSelectedButton : TRectangle;
    FButtonIDs: TArray<Integer>;
    procedure Criabtn_menu;
    procedure btn_menuMouseEnter(Sender: TObject);
    procedure btn_menuMouseLeave(Sender: TObject);
    procedure btn_menuClick(Sender: TObject);
    procedure Exportar_XLSX;
    procedure DetalhesTreinoDoDia(planilha: Variant; idTreinoDia: Integer; linhaInicio: Integer);
  public
    { Public declarations }
    Nr_Fichas, IDTreinoDia, treino_dia : integer;
    espec_treino_dia : string;
  end;

var
  form_consulta_treino_atual: Tform_consulta_treino_atual;

implementation

{$R *.fmx}

uses Unit_DM_Treino, Unit_Popup_Card_Aluno, Unit_Dia_Ficha_Treino;

procedure Tform_consulta_treino_atual.FormCreate(Sender: TObject);
begin
  Criabtn_menu;
  tit_fund_ficha.Text := 'Ficha A';
end;

procedure Tform_consulta_treino_atual.Criabtn_menu;
var
  i : integer;
  btn_menu : TRectangle;
  lbl_btn_menu : TLabel;
  letra : string;
begin
{
  with dm_treino.ado_proc_consulta_treino_atual do
  begin
    Parameters.ParamByName('@ID_TREINO').Value := id;
  end;    }
  i := 0;
  Nr_Fichas := form_popup_card_aluno.i;
  SetLength(FButtonIDs, Nr_Fichas + 1);
  with dm_treino do
  begin
    ado_proc_consulta_treino_atual.Open;
    ado_proc_consulta_treino_atual.First;
    while not ado_proc_consulta_treino_atual.Eof do
    begin

      IDTreinoDia := ado_proc_consulta_treino_atual.FieldByName('ID_TREINO_DIA').AsInteger;

      btn_menu := TRectangle.Create(Self);
      btn_menu.Parent := MenuBar1;
      btn_menu.Align := TAlignLayout.FitLeft;
      btn_menu.Height := 43;
      btn_menu.Width := 120;
      btn_menu.Margins.Top := 3;
      btn_menu.Margins.Left := 10;
      btn_menu.Margins.Right := 10;
      btn_menu.Margins.Bottom := 3;
      btn_menu.Fill.Color := $FFFFFFFF;
      btn_menu.Stroke.Color := TAlphaColors.Null;
      btn_menu.Stroke.Thickness := 0;
      btn_menu.Cursor := crHandPoint;

      letra := Char(Ord('A') + i);

      lbl_btn_menu := TLabel.Create(Self);
      lbl_btn_menu.Parent := btn_menu;
      lbl_btn_menu.Align := TAlignLayout.Client;
      lbl_btn_menu.Size.Height := 20;
      lbl_btn_menu.Margins.Top := 3;
      lbl_btn_menu.Margins.Bottom := 3;
      lbl_btn_menu.Margins.Left := 3;
      lbl_btn_menu.Margins.Right := 3;
      lbl_btn_menu.TextSettings.HorzAlign := TTextAlign.Center;
      lbl_btn_menu.TextSettings.VertAlign := TTextAlign.Center;
      lbl_btn_menu.TextSettings.WordWrap := True;
      lbl_btn_menu.TextSettings.Trimming := TTextTrimming.None;


      lbl_btn_menu.StyleLookup :=  'lbl_btn_menu_add_ficha_style';
      lbl_btn_menu.Text := 'Ficha '+letra;

      btn_menu.OnMouseEnter := btn_menuMouseEnter;
      btn_menu.OnMouseLeave := btn_menuMouseLeave;
      btn_menu.OnClick := btn_menuClick;

      btn_menu.Tag := IDTreinoDia;
      FButtonIDs[i] := IDTreinoDia;

      ado_proc_consulta_treino_atual.Next;
      i := i + 1;
      if letra = 'A' then
      begin
        SelectedButton := btn_menu;
        SelectedButton.Fill.Color := $FF9FB1F5;
      end;
    end;
  end;
end;

procedure Tform_consulta_treino_atual.btn_menuMouseEnter(Sender: TObject);
begin
  if Sender <> FSelectedButton then
    TRectangle(Sender).Fill.Color := $FFE0EEF8;
end;

procedure Tform_consulta_treino_atual.btn_menuMouseLeave(Sender: TObject);
begin
  if Sender <> FSelectedButton then
    TRectangle(Sender).Fill.Color := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_rem_fichaMouseEnter(Sender: TObject);
begin
  btn_rem_ficha.Fill.Color := $FF214358;
  lbl_btn_rem_ficha.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_rem_fichaMouseLeave(Sender: TObject);
begin
  btn_rem_ficha.Fill.Color := $FF03223F;
  lbl_btn_rem_ficha.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_consulta_treino_atual.btn_add_espec_fichaClick(Sender: TObject);
begin
  form_dia_ficha_treino := Tform_dia_ficha_treino.Create(Application);
  form_dia_ficha_treino.id_treino_dia := treino_dia;
  form_dia_ficha_treino.ShowModal;
end;

procedure Tform_consulta_treino_atual.btn_add_espec_fichaMouseEnter(
  Sender: TObject);
begin
  btn_add_espec_ficha.Fill.Color := $FF214358;
  lbl_btn_add_espec_ficha.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_add_espec_fichaMouseLeave(
  Sender: TObject);
begin
  btn_add_espec_ficha.Fill.Color := $FF03223F;
  lbl_btn_add_espec_ficha.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_consulta_treino_atual.btn_alt_ord_exeMouseEnter(
  Sender: TObject);
begin
  btn_alt_ord_exe.Fill.Color := $FF214358;
  lbl_btn_alt_ord_exe.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_alt_ord_exeMouseLeave(
  Sender: TObject);
begin
  btn_alt_ord_exe.Fill.Color := $FF03223F;
  lbl_btn_alt_ord_exe.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_consulta_treino_atual.btn_exportar_compClick(Sender: TObject);
begin
  Exportar_XLSX;
end;

procedure Tform_consulta_treino_atual.btn_exportar_compMouseEnter(
  Sender: TObject);
begin
  btn_exportar_comp.Fill.Color := $FF214358;
  lbl_btn_exportar_comp.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_exportar_compMouseLeave(
  Sender: TObject);
begin
  btn_exportar_comp.Fill.Color := $FF03223F;
  lbl_btn_exportar_comp.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_consulta_treino_atual.btn_exportar_enviarMouseEnter(
  Sender: TObject);
begin
  btn_exportar_enviar.Fill.Color := $FF214358;
  lbl_btn_exportar_enviar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_exportar_enviarMouseLeave(
  Sender: TObject);
begin
  btn_exportar_enviar.Fill.Color := $FF03223F;
  lbl_btn_exportar_enviar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_consulta_treino_atual.btn_menuClick(Sender: TObject);
var
  label_text : string;
  Index: Integer;
  IDAssociado: Integer;
begin
  FSelectedButton := TRectangle(Sender);

  if Assigned(SelectedButton) then
  begin
    SelectedButton.Fill.Color := $FFFFFFFF;
  end;

  SelectedButton := TRectangle(Sender);
  TRectangle(Sender).Fill.Color := $FF9FB1F5;

  Index := SelectedButton.Tag;

  IDAssociado := Index;
  treino_dia := Index;

  try
    with dm_treino do
    begin
      with ado_query_ficha_treino do
      begin
        Close;
        Parameters.ParamByName('TREINO_DIA').Value := IDAssociado;
        Open;
      end;
      if (ado_query_ficha_treinoGRUPO_MUSCULAR_TREINO_DIA.AsString <> '') or (ado_query_ficha_treinoGRUPO_MUSCULAR_TREINO_DIA.AsString <> 'null') then
      begin
        espec_treino_dia := ado_query_ficha_treinoGRUPO_MUSCULAR_TREINO_DIA.AsString;
        btn_add_espec_ficha.Enabled := False;
      end
      else
      begin
        espec_treino_dia := '';
        btn_add_espec_ficha.Enabled := True;
      end;
      with ado_query_dia_treino do
      begin
        Close;
        Parameters.ParamByName('ID_TREINO_DIA').Value := IDAssociado;
        Open;
        tit_fund_ficha.Text := ado_query_dia_treinoFICHA_TREINO_DIA.AsString;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

procedure Tform_consulta_treino_atual.btn_exportar_ficha_diaClick(
  Sender: TObject);
var
  planilha : Variant;
  linha, contar : integer;
begin
  if treino_dia > 0 then
  begin

    contar := dm_treino.ado_query_consulta_ficha_treino_exp.RecordCount;
    linha := 2;

    planilha := CreateOleObject('Excel.Application');
    planilha.Caption := 'Exportação treino';
    planilha.Workbooks.Add(1);

    planilha.Sheets.Add;
    planilha.Sheets[linha].Name := dm_treino.ado_query_ficha_treinoFICHA_TREINO_DIA.AsString;



    planilha.Cells[4, 1] := 'Exercício';
    planilha.Cells[4, 2] := 'Séries';
    planilha.Cells[4, 3] := 'Repetições';
    planilha.Cells[4, 4] := 'Tempo';
    planilha.Cells[4, 5] := 'Carga';
    planilha.Cells[4, 6] := 'Obs';
    planilha.Cells[4, 7] := 'Descrição';
    try
      with dm_treino do
      begin
        with ado_query_consulta_ficha_treino_exp do
        begin
          Close;
          Parameters.ParamByName('ID_TREINO_DIA').Value := treino_dia;
          Open;
        end;
        planilha.Cells[2, 1] := 'Treino do Dia: ' + ado_query_consulta_ficha_treino_expGRUPO_MUSCULAR_TREINO_DIA.AsString;
        ado_query_consulta_ficha_treino_exp.First;
        while not ado_query_consulta_ficha_treino_exp.Eof do
        begin
          planilha.cells[linha,1] := ado_query_consulta_ficha_treino_expNOME_EXERCICIO.AsString;
          planilha.cells[linha,2] := ado_query_consulta_ficha_treino_expSERIES_EXERCICIO_TREINO.AsInteger;
          planilha.cells[linha,3] := ado_query_consulta_ficha_treino_expREPETICOES_EXERCICIO_TREINO.AsString;
          planilha.cells[linha,4] := ado_query_consulta_ficha_treino_expTEMPO_EXERCICIO_TREINO.AsString;
          planilha.cells[linha,5] := ado_query_consulta_ficha_treino_expCARGA_EXERCICIO_TREINO.AsString;
          planilha.cells[linha,6] := ado_query_consulta_ficha_treino_expOBS_EXERCICIO_TREINO.AsString;
          planilha.cells[linha,7] := ado_query_consulta_ficha_treino_expDESCRICAO_EXERCICIO.AsString;
          linha := linha + 1;
          ado_query_consulta_ficha_treino_exp.Next;
        end;
        planilha.columns.autofit;
        planilha.visible := True;
      end;

    finally
      planilha.Unassigned;
    end;

  end
  else if not treino_dia > 0 then
       begin
         ShowMessage('Selecione uma ficha, para exportar.');
       end;
end;

procedure Tform_consulta_treino_atual.btn_exportar_ficha_diaMouseEnter(
  Sender: TObject);
begin
  btn_exportar_ficha_dia.Fill.Color := $FF214358;
  lbl_btn_exportar_ficha_dia.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_consulta_treino_atual.btn_exportar_ficha_diaMouseLeave(
  Sender: TObject);
begin
  btn_exportar_ficha_dia.Fill.Color := $FF03223F;
  lbl_btn_exportar_ficha_dia.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_consulta_treino_atual.Exportar_XLSX;
var
  planilha : Variant;
  linha, contar : integer;
begin
  contar := dm_treino.ado_proc_consulta_treino_atual.RecordCount;
  linha := 1;

  planilha := CreateOleObject('Excel.Application');
  planilha.Caption := 'Exportação treino';
  planilha.Workbooks.Add(1);

  try
    with dm_treino do
    begin
      ado_proc_consulta_treino_atual.First;
      while not ado_proc_consulta_treino_atual.Eof do
      begin
        // Criar uma nova aba para cada ficha de treino do dia
        planilha.Sheets.Add;
       // planilha.Sheets[linha].Name := 'Ficha ' + IntToStr(linha);
        planilha.Sheets[linha].Name := ado_proc_consulta_treino_atual.FieldByName('FICHA_TREINO_DIA').AsString;
        // Preencher cabeçalho na nova aba
        planilha.Cells[1, 1] := 'Aluno';
        planilha.Cells[1, 2] := 'Nº Treino';
        planilha.Cells[1, 3] := 'Modelo';
        planilha.Cells[1, 4] := 'Foco';

        // Preencher informações específicas da ficha de treino do dia na nova aba
        planilha.Cells[7, 1] := 'Treino do Dia: ' + ado_proc_consulta_treino_atual.FieldByName('NOME_ALUNO').AsString;

        planilha.Cells[9, 1] := 'Exercício';
        planilha.Cells[9, 2] := 'Séries';
        planilha.Cells[9, 3] := 'Repetições';
        planilha.Cells[9, 4] := 'Tempo';
        planilha.Cells[9, 5] := 'Carga';
        planilha.Cells[9, 6] := 'Obs';
        planilha.Cells[9, 7] := 'Descrição';

        // Preencher detalhes do treino do dia na nova aba
        DetalhesTreinoDoDia(planilha, ado_proc_consulta_treino_atual.FieldByName('ID_TREINO_DIA').AsInteger, 10);

        linha := linha + 1;
        ado_proc_consulta_treino_atual.Next;
      end;
      planilha.Columns.Autofit;
      planilha.Visible := True;
    end;
  finally
    planilha.Unassigned;
  end;
end;

procedure Tform_consulta_treino_atual.DetalhesTreinoDoDia(planilha: Variant; idTreinoDia: Integer; linhaInicio: Integer);
begin
  try
    with dm_treino do
    begin
      ado_proc_consulta_treino_atual.Close;
      ado_proc_consulta_treino_atual.Parameters.ParamByName('@TREINO_DIA').Value := idTreinoDia;
      ado_proc_consulta_treino_atual.Open;

      while not ado_proc_consulta_treino_atual.Eof do
      begin
        planilha.Cells[linhaInicio, 1] := ado_proc_consulta_treino_atual.FieldByName('NOME_EXERCICIO').AsString;
        planilha.Cells[linhaInicio, 2] := ado_proc_consulta_treino_atual.FieldByName('SERIES_EXERCICIO_TREINO').AsInteger;
        planilha.Cells[linhaInicio, 3] := ado_proc_consulta_treino_atual.FieldByName('REPETICOES_EXERCICIO_TREINO').AsString;
        planilha.Cells[linhaInicio, 4] := ado_proc_consulta_treino_atual.FieldByName('TEMPO_EXERCICIO_TREINO').AsString;
        planilha.Cells[linhaInicio, 5] := ado_proc_consulta_treino_atual.FieldByName('CARGA_EXERCICIO_TREINO').AsString;
        planilha.Cells[linhaInicio, 6] := ado_proc_consulta_treino_atual.FieldByName('OBS_EXERCICIO_TREINO').AsString;
        planilha.Cells[linhaInicio, 7] := ado_proc_consulta_treino_atual.FieldByName('DESCRICAO_EXERCICIO').AsString;

        linhaInicio := linhaInicio + 1;
        ado_proc_consulta_treino_atual.Next;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao preencher detalhes do treino do dia: ' + E.Message);
  end;

end;

procedure Tform_consulta_treino_atual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_consulta_treino_atual := Nil;
  form_consulta_treino_atual.Free;
end;

end.

unit Unit_Monta_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.Objects, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Controls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Fmx.Bind.Navigator,
  Data.Bind.Grid, FMX.Grid, Data.Bind.DBScope;

type
  Tform_monta_treino = class(TForm)
    pnl_fundo: TRectangle;
    scr_box_fundo: TScrollBox;
    pnl_info: TRectangle;
    scr_box: TScrollBox;
    lbl_mdl_treino: TLabel;
    lbl_fco_treino: TLabel;
    MenuBar1: TMenuBar;
    btn_menu_add_ficha_a: TRectangle;
    lbl_dsc_menu: TLabel;
    lbl_btn_menu_add_ficha_a: TLabel;
    StyleBook1: TStyleBook;
    S: TRectangle;
    lbl_cbx_grup_muscular: TLabel;
    cbx_grup_muscular: TComboBox;
    pnl_grup_muscular: TRectangle;
    pnl_fundo_exercicios: TRectangle;
    pnl_fun_ficha_treino: TRectangle;
    btn_ins_ficha: TRectangle;
    lbl_btn_ins_ficha: TLabel;
    tit_fund_ficha: TLabel;
    btn_rem_ficha: TRectangle;
    lbl_btn_rem_ficha: TLabel;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    btn_ficha_p_cad: TRectangle;
    lbl_btn_ficha_p_cad: TLabel;
    btn_alt_ord_exe: TRectangle;
    lbl_btn_alt_ord_exe: TLabel;
    pnl_fund_menu_ficha: TRectangle;
    lbl_tit_fun_cad_treino: TLabel;
    grid_lista_exerc_musc: TStringGrid;
    BindingsList1: TBindingsList;
    lbl_edt_grup_dia: TLabel;
    edt_grup_dia: TEdit;
    btn_add_espec_ficha: TRectangle;
    lbl_btn_add_espec_ficha: TLabel;
    BindSourceDB2: TBindSourceDB;
    grid_ficha_treino: TStringGrid;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    NavigatorBindSourceDB2: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_menu_add_ficha_aMouseEnter(Sender: TObject);
    procedure btn_menu_add_ficha_aMouseLeave(Sender: TObject);
    procedure btn_ins_fichaMouseEnter(Sender: TObject);
    procedure btn_ins_fichaMouseLeave(Sender: TObject);
    procedure btn_rem_fichaMouseEnter(Sender: TObject);
    procedure btn_rem_fichaMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_gravarMouseEnter(Sender: TObject);
    procedure btn_gravarMouseLeave(Sender: TObject);
    procedure btn_ficha_p_cadMouseEnter(Sender: TObject);
    procedure btn_ficha_p_cadMouseLeave(Sender: TObject);
    procedure btn_add_espec_fichaClick(Sender: TObject);
    procedure cbx_grup_muscularChange(Sender: TObject);
    procedure btn_ins_fichaClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
  private
    { Private declarations}
    SelectedButton : TRectangle;
    FSelectedButton : TRectangle;
    FButtonIDs: TArray<Integer>;
    procedure Criabtn_menu;
    procedure btn_menuMouseEnter(Sender: TObject);
    procedure btn_menuMouseLeave(Sender: TObject);
    procedure btn_menuClick(Sender: TObject);
    procedure ShowEspecTreinoDia;
  public
    { Public declarations }
    id_aluno, Nr_Fichas, id_treino, treino_dia,
    exercicio_i : integer;
    nome_exercicio, espec_treino_dia,  grupo_muscular : string;
    Function DefinirNrFichas(Valor: Integer) : Integer;
  end;

var
  form_monta_treino: Tform_monta_treino;

implementation

{$R *.fmx}

uses Unit_Exercicio_Ficha_Treino, Unit_Info_Basica_Treino, Unit_DM_Treino,
  Unit_DM_Principal, Unit_Dia_Ficha_Treino, Unit_Finaliza_Monta_Treino;



Function Tform_monta_treino.DefinirNrFichas(Valor: Integer) : Integer;
begin
  Nr_Fichas := Valor;
end;

procedure Tform_monta_treino.btn_menuClick(Sender: TObject);
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
        espec_treino_dia := ado_query_ficha_treinoGRUPO_MUSCULAR_TREINO_DIA.AsString
      else
        espec_treino_dia := '';
      lbl_tit_fun_cad_treino.Text := ado_query_ficha_treinoFICHA_TREINO_DIA.AsString;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;

end;

procedure Tform_monta_treino.btn_menuMouseEnter(Sender: TObject);
begin
  if Sender <> FSelectedButton then
    TRectangle(Sender).Fill.Color := $FFE0EEF8;
end;

procedure Tform_monta_treino.btn_menuMouseLeave(Sender: TObject);
begin
  if Sender <> FSelectedButton then
    TRectangle(Sender).Fill.Color := $FFFFFFFF;
end;

procedure Tform_monta_treino.Criabtn_menu;
var
  i : integer;
  btn_menu : TRectangle;
  lbl_btn_menu : TLabel;
  letra, ficha_treino_desc : string;
begin
  Nr_Fichas := Unit_Info_Basica_Treino.form_info_bsc_treino.i;
  SetLength(FButtonIDs, Nr_Fichas + 1);
  for i := 0 to Nr_Fichas do
      begin
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
        ficha_treino_desc := lbl_btn_menu.Text;


        btn_menu.OnMouseEnter := btn_menuMouseEnter;
        btn_menu.OnMouseLeave := btn_menuMouseLeave;
        btn_menu.OnClick := btn_menuClick;


        with dm_treino.ado_proc_cad_treino_dia do
        begin
          Parameters.ParamByname('@TREINO_TREINO_DIA').Value := id_treino;
          Parameters.ParamByname('@FICHA_TREINO_DIA').Value := ficha_treino_desc;
          Parameters.ParamByname('@GRUPO_MUSCULAR_TREINO_DIA').Value := null;
          ExecProc;
          treino_dia := Parameters.ParamByName('@RETURN_VALUE').Value;
        end;

        btn_menu.Tag := treino_dia;
        FButtonIDs[i] := treino_dia;

        if letra = 'A' then
        begin
          SelectedButton := btn_menu;
          SelectedButton.Fill.Color := $FF9FB1F5;
        end;
      end;

end;

procedure Tform_monta_treino.FormCreate(Sender: TObject);
begin
  id_treino := form_info_bsc_treino.id_treino;
  Criabtn_menu;
  btn_ficha_p_cad.Visible := False;


  try
    with dm_treino do
    begin
      ado_query_consulta_grup_musc.Close;
      ado_query_consulta_grup_musc.Open;
      while not ado_query_consulta_grup_musc.Eof do
      begin
        cbx_grup_muscular.Items.Add(ado_query_consulta_grup_musc.FieldByName('NOME_GRUPO_MUSCULAR').AsString);
        ado_query_consulta_grup_musc.Next;
      end;
      btn_menuClick(SelectedButton);
    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Lista de Grupos Musculares; Cadastro de Treino.');
  end;

end;

procedure Tform_monta_treino.ShowEspecTreinoDia;
begin
  form_dia_ficha_treino := Tform_dia_ficha_treino.Create(Application);
  form_dia_ficha_treino.ShowModal;
end;

procedure Tform_monta_treino.btn_add_espec_fichaClick(Sender: TObject);
begin
  form_dia_ficha_treino := Tform_dia_ficha_treino.Create(Application);
  form_dia_ficha_treino.id_treino_dia := id_treino;
  form_dia_ficha_treino.ShowModal;
end;

procedure Tform_monta_treino.cbx_grup_muscularChange(Sender: TObject);
begin
  grupo_muscular := cbx_grup_muscular.Selected.Text;
  Try
    with dm_treino do
    begin
      ado_query_lista_exe_grp_musc.Close;
      ado_query_lista_exe_grp_musc.Parameters.ParamByName('GRUPO_MUSCULAR').Value := grupo_muscular;
      ado_query_lista_exe_grp_musc.Open;
      if ado_query_lista_exe_grp_musc.RecordCount > 0 then
        btn_ins_ficha.Enabled := True
      else
        btn_ins_ficha.Enabled := False;
    end;
  except
    on E: Exception do
        ShowMessage('Erro: ' + E.Message + ' Lista de Exercícios.');
  end;
end;

procedure Tform_monta_treino.btn_ficha_p_cadMouseEnter(Sender: TObject);
begin
  btn_ficha_p_cad.Fill.Color := $FF214358;
  lbl_btn_ficha_p_cad.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_monta_treino.btn_ficha_p_cadMouseLeave(Sender: TObject);
begin
  btn_ficha_p_cad.Fill.Color := $FF03223F;
  lbl_btn_ficha_p_cad.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_monta_treino.btn_gravarClick(Sender: TObject);
begin
  form_finaliza_treino.Create(Application);
  form_finaliza_treino.ShowModal;
end;

procedure Tform_monta_treino.btn_gravarMouseEnter(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF214358;
  lbl_btn_gravar.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_monta_treino.btn_gravarMouseLeave(Sender: TObject);
begin
  btn_gravar.Fill.Color := $FF03223F;
  lbl_btn_gravar.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_monta_treino.btn_menu_add_ficha_aMouseEnter(Sender: TObject);
begin
  btn_menu_add_ficha_a.Fill.Color := $FFE0EEF8;
  lbl_btn_menu_add_ficha_a.TextSettings.FontColor := $00000080;
end;

procedure Tform_monta_treino.btn_menu_add_ficha_aMouseLeave(Sender: TObject);
begin
  btn_menu_add_ficha_a.Fill.Color := $FFFFFFFF;
  lbl_btn_menu_add_ficha_a.TextSettings.FontColor := $00000080;
end;

procedure Tform_monta_treino.btn_rem_fichaMouseEnter(Sender: TObject);
begin
  btn_rem_ficha.Fill.Color := $FF214358;
  lbl_btn_rem_ficha.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_monta_treino.btn_rem_fichaMouseLeave(Sender: TObject);
begin
  btn_rem_ficha.Fill.Color := $FF03223F;
  lbl_btn_rem_ficha.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_monta_treino.btn_ins_fichaClick(Sender: TObject);
begin
  Try
    with dm_treino do
    begin
      exercicio_i := ado_query_lista_exe_grp_muscID_EXERCICIO.AsInteger;
      if exercicio_i > 0 then
      begin
        nome_exercicio := ado_query_lista_exe_grp_muscNOME_EXERCICIO.AsString;
        form_exercicio_ficha_treino := Tform_exercicio_ficha_treino.Create(Application);
        try
          with Unit_Exercicio_Ficha_Treino.form_exercicio_ficha_treino do
          begin
            ShowModal;
          end;
          finally
            form_exercicio_ficha_treino.Free;
        end;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

procedure Tform_monta_treino.btn_ins_fichaMouseEnter(Sender: TObject);
begin
  btn_ins_ficha.Fill.Color := $FF214358;
  lbl_btn_ins_ficha.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_monta_treino.btn_ins_fichaMouseLeave(Sender: TObject);
begin
  btn_ins_ficha.Fill.Color := $FF03223F;
  lbl_btn_ins_ficha.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_monta_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dm_treino do
  begin
    ado_proc_cancela_treino.Parameters.ParamByName('@ID_TREINO').Value := id_treino;
    ado_proc_cancela_treino.ExecProc;
  end;
  form_monta_treino := nil;
  form_monta_treino.Free;
end;


end.

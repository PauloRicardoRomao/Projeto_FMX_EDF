unit Unit_Info_Basica_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.DialogService;

type
  Tform_info_bsc_treino = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    lbl_fco_treino: TLabel;
    cbx_fco_treino: TComboBox;
    lbl_mdl_treino: TLabel;
    cbx_mdl_treino: TComboBox;
    Label3: TLabel;
    mmo_obs_treino: TMemo;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_treino: TLabel;
    Label1: TLabel;
    edt_nr_treino: TEdit;
    btn_grava_inf_bsc: TRectangle;
    lbl_btn_grava_inf_bsc: TLabel;
    procedure btn_grava_inf_bscMouseEnter(Sender: TObject);
    procedure btn_grava_inf_bscMouseLeave(Sender: TObject);
    procedure btn_grava_inf_bscClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_aluno, i, id_treino, nr_treino : integer;
  end;

var
  form_info_bsc_treino: Tform_info_bsc_treino;

implementation

{$R *.fmx}

uses Unit_Monta_Treino, Unit_DM_Principal, Unit_DM_Treino,
  Unit_Popup_Card_Aluno;



procedure Tform_info_bsc_treino.FormCreate(Sender: TObject);
begin
  id_aluno := form_popup_card_aluno.id_aluno;
  id_treino := 0;
  with dm_treino do
  begin
    ado_query_consulta_nr_treinos.Close;
    ado_query_consulta_nr_treinos.Parameters.ParamByName('ID_ALUNO').Value := id_aluno;
    ado_query_consulta_nr_treinos.Open;
    nr_treino := ado_query_consulta_nr_treinosPROXIMO_NR_TREINO.AsInteger;
  end;
  edt_nr_treino.Text := IntToStr(nr_treino+1);
end;

procedure Tform_info_bsc_treino.btn_grava_inf_bscClick(Sender: TObject);
var
  formMontaTreino: Tform_monta_treino;
  foco_treino, modelo_treino, obs_treino : string;
begin
  if (cbx_fco_treino.ItemIndex = -1) or (cbx_mdl_treino.ItemIndex = -1) then
  Begin
    ShowMessage('Preencha os campos faltantes!');
    Exit;
  End;

  if (cbx_fco_treino.ItemIndex <> -1) and (cbx_mdl_treino.ItemIndex <> -1) then
  begin
    i := cbx_mdl_treino.ItemIndex;

    nr_treino := StrToInt(edt_nr_treino.Text);
    foco_treino := cbx_fco_treino.Selected.Text;
    modelo_treino := cbx_mdl_treino.Selected.Text;
    obs_treino := mmo_obs_treino.Lines.Text;
    try
      with dm_treino.ado_proc_cad_info_basic_treino do
      begin
        Parameters.ParamByName('@ALUNO_TREINO').Value := id_aluno;
        Parameters.ParamByName('@NR_TREINO_ALUNO').Value := nr_treino;
        Parameters.ParamByName('@FOCO_TREINO').Value := foco_treino;
        Parameters.ParamByName('@MODELO_TREINO').Value := modelo_treino;
        Parameters.ParamByName('@OBS_TREINO').Value := obs_treino;
        ExecProc;
        id_treino := Parameters.ParamByName('@RETURN_VALUE').Value;
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro: ' + E.Message);
      end;

    end;

    form_monta_treino := Tform_monta_treino.Create(Application);
    try
      with Unit_Monta_Treino.form_monta_treino do
      begin
        lbl_mdl_treino.Text := lbl_mdl_treino.Text + ' ' + cbx_mdl_treino.Selected.Text;
        lbl_fco_treino.Text := lbl_fco_treino.Text + ' ' + cbx_fco_treino.Selected.Text;
        DefinirNrFichas(i);
        ShowModal;
      end;
      finally
        form_monta_treino.Free;
    end;

    form_info_bsc_treino.Close;
  end;

end;

procedure Tform_info_bsc_treino.btn_grava_inf_bscMouseEnter(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_info_bsc_treino.btn_grava_inf_bscMouseLeave(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_info_bsc_treino.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  dlgResult: TModalResult;
begin
  if id_treino > 0 then
  begin
    with dm_treino do
    begin
      ado_query_verifica_ficha_treino_dia.Close;
      ado_query_verifica_ficha_treino_dia.Parameters.ParamByName('ID_TREINO').Value := id_treino;
      ado_query_verifica_ficha_treino_dia.Open;
      if ado_query_verifica_ficha_treino_dia.RecordCount = 0 then
      begin
      //////////
        dlgResult := MessageDlg('Não há fichas cadastradas. O treino será cancelado, deseja sair mesmo assim?', TMsgDlgType.mtConfirmation, mbYesNo, 0);

        if dlgResult = mrYes then
        begin
          ado_proc_exclui_treino.Parameters.ParamByName('@ID_TREINO').Value := id_treino;
          ado_proc_exclui_treino.ExecProc;

          form_info_bsc_treino := nil;
          form_info_bsc_treino.Free;
        end
        else
        begin
           Exit;
        end;
      /////////
      end;
    end;
  end
  else
  begin
    form_info_bsc_treino := nil;
    form_info_bsc_treino.Free;
  end;
end;

end.

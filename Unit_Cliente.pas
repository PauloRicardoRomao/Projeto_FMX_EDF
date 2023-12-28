unit Unit_Cliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.DateTimeCtrls;

type
  Tform_aluno = class(TForm)
    pnl_fundo: TRectangle;
    scr_box: TScrollBox;
    pnl_info: TRectangle;
    scr_box_fundo: TScrollBox;
    mnu_cad: TMenuBar;
    menu_info_basic: TMenuItem;
    menu_anamnese: TMenuItem;
    menu_med_corp: TMenuItem;
    StyleBook1: TStyleBook;
    lbl_nome: TLabel;
    lbl_data_nasc: TLabel;
    lbl_sexo: TLabel;
    lbl_altura: TLabel;
    edt_altura: TEdit;
    lbl_peso_base: TLabel;
    edt_peso_base: TEdit;
    lbl_obj: TLabel;
    lbl_nvl_ativ: TLabel;
    edt_data_nasc: TDateEdit;
    cbx_sexo: TComboBox;
    mmo_obj: TMemo;
    cbx_nvl_ativ: TComboBox;
    pnl_foto: TRectangle;
    img_cad: TImage;
    Label1: TLabel;
    pnl_fundo_info_basic: TRectangle;
    pnl_fundo_anamnese: TRectangle;
    lbl_rest_alim: TLabel;
    lbl_medicamentos: TLabel;
    lbl_condic_med: TLabel;
    lbl_pressao_art: TLabel;
    lbl_obs: TLabel;
    Memo1: TMemo;
    lbl_freq_card_base: TLabel;
    lbl_hist_exerc: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    btn_limpar_form: TRectangle;
    lbl_limpar_form: TLabel;
    pnl_fundo_med_corp: TRectangle;
    lbl_cir_bra_esq: TLabel;
    lbl_cir_alt: TLabel;
    DateEdit1: TDateEdit;
    lbl_cir_data: TLabel;
    lbl_cir_per_esq: TLabel;
    lbl_cir_abd: TLabel;
    lbl_cir_bra_dir: TLabel;
    lbl_cir_peso: TLabel;
    lbl_cir_per_dir: TLabel;
    lbl_cir_pan_dir: TLabel;
    lbl_cir_pan_esq: TLabel;
    lbl_cir_cin: TLabel;
    lbl_cir_qua: TLabel;
    lbl_cic_pei: TLabel;
    lbl_cir_out_med: TLabel;
    edt_cir_alt: TEdit;
    edt_cir_pei: TEdit;
    edt_cir_abd: TEdit;
    edt_cir_bra_dir: TEdit;
    edt_cir_bra_esq: TEdit;
    edt_cir_per_esq: TEdit;
    edt_cir_per_dir: TEdit;
    edt_cir_pan_esq: TEdit;
    edt_cir_pan_dir: TEdit;
    edt_cir_qua: TEdit;
    edt_cir_cin: TEdit;
    edt_cir_peso: TEdit;
    mmo_cir_out_med: TMemo;
    btn_grava_med_cir: TRectangle;
    lbl_btn_grava_med_cir: TLabel;
    btn_lmp_med_cir: TRectangle;
    lbl_btn_lmp_med_cir: TLabel;
    pnl_fundo_med_cir: TRectangle;
    btn_grava_inf_bsc: TRectangle;
    lbl_btn_grava_inf_bsc: TLabel;
    btn_lmp_inf_bsc: TRectangle;
    lbl_btn_lmp_inf_bsc: TLabel;
    lbl_tit_fun_inf_bsc: TLabel;
    lbl_tit_fun_anm_med: TLabel;
    edt_prs_art_base: TEdit;
    edt_frq_cdc_base: TEdit;
    lbl_tit_fun_med_cir: TLabel;
    btn_grava_anm_med: TRectangle;
    lbl_btn_grava_anm_med: TLabel;
    btn_lmp_anm_med: TRectangle;
    lbl_btn_lmp_anm_med: TLabel;
    pnl_fundo_med_dob_cut: TRectangle;
    lbl_db_sub_med_dob_cut: TLabel;
    edt_db_sub_med_dob_cut: TEdit;
    lbl_db_sup_med_dob_cut: TLabel;
    edt_db_sup_med_dob_cut: TEdit;
    lbl_db_trc_med_dob_cut: TLabel;
    edt_db_trc_med_dob_cut: TEdit;
    lbl_db_pnm_med_dob_cut: TLabel;
    edt_db_pnm_med_dob_cut: TEdit;
    lbl_db_axl_med_dob_cut: TLabel;
    edt_db_axl_med_dob_cut: TEdit;
    lbl_data_med_dob_cut: TLabel;
    edt_data_med_dob_cut: TDateEdit;
    lbl_out_med_dob_cut: TLabel;
    mmo_out_med_dob_cut: TMemo;
    lbl_db_bcp_med_dob_cut: TLabel;
    edt_db_bcp_med_dob_cut: TEdit;
    lbl_db_abd_med_dob_cut: TLabel;
    edt_db_abd_med_dob_cut: TEdit;
    btn_grava_db_cut: TRectangle;
    lbl_btn_grava_db_cut: TLabel;
    btn_lmp_db_cut: TRectangle;
    lbl_btn_lmp_db_cut: TLabel;
    lbl_tit_fun_med_dob_cut: TLabel;
    menu_med_corp_cir: TMenuItem;
    menu_med_corp_dob_cut: TMenuItem;
    lbl_dsc_menu: TLabel;
    procedure menu_info_basicClick(Sender: TObject);
    procedure menu_anamneseClick(Sender: TObject);
    procedure menu_med_corp_cirClick(Sender: TObject);
    procedure menu_med_corp_dob_cutClick(Sender: TObject);
    procedure btn_grava_med_cirMouseEnter(Sender: TObject);
    procedure btn_grava_anm_medMouseEnter(Sender: TObject);
    procedure btn_lmp_anm_medMouseEnter(Sender: TObject);
    procedure btn_lmp_anm_medMouseLeave(Sender: TObject);
    procedure btn_grava_anm_medMouseLeave(Sender: TObject);
    procedure btn_lmp_inf_bscMouseEnter(Sender: TObject);
    procedure btn_lmp_inf_bscMouseLeave(Sender: TObject);
    procedure btn_grava_inf_bscMouseEnter(Sender: TObject);
    procedure btn_grava_inf_bscMouseLeave(Sender: TObject);
    procedure btn_grava_med_cirMouseLeave(Sender: TObject);
    procedure btn_lmp_med_cirMouseLeave(Sender: TObject);
    procedure btn_lmp_med_cirMouseEnter(Sender: TObject);
    procedure btn_grava_db_cutMouseEnter(Sender: TObject);
    procedure btn_grava_db_cutMouseLeave(Sender: TObject);
    procedure btn_lmp_db_cutMouseLeave(Sender: TObject);
    procedure btn_lmp_db_cutMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_aluno: Tform_aluno;

implementation

{$R *.fmx}


procedure Tform_aluno.menu_info_basicClick(Sender: TObject);
begin
  pnl_fundo_anamnese.Visible := False;
  pnl_fundo_med_corp.Visible := False;
  pnl_fundo_med_dob_cut.Visible := False;
  pnl_fundo_med_cir.Visible := False;
  if pnl_fundo_info_basic.Visible = False then
    pnl_fundo_info_basic.Visible := True
  else
    pnl_fundo_info_basic.Visible := False;
end;

procedure Tform_aluno.btn_grava_anm_medMouseEnter(Sender: TObject);
begin
  btn_grava_anm_med.Fill.Color := $FF214358;
  lbl_btn_grava_anm_med.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_grava_anm_medMouseLeave(Sender: TObject);
begin
  btn_grava_anm_med.Fill.Color := $FF03223F;
  lbl_btn_grava_anm_med.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_grava_db_cutMouseEnter(Sender: TObject);
begin
  btn_grava_db_cut.Fill.Color := $FF214358;
  lbl_btn_grava_db_cut.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_grava_db_cutMouseLeave(Sender: TObject);
begin
  btn_grava_db_cut.Fill.Color := $FF03223F;
  lbl_btn_grava_db_cut.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_grava_inf_bscMouseEnter(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_grava_inf_bscMouseLeave(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_grava_med_cirMouseEnter(Sender: TObject);
begin
  btn_grava_med_cir.Fill.Color := $FF214358;
  lbl_btn_grava_med_cir.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_grava_med_cirMouseLeave(Sender: TObject);
begin
  btn_grava_med_cir.Fill.Color := $FF03223F;
  lbl_btn_grava_med_cir.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_lmp_anm_medMouseEnter(Sender: TObject);
begin
  btn_lmp_anm_med.Fill.Color := $FF214358;
  lbl_btn_lmp_anm_med.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_lmp_anm_medMouseLeave(Sender: TObject);
begin
  btn_lmp_anm_med.Fill.Color := $FF03223F;
  lbl_btn_lmp_anm_med.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_lmp_db_cutMouseEnter(Sender: TObject);
begin
  btn_lmp_db_cut.Fill.Color := $FF214358;
  lbl_btn_lmp_db_cut.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_lmp_db_cutMouseLeave(Sender: TObject);
begin
  btn_lmp_db_cut.Fill.Color := $FF03223F;
  lbl_btn_lmp_db_cut.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_lmp_inf_bscMouseEnter(Sender: TObject);
begin
  btn_lmp_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_lmp_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_lmp_inf_bscMouseLeave(Sender: TObject);
begin
  btn_lmp_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_lmp_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.btn_lmp_med_cirMouseEnter(Sender: TObject);
begin
  btn_lmp_med_cir.Fill.Color := $FF214358;
  lbl_btn_lmp_med_cir.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_aluno.btn_lmp_med_cirMouseLeave(Sender: TObject);
begin
  btn_lmp_med_cir.Fill.Color := $FF03223F;
  lbl_btn_lmp_med_cir.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_aluno.menu_anamneseClick(Sender: TObject);
begin
  pnl_fundo_info_basic.Visible := False;
  pnl_fundo_med_corp.Visible := False;
  pnl_fundo_med_dob_cut.Visible := False;
  pnl_fundo_med_cir.Visible := False;
  if pnl_fundo_anamnese.Visible = False then
    pnl_fundo_anamnese.Visible := True
  else
    pnl_fundo_anamnese.Visible := False;
end;

procedure Tform_aluno.menu_med_corp_cirClick(Sender: TObject);
begin
  pnl_fundo_info_basic.Visible := False;
  pnl_fundo_anamnese.Visible := False;
  pnl_fundo_med_dob_cut.Visible := False;
  pnl_fundo_med_corp.Visible := True;
  if pnl_fundo_med_cir.Visible = False then
    pnl_fundo_med_cir.Visible := True
  else
    pnl_fundo_med_cir.Visible := False;
end;

procedure Tform_aluno.menu_med_corp_dob_cutClick(Sender: TObject);
begin
  pnl_fundo_info_basic.Visible := False;
  pnl_fundo_anamnese.Visible := False;
  pnl_fundo_med_cir.Visible := False;
  pnl_fundo_med_corp.Visible := True;
  if pnl_fundo_med_dob_cut.Visible = False then
    pnl_fundo_med_dob_cut.Visible := True
  else
    pnl_fundo_med_dob_cut.Visible := False;
end;

procedure Tform_aluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form_aluno := nil;
  form_aluno.Free;
end;


end.

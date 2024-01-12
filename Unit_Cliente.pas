{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
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
    edt_nome: TEdit;
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
    edt_data_cir: TDateEdit;
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
    procedure btn_lmp_anm_medClick(Sender: TObject);
    procedure btn_lmp_inf_bscClick(Sender: TObject);
    procedure btn_lmp_med_cirClick(Sender: TObject);
    procedure btn_lmp_db_cutClick(Sender: TObject);
    procedure btn_grava_inf_bscClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_aluno: Tform_aluno;

implementation

{$R *.fmx}

uses Unit_DM_Principal;


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
          TMemo(TLabel(Rectangle.Children[i]).Children[j]).Lines.Clear
        else if TLabel(Rectangle.Children[i]).Children[j] is TComboBox then
          TComboBox(TLabel(Rectangle.Children[i]).Children[j]).ItemIndex := -1;
      end;
    end;
  end;
end;

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

procedure Tform_aluno.btn_grava_inf_bscClick(Sender: TObject);
var
  nome, sexo, data_nascimento, objetivo, nivel_atividade, foto :  string;
  //data_nascimento : Tdate;
  altura, peso : currency;
begin

  if edt_nome.Text = '' then
  begin
    ShowMessage('Necessário preencher o campo NOME!');
    edt_nome.SetFocus;
    Exit;
  end;


  //nome := edt_nome.Text;
  data_nascimento := edt_data_nasc.Text;
  sexo := cbx_sexo.Selected.Text;
  altura := StrToCurr(edt_altura.Text);
  peso := StrToCurr(edt_peso_base.Text);
  objetivo := mmo_obj.Lines.Text;
  nivel_atividade := cbx_nvl_ativ.Selected.Text;
  //foto :=

  if edt_nome.Text <> '' then
  begin
    Try
      with dm_principal do
      begin
        with ado_proc_cad_aluno_info_basic.Parameters do
        begin
          ParamByName('@NOME_ALUNO').Value := nome;
          ParamByName('@DATA_NASCIMENTO_ALUNO').Value := data_nascimento;
          ParamByName('@SEXO_ALUNO').Value := sexo;
          ParamByName('@ALTURA_ALUNO').Value := altura;
          ParamByName('@PESO_ALUNO').Value := peso;
          ParamByName('@OBJETIVO_ALUNO').Value := objetivo;
          ParamByName('@NIVEL_ATIVIDADE_ALUNO').Value := nivel_atividade;
          ParamByName('@FOTO_ALUNO').Value := null;
          ado_proc_cad_aluno_info_basic.ExecProc;
        end;
      end;
    Except
      ShowMessage('Erro não especificado!'); //TROCAR DEPOIS
    End;
  end;
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

procedure Tform_aluno.btn_lmp_anm_medClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_anamnese);
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

procedure Tform_aluno.btn_lmp_db_cutClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_med_dob_cut);
  edt_data_med_dob_cut.Date := Now;
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

procedure Tform_aluno.btn_lmp_inf_bscClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_info_basic);
  edt_data_nasc.Date := Now;
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

procedure Tform_aluno.btn_lmp_med_cirClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fundo_med_cir);
  edt_data_cir.Date := Now;
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

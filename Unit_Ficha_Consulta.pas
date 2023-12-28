unit Unit_Ficha_Consulta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Menus, FMX.Layouts;

type
  Tform_ficha_consulta = class(TForm)
    pnl_fundo_med_corp: TRectangle;
    pnl_fundo_med_cir: TRectangle;
    lbl_cic_pei: TLabel;
    edt_cir_pei: TEdit;
    lbl_cir_abd: TLabel;
    edt_cir_abd: TEdit;
    lbl_cir_alt: TLabel;
    edt_cir_alt: TEdit;
    lbl_cir_bra_dir: TLabel;
    edt_cir_bra_dir: TEdit;
    lbl_cir_bra_esq: TLabel;
    edt_cir_bra_esq: TEdit;
    lbl_cir_cin: TLabel;
    edt_cir_cin: TEdit;
    lbl_cir_data: TLabel;
    DateEdit1: TDateEdit;
    lbl_cir_out_med: TLabel;
    mmo_cir_out_med: TMemo;
    lbl_cir_pan_dir: TLabel;
    edt_cir_pan_dir: TEdit;
    lbl_cir_pan_esq: TLabel;
    edt_cir_pan_esq: TEdit;
    lbl_cir_per_dir: TLabel;
    edt_cir_per_dir: TEdit;
    lbl_cir_per_esq: TLabel;
    edt_cir_per_esq: TEdit;
    lbl_cir_peso: TLabel;
    edt_cir_peso: TEdit;
    lbl_cir_qua: TLabel;
    edt_cir_qua: TEdit;
    btn_grava_med_cir: TRectangle;
    lbl_btn_grava_med_cir: TLabel;
    btn_lmp_med_cir: TRectangle;
    lbl_btn_lmp_med_cir: TLabel;
    lbl_tit_fun_med_cir: TLabel;
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
    StyleBook1: TStyleBook;
    mnu_cad: TMenuBar;
    menu_med_corp_cir: TMenuItem;
    menu_med_corp_dob_cut: TMenuItem;
    lbl_dsc_menu: TLabel;
    scr_box_fundo: TScrollBox;
    procedure menu_med_corp_cirClick(Sender: TObject);
    procedure menu_med_corp_dob_cutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_grava_med_cirMouseLeave(Sender: TObject);
    procedure btn_grava_med_cirMouseEnter(Sender: TObject);
    procedure btn_lmp_med_cirMouseEnter(Sender: TObject);
    procedure btn_lmp_med_cirMouseLeave(Sender: TObject);
    procedure btn_grava_db_cutMouseEnter(Sender: TObject);
    procedure btn_grava_db_cutMouseLeave(Sender: TObject);
    procedure btn_lmp_db_cutMouseEnter(Sender: TObject);
    procedure btn_lmp_db_cutMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_ficha_consulta: Tform_ficha_consulta;

implementation

{$R *.fmx}


procedure Tform_ficha_consulta.menu_med_corp_cirClick(Sender: TObject);
begin
  pnl_fundo_med_dob_cut.Visible := False;
  pnl_fundo_med_cir.Visible := True;
end;

procedure Tform_ficha_consulta.menu_med_corp_dob_cutClick(Sender: TObject);
begin
  pnl_fundo_med_cir.Visible := False;
  pnl_fundo_med_dob_cut.Visible := True;
end;

procedure Tform_ficha_consulta.btn_grava_db_cutMouseEnter(Sender: TObject);
begin
  btn_grava_db_cut.Fill.Color := $FF214358;
  lbl_btn_grava_db_cut.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_grava_db_cutMouseLeave(Sender: TObject);
begin
  btn_grava_db_cut.Fill.Color := $FF03223F;
  lbl_btn_grava_db_cut.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.btn_grava_med_cirMouseEnter(Sender: TObject);
begin
  btn_grava_med_cir.Fill.Color := $FF214358;
  lbl_btn_grava_med_cir.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_grava_med_cirMouseLeave(Sender: TObject);
begin
  btn_grava_med_cir.Fill.Color := $FF03223F;
  lbl_btn_grava_med_cir.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.btn_lmp_db_cutMouseEnter(Sender: TObject);
begin
  btn_lmp_db_cut.Fill.Color := $FF214358;
  lbl_btn_lmp_db_cut.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_lmp_db_cutMouseLeave(Sender: TObject);
begin
  btn_lmp_db_cut.Fill.Color := $FF03223F;
  lbl_btn_lmp_db_cut.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.btn_lmp_med_cirMouseEnter(Sender: TObject);
begin
  btn_lmp_med_cir.Fill.Color := $FF214358;
  lbl_btn_lmp_med_cir.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_ficha_consulta.btn_lmp_med_cirMouseLeave(Sender: TObject);
begin
  btn_lmp_med_cir.Fill.Color := $FF03223F;
  lbl_btn_lmp_med_cir.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_ficha_consulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  form_ficha_consulta := nil;
  form_ficha_consulta.Free;
end;

end.

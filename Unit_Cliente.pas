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
    Memo6: TMemo;
    Memo7: TMemo;
    btn_gravar: TRectangle;
    lbl_btn_gravar: TLabel;
    btn_limpar_form: TRectangle;
    lbl_limpar_form: TLabel;
    pnl_fundo_med_corp: TRectangle;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    Memo8: TMemo;
    Label7: TLabel;
    Edit3: TEdit;
    Label8: TLabel;
    ComboBox2: TComboBox;
    procedure menu_info_basicClick(Sender: TObject);
    procedure menu_anamneseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_aluno: Tform_aluno;

implementation

{$R *.fmx}

procedure Tform_aluno.menu_anamneseClick(Sender: TObject);
begin
  if pnl_fundo_anamnese.Visible = False then
  begin
    pnl_fundo_info_basic.Visible := False;
    pnl_fundo_anamnese.Visible := True;
  end
  else
    pnl_fundo_anamnese.Visible := False;
end;

procedure Tform_aluno.menu_info_basicClick(Sender: TObject);
begin
  if pnl_fundo_info_basic.Visible = False then
  begin
    pnl_fundo_anamnese.Visible := False;
    pnl_fundo_info_basic.Visible := True;
  end
  else
    pnl_fundo_info_basic.Visible := False;
end;

end.

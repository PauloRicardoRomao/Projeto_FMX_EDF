unit Unit_Exercicio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Layouts;

type
  Tform_exercicios = class(TForm)
    pnl_fun_cad_treino: TRectangle;
    lbl_fco_treino: TLabel;
    lbl_desc_exercicio: TLabel;
    StyleBook1: TStyleBook;
    lbl_tit_fun_cad_exercicio: TLabel;
    lbl_grup_muscular: TLabel;
    btn_grava_inf_bsc: TRectangle;
    lbl_btn_grava_inf_bsc: TLabel;
    btn_lmp_inf_bsc: TRectangle;
    lbl_btn_lmp_inf_bsc: TLabel;
    edt_nme_exercicio: TEdit;
    mmo_desc_exercicio: TMemo;
    cbx_grup_muscular: TComboBox;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToFieldNOME_GRUPO_MUSCULAR: TLinkListControlToField;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    procedure btn_grava_inf_bscMouseEnter(Sender: TObject);
    procedure btn_grava_inf_bscMouseLeave(Sender: TObject);
    procedure btn_lmp_inf_bscMouseEnter(Sender: TObject);
    procedure btn_lmp_inf_bscMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_lmp_inf_bscClick(Sender: TObject);
    procedure btn_grava_inf_bscClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_exercicios: Tform_exercicios;

implementation

{$R *.fmx}

uses Unit_DM_Principal, Unit_DM_Treino, Unit_Menu_Novo;

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

procedure Tform_exercicios.btn_grava_inf_bscClick(Sender: TObject);
var
  exercicio, descricao, musculo : string;
  id_musculo : integer;
begin
  if (edt_nme_exercicio.Text = '') or (cbx_grup_muscular.ItemIndex = -1) then
  begin
    ShowMessage('� necess�rio informar o NOME e selecionar o GRUPO MUSCULAR');
    Exit;
  end;

  exercicio := edt_nme_exercicio.Text;
  descricao := mmo_desc_exercicio.Lines.Text;
  musculo := cbx_grup_muscular.Selected.Text;

  with dm_treino do
  begin
    with ado_query_grup_musc_auxiliar do
    begin
      Close;
      Parameters.ParamByName('NOME_GRUPO_MUSCULAR').Value := musculo;
      Open;
    end;
    id_musculo := ado_query_grup_musc_auxiliarID_GRUPO_MUSCULAR.AsInteger;
  end;
  try
    with dm_principal.ado_proc_cad_exercicio do
    begin
      Parameters.ParamByName('@NOME_EXERCICIO').Value := exercicio;
      Parameters.ParamByName('@DESCRICAO_EXERCICIO').Value := descricao;
      Parameters.ParamByName('@GRUPO_MUSCULAR').Value := id_musculo;
      ExecProc;
    end;
    ShowMessage('Exerc�cio gravado com sucesso!');
    LimparControlesDentroDoRectangle(pnl_fun_cad_treino);
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + ' Cadastro de Exerc�cios.');
  end;
end;

procedure Tform_exercicios.btn_grava_inf_bscMouseEnter(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_exercicios.btn_grava_inf_bscMouseLeave(Sender: TObject);
begin
  btn_grava_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_grava_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_exercicios.btn_lmp_inf_bscClick(Sender: TObject);
begin
  LimparControlesDentroDoRectangle(pnl_fun_cad_treino);
end;

procedure Tform_exercicios.btn_lmp_inf_bscMouseEnter(Sender: TObject);
begin
  btn_lmp_inf_bsc.Fill.Color := $FF214358;
  lbl_btn_lmp_inf_bsc.TextSettings.FontColor := $FFFFFFFF;
end;

procedure Tform_exercicios.btn_lmp_inf_bscMouseLeave(Sender: TObject);
begin
  btn_lmp_inf_bsc.Fill.Color := $FF03223F;
  lbl_btn_lmp_inf_bsc.TextSettings.FontColor := TAlphaColorRec.BlanchedAlmond;
end;

procedure Tform_exercicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form_exercicios := nil;
  form_exercicios.Free;
end;

end.

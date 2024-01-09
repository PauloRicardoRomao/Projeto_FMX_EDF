unit Unit_Info_Basica_Treino;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

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
  private
    { Private declarations }
  public
    { Public declarations }
    i : integer;
  end;

var
  form_info_bsc_treino: Tform_info_bsc_treino;

implementation

{$R *.fmx}

uses Unit_Monta_Treino;


procedure Tform_info_bsc_treino.btn_grava_inf_bscClick(Sender: TObject);
var
 formMontaTreino: Tform_monta_treino;
begin
  if (cbx_fco_treino.ItemIndex = -1) or (cbx_mdl_treino.ItemIndex = -1) then
  Begin
    ShowMessage('Preencha os campos faltantes!');
    Exit;
  End;

  if (cbx_fco_treino.ItemIndex <> -1) and (cbx_mdl_treino.ItemIndex <> -1) then
  begin
    i := cbx_mdl_treino.ItemIndex;

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
begin
  form_info_bsc_treino := nil;
  form_info_bsc_treino.Free;
end;

end.

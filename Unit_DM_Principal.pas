unit Unit_DM_Principal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, Data.Win.ADODB;

type
  Tdm_principal = class(TDataModule)
    ado_connection: TADOConnection;
    ado_proc_cad_aluno_info_basic: TADOStoredProc;
    ado_proc_cad_aluno_anamnese: TADOStoredProc;
    ado_proc_cad_aluno_info_circ: TADOStoredProc;
    ado_proc_cad_aluno_dim_corp: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_principal: Tdm_principal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.

unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  Cep.Controller.Interfaces, Cep.Controller,
  Cep.Entity.impl,  Cep.Model.Entity, Cep.Model.entity.Interfaces;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MemoResultado: TMemo;
    cxEditCep: TEdit;
    Label1: TLabel;
    cxSelecionaApi: TComboBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LController: iCepController;
  LCep: ICep;
begin
  LController := TCepController.New;

  case cxSelecionaApi.ItemIndex of
    0  : LController.Buscar(cxEditCep.Text, '');
    1  : LController.Buscar(cxEditCep.Text, cxSelecionaApi.Text);
    2  : LController.Buscar(cxEditCep.Text, cxSelecionaApi.Text);
    3  : LController.Buscar(cxEditCep.Text, cxSelecionaApi.Text);
  end;

  LCep := LController.ObterCep;

  MemoResultado.Lines.Clear;
  MemoResultado.Lines.Add('CEP: ' + LCep.GetCep);
  MemoResultado.Lines.Add('Logradouro: ' + LCep.GetLogradouroRua);
  MemoResultado.Lines.Add('Complemento: ' + LCep.GetComplemento);
  MemoResultado.Lines.Add('Bairro: ' + LCep.GetBairro);
  MemoResultado.Lines.Add('Cidade: ' + LCep.GetLocalidadeCidade);
  MemoResultado.Lines.Add('UF: ' + LCep.GetUF);
  MemoResultado.Lines.Add('IBGE: ' + LCep.GetIBGE);
  MemoResultado.Lines.Add('DDD: ' + LCep.GetDDD);
  MemoResultado.Lines.Add('UNIDADE' + LCep.GetUnidade);
  MemoResultado.Lines.Add('ESTADO' + LCep.GetEstado);
  MemoResultado.Lines.Add('REGIAO' + LCep.GetRegiao);
  MemoResultado.Lines.Add('GIA' + LCep.GetGIA);
  MemoResultado.Lines.Add('SIAFI' + LCep.GetSIAFI);
  MemoResultado.Lines.Add('API :' + LCep.GetAPI);

  {view basica só executando as buscas e retornando os dados a UI/UX não foi tão utilizada assim
  mas é possivel montar algo mais bonito e layout organizado}

end;

end.

unit Teste.Principal;

interface

uses
  DUnitX.TestFramework,
  System.JSON,
  Cep.Controller,
  Cep.Controller.Interfaces,
  Cep.Service.Interfaces,
  Cep.Model.entity.Interfaces,
  system.SysUtils;

type
  [TestFixture]
  TMyTestObject = class
  private
    FCepController: ICepController;
    const Cep = '17522410';
    const ApiViaCep = 'viacep';
    const ApiAwesome = 'awesome';
    const ApiCep = 'apicep';
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure ValidaAPIViaCep;

    [Test]
    procedure ValidaAPIAwesome;

    [Test]
    procedure ValidaAPICep;
  end;

implementation

procedure TMyTestObject.Setup;
begin
  FCepController := TCepController.New;
end;

procedure TMyTestObject.TearDown;
begin
end;


procedure TMyTestObject.ValidaAPIAwesome;
var
  DadosCep: ICep;
  ApiUsada: string;
begin
  FCepController.Buscar(Cep, ApiAwesome);

  DadosCep := FCepController.ObterCep;

  Assert.IsNotNull(DadosCep, 'Teste ao enviar para o model não encontrou dados verifique a variavel cep de teste');

  ApiUsada := DadosCep.GetAPI;
  Assert.IsFalse(ApiUsada.Trim.IsEmpty, 'Nome da API usada está vazio');

  Assert.IsTrue(ApiUsada.ToLower.Contains('awesome api') , 'API Awesome testada');
end;

procedure TMyTestObject.ValidaAPICep;
var
  DadosCep: ICep;
  ApiUsada: string;
begin
  FCepController.Buscar(Cep, ApiCep);

  DadosCep := FCepController.ObterCep;

  Assert.IsNotNull(DadosCep, 'Teste ao enviar para o model não encontrou dados verifique a variavel cep de teste');

  ApiUsada := DadosCep.GetAPI;
  Assert.IsFalse(ApiUsada.Trim.IsEmpty, 'Nome da API usada está vazio ou caso for ApiCep ela se encontra fora do ar');

  Assert.IsTrue(
    ApiUsada.ToLower.Contains('api cep '), 'API Cep testada');
end;

procedure TMyTestObject.ValidaAPIViaCep;
var
  DadosCep: ICep;
  ApiUsada: string;
begin
  FCepController.Buscar(Cep, ApiViaCep);

  DadosCep := FCepController.ObterCep;

  Assert.IsNotNull(DadosCep, 'Teste ao enviar para o model não encontrou dados verifique a variavel cep de teste');

  ApiUsada := DadosCep.GetAPI;
  Assert.IsFalse(ApiUsada.Trim.IsEmpty, 'Nome da API usada está vazio');

  Assert.IsTrue(
    ApiUsada.ToLower.Contains('via cep api') , 'API Via Cep Testada');
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.

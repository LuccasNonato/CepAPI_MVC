unit Controller.APICEP.DMVC;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,
  MVCFramework.Nullables,
  System.Generics.Collections,
  JsonDataObjects,
  Cep.Controller,
  Cep.Controller.Interfaces,
  Cep.Service.Interfaces,
  Cep.Model.entity.Interfaces;

type
  [MVCPath('/api')]
  TControllerCep = class(TMVCController)
  public
    [MVCPath('/cep/($Value)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    function GetCep(const Value: String): TJSONObject;
  end;

implementation

uses
  System.SysUtils,
  MVCFramework.Logger;

function TControllerCep.GetCep(const Value: String): TJSONObject;
var
  Controller: iCepController;
  CepData: ICep;
begin
  try
    Controller := TCepController.New.Buscar(Value, '');
    CepData := Controller.ObterCep;

    if Assigned(CepData) then
    begin
      Result := TJSONObject.Create;
      Result.S['cep'] := CepData.GetCep;
      Result.S['logradouro'] := CepData.GetLogradouroRua;
      Result.S['bairro'] := CepData.GetBairro;
      Result.S['cidade'] := CepData.GetLocalidadeCidade;
      Result.S['estado'] := CepData.GetEstado;
      Result.S['complemento'] := CepData.GetComplemento;
      Result.S['unidade'] := CepData.GetUnidade;
      Result.S['uf'] := CepData.GetUF;
      Result.S['ibge'] := CepData.GetIBGE;
      Result.S['gia'] := CepData.GetGIA;
      Result.S['ddd'] := CepData.GetDDD;
      Result.S['siafi'] := CepData.GetSIAFI;
      Result.S['API :'] := CepData.GetAPI;
    end
    else
      raise EMVCException.Create('CEP não encontrado');

  except
    on E: Exception do
    begin
      LogE('Erro ao buscar CEP: ' + E.Message);
      raise EMVCException.Create('Erro interno ao consultar CEP');
    end;
  end;
end;


end.


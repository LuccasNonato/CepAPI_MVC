unit Cep.Service.Strategy.ViaCep;

interface

uses
  Cep.Service.Strategy.Interfaces, Cep.Model.Entity.Interfaces;

type
  TCepViaCepStrategy = class(TInterfacedObject, ICepConsultaStrategy)
  public
    function Consultar(const ACep: string; Model: ICep): Boolean;
  end;

implementation

uses
  System.Net.HttpClient, System.JSON, System.SysUtils;

function TCepViaCepStrategy.Consultar(const ACep: string; Model: ICep): Boolean;
var
  Http: THttpClient;
  Resp: IHTTPResponse;
  Json: TJSONObject;
begin
  Result := False;
  Http := THttpClient.Create;

  try
    Resp := Http.Get('https://viacep.com.br/ws/' + ACep + '/json/');

    if Resp.StatusCode = 200 then
    begin
      Json := TJSONObject.ParseJSONValue(Resp.ContentAsString) as TJSONObject;

      if Assigned(Json) and not Json.GetValue<Boolean>('erro', False) then
      begin
        Model
          .SetCep(Json.GetValue<string>('cep'))
          .SetLogradouroRua(Json.GetValue<string>('logradouro'))
          .SetComplemento(Json.GetValue<string>('complemento'))
          .SetBairro(Json.GetValue<string>('bairro'))
          .SetLocalidadeCidade(Json.GetValue<string>('localidade'))
          .SetUF(Json.GetValue<string>('uf'))
          .SetIBGE(Json.GetValue<string>('ibge'))
          .SetGIA(Json.GetValue<string>('gia'))
          .SetDDD(Json.GetValue<string>('ddd'))
          .SetSIAFI(Json.GetValue<string>('siafi'))
          .SetEstado(Json.GetValue<string>('estado'))
          .SetUnidade(Json.GetValue<string>('unidade'))
          .SetAPI('VIA CEP API');
        Result := True;
      end;
      Json.Free;
    end
    else
    begin
      raise Exception.Create('API Retornou um erro pode estar indisponível no momento');   // esse exception não é o ideal porque ele trava o funcionamento mas vou mantelo para manter as ideias de tratativas
    end;
  except
    on E: Exception do
      Result := False;
  end;
  Http.Free;
end;

end.


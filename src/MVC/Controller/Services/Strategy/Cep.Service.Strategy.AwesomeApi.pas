unit Cep.Service.Strategy.AwesomeApi;

interface

uses
  Cep.Service.Strategy.Interfaces, Cep.Model.Entity.Interfaces;

type
  TCepAwesomeApiStrategy = class(TInterfacedObject, ICepConsultaStrategy)
  public
    function Consultar(const ACep: string; Model: ICep): Boolean;
  end;

implementation

uses
  System.Net.HttpClient, System.JSON, System.SysUtils;

function TCepAwesomeApiStrategy.Consultar(const ACep: string; Model: ICep): Boolean;
var
  Http: THttpClient;
  Resp: IHTTPResponse;
  Json: TJSONObject;
begin
  Result := False;
  Http := THttpClient.Create;

  try
    Resp := Http.Get('https://cep.awesomeapi.com.br/json/' + ACep);

    if Resp.StatusCode = 200 then
    begin
      Json := TJSONObject.ParseJSONValue(Resp.ContentAsString) as TJSONObject;
      if Assigned(Json) and not Json.GetValue<Boolean>('erro', False) then
      begin
        Model
          .SetCep(Json.GetValue<string>('cep'))
          .SetLogradouroRua(Json.GetValue<string>('address'))
          .SetBairro(Json.GetValue<string>('district'))
          .SetLocalidadeCidade(Json.GetValue<string>('city'))
          .SetIBGE(Json.GetValue<string>('city_ibge'))
          .SetEstado(Json.GetValue<string>('state'))
          .SetAPI('Awesome API');
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


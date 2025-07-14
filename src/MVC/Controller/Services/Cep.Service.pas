unit Cep.Service;

interface

uses
  Cep.Service.Interfaces, Cep.Model.Entity.Interfaces, System.SysUtils;

type
  TCepService = class(TInterfacedObject, ICepService)
  private
   const awesome = 'awesome';
   const viacep = 'viacep';
   const apicep = 'apicep';
  public
    function BuscarCep(const ACep: string; Model: ICep; Api : string): Boolean;
  end;

implementation

uses
  System.Generics.Collections,
  Cep.Service.Strategy.Interfaces,
  Cep.Service.Strategy.ViaCep,
  Cep.Service.Strategy.ApiCep,
  Cep.Service.Strategy.AwesomeApi;

function TCepService.BuscarCep(const ACep: string; Model: ICep; Api : string): Boolean;
var
  Strategies: TList<ICepConsultaStrategy>;
  Strategy: ICepConsultaStrategy;
  SelecionaApi: TDictionary<string, ICepConsultaStrategy>;

  { poderia ser utilizado com if também mas foi utilizado dictionary como exemplo de tecnicas
  também seguindo a ideia de if bom é if morto}
begin
  Result := False;

  SelecionaApi := TDictionary<string, ICepConsultaStrategy>.Create;
  Strategies := TList<ICepConsultaStrategy>.Create;

  try
    SelecionaApi.Add(viacep, TCepViaCepStrategy.Create);
    SelecionaApi.Add(apicep, TCepApiCepStrategy.Create);
    SelecionaApi.Add(awesome, TCepAwesomeApiStrategy.Create);


    if SelecionaApi.TryGetValue(LowerCase(Api), Strategy) then
    begin
      Result := Strategy.Consultar(ACep, Model);
    end
    else
    begin
     Strategies.Add(TCepViaCepStrategy.Create);
     Strategies.Add(TCepApiCepStrategy.Create);
     Strategies.Add(TCepAwesomeApiStrategy.Create);

     for Strategy in Strategies do
     begin

       if Strategy.Consultar(ACep, Model) then
       begin
          Result := True;
          Break;
       end;

     end;

    end;

  finally
    Strategies.Free;
    SelecionaApi.Free;
  end;

end;


end.


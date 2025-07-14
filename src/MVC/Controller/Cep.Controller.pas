unit Cep.Controller;

interface

uses
  Cep.Service.Interfaces,
  Cep.Service,
  Cep.Entity.impl,
  Cep.Model.entity.Interfaces,
  Cep.Controller.Interfaces,
  System.SysUtils;

Type
  TCepController = class(TInterfacedObject, iCepController)
    private
      FEntity: iEntity;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iCepController;

      function Buscar(Value: String; ValueApi: string) : ICepController;
      function ObterCep: ICep;
  end;

implementation

{ TMinhaClasse }

{ meu controller poderia ser também uma factory porém por fato de não ter tantos procedimentos
utilizei o padrão da controller utilizando a strategy para cada API}

function TCepController.Buscar(Value: String; ValueApi: string): ICepController;
var
  LService: ICepService;
begin
  Result := Self;

  LService := TCepService.Create;


 try

  LService.BuscarCep(Value, FEntity.Cep, ValueApi);

 except
  on E: Exception do
    raise Exception.Create('Erro ao buscar CEP: ' + E.Message);
 end;


end;

function TCepController.ObterCep: ICep;
begin
  Result := FEntity.Cep;
end;

constructor TCepController.Create;
begin
  FEntity := TEntity.New;
end;

destructor TCepController.Destroy;
begin
  inherited;
end;

class function TCepController.New: iCepController;
begin
  Result := Self.Create;
end;

end.


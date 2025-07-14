unit Cep.Entity.impl;

interface

uses
  Cep.Model.entity.Interfaces, Cep.Model.Entity;

Type
  TEntity = class(TInterfacedObject, iEntity)
    private
     FCep : ICep;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iEntity;

      function Cep: ICep;

    end;

implementation

{ TMinhaClasse }

{deixei como TMinhaClasse para demonstrar o templatelayout em uma das aulas da academia o Thulio ensina como configurar
e deixar uma classe padrão para criação}


function TEntity.Cep: ICep;
begin

 if not Assigned(FCep) then
   FCep := TCepModel.New;

  Result := FCep;
end;

constructor TEntity.Create;
begin

end;

destructor TEntity.Destroy;
begin

  inherited;
end;

class function TEntity.New: iEntity;
begin
  Result := Self.Create;
end;

end.

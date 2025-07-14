unit Cep.Service.Strategy.interfaces;

interface

uses
  Cep.Model.Entity.Interfaces;

type
  ICepConsultaStrategy = interface
    ['{4E411997-D154-4D37-94BC-890D76515030}']
    function Consultar(const ACep: string; Model: ICep): Boolean;
  end;

implementation

end.

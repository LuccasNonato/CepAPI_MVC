unit Cep.Service.Interfaces;

interface

uses
  Cep.Model.Entity.Interfaces;

type
  ICepService = interface
    ['{E95B3124-470E-4902-8645-57967AF16772}']
    function BuscarCep(const ACep: string; Model: ICep; Api : string): Boolean;
  end;

implementation

end.

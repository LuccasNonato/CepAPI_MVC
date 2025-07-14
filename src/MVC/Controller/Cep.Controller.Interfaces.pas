unit Cep.Controller.Interfaces;

interface

uses
  Cep.Model.entity.Interfaces;

 type

   ICepController = interface
   ['{FD1F840A-B4D1-4657-8CAD-14C29B8093F6}']
   function Buscar(Value : String; ValueApi : string) : ICepController;
   function ObterCep: ICep;

 end;

implementation

end.

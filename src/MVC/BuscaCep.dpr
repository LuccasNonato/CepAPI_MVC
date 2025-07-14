program BuscaCep;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {Form1},
  Cep.Model.entity.Interfaces in 'Model\Entity\Cep.Model.entity.Interfaces.pas',
  Cep.Model.Entity in 'Model\Entity\Cep.Model.Entity.pas',
  Cep.Controller.Interfaces in 'Controller\Cep.Controller.Interfaces.pas',
  Cep.Controller in 'Controller\Cep.Controller.pas',
  Cep.Entity.impl in 'Model\Entity\Cep.Entity.impl.pas',
  Cep.Service in 'Controller\Services\Cep.Service.pas',
  Cep.Service.Interfaces in 'Controller\Services\Cep.Service.Interfaces.pas',
  Cep.Service.Strategy.ViaCep in 'Controller\Services\Strategy\Cep.Service.Strategy.ViaCep.pas',
  Cep.Service.Strategy.ApiCep in 'Controller\Services\Strategy\Cep.Service.Strategy.ApiCep.pas',
  Cep.Service.Strategy.AwesomeApi in 'Controller\Services\Strategy\Cep.Service.Strategy.AwesomeApi.pas',
  Cep.Service.Strategy.interfaces in 'Controller\Services\Strategy\Cep.Service.Strategy.interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program Teste_MVC_Cep;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  Teste.Principal in 'Teste.Principal.pas',
  Cep.Controller.Interfaces in '..\src\MVC\Controller\Cep.Controller.Interfaces.pas',
  Cep.Controller in '..\src\MVC\Controller\Cep.Controller.pas',
  Cep.Service.Strategy.ApiCep in '..\src\MVC\Controller\Services\Strategy\Cep.Service.Strategy.ApiCep.pas',
  Cep.Service.Strategy.AwesomeApi in '..\src\MVC\Controller\Services\Strategy\Cep.Service.Strategy.AwesomeApi.pas',
  Cep.Service.Strategy.interfaces in '..\src\MVC\Controller\Services\Strategy\Cep.Service.Strategy.interfaces.pas',
  Cep.Service.Strategy.ViaCep in '..\src\MVC\Controller\Services\Strategy\Cep.Service.Strategy.ViaCep.pas',
  Cep.Service.Interfaces in '..\src\MVC\Controller\Services\Cep.Service.Interfaces.pas',
  Cep.Service in '..\src\MVC\Controller\Services\Cep.Service.pas',
  Cep.Entity.impl in '..\src\MVC\Model\Entity\Cep.Entity.impl.pas',
  Cep.Model.entity.Interfaces in '..\src\MVC\Model\Entity\Cep.Model.entity.Interfaces.pas',
  Cep.Model.Entity in '..\src\MVC\Model\Entity\Cep.Model.Entity.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Continue then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}

  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.

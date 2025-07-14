unit Cep.Model.entity.Interfaces;

interface

type
  ICep = interface
    ['{1FBD167D-9482-45EA-A596-8D285F2980DA}']
    function SetCep(Value : string): ICep; overload;
    function GetCep : string; overload;

    function SetLogradouroRua(Value : string): ICep; overload;
    function GetLogradouroRua : string; overload;

    function SetComplemento(Value : string) : ICep; overload;
    function GetComplemento : string; overload;

    function SetUnidade(Value : string): ICep; overload;
    function GetUnidade : string; overload;

    function SetBairro(Value : string) : ICep; overload;
    function GetBairro : string; overload;

    function SetLocalidadeCidade(Value : string) : ICep; overload;
    function GetLocalidadeCidade : string; overload;

    function SetUF(Value : string): ICep; overload;
    function GetUF : string; overload;

    function SetEstado(Value : string) : ICep; overload;
    function GetEstado : string; overload;

    function SetRegiao(Value : string) : ICep; overload;
    function GetRegiao : string; overload;

    function SetIBGE(Value : string) : ICep; overload;
    function GetIBGE : string; overload;

    function SetGIA(Value : string) : ICep; overload;
    function GetGIA : string; overload;

    function SetDDD(Value : string) : ICep; overload;
    function GetDDD : string; overload;

    function SetSIAFI(Value : string) : ICep; overload;
    function GetSIAFI : string; overload;

    function SetAPI(Value : string) : ICep; overload;
    function GetAPI : string; overload;

  end;

  IEntity = interface
  ['{619CE38B-A369-4607-8444-B5B602945AE4}']
    function Cep: ICep;
  end;

implementation

end.

unit Cep.Model.Entity;

interface

uses
  Cep.Model.entity.Interfaces, 
  system.SysUtils;

Type
  TCepModel = class(TInterfacedObject, ICep)
    private
      FCep : string;
      FLogradouro : string;
      FComplemento : string;
      FUnidade : string;
      FBairro : string;
      FLocalidadeCidade : string;
      FUF : string;
      FEstado : string;
      FRegiao : string;
      FIBGE : string;
      FGIA : string;
      FDDD : string;
      FSIAFI : string;
      FAPI : string;

    function VerificaCep(Value : string): boolean;
    public

    constructor Create;
    destructor  Destroy; override;
    class function New : ICep;

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

implementation

{ TMinhaClasse }

{lembrando que os getters e setters podem ser propriedades para o encapsulamento
mas dessa forma montada fazendo a sobrecarga e leitura o encapsulamento pode ser como uma constante = const
fazendo com que não possa ser alterado o valor passado ou buscado}

constructor TCepModel.Create;
begin

end;

destructor TCepModel.Destroy;
begin

  inherited;
end;

function TCepModel.GetAPI: string;
begin
  Result := FAPI;
end;

function TCepModel.GetBairro: string;
begin
  Result := FBairro;
end;

function TCepModel.GetCep: string;
begin
  Result := FCep;
end;

function TCepModel.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TCepModel.GetDDD: string;
begin
  Result := FDDD;
end;

function TCepModel.GetEstado: string;
begin
  Result := FEstado;
end;

function TCepModel.GetGIA: string;
begin
  Result := FGIA;
end;

function TCepModel.GetIBGE: string;
begin
  Result := FIBGE;
end;

function TCepModel.GetLocalidadeCidade: string;
begin
  Result := FLocalidadeCidade;
end;

function TCepModel.GetLogradouroRua: string;
begin
  Result := FLogradouro;
end;

function TCepModel.GetRegiao: string;
begin
  Result := FRegiao;
end;

function TCepModel.GetSIAFI: string;
begin
  Result := FSIAFI;
end;

function TCepModel.GetUF: string;
begin
  Result := FUF;
end;

function TCepModel.GetUnidade: string;
begin
  Result := FUnidade;
end;

class function TCepModel.New: ICep;
begin
  Result := Self.Create;
end;

function TCepModel.SetAPI(Value: string): ICep;
begin
  Result := Self;
  FAPI := Value;
end;

function TCepModel.SetBairro(Value: string): ICep;
begin
  Result := Self;
  FBairro := Value;
end;

function TCepModel.SetCep(Value: string): ICep;
begin
  Result := Self;

  if not VerificaCep(Value) then
    raise Exception.Create('CEP inválido');
        
  FCep := Value;

  {lembrando que em uma das aulas do Alessandro ele diz que as regras de negocio devem ser tratadas no model 
  para nao espalhar codigo nas views ou nas demais units}
end;

function TCepModel.SetComplemento(Value: string): ICep;
begin
  Result := Self;
  FComplemento := Value;
end;

function TCepModel.SetDDD(Value: string): ICep;
begin
  Result := Self;
  FDDD := Value;
end;

function TCepModel.SetEstado(Value: string): ICep;
begin
  Result := Self;
  FEstado := Value;
end;

function TCepModel.SetGIA(Value: string): ICep;
begin
  Result := Self;
  FGIA := Value;
end;

function TCepModel.SetIBGE(Value: string): ICep;
begin
  Result := Self;
  FIBGE := Value;
end;

function TCepModel.SetLocalidadeCidade(Value: string): ICep;
begin
  Result := Self;
  FLocalidadeCidade := Value;
end;

function TCepModel.SetLogradouroRua(Value: string): ICep;
begin
  Result := Self;
  FLogradouro := Value;
end;

function TCepModel.SetRegiao(Value: string): ICep;
begin
  Result := Self;
  FRegiao := Value;
end;

function TCepModel.SetSIAFI(Value: string): ICep;
begin
  Result := Self;
  FSIAFI := Value;
end;

function TCepModel.SetUF(Value: string): ICep;
begin
  Result := Self;
  FUF := Value;
end;

function TCepModel.SetUnidade(Value: string): ICep;
begin
  Result := Self;
  FUnidade := Value;
end;

function TCepModel.VerificaCep(Value : string): Boolean;
var
  Digitos: string;
  I: Integer;
begin
  Digitos := '';
  for I := 1 to Length(Value) do
    if Value[I] in ['0'..'9'] then
      Digitos := Digitos + Value[I];
  Result := Length(Digitos) = 8;
end;

end.


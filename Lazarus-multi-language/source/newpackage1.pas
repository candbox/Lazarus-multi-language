{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit NewPackage1;

{$warn 5023 off : no warning about unused units}
interface

uses
  Language, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('Language', @Language.Register);
end;

initialization
  RegisterPackage('NewPackage1', @Register);
end.

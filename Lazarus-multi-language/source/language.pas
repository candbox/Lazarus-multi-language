unit Language;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LCLType, jsonparser, fpjson;

type
  TLanguage = class(TComponent)
  private
    FLang: string;
    FCurrLang: string;
    FIds: TJSONData;
  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //set resource/language
    procedure setSource(const resName: string);
    procedure setLanguage(const langId: string = 'eng');
    //localization function
    function localize(const id: string): string;
  published

  end;

procedure Register;

implementation

procedure Register;
begin
  //{$I language_icon.lrs}
  RegisterComponents('Standard',[TLanguage]);
end;

constructor TLanguage.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 FLang := ' ';
 FCurrLang := 'eng';
end;

destructor TLanguage.Destroy;
begin
 FIds.Free;
 inherited;
end;

function TLanguage.localize(const id: string): string;
var
 FValueInner: TJSONData;
 e,k: TJSONEnum; 
begin
 Result := '';
 try
  for e in FIds do begin
     if (e.value is TJSONObject) then begin
         FValueInner:= TJSONObject(e.value).FindPath(FCurrLang);
         if (FValueInner is TJSONArray) then begin
               for k in TJSONArray(FValueInner) do begin
                   Result:= k.value.GetPath(id).AsString;
               end;
         end;
     end;
  end;
 except
  Result := '-';
 end;

end;

procedure TLanguage.setLanguage(const langId: string);
begin
  FCurrLang := langId;
end;

procedure TLanguage.setSource(const resName: string);
var
 rs: TResourceStream;
 sl: TStringList;
begin
 FLang := resName;
 rs := TResourceStream.Create(HInstance, FLang, RT_RCDATA);
 try
  sl := TStringList.Create;
  try
    sl.LoadFromStream(rs, TEncoding.UTF8);
    FIds := GetJSON(sl.text) as TJSONArray;
  finally
   sl.Free;
  end
 finally
  rs.Free;
 end;

end;

end.

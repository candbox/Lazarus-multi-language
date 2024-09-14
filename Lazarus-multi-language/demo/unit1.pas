unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType, Language;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    langen: TButton;
    langcn: TButton;
    langdef: TButton;
    Label1: TLabel;
    menuopt: TLabel;
    Language1: TLanguage;
    procedure langdefClick(Sender: TObject);
    procedure langenClick(Sender: TObject);
    procedure langcnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Loadlang(Sender: TObject);
    procedure Resetlang(Sender: TObject);
    procedure Loadcomopt(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  optarr: array[0..3]of string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

   Loadlang(Sender);

end;

{--default-is-setting-your-first-display--language--}
procedure TForm1.langdefClick(Sender: TObject);
begin
     Language1.setLanguage('eng');
     Resetlang(Sender);
end;

procedure TForm1.langenClick(Sender: TObject);
begin
     Language1.setLanguage('enu');
     Resetlang(Sender);
end;

procedure TForm1.langcnClick(Sender: TObject);
begin
  Language1.setLanguage('cns');
     Resetlang(Sender);
end;

procedure TForm1.Loadcomopt(Sender: TObject);
var
  k: string;
begin
     ComboBox1.Items.Clear;
     ComboBox1.text:='';
     For k in optarr do
      ComboBox1.Items.add(k);
end;

procedure TForm1.Loadlang(Sender: TObject);
begin
   {-value-APPLANG-is-Resources-name-}
     Language1.setSource('APPLANG');
     Language1.setLanguage('eng');
     Resetlang(Sender);
end;

procedure TForm1.Resetlang(Sender: TObject);
begin
     label1.Caption:=Language1.localize('apptitle');
     {--combobox--}
     menuopt.Caption:=Language1.localize('menuopt');
     optarr[0]:=Language1.localize('book');
     optarr[1]:=Language1.localize('dog');
     optarr[2]:=Language1.localize('food');
     optarr[3]:=Language1.localize('phone');
     {--load-combobox--}
     Loadcomopt(Sender);
     {--BUTTON--}
     langdef.caption:=Language1.localize('langdef');
     langen.caption:=Language1.localize('langen');
     langcn.caption:=Language1.localize('langcn');
end;


end.


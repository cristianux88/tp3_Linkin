unit Unit_GUI_Form5;
{$mode objfpc}{$H+}
interface
uses
    {$IFDEF UNIX}{$IFDEF UseCThreads}
    cthreads, cmem
    {$ENDIF}{$ENDIF}
  Classes, SysUtils, Forms, Controls, StdCtrls, PolinD;
type
  TForm5 = class(TForm)
    Error_Edit: TEdit;
    Raiz_GroupBox: TGroupBox;
    Raiz_Memo: TMemo;
    X0_Edit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    constructor crear(Comp: Tcomponent; Pol: cls_Polin);
    Procedure Actualiza();
  public
    Polin: cls_Polin;
    error: extended;
    X0: extended;
  end;

var
  Form5: TForm5;

implementation
{$R *.lfm}
procedure TForm5.FormCreate(Sender: TObject);
begin
     Label1.Caption:='Error';
     Label2.Caption:='X0';
     Error_Edit.Text:= FloatToStr(error);
     X0_edit.Text:= FloatToStr(X0);
     self.Caption:='Newton Para Polinomios';
end;

procedure TForm5.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     CloseAction:= caFree;
     Form5:= nil;
end;

constructor TForm5.Crear(Comp: Tcomponent; Pol: cls_Polin);
Begin
     inherited create(comp);
     Polin:= Pol;
     Error:= 0.000000000000001;
     X0:= 0;
     self.actualiza();
end;

Procedure TForm5.actualiza();
Var
   posi: integer;
   cad: string;
   raiz: extended;
Begin
     VAL(cad,error,posi);
     if (posi>0) then Begin
        error:= 0.000000000000001;
        Error_Edit.Caption:= FloatToStr(error);
     end;
     VAL(cad,X0,posi);
     if (posi>0) then Begin
        X0:= 0;
        X0_Edit.Caption:= FloatToStr(X0);
     end;

     Raiz:= Polin.newton(X0,Error);
     Raiz_Memo.Lines.Text:= FloatToStr(Raiz);
end;

BEGIN
END.

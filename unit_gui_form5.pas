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
    procedure Error_EditEditingDone(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    constructor crear(Comp: Tcomponent; Pol: cls_Polin);
    Procedure Actualiza();
    procedure X0_EditEditingDone(Sender: TObject);
  public
    Polin: cls_Polin;
    error: extended;
    X0: extended;
  end;

var
  Form5: TForm5;

implementation
{$R *.lfm}
procedure TForm5.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     CloseAction:= caFree;
     Form5:= nil;
end;

constructor TForm5.Crear(Comp: Tcomponent; Pol: cls_Polin);
Begin
     inherited create(comp);
     Polin:= Pol;
     self.Caption:='Newton Para Polinomios';
     Error:= 0.001;
     self.Error_Edit.Caption:='0.001';
     self.Label1.Caption:='Error';
     X0:= 0;
     self.X0_Edit.Caption:='0';
     Label2.Caption:='X0';
     self.actualiza();
end;

Procedure TForm5.actualiza();
Var
   posi: integer;
   cad: string;
   raiz: extended;
Begin
     //Valida Error
     VAL(Error_Edit.Caption,error,posi);
     if (posi>0) then Begin
        error:= 0.001;
        Error_Edit.Caption:= '0.001';
     end;
     //Valida X0
     VAL(X0_Edit.Caption,X0,posi);
     if (posi>0) then Begin
        X0:= 0;
        X0_Edit.Caption:= '0';
     end;
     //Actualiza el calculo de Raiz
     Raiz:= Polin.newton(X0,Error);
     Raiz_Memo.Lines.Text:= FloatToStr(Raiz);
end;

procedure TForm5.X0_EditEditingDone(Sender: TObject);
begin
     self.Actualiza();
end;

procedure TForm5.Error_EditEditingDone(Sender: TObject);
begin
     self.Actualiza();
end;

BEGIN
END.

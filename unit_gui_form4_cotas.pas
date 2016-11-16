unit Unit_GUI_Form4_Cotas;
{$mode objfpc}{$H+}

interface
uses
    {$IFDEF UNIX}{$IFDEF UseCThreads}
    cthreads, cmem
    {$ENDIF}{$ENDIF}
  Classes, SysUtils, Forms, Controls, StdCtrls, PolinD;

type

  { TForm4 }

  TForm4 = class(TForm)
       Lagrange_GroupBox: TGroupBox;
       Lagrange_Memo: TMemo;
       Laguerre_GroupBox: TGroupBox;
       Laguerre_Memo: TMemo;
       Newton_GroupBox: TGroupBox;
       Newton_Memo: TMemo;
       Sturm_GroupBox: TGroupBox;
       Sturm_Memo: TMemo;
       constructor crear(Comp: Tcomponent; Pol: cls_Polin);
       procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
       Procedure actualiza();
  Public
       Polin: cls_Polin;
  const
       MIN_MASC = 0;
       MAX_MASC = 11;
  end;
var
  Form4: TForm4;

implementation
{$R *.lfm}
USES
    VectorD;

procedure TForm4.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     CloseAction:= caFree;
     Form4:= nil;
end;

constructor TForm4.Crear(Comp: Tcomponent; Pol: cls_Polin);
Begin
     inherited create(comp);
     Polin:= Pol;
     self.actualiza();
end;
Procedure TForm4.actualiza();
Var
   Vector: cls_Vector;
Begin
     //Lagrange
     Vector:= Cls_Vector.Crear(4);
     Polin.Lagrange(Vector);
     Lagrange_Memo.Lines.Text:= Vector.ToString(2);
     //Laguerre
     Vector.Free;
     Vector:= Polin.Laguerre();
     Laguerre_Memo.Lines.Text:= Vector.ToString(2);
     //Newton
     Vector.Free;
     vector:= polin.cotasNewton();
     Newton_Memo.Lines.Text:= Vector.ToString(2);
     //Sturm
     Vector.Free;
     Vector:= Polin.Sturm();
     Sturm_Memo.Lines.Text:= Vector.ToString(2);
end;

BEGIN
END.

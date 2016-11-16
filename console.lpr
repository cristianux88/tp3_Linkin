PROGRAM console;
{$mode objfpc}{$H+ $I+}

USES
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads, cmem
  {$ENDIF}{$ENDIF}
  PolinD, VectorD, MatrizD, Interfaces, Dialogs, sysutils;

VAR
    M,M2,M3: cls_Matriz;
    V, V2: cls_vector;

    pol_n, divi,coc,rest, B,C: cls_polin;
    i: integer;
    k:extended;
BEGIN
   pol_N:= cls_Polin.Crear(3);
   //pol_N.Coef.cells[4]:= 1;
   pol_N.Coef.cells[3]:= 4;
   pol_N.Coef.cells[2]:= 0;
   pol_N.Coef.cells[1]:= 5;
   pol_N.Coef.cells[0]:= 1;
   pol_n.Coef.mostrar('Coef: ');

   writeln('Una raiz: ',Pol_N.newton(0,0.00001));
  readln;

END.

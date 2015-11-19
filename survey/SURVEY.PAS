PROGRAM Practica2;
USES crt;

TYPE
    dades=record
       P1:Integer;
       P2:Integer;
       P3:Integer;
       P4:Array [1..3] of Integer;
       P5:Array [1..3] of Integer;
       P6:Array [1..3] of Integer;
       P7:Integer;
       P8:Real;
    End;
VAR
   Nal,al:word; {nombre d'alumnes}
   enq,copia:array [1..100] of dades;
   modalitat,eleccio:word;
   nomf,fRes:string;
   a:text;
   Vp1,Vp2,Vp3,Vp4,Vp5,Vp6,Vp7,Vp8:boolean; {Verificaci¢ escriptura en fitxer}
   Vp9,Vp10,Vp11,Vp12,Vp13,Vp14,Vp15,Vp16,Vp17:Boolean;
(*''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*)

PROCEDURE Fitxer;
VAR
    nomfitxer:string;
    f:TEXT;

BEGIN
     al:=1;
     write('Nom del fitxer on vol recuperar les dades: ');
     readln(nomfitxer);
     assign(f,nomfitxer);
     {$I-}
     reset(f);
     close(f);
     {$I+}
     If IOresult <> 0 then write('No existeix el fitxer!')
     Else begin
     reset(f);

        while not eof(f) do begin
           readln(f,nal);
           readln(f,enq[al].P1);
           readln(f,enq[al].P2);
           readln(f,enq[al].P3);
           readln(f,enq[al].P4[1]);
           readln(f,enq[al].P4[2]);
           readln(f,enq[al].P4[3]);
           readln(f,enq[al].P5[1]);
           readln(f,enq[al].P5[2]);
           readln(f,enq[al].P5[3]);
           readln(f,enq[al].P6[1]);
           readln(f,enq[al].P6[2]);
           readln(f,enq[al].P6[3]);
           readln(f,enq[al].P7);
           readln(f,enq[al].P8);
           al:=al+1;
        End;
        nal:=al-1;
        close(f);
     End;
END;

{--------------------------------------------------------------------------------}

PROCEDURE Veure_memoria;
BEGIN
        clrscr;
        WRITELN('Estat de la memïria: ');
        writeln;
        for nal:=1 to nal do begin { VISUALITZACI‡ memïria}
        writeln('Alumnes enq: ',nal);
        writeln('P1: ',enq[nal].P1);
        writeln('P2: ',enq[nal].P2);
        writeln('P3: ',enq[nal].P3);
        writeln('P4: ',enq[nal].P4[1],'  ',enq[nal].P4[2],'  ',enq[nal].P4[3]);
        writeln('P5: ',enq[nal].P5[1],'  ',enq[nal].P5[2],'  ',enq[nal].P5[3]);
        writeln('P6: ',enq[nal].P6[1],'  ',enq[nal].P6[2],'  ',enq[nal].P6[3]);
        writeln('P7: ',enq[nal].P7);
        writeln('P8: ',enq[nal].P8:1:2);
        readln;
        end;
END;


{----------------------------------------------------------------------------}


PROCEDURE Manual;
BEGIN
     write('Nombre d''alumnes que desitja introduãr: ');
     readln(nal);
     For nal:=1 to nal do begin
         clrscr;
         writeln('ALUMNE ',nal);
         writeln('Via d''accÇs dels estudis que acabes de finalitzar?');
         writeln('(1) BTX               (2) CFGS');
         writeln('(3) Proba 25 anys     (4) Altres');
         write('Resposta => ');
         readln(enq[nal].P1);
         writeln;
         write('--------------------------------------------------------------------------------');
         writeln;

         writeln('Situaci¢ en la que vas superar la fase selectiva:');
         writeln('(1) Excel˙lent   (2) Notable');
         writeln('(3) Aprovat      (4) No fase selectiva');
         write('Resposta => ');
         readln(enq[nal].P2);
         writeln;
         write('--------------------------------------------------------------------------------');

         writeln;
         writeln('Situaci¢ laboral durant els estudis:');
         writeln('(1) No treballa                 (2) Treballa fora del horari escolar');
         writeln('(3) Treballa en horari escolar  (4) Caps de setmana');
         write('Resposta => ');
         readln(enq[nal].P3);

           clrscr;

         writeln('Les 3 assignatures que has trobat mÇs dificils s¢n:');
         write('Assignatura 1 => ');
         readln(enq[nal].P4[1]);
         write('Assignatura 2 => ');

         readln(enq[nal].P4[2]);
         write('Assignatura 3 => ');
         readln(enq[nal].P4[3]);

         writeln;
         write('--------------------------------------------------------------------------------');
         writeln;
         writeln('Les 3 assignatures mÇs interessants s¢n: ');
         write('Assignatura 1 => ');
         readln(enq[nal].P5[1]);
         write('Assignatura 2 => ');
         readln(enq[nal].P5[2]);
         write('Assignatura 3 => ');
         readln(enq[nal].P5[3]);

         writeln;
         write('--------------------------------------------------------------------------------');
         writeln;
         writeln('Les 3 assignatures menys interessants s¢n: ');
         write('Assignatura 1 => ');
         readln(enq[nal].P6[1]);
         write('Assignatura 2 => ');
         readln(enq[nal].P6[2]);
         write('Assignatura 3 => ');
         readln(enq[nal].P6[3]);

         clrscr;

         writeln('Temps per finalitzar els estudis. (entre 1 i 20):');
         write('Nß Quadrimestres => ');
         readln(enq[nal].P7);

         writeln;
         write('--------------------------------------------------------------------------------');
         writeln;
         writeln('Nota mitja ponderada de totes les assignatures (entre 0.0 i 10.0');
         write('Nota => ');
         readln(enq[nal].P8);
         writeln;
         write('--------------------------------------------------------------------------------');
         writeln;
         writeln;
         writeln('FI D''ENQUESTA PER L''ALUMNE ',nal);
         readln;
     End;


END;

(*//////////////////////////////////////////////////////////////////////////*)
(*///////////////////   PROCEDIMENTS DE LES PREGUNTES   ////////////////////*)
(*//////////////////////          (1 A 17)           ///////////////////////*)
(*//////////////////////////////////////////////////////////////////////////*)

procedure Pr1;
VAR
   batx,cfgs,majors,altres:real;

BEGIN
     batx:=0;
     cfgs:=0;
     majors:=0;
     altres:=0;
     clrscr;
     for nal:=1 to nal do begin
         case (enq[nal].P1) of
         1: Batx:=batx+1;
         2: cfgs:=cfgs+1;
         3: majors:=majors+1;
         4: altres:=altres+1;
         else begin writeln('Error! Alumne nß ',nal,' ha introduãt resposta no vÖlida');
                    writeln('Es prosegueix amb les dades correctes...');
                    readln;
              end;

         End;
     End;
     If nal <> 0 then begin
     batx:=(batx*100)/nal;
     cfgs:=(cfgs*100)/nal;
     majors:=(majors*100)/nal;
     altres:=(altres*100)/nal;
     End;
     If (vp1=false) then begin
        append(a);

             writeln(a,'RESULTAT DE LA PREGUNTA 1');
             writeln(a);
             writeln(a,'Batxillerat:              ',batx:2:1,' %');
             writeln(a,'Cicle formatiu grau sup:  ',cfgs:2:1,' %');
             writeln(a,'Proba majors 25 anys:     ',majors:2:1,' %');
             writeln(a,'Altres:                   ',altres:2:1,' %');
        writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
        close(a);
        vp1:=true;
     End;
     writeln('RESULTAT DE LA PREGUNTA 1');
     writeln;
     writeln('Batxillerat:              ',batx:2:1,' %');
     writeln('Cicle formatiu grau sup:  ',cfgs:2:1,' %');
     writeln('Proba majors 25 anys:     ',majors:2:1,' %');
     writeln('Altres:                   ',altres:2:1,' %');

     readln;

END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr2;
VAR
e,n,ap,nf:real;
BEGIN
     e:=0;   n:=0;   ap:=0;   nf:=0;
     for nal:=1 to nal do begin
     case (enq[nal].P2) of
         1: e:=e+1;
         2: n:=n+1;
         3: ap:=ap+1;
         4: nf:=nf+1;
     End; {case}
     End;
     If nal <> 0 then begin
     e:=(e*100)/nal;
     n:=(n*100)/nal;
     ap:=(ap*100)/nal;
     nf:=(nf*100)/nal;
     End;
          If (vp2=false) then begin
             append(a);
             writeln(a,'RESULTAT DE LA PREGUNTA 2');
             writeln(a);
             writeln(a,'Excel˙lent:           ',e:2:1,' %');
             writeln(a,'Notable:              ',n:2:1,' %');
             writeln(a,'Aprovat:              ',ap:2:1,' %');
             writeln(a,'No fase selectiva:    ',nf:2:1,' %');
        writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
        close(a);
        vp2:=true;
     End;

     clrscr;
     writeln('RESULTAT DE LA PREGUNTA 2');
             writeln;
             writeln('Excel˙lent:           ',e:2:1,' %');
             writeln('Notable:              ',n:2:1,' %');
             writeln('Aprovat:              ',ap:2:1,' %');
             writeln('No fase selectiva:    ',nf:2:1,' %');
     readln;

END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr3;
VAR nt,fh,eh,cs:real;
BEGIN
     nt:=0;   fh:=0;   eh:=0;   cs:=0;
     for nal:=1 to nal do begin
     case (enq[nal].P3) of
         1: nt:=nt+1;
         2: fh:=fh+1;
         3: eh:=eh+1;
         4: cs:=cs+1;
     End; {case}
     End;
     If nal <> 0 then begin
     nt:=(nt*100)/nal;
     fh:=(fh*100)/nal;
     eh:=(eh*100)/nal;
     cs:=(cs*100)/nal;
     End;
          If (vp3=false) then begin
             append(a);
             writeln(a,'RESULTAT DE LA PREGUNTA 3');
             writeln(a);
             writeln(a,'No treballen:                ',nt:2:1,' %');
             writeln(a,'Fora del horari escolar:     ',fh:2:1,' %');
             writeln(a,'En horari escolar:           ',eh:2:1,' %');
             writeln(a,'Caps de setmana:             ',cs:2:1,' %');
        writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
        close(a);
        vp3:=true;
     End;
             clrscr;
             writeln('RESULTAT DE LA PREGUNTA 3');
             writeln;
             writeln('No treballen:                ',nt:2:1,' %');
             writeln('Fora del horari escolar:     ',fh:2:1,' %');
             writeln('En horari escolar:           ',eh:2:1,' %');
             writeln('Caps de setmana:             ',cs:2:1,' %');
             readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr4;
VAR
   v: Array [1..20] of integer;
   i:integer;

BEGIN
     for i:=1 to 20 do  v[i]:=0; {Inicialitzaci¢}
     for nal:=1 to nal do begin
     i:=enq[nal].P7;
     v[i]:=v[i]+1;
     End;
     clrscr;
     writeln('RESULTAT DE LA PREGUNTA 4');
     WRITELN;

     for i:=1 to 20 do begin
         If v[i] <> 0 then begin
            writeln(v[i],' alumnes que acaben en ',i,' quadrimestres');
         End;
     End;
    
     If (vp4=false) then begin
     append(a);
     writeln(a,'RESULTAT DE LA PREGUNTA 4');
     WRITELN(a);
     for i:=1 to 20 do begin
         If v[i] <> 0 then begin
            writeln(a,v[i],' alumnes que acaben en ',i,' quadrimestres');
         End;
     End;

     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
     close(a);

     vp4:=true;
     End;

     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr5;
VAR
Mt:real;

BEGIN
     mt:=0;
     for nal:=1 to nal do mt:=mt+enq[nal].P7;
     mt:=mt/nal;
     clrscr;
     writeln('RESULTAT DE LA PREGUNTA 5');
     writeln;
     writeln('La mitja total de temps Çs de ',mt:2:2,' quadrimestres');

   If (vp5=false) then begin
     append(a);
     writeln(a,'RESULTAT DE LA PREGUNTA 5');
     writeln(a);
     writeln(a,'La mitja total de temps Çs de ',mt:2:2,' quadrimestres');
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
     close(a);
     vp5:=true;
   End;
     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr6;
VAR Mbtx,Mcfgs,M25,Maltres:real;
    nbtx,Ncfgs,n25,naltres:integer;
BEGIN
     Mbtx:=0;     Mcfgs:=0;     M25:=0;     Maltres:=0;
     nbtx:=0;     Ncfgs:=0;     n25:=0;     naltres:=0;
     For nal:=1 to nal do begin
          If (enq[nal].P1=1) then begin
             Mbtx:=Mbtx+enq[nal].P7;
             Nbtx:=nbtx+1;
          End;
          If (enq[nal].P1=2) then begin
             Mcfgs:=Mcfgs+enq[nal].P7;
             ncfgs:=ncfgs+1;
          End;
          If (enq[nal].P1=3) then begin
             M25:=M25+enq[nal].P7;
             n25:=n25+1;
          End;
          If (enq[nal].P1=4) then begin
             Maltres:=Maltres+enq[nal].P7;
             naltres:=naltres+1;
          End;

     End;
     If nbtx <> 0 then Mbtx:=Mbtx/Nbtx;
     If ncfgs <> 0 then Mcfgs:=Mcfgs/ncfgs;
     If n25 <> 0 then M25:=m25/n25;
     If naltres <> 0 then Maltres:=maltres/naltres;

     clrscr;
     WRITELN('RESULTAT DE LA PREGUNTA 6');
     writeln;
     writeln('La mitjana de temps de Batxillerat Çs de   : ',mbtx:2:2,' quadrimestres');
     writeln('La mitjana de temps de C Formatius Çs de   : ',mcfgs:2:2,' quadrimestres');
     writeln('La mitjana de temps per prova accÇs 25 Çs  : ',m25:2:2,' quadrimestres');
     writeln('La mitjana de temps d''altres estudis Çs de : ',maltres:2:2,' quadrimestres');

     If (vp6=false) then begin
       append(a);
       WRITELN(a,'RESULTAT DE LA PREGUNTA 6');
     writeln(a);
     writeln(a,'La mitjana de temps de Batxillerat Çs de   : ',mbtx:2:2,' quadrimestres');
     writeln(a,'La mitjana de temps de C Formatius Çs de   : ',mcfgs:2:2,' quadrimestres');
     writeln(a,'La mitjana de temps per prova accÇs 25 Çs  : ',m25:2:2,' quadrimestres');
     writeln(a,'La mitjana de temps d''altres estudis Çs de : ',maltres:2:2,' quadrimestres');
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       vp6:=true;
       close(a);
     End;
     readln;


END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr7;
VAR
me,mn,ma,mnf:real;
ne,nn,na,nnf:integer;

BEGIN
     me:=0;     mn:=0;  ma:=0;  mnf:=0;    ne:=0;       nn:=0;
     na:=0;     nnf:=0;

     For nal:=1 to nal do begin
          If (enq[nal].P1=1) then begin
             Me:=Me+enq[nal].P7;
             ne:=ne+1;
          End;
          If (enq[nal].P1=3) then begin
             Mn:=Mn+enq[nal].P7;
             nn:=nn+1;
          End;
          If (enq[nal].P1=2) then begin
             ma:=Ma+enq[nal].P7;
             na:=na+1;
          End;
          If (enq[nal].P1=4) then begin
             Mnf:=Mnf+enq[nal].P7;
             nnf:=nnf+1;
          End;

     End;
     If ne <> 0 then Me:=Me/Ne;
     If nn <> 0 then Mn:=Mn/nn;
     If na <> 0 then Ma:=ma/na;
     If nnf <> 0 then Mnf:=mnf/nnf;

     clrscr;
     Writeln('RESULTAT DE LA PREGUNTA 7');
     writeln;
     writeln('La mitjana de temps dels alumnes amb excel˙lent Çs de  : ',me:2:2,' quadrimestres');
     writeln('La mitjana de temps dels alumnes amb notable Çs de     : ',mn:2:2,' quadrimestres');
     writeln('La mitjana de temps dels alumnes amb aprovat Çs de     : ',ma:2:2,' quadrimestres');
     writeln('La mitjana de temps d''alumnes sense fase selectiva Çs : ',mnf:2:2,' quadrimestres');


If (vp7=false) then begin
       append(a);
     Writeln(a,'RESULTAT DE LA PREGUNTA 7');
     writeln(a);
     writeln(a,'La mitjana de temps dels alumnes amb excel˙lent Çs de  : ',me:2:2,' quadrimestres');
     writeln(a,'La mitjana de temps dels alumnes amb notable Çs de     : ',mn:2:2,' quadrimestres');
     writeln(a,'La mitjana de temps dels alumnes amb aprovat Çs de     : ',ma:2:2,' quadrimestres');
     writeln(a,'La mitjana de temps d''alumnes sense fase selectiva Çs  : ',mnf:2:2,' quadrimestres');
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
      vp7:=true;
     close(a);
     End;
     readln;

END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr8;
VAR
mnt,mfh,meh,mcs:real;
nnt,nfh,neh,ncs:integer;

BEGIN
     mnt:=0;     mfh:=0;  meh:=0;  mcs:=0;    neh:=0;       ncs:=0;
     nnt:=0;     nfh:=0;

     For nal:=1 to nal do begin
          If (enq[nal].P3=1) then begin
             Mnt:=Mnt+enq[nal].P7;
             nnt:=nnt+1;
          End;
          If (enq[nal].P3=2) then begin
             Mfh:=Mfh+enq[nal].P7;
             nfh:=nfh+1;
          End;
          If (enq[nal].P3=3) then begin
             meh:=Meh+enq[nal].P7;
             neh:=neh+1;
          End;
          If (enq[nal].P3=4) then begin
             Mcs:=Mcs+enq[nal].P7;
             ncs:=ncs+1;
          End;

     End;
     If nnt <> 0 then Mnt:=Mnt/Nnt;
     If nfh <> 0 then Mfh:=Mfh/nfh;
     If neh <> 0 then Meh:=meh/neh;
     If ncs <> 0 then Mcs:=mcs/ncs;

     clrscr;
     Writeln('RESULTAT DE LA PREGUNTA 8');
     writeln('Mitjana de temps:');
     writeln;
     writeln('Alumnes que no treballen                       : ',mnt:2:2,' quadrimestres');
     writeln('Alumnes que treballen fora del horari escolar  : ',mfh:2:2,' quadrimestres');
     writeln('Alumnes que treballen en horari escolar        : ',meh:2:2,' quadrimestres');
     writeln('Alumnes que treballen els caps de setmana      : ',mcs:2:2,' quadrimestres');


If (vp8=false) then begin
       append(a);
     Writeln(a,'RESULTAT DE LA PREGUNTA 8');
     writeln(a,'Mitjana de temps:');
     writeln(a);
     writeln(a,'Alumnes que no treballen                       : ',mnt:2:2,' quadrimestres');
     writeln(a,'Alumnes que treballen fora del horari escolar  : ',mfh:2:2,' quadrimestres');
     writeln(a,'Alumnes que treballen en horari escolar        : ',meh:2:2,' quadrimestres');
     writeln(a,'Alumnes que treballen els caps de setmana      : ',mcs:2:2,' quadrimestres');
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
      vp8:=true;
     close(a);
     End;
     readln;

END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr9;
VAR Mn:real;

BEGIN

     Mn:=0;
     for nal:=1 to nal do mn:=mn+enq[nal].P8;
     mn:=mn/nal;

     clrscr;
     writeln('RESULTAT DE LA PREGUNTA 9');
     writeln;
     writeln('La mitjana global dels ',nal, ' alumnes enquestats Çs de ',mn:2:2);

     If (vp9=false) then begin
       append(a);
       writeln(a,'RESULTAT DE LA PREGUNTA 9');
       writeln(a);
       writeln(a,'La mitjana global dels ',nal, ' alumnes enquestats Çs de ',mn:2:2);
       vp9:=true;
       writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       close(a);
     End;
     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
Procedure Pr10;

VAR Mbtx,Mcfgs,M25,Maltres:real;
    nbtx,Ncfgs,n25,naltres:integer;
BEGIN
     Mbtx:=0;     Mcfgs:=0;     M25:=0;     Maltres:=0;
     nbtx:=0;     Ncfgs:=0;     n25:=0;     naltres:=0;
     For nal:=1 to nal do begin
          If (enq[nal].P1=1) then begin
             Mbtx:=Mbtx+enq[nal].P8;
             Nbtx:=nbtx+1;
          End;
          If (enq[nal].P1=2) then begin
             Mcfgs:=Mcfgs+enq[nal].P8;
             ncfgs:=ncfgs+1;
          End;
          If (enq[nal].P1=3) then begin
             M25:=M25+enq[nal].P8;
             n25:=n25+1;
          End;
          If (enq[nal].P1=4) then begin
             Maltres:=Maltres+enq[nal].P8;
             naltres:=naltres+1;
          End;

     End;
     If nbtx <> 0 then Mbtx:=Mbtx/Nbtx;
     If ncfgs <> 0 then Mcfgs:=Mcfgs/ncfgs;
     If n25 <> 0 then M25:=m25/n25;
     If naltres <> 0 then Maltres:=maltres/naltres;

     clrscr;
     WRITELN('RESULTAT DE LA PREGUNTA 10');
     writeln;
     writeln('La mitjana de Batxillerat Çs de    : ',mbtx:2:2);
     writeln('La mitjana de C Formatius Çs de    : ',mcfgs:2:2);
     writeln('La mitjana de Prova accÇs 25 Çs de : ',m25:2:2);
     writeln('La mitjana d''Altres estudis Çs de  : ',maltres:2:2);

     If (vp10=false) then begin
       append(a);
       WRITELN(a,'RESULTAT DE LA PREGUNTA 10');
     writeln(a);
     writeln(a,'La mitjana de Batxillerat Çs de    : ',mbtx:2:2);
     writeln(a,'La mitjana de C Formatius Çs de    : ',mcfgs:2:2);
     writeln(a,'La mitjana de Prova accÇs 25 Çs de : ',m25:2:2);
     writeln(a,'La mitjana d''Altres estudis Çs de  : ',maltres:2:2);
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       vp10:=true;
       close(a);
     End;
     readln;

END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr11;

VAR
mnt,mfh,meh,mcs:real;
nnt,nfh,neh,ncs:integer;

BEGIN
     mnt:=0;     mfh:=0;  meh:=0;  mcs:=0;    neh:=0;       ncs:=0;
     nnt:=0;     nfh:=0;

     For nal:=1 to nal do begin
          If (enq[nal].P2=1) then begin
             Mnt:=Mnt+enq[nal].P8;
             nnt:=nnt+1;

          End;
          If (enq[nal].P2=2) then begin
             Mfh:=Mfh+enq[nal].P8;
             nfh:=nfh+1;
          End;
          If (enq[nal].P2=3) then begin
             meh:=Meh+enq[nal].P8;
             neh:=neh+1;
          End;
          If (enq[nal].P2=4) then begin
             Mcs:=Mcs+enq[nal].P8;
             ncs:=ncs+1;
          End;

     End;
     If nnt <> 0 then Mnt:=Mnt/Nnt;
     If nfh <> 0 then Mfh:=Mfh/nfh;
     If neh <> 0 then Meh:=meh/neh;
     If ncs <> 0 then Mcs:=mcs/ncs;

     clrscr;
     Writeln('RESULTAT DE LA PREGUNTA 11');
     writeln('Mitjana de notes:');
     writeln;
     writeln('Alumnes que no treballen                       : ',mnt:2:2);
     writeln('Alumnes que treballen fora del horari escolar  : ',mfh:2:2);
     writeln('Alumnes que treballen en horari escolar        : ',meh:2:2);
     writeln('Alumnes que treballen els caps de setmana      : ',mcs:2:2);


If (vp11=false) then begin
       append(a);
     Writeln(a,'RESULTAT DE LA PREGUNTA 11');
     writeln(a,'Mitjana de notes:');
     writeln(a);
     writeln(a,'Alumnes que no treballen                       : ',mnt:2:2);
     writeln(a,'Alumnes que treballen fora del horari escolar  : ',mfh:2:2);
     writeln(a,'Alumnes que treballen en horari escolar        : ',meh:2:2);
     writeln(a,'Alumnes que treballen els caps de setmana      : ',mcs:2:2);
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
      vp11:=true;
     close(a);
     End;
     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr12;
VAR
mnt,mfh,meh,mcs:real;
nnt,nfh,neh,ncs:integer;

BEGIN
     mnt:=0;     mfh:=0;  meh:=0;  mcs:=0;    neh:=0;       ncs:=0;
     nnt:=0;     nfh:=0;

     For nal:=1 to nal do begin
          If (enq[nal].P3=1) then begin
             Mnt:=Mnt+enq[nal].P8;
             nnt:=nnt+1;
          End;
          If (enq[nal].P3=2) then begin
             Mfh:=Mfh+enq[nal].P8;
             nfh:=nfh+1;
          End;
          If (enq[nal].P3=3) then begin
             meh:=Meh+enq[nal].P8;
             neh:=neh+1;
          End;
          If (enq[nal].P3=4) then begin
             Mcs:=Mcs+enq[nal].P8;
             ncs:=ncs+1;
          End;

     End;
     If nnt <> 0 then Mnt:=Mnt/Nnt;
     If nfh <> 0 then Mfh:=Mfh/nfh;
     If neh <> 0 then Meh:=meh/neh;
     If ncs <> 0 then Mcs:=mcs/ncs;

     clrscr;
     Writeln('RESULTAT DE LA PREGUNTA 12');
     writeln('Mitjana de notes per:');
     writeln;
     writeln('Alumnes que no treballen                       : ',mnt:2:2);
     writeln('Alumnes que treballen fora del horari escolar  : ',mfh:2:2);
     writeln('Alumnes que treballen en horari escolar        : ',meh:2:2);
     writeln('Alumnes que treballen els caps de setmana      : ',mcs:2:2);


If (vp12=false) then begin
       append(a);
     Writeln(a,'RESULTAT DE LA PREGUNTA 12');
     writeln(a,'Mitjana de notes per:');
     writeln(a);
     writeln(a,'Alumnes que no treballen                       : ',mnt:2:2);
     writeln(a,'Alumnes que treballen fora del horari escolar  : ',mfh:2:2);
     writeln(a,'Alumnes que treballen en horari escolar        : ',meh:2:2);
     writeln(a,'Alumnes que treballen els caps de setmana      : ',mcs:2:2);
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
      vp12:=true;
     close(a);
     End;
     readln;
END;

(*//////////////////////////////////////////////////////////////////////////*)

procedure Pr13;
VAR
   v: Array [1..20] of real;
   z: Array [1..20] of integer;
   i:integer;

BEGIN
     for i:=1 to 20 do begin
       v[i]:=0; {Inicialitzaci¢ again}
       z[i]:=0; {Comptador de nombre de notes a fer la mitjana}
     End;

     for nal:=1 to nal do begin
       i:=enq[nal].P7;
       v[i]:=v[i]+enq[nal].P8;
       z[i]:=z[i]+1;
       if v[i] <> 0 then v[i]:=v[i]/z[i];
     End;

     clrscr;
     writeln('RESPOSTA DE LA PREGUNTA 13');
     writeln('Mitjana notes per temps:');
     writeln;
     for i:=1 to 20 do begin
     If z[i] <> 0 then
     writeln('Estudis cursats en ',i,' quadrimestres: ',v[i]:2:2);
     End;


If (vp13=false) then begin
       append(a);
            writeln(a,'RESPOSTA DE LA PREGUNTA 13');
     writeln(a,'Mitjana notes per temps:');
     writeln(a);

     
     for i:=1 to 20 do begin
     If z[i] <> 0 then
     writeln(a,'Estudis cursats en ',i,' quadrimestres: ',v[i]:2:2);
     End;
     writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
     vp13:=true;

     close(a);
     End;
     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
Procedure Pr14;
VAR
          i,z,n,canvipos:integer;
          v:Array [1..99] of integer;
          temp:Array [1..10] of word;
          Aux:integer;
          massesbucles:integer;

BEGIN
     massesbucles:=0;

     for i:=1 to 99 do v[i]:=0;

     for nal:=1 to nal do begin
          for z:=1 to 3 do begin
             If enq[nal].P5[z] <> 0 then begin
               i:=enq[nal].P5[z];
               v[i]:=v[i]+1;
             End;
          End;
     End;

     for n:=1 to 10 do temp[n]:=0;
     n:=1;
     
     repeat
     aux:=0;

        {  Element + gran    }

        for i:=1 to 99 do BEGIN
            If (v[i] <> 0) and (aux < v[i]) then aux:=i;
        END;
        iF aUX <> 0 THEN v[aux]:=0;
        temp[n]:=aux;
        n:=n+1;
        massesbucles:=massesbucles+1;
     Until ((n=10) OR (massesbucles>=1000));

     clrscr;
     writeln('RESPOSTA DE LA PREGUNTA 14');
     writeln('Assignatures mÇs interessants (de + a -)');
     writeln;
     for n:=1 to 10 do writeln('Assignatura nß ',temp[n]);

If (vp14=false) then begin
       append(a);
            writeln(a,'RESPOSTA DE LA PREGUNTA 14');
            writeln(a,'Assignatures mÇs interessants (de + a -)');
            writeln(a);
            for n:=1 to 10 do writeln(a,'Assignatura nß ',temp[n]);
            writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       vp14:=true;
       close(a);
     End;
     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
procedure Pr15;
VAR
          i,z,n,canvipos:integer;
          v:Array [1..99] of integer;
          temp:Array [1..10] of word;
          Aux:integer;
          massesbucles:integer;

BEGIN
     massesbucles:=0;

     for i:=1 to 99 do v[i]:=0;

     for nal:=1 to nal do begin
          for z:=1 to 3 do begin
             If enq[nal].P4[z] <> 0 then begin
               i:=enq[nal].P4[z];
               v[i]:=v[i]+1;
             End;
          End;
     End;

     for n:=1 to 10 do temp[n]:=0;
     n:=1;
     
     repeat
     aux:=0;

        {  Element + gran    }

        for i:=1 to 99 do BEGIN
            If (v[i] <> 0) and (aux < v[i]) then aux:=i;
        END;
        iF aUX <> 0 THEN v[aux]:=0;
        temp[n]:=aux;
        n:=n+1;
        massesbucles:=massesbucles+1;
     Until ((n=10) OR (massesbucles>=1000));

     clrscr;
     writeln('RESPOSTA DE LA PREGUNTA 15');
     writeln('Assignatures mÇs dif°cils (de + a -)');
     writeln;
     for n:=1 to 10 do writeln('Assignatura nß ',temp[n]);

If (vp15=false) then begin
       append(a);
            writeln(a,'RESPOSTA DE LA PREGUNTA 15');
            writeln(a,'Assignatures mÇs dif°cils (de + a -)');
            writeln(a);
            for n:=1 to 10 do writeln(a,'Assignatura nß ',temp[n]);
            writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       vp15:=true;
       close(a);
     End;
     readln;
END;

(*//////////////////////////////////////////////////////////////////////////*)

procedure Pr16;
VAR       enqaux,enqaux2:array [1..100] of real;
          posicio,temp:array [1..100] of integer;
          aux:real;
          i,N,z,p,x,percentatge,aux2:integer;

BEGIN

{Inicialitzaci¢ arrays}

for nal:=1 to nal do enqaux[nal]:=enq[nal].P8;  { COPIA DE LES DADES ORIGINALS }
for nal:=1 to nal do begin
    posicio[nal]:=0;
    enqaux2[nal]:=0;

End;
for nal:=1 to nal do for z:=1 to 3 do copia[nal].P5[z]:=0;

{Fi Inicialitzaci¢ arrays}

     i:=1;
     p:=1;
     z:=1;
     If round(nal*0.20) > 10 then percentatge:=round(nal*0.20)
     Else percentatge:=10;


repeat { buscar les notes 20 % MêS ALTES}

   AUX:=0;
   for nal:=1 to nal do
     If aux < enqaux[nal] then begin
       aux:=enqaux[nal];
       p:=nal;
     End;
   {Ha trobat la nota mÇs alta (aux) i la posici¢ en que es troba (p)}

   enqaux[p]:=0;
   posicio[i]:=p;
   i:=i+1;
Until (i=percentatge+1);
clrscr;

{      En posicio[i] tenim les posicions dels alumnes amb nota mÇs alta}

for i:=1 to i-1 do begin
    for z:=1 to 3 do begin
        copia[i].P5[z]:=enq[posicio[i]].P5[z];
    End;
End;
p:=1;
{^.Obtenim vector copia amb els valors reals amb els quals hem de treballar.^}
for p:=1 to 100 do temp[p]:=0;
x:=0;
for i:=1 to i-1 do begin
    for z:=1 to 3 do begin
        p:=copia[i].P5[z];
        if p<>0 then temp[p]:=x+1;
    End;
End;
     N:=0;
        writeln('RESPOSTA DE LA PREGUNTA 16');
        writeln('10 Assignatures mÇs interessants del 20% dels alumnes amb millor nota mitja');
        writeln;
     If (vp16=false) then begin
        append(a);
        writeln(a,'RESPOSTA DE LA PREGUNTA 16');
        writeln(a,'10 Assignatures mÇs interessants del 20% dels alumnes amb millor nota mitja');
        writeln(a);
     End;
     repeat
     aux2:=0;

        {  Element + gran    }

        for p:=1 to 99 do BEGIN
            If (temp[p] <> 0) and (aux2 < temp[p]) then aux2:=p;
        END;
        if aux <> 0 then temp[aux2]:=0;

        writeln('Assignatura nß',aux2);
        If vp16=false then writeln(a,'Assignatura nß',aux2);
        n:=n+1;
     Until (n=10);

     If vp16=false then begin
       writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       vp16:=true;
       close(a);
     End;
     readln;
END;
(*//////////////////////////////////////////////////////////////////////////*)
Procedure Pr17;
VAR       enqaux,enqaux2:array [1..100] of real;
          posicio,temp:array [1..100] of integer;
          aux:real;
          i,N,z,p,x,percentatge,aux2:integer;

BEGIN

{Inicialitzaci¢ arrays}

for nal:=1 to nal do enqaux[nal]:=enq[nal].P8;  { COPIA DE LES DADES ORIGINALS }
for nal:=1 to nal do begin
    posicio[nal]:=0;
    enqaux2[nal]:=0;

End;
for nal:=1 to nal do for z:=1 to 3 do copia[nal].P6[z]:=0;

{Fi Inicialitzaci¢ arrays}

     i:=1;
     p:=1;
     z:=1;
     If round(nal*0.20) > 10 then percentatge:=round(nal*0.20)
     Else percentatge:=10;


repeat { buscar les notes 20 % MêS ALTES}

   AUX:=0;
   for nal:=1 to nal do
     If aux < enqaux[nal] then begin
       aux:=enqaux[nal];
       p:=nal;
     End;
   {Ha trobat la nota mÇs alta (aux) i la posici¢ en que es troba (p)}

   enqaux[p]:=0;
   posicio[i]:=p;
   i:=i+1;
Until (i=percentatge+1);
clrscr;

{      En posicio[i] tenim les posicions dels alumnes amb nota mÇs alta}

for i:=1 to i-1 do begin
    for z:=1 to 3 do begin
        copia[i].P6[z]:=enq[posicio[i]].P6[z];
    End;
End;
p:=1;
{^.Obtenim vector copia amb els valors reals amb els quals hem de treballar.^}
for p:=1 to 100 do temp[p]:=0;
x:=0;
for i:=1 to i-1 do begin
    for z:=1 to 3 do begin
        p:=copia[i].P6[z];
        if p<>0 then temp[p]:=x+1;
    End;
End;
     N:=0;
        writeln('RESPOSTA DE LA PREGUNTA 17');
        writeln('10 Assignatures menys interessants del 20% dels alumnes amb millor nota mitja');
        writeln;
     If (vp17=false) then begin
        append(a);
        writeln(a,'RESPOSTA DE LA PREGUNTA 17');
        writeln(a,'10 Assignatures menys interessants del 20% dels alumnes amb millor nota mitja');
        writeln(a);
     End;
     repeat
     aux2:=0;

        {  Element + gran    }

        for p:=1 to 99 do BEGIN
            If (temp[p] <> 0) and (aux2 < temp[p]) then aux2:=p;
        END;
        if aux <> 0 then temp[aux2]:=0;

        writeln('Assignatura nß',aux2);
        If vp17=false then writeln(a,'Assignatura nß',aux2);
        n:=n+1;
     Until (n=10);

     If vp17=false then begin
       writeln(a,'<-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*->');
       vp17:=true;
       close(a);
     End;
     readln;
END;
(*--------------------------------------------------------------------------*)
(*---------------------------------- kReDiTs -------------------------------*)
(*--------------------------------------------------------------------------*)


PROCEDURE credits;
   Begin
     clrscr;
     
     textcolor(LightBlue);
     gotoxy(35,13);
     write('bY ÜRt');
     textcolor(lightgreen);
     write('!');
     textcolor(white);
     write('ùm·');
     Textcolor(lightgreen);
     write(' ©');

     REPEAT
     
     DELAY(3000);
     gotoxy(30,13);
     WRITE('/');
     gotoxy(wherex-1,13);
     DELAY(3000);
     write('-');
     gotoxy(wherex-1,13);
     DELAY(3000);
     write('\');
     gotoxy(wherex-1,13);
     DELAY(3000);
     write('|');
     Until keypressed;
     textcolor(lightgray);


   End;


(*//////////////////////////////////////////////////////////////////////////*)
(*//////////////////////////////////////////////////////////////////////////*)
{
   PPPPP  RRRRR  IIIIII  NN   N  CCCCC  IIIIII  PPPPP  AAAAA  LL       ||
   PP PP  RR RR    II    NNN  N  CC       II    PP PP  A   A  LL       ||
   PPPPP  RRRR     II    NN N N  CC       II    PPPPP  AAAAA  LL       ||
   PP     RR RR    II    NN  NN  CC       II    PP     A   A  LL       ||
   PP     RR  R  IIIIII  NN   N  CCCCC  IIIIII  PP     A   A  LLLLLL  \::/
                                                                       \/
               P R O G R A M A   P R I N C I P A L                           }
(*//////////////////////////////////////////////////////////////////////////*)
(*//////////////////////////////////////////////////////////////////////////*)


BEGIN
     Vp1:=false;
     Vp2:=false;
     Vp3:=false;
     Vp4:=false;
     Vp5:=false;
     Vp6:=false;
     Vp7:=false;
     Vp8:=false;
     Vp9:=false;
     Vp10:=false;
     Vp11:=false;
     Vp12:=false;
     Vp13:=false;
     Vp14:=false;
     Vp15:=false;
     Vp16:=false;
     Vp17:=false;
     nal:=0;
     al:=0;
     repeat
     clrscr;
     writeln('Triã una modalitat per a carregar les dades: ');
     writeln;writeln;
     writeln('          1.- Carregar les dades d''un fitxer de text');
     writeln('          2.- Introduãr les dades a continuaci¢');
     writeln;writeln;
     write('La seva opci¢ Çs: ');
     readln(modalitat);
     Until ((modalitat=1) or (modalitat =2));
     clrscr;

     If modalitat=1 then fitxer
     Else manual;
     clrscr;
     gotoxy(1,13);
     writeln('ADVERT‘NCIA: Cada cop que entri en una opci¢ resultat per primera');
     writeln('vegada, a mÇs de veure els resultats per pantalla, seran guardats');
     writeln('en l''arxiu que vostä a continuaci¢ indiqui:');
     writeln;
     write('NOM FITXER RESULTAT: ');
     readln(fRes);
     assign(a,fRes);
     rewrite(a);
     writeln(a,'NOMBRE D''ALUMNES ENQUESTATS = ',nal);
     writeln(a,'===================================================');
     close(a);


     REPEAT

     clrscr;

     write('|| ALUMNES ENQUESTATS = ');
     textcolor(white+blink);
     write(nal);textcolor(lightgray);
     writeln(' ||   /* CÖlculs estad°stics: *\');
     writeln;
     writeln('1.  Percentatge per grups de la pregunta 1');
     writeln('2.  Percentatge per grups de la pregunta 2');
     writeln('3.  Percentatge per grups de la pregunta 3');
     writeln('4.  Nß d''alumnes per cada valor de temps en finalitzar els estudis');
     writeln('5.  Mitjana total de temps');
     writeln('6.  Mitjana de temps per estudis');
     writeln('7.  Mitjana de temps per fase d''accÇs');
     writeln('8.  Mitjana de temps per laboral');
     writeln('9.  Mitjana de notes global');
     writeln('10. Mitjana de notes per grups segons estudis');
     writeln('11. Mitjana de notes per grups segons fase d''accÇs');
     writeln('12. Mitjana de notes per grups segons laboral');
     writeln('13. Mitjana de notes per temps');
     writeln('14. Ordre de les 10 assignatures mÇs interessants');
     writeln('15. Ordre de les 10 assignatures mÇs dif°cils');
     writeln('16. Buscar les 10 assignatures mÇs interessants del 20% dels alumnes');
     writeln('    amb millor nota mitja.');
     writeln('17. Buscar les 10 assignatures menys interessants del 20% dels alumnes');
     writeln('    amb millor nota mitja');
     writeln('18. Extra --> VEURE ESTAT DE LA MEMORIA');
     writeln('19. Extra --> Guardar estat de la memïria en un arxiu');
     writeln;
     write('La seva elecci¢ Çs (0 SORTIR): ');

     readln(eleccio);

     case (eleccio) of

     1:    Pr1;
     2:    Pr2;
     3:    Pr3;
     4:    Pr4;
     5:    Pr5;
     6:    Pr6;
     7:    Pr7;
     8:    Pr8;
     9:    Pr9;
     10:   Pr10;
     11:   Pr11;
     12:   Pr12;
     13:   Pr13;
     14:   Pr14;
     15:   Pr15;
     16:   Pr16;
     17:   Pr17;
     18:   Veure_memoria;
     19:   BEGIN
           write('Nom del fitxer: ');
     readln(nomf);
     assign(a,nomf);
     rewrite(a);
     for nal:=1 to nal do begin

           writeln(a,nal);
           writeln(a,enq[nal].P1);
           writeln(a,enq[nal].P2);
           writeln(a,enq[nal].P3);
           writeln(a,enq[nal].P4[1]);
           writeln(a,enq[nal].P4[2]);
           writeln(a,enq[nal].P4[3]);
           writeln(a,enq[nal].P5[1]);
           writeln(a,enq[nal].P5[2]);
           writeln(a,enq[nal].P5[3]);
           writeln(a,enq[nal].P6[1]);
           writeln(a,enq[nal].P6[2]);
           writeln(a,enq[nal].P6[3]);
           writeln(a,enq[nal].P7);
           writeln(a,enq[nal].P8);
        End;
        close(a);

           END;
     0:    credits;
     End; {CASE}

     UNTIL (eleccio=0);









END.
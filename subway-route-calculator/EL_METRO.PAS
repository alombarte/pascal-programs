PROGRAM PracMetro;
Uses crt;

TYPE apuntador=^estacio;
     estacio=record
       nom:string[20];
       ant:apuntador;
       seg:apuntador;
       linia:BYTE;
       trans:boolean;
       transbord:array [1..3] of STRING;
       ltrans:array [1..3] of byte;
     End;

VAR
   p,q,r,control:apuntador;
   aux:string;
   stat:estacio;
   ini_trans,fi_trans:apuntador;
   ini: array [1..10] of apuntador;
   fi: array [1..10] of apuntador;
   n:word;
   i,i2,Z,c:byte;
   f:file of estacio;
   usuari,check,trOK:boolean;
   login,est:string;
   pwd:string;
   ch,opcio,opcio2:char;
   nomf:string;
   lin:byte; {USAT PELS FITXERS DE TIPUS}

   tr,TR2:BYTE;
   PENJAT:INTeger; {transbord penjat, JA NO CAL}


FUNCTION PASSWORD:string;
BEGIN
     i:=1;
     repeat
     ch:=readkey;
     If ch=#0 then ch:=readkey
     Else
        If ch <> #8 then begin
        password[i]:=Ch;
        iF CH <> #13 THEN BEGIN
           TEXTCOLOR(lIGHTGREEN);
           write('*');
           TEXTCOLOR(WHITE);
        eND;
        i:=i+1;
     End;
     Until (ch=#13);
     writeln;
     password[0]:=chr(i-2);
END;
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     procedure veure_linia;
     BEGIN
     clrscr;
     repeat
     
     
     repeat
     write('Quina lกnia vol veure?: ');
     TEXTCOLOR(lIGHTGREEN);
     readln(i);
     until ((i>0) and (i<11));
     TEXTCOLOR(WHITE);
     until ((i<11) and (i>0));
     clrscr;
     If ini[i]<>nil then begin

        TEXTCOLOR(lIGHTGREEN);
        writeLN('** LึNIA ',i,' **');
        writeln;
        TEXTCOLOR(WHITE);
        p:=ini[i];
        repeat
          If p^.trans=true then writeln(p^.nom,'      (*)')
          Else writeln(p^.nom);
          p:=p^.seg;
        Until (p=nil);
        writeln('                           (*) Transbord en lกnia');
     End
     Else writeln('La lกnia ',i,' no existeix');
     ch:=readkey;
     END;
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     procedure veure_xarxa;
     BEGIN
     i:=1;
     repeat
     If ini[i]<>nil then begin
     clrscr;
        TEXTCOLOR(lIGHTGREEN);
        writeLN('** LึNIA ',i,' **');
        writeln;
        TEXTCOLOR(WHITE);
        p:=ini[i];
        repeat
          If p^.trans=true then writeln(p^.nom,'      (*)')
          Else writeln(p^.nom);
          p:=p^.seg;
        Until (p=nil);

        writeln('                           (*) Estaciข amb transbord');
        ch:=readkey;
     End;
     I:=I+1;
     until (i>10);
     END;
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     procedure itinerari;
     VAR
  ascendent,est,direccio:boolean;
  origen, desti, nome : STRING[20];
  lino, lind, i : INTEGER;
  o, d, t, w : apuntador;
  label invers;
  label origen_i_desti;
  label TransSimult;
  label final;
  label notrans;

BEGIN
  ascendent:=TRUE;
  est:=TRUE;
  clrscr;
   TEXTCOLOR(lIGHTGREEN);
        writeLN('** ITINERARI **');
        writeln;
   TEXTCOLOR(WHITE);
  write('Origen?: ');
   TEXTCOLOR(lIGHTGREEN);
   readln(origen);
   TEXTCOLOR(WHITE);
   write('Destก?: ');
   TEXTCOLOR(lIGHTGREEN);
   readln(desti);
   TEXTCOLOR(WHITE);
  
  o:= NIL;
  d:= NIL;
  for lin:=1 to 10 do if ini[lin]<>nil then begin

    p:=ini[lin];
    repeat
      if p^.nom=origen then begin
        lino:= lin; (* Linia origen guardada *)
        o:= p;      (* Apuntador a l'estaciข origen *)
      end;
      if p^.nom=desti then begin
        lind:= lin;     (* Linia origen guardada *)
        d:= p;          (* Apuntador a l'estaciข origen *)
      end;
      p:=p^.seg;
    until p=nil;
  end;


    (*  En aquest punt ja tenim apuntats les dues estacions *)


  if ((o=nil) or (d=nil)) OR (O=D) then begin
     if o=nil then writeln('Impossible localitzar la estaciข ',origen);
     if d=nil then writeln('Impossible localitzar la estaciข ',desti);
     if d=o then writeln('Per anar al mateix lloc no li cal agafar el metro!');
  End
  Else begin
    if lino<>lind then begin {No parlem de la mateixa linia}
      t:= nil;    (* 't' guardar… estaciข transbord *)
      p:=ini[lino];
      repeat
        for z:=1 to 3 do if p^.ltrans[z]=lind then t:=p;
        p:=p^.seg;
      until p=nil;

      if t=nil then begin       (* L'usuari ha oblidat el transbord entre aquestes 2 linies *)
         writeln('ERROR: Ha oblidat d''inserir un transbord entre les 2 lกnies');
         goto notrans;
      end
      else 
      if t^.nom = o^.nom then goto origen_i_desti;
      begin                {Buscar la estaciข origen fins al destก}
        p:=ini[lino];
        direccio:=true;
        while p^.nom<>origen do begin
          if (p^.nom=t^.nom) then direccio:=false;
          P:=P^.SeG;
        End;
        repeat
          writeln(p^.nom,' (L',P^.LINIA,')');
          if direccio=true then p:=p^.seg     {direcciข ascendent}
          else p:=p^.ant;
        until p^.nom=t^.nom;

        origen_i_desti: if t^.nom=o^.nom then begin
           (* Origen no est… enllaat amb destก? *)
           for z:=1 to 3 do if t^.transbord[z]=d^.nom then goto TransSimult;
        end;
        for z:=1 to 3 do begin  (* estaciข destก no s estacio enlla *)
              if t^.transbord[z]=d^.nom then goto final;
        end;
        write(t^.NOM,' (L',t^.linia,') -(*)-> ');
        p:=ini[lind];
        if t^.ltrans[1]=lind then nome:= t^.transbord[1] else
        if t^.ltrans[2]=lind then nome:= t^.transbord[2] else
        if t^.ltrans[3]=lind then nome:= t^.transbord[3] else est:=false;
        direccio:=true;

        if est=true then while(p^.nom<>nome) do begin
          if p^.nom=nome then direccio:=false;
          p:=p^.seg;
        END;
        w:=P;
        repeat  (* Comprovaciข de direcciข *)
          if direccio=true then w:=w^.seg
          else ascendent:=false;

          if w=nil then begin
            ascendent:=false;
            goto invers
          end;
        until w^.nom=desti;

        if ascendent=true then begin (* Recorregut endavant *)
          repeat
            writeln(p^.nom,' (L',P^.LINIA,')');
            if direccio=true then p:=p^.seg
            else ascendent:=false;
          until p^.nom=desti;
         end;

        invers: if ascendent=false then begin (* Recorregut endarrere *)
        repeat
          writeln(p^.nom,' (L',P^.LINIA,')');
          if direccio=true then p:=p^.ant
          else p:=P^.SeG;

        until p^.nom=desti;
      End;
      writeln(d^.nom,' (L',d^.linia,')');
      End;

      (*-------------------------------------------------------------------*)
      TransSimult: (* Origen i destก comparteixen transbord *)

      if t^.nom=o^.nom then begin
         
         for z:=1 to 3 do
             if t^.transbord[z]=d^.nom then begin
                   writeln(o^.nom,' (L',o^.linia,') -(*)-> ',d^.nom,' (L',d^.linia,')');
                   goto notrans;
             end;
          end;
      (*-------------------------------------------------------------------*)
      final:       (* Destก est… en un transbord final *)

      for z:=1 to 3 do  
             begin
                 if t^.transbord[z]=d^.nom then begin
                    write(t^.NOM,' (L',t^.linia,') -(*)-> ',desti,' (L',d^.linia,')');
                    {writeln(desti);}
                 end;
             end;

    (*-------------------------------------------------------------------*)
    notrans:
    
    end
    else (* No hi ha transbord *)
    begin
      p:=ini[lino];
      direccio:=true;
      while p^.nom<>origen do begin
        if p^.nom=desti then direccio:=false;
        p:=p^.seg;
      end;

      repeat
        writeln(p^.nom,' (L',P^.LINIA,')');
        if direccio=true then p:=p^.seg
        else p:=p^.ant;
      until p^.nom=desti;
      writeln(d^.nom,' (L',d^.linia,')');

    end;
  end;
   TEXTCOLOR(lIGHTGREEN);
   writeln('                             -(*)-> TRANSBORDS');
   TEXTCOLOR(WHITE);
  ch:=readkey;

     END;
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     procedure recuperar;
     BEGIN
     clrscr;
     TEXTCOLOR(lIGHTGREEN);
     writeln('** RECUPERAR UN ARXIU **');
     WRITELN;
     TEXTCOLOR(WHITE);
     write('Nom del arxiu: ');
     TEXTCOLOR(lIGHTGREEN);
     readln(nomf);
     TEXTCOLOR(WHITE);

     assign(f,nomf);
     {$I-}
       reset(f);
       close(f);
     {$I+}
     If  Ioresult <> 0 then BEGIN
        writeln('L''arxiu no existeix');
        ch:=readkey;
     End
     Else begin
          RESET(F);
          SEEK(F,0);
          z:=0;
          while not eof (f) do begin
                if z=0 then begin
                   new(p);
                   read(f,p^);
                   ini[p^.linia]:=p;
                   z:=1;
                end;

                NEW(q);
                read(f,q^);
                if ((q^.linia >0) and (q^.linia <11)) then begin
                if p^.linia <> q^.linia then begin
                   ini[q^.linia]:=q;
                   fi[p^.linia]:=p;
                end
                else
                   q^.ant:=p;
                   q^.seg:=nil;
                   q:=p;
                end;
          end;


          close(f);
          writeln('Xarxa recuperada');
          CH:=READKEY;
          End;
              
End;
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     procedure gravar;
     BEGIN
          clrscr;
          TEXTCOLOR(lIGHTGREEN);
          WRITELN(** DESAR UN ARXIU **);
          WRITELN;
          TEXTCOLOR(WHITE);
          write('Arxiu on vol desar: ');
          TEXTCOLOR(lIGHTGREEN);
             readln(nomf);
         TEXTCOLOR(WHITE);

          assign(f,nomf);
          rewrite(f);
          for lin:=1 to 10 do begin
            
            If ini[lin]<>nil then begin
             p:=ini[lin];
               REPEAT
                  WRITE(f,p^);
                  p:=p^.seg;

               UNTIL p=nil;
            End;



          End;
          close(f);
          writeln('Xarxa desada!');
          CH:=READKEY;

     END;

     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }


   procedure mantenir_linia;
   BEGIN
   REPEAT
     clrscr;
     TEXTCOLOR(WHITE);
     WRITELN;
     WRITELN;
     WRITELN('                             ษออออออออออออออออป');
     WRITE('                  ษออออออออออน');
     TEXTCOLOR(lIGHTGREEN);WRITE(' MANT ESTACIONS');
     TEXTCOLOR(WHITE);
     WRITELN(' ฬออออออออออป');
     WRITELN('                  บ          ศออออออออออออออออผ          บ');
     WRITELN('                  บษออออออออออออออออออออออออออออออออออออปบ');
     WRITELN('                  ฬน  1. AFEGIR ESTACIONS               ฬน');
     WRITELN('                  บบ  2. ELIMINAR ESTACIONS             บบ');
     WRITELN('                  บบ  3. MODIFICAR LES ESTACIONS (NOM)  บบ');
     WRITELN('                  บบ                                    บบ');
     WRITELN('                  ฬน  0. MEN้ ANTERIOR                  ฬน');
     WRITELN('                  บศออออออออออออออออออออออออออออออออออออผบ');
     WRITELN('                  บ OPCIเ:                               บ');
     WRITELN('                  ศออออออออออออออออออออออออออออออออออออออผ');
     GOTOXY(28,13);
     TEXTCOLOR(lIGHTGREEN);
     readln(opcio2);
     TEXTCOLOR(WHITE);
     
     case (opcio2) of
     '1':begin
            clrscr;
            TEXTCOLOR(lIGHTGREEN);
            WRITELN('** AFEGIR ESTACIONS **');
            WRITELN;
            TEXTCOLOR(WHITE);

            repeat
            write('Lกnia on vol afegir estacions: ');
            TEXTCOLOR(lIGHTGREEN);
                 readln(i);
                 until ((i>0) and (i<11));
            TEXTCOLOR(WHITE);
   
            
            if ini[i]=nil then writeln('La lกnia no existeix')
            Else begin
              
              write('Nom de la estaciข anterior?: ');
              TEXTCOLOR(lIGHTGREEN);
              readln(aux);
              TEXTCOLOR(WHITE);
              
              q:=ini[i];
              p:=nil;
              repeat
                    if q^.nom=aux then p:=q;
                    q:=q^.seg;
              Until (q=nil);
              If p=nil then writeln('La estaciข no existeix')
              Else begin
                   write('Nom de la nova estaciข?: ');
                   TEXTCOLOR(lIGHTGREEN);
                   readln(aux);
                   TEXTCOLOR(WHITE);
   
         
                   new(q);
                   q^.nom:=aux;
                   q^.ant:=p;
                   q^.seg:=p^.seg;
                   r:=p^.seg;
                   r^.ant:=q;
                   p^.seg:=q;
                   WRITELN('Estaciข ',aux,' creada!');

              End;
            End;

         End;
     '2':begin
              clrscr;
              TEXTCOLOR(lIGHTGREEN);
              WRITELN('** ELIMINAR ESTACIONS **');
              WRITELN;
              TEXTCOLOR(WHITE);
              
              repeat
              write('Nง de lกnia?: ');
              TEXTCOLOR(lIGHTGREEN);
               readln(i);
              until ((i>0) and (i<11));
              TEXTCOLOR(WHITE);

              if ini[i]=nil then writeln('La lกnia no existeix')
              Else begin
              writeln('Recordi que els transbords no es poden eliminar...');
              write('Nom de la estaciข a eliminar?: ');
              TEXTCOLOR(lIGHTGREEN);
              readln(AUX);
              TEXTCOLOR(WHITE);
              p:=ini[i];
              Q:=NIL;
              REPEAT
              if (p^.nom=aux) and (p^.trans=false) then begin
                q:=p^.seg;
                r:=p^.ant;
                q^.ant:=r;
                r^.seg:=q;
                writeln('Estaciข eliminada amb xit!');
              end;
              P:=P^.seg;
              UNTIL (P=NIL);
              End;

              ch:=readkey;
         end;
     '3':begin
         clrscr;
         TEXTCOLOR(lIGHTGREEN);
               WRITELN('** MODIFICAR EL NOM **');
               WRITELN;
         TEXTCOLOR(WHITE);
         repeat
         write('Lกnia?: ');
         TEXTCOLOR(lIGHTGREEN);
         readln(i);
         until ((i>0) and (i<11));
         TEXTCOLOR(WHITE);

         If ini[i]=nil then writeln('La lกnia no existeix!')
         Else begin
              write('Nom de la estaciข a canviar: ');
              TEXTCOLOR(lIGHTGREEN);
               readln(AUX);
              TEXTCOLOR(WHITE);

              p:=ini[i];
              q:=nil;
              repeat
                if aux=p^.nom then q:=p;
                p:=p^.seg;
              until p=nil;
              If (q=nil) or (q^.trans=true) then writeln('Estaciข no trobada! (Asseguri''s que no s un transbord)')
              Else begin
                write('Nou nom?: ');
                TEXTCOLOR(lIGHTGREEN);
               readln(q^.nom);
              TEXTCOLOR(WHITE);

                writeln('Nom de la estaciข canviada!');
                {**    NOTAR QUE NO ES CANVIEN ELS TRANSBORDS **}

              End;
         End;
              CH:=READKEY;
         end;

     End; {case}
   Until (opcio2='0');
   END;

{ ----------------------------------------------------------------------  }
{ ----------------------------------------------------------------------  }
{ ----------------------------------------------------------------------  }
{ ----------------------------------------------------------------------  }

     procedure mantenir_xarxa;
     VAR
        cont:integer;
        correcte:boolean;
     BEGIN

     cont:=0;
     correcte:=false;

     repeat
     clrscr;
     TEXTCOLOR(WHITE);
     WRITELN;
     WRITELN;
     WRITELN('                             ษออออออออออออออออป');
     WRITE('                  ษออออออออออน');
     TEXTCOLOR(lIGHTGREEN);WRITE(' MANT DE XARXES');
     TEXTCOLOR(WHITE);
     WRITELN(' ฬออออออออออป');
     WRITELN('                  บ          ศออออออออออออออออผ          บ');
     WRITELN('                  บษออออออออออออออออออออออออออออออออออออปบ');
     WRITELN('                  ฬน  1. CREAR UNA LINIA                ฬน');
     WRITELN('                  บบ  2. ELIMINAR UNA LINIA             บบ');
     WRITELN('                  บบ                                    บบ');
     WRITELN('                  ฬน  0. MEN้ ANTERIOR                  ฬน');
     WRITELN('                  บศออออออออออออออออออออออออออออออออออออผบ');
     WRITELN('                  บ OPCIเ:                               บ');
     WRITELN('                  ศออออออออออออออออออออออออออออออออออออออผ');
     GOTOXY(28,12);
     TEXTCOLOR(lIGHTGREEN);
          readln(opcio2);
     TEXTCOLOR(WHITE);

     case (opcio2) of
     '1':begin
         cont:=0;
         trOK:=false;
         for Z:=1 to 10 do If ini[Z] <> nil then cont:=cont+1;
         CLRSCR;
         TEXTCOLOR(lIGHTGREEN);
         WRITELN('** CREAR UNA LINIA **');
         WRITELN;
         TEXTCOLOR(WHITE);
         repeat
           
           repeat
           write('Nฃmero de lกnia: ');
           TEXTCOLOR(lIGHTGREEN);
           readln(i);
           until ((i>0) and (i<11));
           TEXTCOLOR(WHITE);
         Until ((i>0) and (i<=10));

         If cont=0 then begin
            PENJAT:=i; {CONTROLA LA LINIA QUE NO TE EL TRANSBORD FET}
            trOk:=true;
         End
         Else begin
             penjat:=0;
         End;


  {-1-}    If ini[i] = nil then begin { NO EXISTIA LA LINIA }
           writeln('L',i);
           writeln('๙๙๙๙๙');
           writeln;
           repeat write('Nombre d''estacions a introdur: ');readln(n); until (n>0);
           new(p);
           write('ESTACIเ 1: ');readln(p^.nom);
           p^.linia:=i;
           p^.trans:=false;
           p^.ant:=nil;
           p^.seg:=nil;
           for z:=1 to 3 do begin
              p^.transbord[z]:='BUIT';
              p^.ltrans[z]:=0;
           end;
           ini[i]:=p;
           fi[i]:=p;

           for n:=2 to n do begin
             new(p);
             write('ESTACIเ ',n,': ');
             readln(p^.nom);
             p^.linia:=i;
             P^.trans:=false;
             for z:=1 to 3 do begin
                p^.transbord[z]:='BUIT';
                p^.ltrans[z]:=0;
             end;
             fi[i]^.seg:=p;
             p^.ant:=fi[i];
             p^.seg:=nil;
             fi[i]:=p;
           End;

           for Z:=1 to 10 do If ini[Z] <> nil then cont:=cont+1;
           {cont=nombre de linies creades}

           WRITELN;

{-1.1-} IF CONT>1 THEN BEGIN {AQUESTA CONDICIเ FA SALTAR EL CREAR TRANSBORDS}
             writeln('Ha de crear com a mกnim un transbord si encara no ha fet:');
(*--------------------------------------------------------------------------*)
   
(*--------------------------------------------------------------------------*)
{+1+}        REPEAT
                writeln('Polsi ''S'' per crear TRANSBORDS en aquesta lกnia... ');
                ch:=readkey;

{-2-}           If ((ch='S') OR (ch='s')) AND (cont>=1) then begin
                  write('ORIGEN (L',I,')?: ');
                  new(p);
                  new(q);
                  p:=nil;
                  q:=ini[i];
                  readln(est);
                  repeat
                    If (est=q^.nom) then p:=q;
                    q:=q^.seg;
                  until (q=nil);

{-3-}             If p=nil then begin {ESTACIO INEXISTENT}
                    writeln('No EXISTEIX ',est);
                    trOK:=false;
                  End
                  Else begin
                    
                    REPEAT
                    write('LINIA DESTึ?: ');
                    readln(i2);
                    If ((ini[i2]=nil) or (i2=i)) then writeln('Lกnia no v…lida!');
                    UNTIL ((ini[i2]<>nil) and (i2<>i));

                    if ini[i2]<>nil then begin
                      write('ESTACIเ DESTึ (L',i2,'): ');
                      readln(est);
                      new(r);
                      (* Recordar que P encara apunta a la estaciข origen del trans*)
                      r:=nil;
                      q:=ini[i2];
                      repeat
                        If (q^.nom=est) then r:=q;
                        q:=q^.seg;
                      until (q=nil);
                     End;
{-4-}                If r=nil then begin
                       writeln('ERROR: No hi ha cap estaciข ',est,' en L',i2);
                       trOK:=false;
                     End
                     Else begin
                       tr:=1;
                       for z:=1 to 3 do if p^.transbord[z]<>'BUIT'then tr:=tr+1;
                       If tr < 4 then begin
                          tr2:=1;
                          for z:=1 to 3 do if r^.transbord[z]<>'BUIT'then tr2:=tr2+1;
                          If tr2 < 4 then begin
                            p^.trans:=true;
                            r^.trans:=true;
                            r^.transbord[tr2]:=p^.nom;
                            r^.ltrans[tr2]:=p^.linia;
                            p^.transbord[tr]:=r^.nom;
                            p^.ltrans[tr]:=r^.linia;
                            writeln('Transbord EFECTUAT');
                            trOK:=true;
                          End
                          Else begin
                             writeln('M…xim de transbords en ',r^.nom);
                          End;
                       End
                       Else begin
                          writeln('M…xim de transbords en ',p^.nom);

                       End;
                     End; {-4-}
                  End; {-3-}
                End {-2-}
                Else begin
                   p:=ini[i];
                   Repeat
                   if p^.trans=true then trOK:=true;
                   p:=p^.seg;
                   until (p=nil);
                   If trOK=false then writeln('Ha de crear com a mกnim un transbord');
                End;
             UNTIL ((trOK=true) AND (CH<>'S')); {+1+}
         END; {-1.1-, SALT DE TRANSBORDS}
           End
           Else begin
              writeln('Error! La linia ja existeix.');
              writeln;
              writeln('Linies disponibles');
              writeln('==================');
              For i:=1 to 10 do If ini[i]=nil then writeln('        L',i);
              
           End; {-1-}
     IF CH<>'S'THEN writeln('Fi L',i);
     ch:=readkey;
     END; {case}

     '2':begin
         CLRSCR;
          TEXTCOLOR(lIGHTGREEN);
         WRITELN('** ELIMINAR UNA LึNIA **');
         WRITELN;
           TEXTCOLOR(WHITE);
     
         write('Quina lกnia vol eliminar?: ');
               TEXTCOLOR(lIGHTGREEN);
           readln(LiN);
           TEXTCOLOR(WHITE);

         IF ini[lin]<>NIL THEN BEGIN
           p:=ini[LIN];
           REPEAT
           for z:=1 to 3 do begin        (*Comproba tots els transbords possibles*)
             if p^.ltrans[z]<>0 then begin
                 q:=ini[p^.ltrans[z]];
                 repeat
                   if q^.ltrans[z]=lin then begin
                     q^.transbord[z]:='BUIT';
                     q^.ltrans[z]:=0;
                   End;
                   if ((q^.transbord[1]='BUIT') AND (q^.transbord[2]='BUIT') AND
                   (q^.transbord[3]='BUIT')) then q^.trans:=false;
                   q:=q^.seg;
                 until q=nil;
             end;
           end;
         p:=p^.seg;
         UNTIL P=NIL;
         ini[LIN]:=nil;
         writeln('Borrada la L',LIN,' i tots els transbords a altres lกnies associats.');
         END
         ELSE writeln('Lกnia inexistent!');
         ch:=readkey;
         end;
         
     End; {case}
     
     Until (opcio2='0');
     
     
     END;
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     { --------------------------------------------------------------------  }
     PROCEDURE credits;
   Begin
     clrscr;
     
     textcolor(LightBlue);
     gotoxy(35,13);
     write('bY Rt');
     textcolor(lightgreen);
     write('!');
     textcolor(white);
     write('mแ');
     Textcolor(lightgreen);
     write(' ฉ');

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

{ ====================------------------------------------=================
    MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN
    MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN
    MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN MAIN
  ====================-------------------------------------================ }

BEGIN

     for LIN:=1 to 10 do begin
         ini[lin]:=nil;
         fi[lin]:=nil;
     End;

     PENJAT:=0;
     usuari:=false;
     check:=false;


   REPEAT
     repeat
     clrscr;
     textcolor(LightGreen);
     gotoxy(60,1);
     writeln('Login: USUARI');
     gotoxy(60,2);
     writeln('Login: MANTENIMENT');
     gotoxy(60,3);
     writeln('Login: SORTIR');

     textcolor(white);

     gotoxy(1,22);

     write('    Login: ');
     readln(login);
     If ((login='MANTENIMENT') or (login='USUARI')) or (login='SORTIR') then usuari:=true
     Else writeln('    No existeix login');

     If login='MANTENIMENT' THEN begin
          write('    Password: ');
          pwd:=password;
          If pwd='\|/' then check:=true
          Else writeln('    Password incorrecte');


     End;
     If ((login='USUARI') or (login='SORTIR')) then check:=true;
     if check=false then readln;
     UNTIL (check=true);

     IF ((login='MANTENIMENT') OR (LOGIN='USUARI')) AND (CHECK=TRUE) THEN
     REPEAT
     CLRSCR;
     TEXTCOLOR(WHITE);
     WRITELN;
     WRITELN;
     WRITELN('                             ษออออออออออออออออป');
     WRITE('                  ษออออออออออน');
     TEXTCOLOR(lIGHTGREEN);WRITE(' MEN้ PRINCIPAL');
     TEXTCOLOR(WHITE);
     WRITELN(' ฬออออออออออป');
     WRITELN('                  บ          ศออออออออออออออออผ          บ');
     WRITELN('                  บษออออออออออออออออออออออออออออออออออออปบ');
     WRITELN('                  ฬน  1. VISUALITZAR UNA LึNIA          ฬน');
     WRITELN('                  บบ  2. VISUALITZAR LA XARXA           บบ');
     WRITELN('                  บบ  3. ITINERARI                      บบ');IF (LOGIN='MANTENIMENT') THEN BEGIN
     WRITELN('                  บบ                                    บบ');
     WRITELN('                  ฬน  A. RECUPERAR XARXA D''UN FITXER    ฬน');
     WRITELN('                  บบ  B. DESAR XARXA EN UN FITXER       บบ');
     WRITELN('                  บบ  C. MANTENIMENT LึNIA              บบ');
     WRITELN('                  บบ  D. MANTENIMENT XARXA              บบ');END;
     WRITELN('                  บบ                                    บบ');
     WRITELN('                  ฬน  0. S O R T I R                    ฬน');
     WRITELN('                  บศออออออออออออออออออออออออออออออออออออผบ');
     WRITELN('                  บ OPCIเ:                               บ');
     WRITELN('                  ศออออออออออออออออออออออออออออออออออออออผ');
     IF login='MANTENIMENT' then GOTOXY(28,18)
     Else GOTOXY(28,13);
     TEXTCOLOR(lIGHTGREEN);
     READLN(opcio);
     TEXTCOLOR(WHITE);
     
     case (opcio) of
     '0':CHECK:=FALSE;
     '1':IF ((login='MANTENIMENT') OR (LOGIN='USUARI')) THEN veure_linia;
     '2':IF ((login='MANTENIMENT') OR (LOGIN='USUARI')) THEN veure_xarxa;
     '3':IF ((login='MANTENIMENT') OR (LOGIN='USUARI')) THEN itinerari;
     'A':IF login='MANTENIMENT' then recuperar;
     'B':IF login='MANTENIMENT' then gravar;
     'C':IF login='MANTENIMENT' then mantenir_linia;
     'D':IF login='MANTENIMENT' then mantenir_xarxa;
     
     End; {case}
     UNTIL (OPCIO='0');
   UNTIL (LOGIN='SORTIR');
   CREDITS;
END.
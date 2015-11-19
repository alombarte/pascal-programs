PROGRAM PRACTICA1;
USES crt;

TYPE
    Agenda=record
       nom: String [40];
       direccio: string [50];
       telefon: string [9];
       edat: integer;
       sou: longint;
       End;

VAR
   Empresa: Array [1..40] Of Agenda;
   opcio,ch,menufuncio:char;
   i,cont,num,error,LINE:integer;
   nomFitxer,AUX:String;
   pos: String [2];
   proba:longint;
   arxiu:TEXT;
   MitjaEdats,MitjaSous:real;
   ExistiaArxiu,checkk:Boolean;
{-----------------------}
   EntraNom: String [40];
   EntraDir: string [50];
   EntraTelefon: string [9];
   EntraEdat: integer;
   EntraSou: longint;
   EntraSouAux: longint;
   EntraSou2: longint;
   EmpleatSPECIAL: integer;

(*--------------------------------------------------------------------------*)
(*------------------------------- FILTRES ----------------------------------*)
(*--------------------------------------------------------------------------*)

FUNCTION FiltreNom:String;
VAR nomx:string;
    Check:boolean;

   Begin

   i:=0;
   CHECK:=FALSE;



   repeat
   repeat

   ch:=readkey;
   if ch=#0 then begin
      ch:=readkey;
   End
   Else begin
      if ((ch>='A') and (ch<='Z')) or (ch=#32) 
         or ((ch>='a') and (ch<='z')) then begin
         If (i<40) then begin
         i:=i+1;
         write(ch);
         NOMX[I]:=ch;
         CHECK:=TRUE;
         End;
         
      End;
      If ch=#8 {Borrar} then Begin
         if (i > 0) then begin
           i:=i-1;
           gotoxy(wherex-1,wherey);
           write(' ');
           gotoxy(wherex-1,wherey);
           if i=0 then check:=False;

         End;
      End;
   End; {else}

   Until (ch=#13);
   Until (check=true);
   nomx[0]:=chr(i);
   filtreNom:=nomx;
End;

(*--------------------------------------------------------------------------*)
(*------------------------------- FILTRES ----------------------------------*)
(*--------------------------------------------------------------------------*)

FUNCTION FiltreSou:LONGINT;
var temp:string;
    error:integer;
    TEMP2:longint;
BEGIN


     I:=1;
     repeat
     repeat
     ch:=readkey;
     if ch=#0 then begin
        ch:=readkey;
     End
     Else begin
      if (ch>='0') and (ch<='9') and (i<7) then begin
         write(ch);
         temp[i]:=ch;
         i:=i+1;
       End;

   
      If ch=#8 {Borrar} then Begin
         if (i > 1) then begin
           i:=i-1;
           gotoxy(wherex-1,wherey);
           write(' ');
           gotoxy(wherex-1,wherey);

         End;
      End;
   End; {else}


     Until (ch=#13);
   temp[0]:=chr(i-1);
   val(temp,TEMP2,error);
   if (TEMP2>=20000) And (TEMP2<=500000) then begin
      FiltreSou:=TEMP2;
   End;
     Until ((TEMP2>=20000) AND (TEMP2<=500000));
END;


(*--------------------------------------------------------------------------*)
(*------------------------------- FILTRES ----------------------------------*)
(*--------------------------------------------------------------------------*)


FUNCTION FiltreEdat:INTEGER;
Var
   temp:String;
   error,edatX:integer;
   incorrecte:Boolean;

Begin
     

     incorrecte:=false;
     i:=1;
repeat
      
      if incorrecte=true then begin
         i:=1;
         gotoxy(11,wherey);
         write('  ');
         gotoxy(11,wherey);
         clreol;
      End;
repeat

   ch:=readkey;
   if ch=#0 then begin
      ch:=readkey;
   End
   Else begin
      if (ch>='0') and (ch<='9') and (i<3) then begin
         write(ch);
         temp[i]:=ch;
         i:=i+1;
      End;
       if (ch=#8) then begin
             if i>1 then BEGIN
             i:=i-1;
             gotoxy(wherex-1,wherey);
             write(' ');
             gotoxy(wherex-1,wherey);
             end;
         End;

   End; {else}
      temp[0]:=chr(i-1);
   val(temp,edatX,error);
   if (edatX>=16) And (edatX<=65) then begin
      FiltreEdat:=edatX;
      incorrecte:=false;
   End
   Else begin
        incorrecte:=true;
   End;
   Until (ch=#13);

   Until (edatX>=16) And (edatx<=65);


End;

(*--------------------------------------------------------------------------*)
(*------------------------------- FILTRES ----------------------------------*)
(*--------------------------------------------------------------------------*)

FUNCTION FiltreDireccio:String;
var direcciox:string;
    escrit:boolean;

   Begin
   i:=0;
   escrit:=false;
   repeat
   repeat

   ch:=readkey;
   if ch=#0 then begin
      ch:=readkey;
   End
   Else begin
      if (ch>='A') and (ch<='Z') or (ch=#32) or
         ((ch>='0') and (ch<='9')) 
         or ((ch>='a') and (ch<='z')) or (ch='.')
         or (ch='.') or (ch='\') or (ch='/')or (ch='-') then begin

            If (i<50) then begin
               i:=i+1;
               write(ch);
               Direcciox[i]:=ch;
            End;
            escrit:=true;

       End;
       If ch=#8 {Borrar} then Begin
         if (i > 0) then begin
           i:=i-1;
           gotoxy(wherex-1,wherey);
           write(' ');
           gotoxy(wherex-1,wherey);
           if i =0 then escrit:=false;

         End;
      End;
   End; {else}

   Until (ch=#13);
   Until (escrit=true);
   direcciox[0]:=chr(i);
   filtreDireccio:=direcciox;
End;



(*--------------------------------------------------------------------------*)
(*------------------------------- FILTRES ----------------------------------*)
(*--------------------------------------------------------------------------*)

FUNCTION FiltreTelefon:STRING;
var telefonx:string;

BEGIN
     i:=1;
     repeat
     repeat

     ch:=readkey;
     if ch=#0 then begin
        ch:=readkey;
     End
     Else begin

          if ((ch>='0') AND (ch<='9')) AND (i<10) then begin
             write(ch);
             telefonx[i]:=ch;
             i:=i+1;
          End;
          if (ch=#8) then begin
             if i>1 then begin
             i:=i-1;
             gotoxy(wherex-1,wherey);
             write(' ');
             gotoxy(wherex-1,wherey);
             End;
          End;
      End;

     Until (ch=#13);

     Until (i=10);
     telefonx[0]:=chr(i);
     filtreTelefon:=telefonx;


END;



(*--------------------------------------------------------------------------*)
(*------------------------------- FILTRES ----------------------------------*)
(*--------------------------------------------------------------------------*)

FUNCTION FiltreFitxer:STRING;
var filename:string;
    HiHaPunt,accepta:boolean;
    ext:word;


BEGIN

     i:=1;
     ext:=1;
     Hihapunt:=false;
     clrscr;
     Textcolor(White);
     writeln('Escrigui un nom de fitxer (m…x 8 car…cters) + "." + extensi¢ (3 car…cters)');
     writeln('Si s''equivoca podr… rectificar en el di…leg segent');

     gotoxy(32,12);
     TEXTCOLOR(LightGreen);
     WRITELN('ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');     gotoxy(32,13);
     WRITELN('º               º');     gotoxy(32,14);
     WRITELN('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼');
     TEXTCOLOR(White);
     gotoxy(35,13);
     
     repeat
       repeat
       ch:=readkey;
       if ch=#0 then begin
          ch:=readkey;
       End
       Else begin
         if ((ch>='A') and (ch<='Z') or (ch>='a') and (ch<='z')) and (i<9)
            and (hihapunt=false)  then begin
               write(ch);
               filename[i]:=ch;
               i:=i+1;
         End;
         if (ch='.') and (hihapunt=false) AND (i>1) then begin
            write(ch);
            filename[i]:=ch;
            
            i:=i+1;
            hihapunt:=true;
         End;
         if (hihapunt=true) and ((ch>='A')
             and (ch<='Z') or (ch>='a') and (ch<='z')) and (ext<4) then begin
               ext:=ext+1;
               write(ch);
               filename[i]:=ch;
               i:=i+1;
         End;
         
     End;
     
     Until (ext=4);
     Until (ch=#13);
     

     filename[0]:=chr(i-1);
     

     clrscr;
     gotoxy(40-i,12);
     writeln(filename);
     gotoxy(40-I,13);
     write('Est… segur? (S/N): [ ]');
     gotoxy(wherex-2,wherey);

     repeat
     ch:=readkey;
     if ch=#0 then begin ch:=readkey;
     End
     Else begin
     
     if (ch='S') or (ch='N') or (ch='s') or (ch='n') then begin
       If (ch='s') or (ch='S') then begin
          accepta:=true;
          write(ch);
          
       end;
       if (ch='N') or (ch='n') then begin
          accepta:=false;
          write(ch);
       End;
     End;
     End;
     If accepta=false then BEGIN
     clrscr;
     
     filename:=FILTREFITXER;
     end;
     until ((ch='s') or (ch='S') or (ch='n') or (ch='N'));
     
     filtrefitxer:=filename;

END;



(*--------------------------------------------------------------------------*)
(*------------------------------- MENU PRAL. -------------------------------*)
(*--------------------------------------------------------------------------*)


FUNCTION menu:char;

   var
   ktrl:Boolean;
   option:char;
   

begin
   ktrl:=false;

   clrscr;
    
     clrscr;
     textcolor(lightgreen);
     writeln('                               MENU D''OPCIONS');
     textcolor(white);
     writeln;
     writeln;
     writeln('          A. Afegir nova entrada');
     writeln('          B. Veure empleats 1 a 1 ');
     writeln('          C. Buscar per nom');
     writeln('          D. Buscar noms d''empleats segons una edat N');
     writeln('          E. Buscar empleats amb remuneraci¢ acotada superior i inferiorment');
     writeln('          F. Veure registres de forma redu‹da');
     writeln('          G. Veure l''empleat m‚s remunerat');
     writeln('          H. Calcular i visualitzar la mitja aritmŠtica d''edats i sous');
     writeln('          I. Esborrar un registre');
     writeln('          J. Modificar dades d''un empleat');
     writeln;
     writeln('          K. SORTIR i GUARDAR');
     writeln;
     writeln;
     write('          Opci¢?: ');
     repeat
     gotoxy(19,18);
     clreol;
     gotoxy(19,18);
     option:=readkey;
     If option =#0 then begin
        option:=readkey;
     End
     Else begin
          if ((option>='A') AND (option <='K')) or ((option>='a') and (option<='k')) then begin
          write(option);
          ktrl:=true;
          eND;
     End;
     Until (ktrl=true);
     menu:=option;
end; {menu}

(*--------------------------------------------------------------------------*)
(*---------------------------------- kReDiTs -------------------------------*)
(*--------------------------------------------------------------------------*)


PROCEDURE credits;
   Begin
     clrscr;
     
     textcolor(LightBlue);
     gotoxy(35,13);
     write('bY †Rt');
     textcolor(lightgreen);
     write('!');
     textcolor(white);
     write('má');
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
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
                   {   P  R  I  N  C  I  P  A  L   }


BEGIN

     cont:=1;
     num:=1;
     clrscr;
     NomFitxer:=FiltreFitxer;
     ExistiaArxiu:=false;

     {$I-}
     Assign(arxiu,NomFitxer);
     reset(arxiu);
     close(arxiu);
     {$I+}

     If IOresult=0 then begin (*ioresult verifica l'existencia del fitxer*)
         ExistiaArxiu:=true;
         reset(arxiu);
         while not eof (arxiu) AND (NUM<40) do begin

            readLN(arxiu,Empresa[num].nom);
            readln(arxiu,Empresa[num].direccio);
            readln(arxiu,Empresa[num].telefon);
            readln(arxiu,AUX); Val(AUX,Empresa[num].edat,error);
            readln(arxiu,AUX); Val(AUX,Empresa[num].sou,error);
            readln(arxiu);
            num:=num+1;

          End;
     End
     Else begin
            rewrite(arxiu);
     End;
     CLOSE(ARXIU);

  REPEAT
     opcio:=menu;
     opcio:=upcase(opcio);

     Case (opcio) of
     
          'A': begin
               clrscr;
               Textcolor(LightGreen);
               writeln('DADES DEL NOU EMPLEAT:');
               Writeln;
               Textcolor(White);

               write('Nom     : '); Empresa[num].nom:=filtrenom; writeln;
               write('Direcci¢: '); Empresa[num].direccio:=filtreDireccio;writeln;
               write('TelŠfon : '); Empresa[num].telefon:=filtretelefon;writeln;
               write('Edat    : '); Empresa[num].edat:=FiltreEdat;writeln;
               write('Sou     : '); Empresa[num].sou:=FiltreSou;writeln;
               num:=num+1;
               writeln;
               Write('Premi ENTER per continuar...');
               repeat
               
               ch:=readkey;
               Until (ch =#13);
               ExistiaArxiu:=true;
               end;

{----------------------------------------------------------------------------}

          'B': begin
               LINE:=0;
               Cont:=1;
               clrscr;
              
            If (ExistiaArxiu=true) then begin
               Textcolor(LightGreen);
               writeln('EMPLEATS REGISTRATS:');
               Writeln;
               Textcolor(White);

               repeat
               gotoxy(1,wherey+1);

               writeln('Nom     : ',Empresa[cont].nom);
               writeln('Direcci¢: ',Empresa[cont].direccio);
               writeln('TelŠfon : ',Empresa[cont].telefon);
               writeln('Edat    : ',Empresa[cont].edat);
               writeln('Sou     : ',Empresa[cont].sou);
               LINE:=LINE+1;
               cont:= cont+1;

               gotoxy(62,wherey+1);
               write('-- Premi ENTER...');
               repeat
               CH:=readkey;
               If (LINE mod 3= 0) then begin
                  clrscr;
                  Textcolor(LightGreen);
                  writeln('EMPLEATS REGISTRATS:');
                  Writeln;
                  Textcolor(White);
               End;
               Until (ch=#13);

               Until (cont=num);


               gotoxy(62,wherey+1);
               writeln('-- Fi del Registre');
               gotoxy(62,wherey);
               writeln('-- Premi ENTER...');
               repeat
               CH:=readkey;
               Until (ch=#13);

             End {existiaArxiu}
             Else Begin
                clrscr;
                GOTOXY(24,13);
                textcolor(yellow);
                writeln('NO HI HA CAP ENTRADA AL REGISTRE');
                textcolor(white);
                repeat
                ch:=readkey;
                Until (ch=#13);

             End;



               End; {'B'}

{----------------------------------------------------------------------------}

          'C': BEGIN
             IF EXISTIAARXIU=TRUE THEN BEGIN
                checkk:=false;
                line:=0;
                clrscr;
                Textcolor(LightGreen);
                writeln('BUSCAR PER NOM:');
                Writeln;
                Textcolor(White);
                write('Nom (?): ');EntraNom:=filtreNom;
                writeln;
                writeln;

                for I:=1 to num-1 do begin
                   if (EntraNom=Empresa[i].nom) then begin
                      writeln('Nom     : ',Empresa[i].nom);
                      writeln('Direcci¢: ',Empresa[i].direccio);
                      writeln('TelŠfon : ',Empresa[i].telefon);
                      writeln('Edat    : ',Empresa[i].edat);
                      writeln('Sou     : ',Empresa[i].sou);
                      checkk:=true;
                      LINE:=LINE+1;
                      writeln;
                      if line mod 3 = 0 then begin
                         gotoxy(63,wherey);
                         writeln('-- M‚s --');
                         repeat
                         ch:=readkey;
                         Until (ch=#13);
                         clrscr;
                         Textcolor(LightGreen);
                         writeln('BUSCAR PER NOM:');
                         Writeln;
                         Textcolor(White);
                      End;
                   End; {IF}

                End;{for}

                if checkk=false then begin
                  writeln('L''empleat ',EntraNom, ' no es troba en el registre');
                  writeln;
                  gotoxy(62,wherey);
                  writeln('-- Premi ENTER...');
                  repeat
                  ch:=readkey;
                  Until (ch=#13);
               End
               eLSE BEGIN
                
                if (i=num-1) then begin
                   gotoxy(62,wherey);
                   writeln('-- Fi de la cerca');
                End;

                gotoxy(62,wherey);
                writeln('-- Premi ENTER...');
                repeat
                ch:=readkey;
                Until (ch=#13);
               eND;
          END {EXISTIAARXIU}
          ELSE BEGIN
            clrscr;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);

            repeat
             ch:=readkey;
            Until (ch=#13);
          END;

               
               



               END; {'C'}

{----------------------------------------------------------------------------}
          
          'D': BEGIN
               i:=1;
            IF EXISTIAARXIU=TRUE THEN BEGIN
               checkk:=false;
               clrscr;
               Textcolor(LightGreen);
               writeln('BUSCAR NOMS:');
               Writeln;
               Textcolor(White);
               write('Edat (N): ');EntraEdat:=filtreEdat;
               writeln;
               writeln;
               writeln('Pos.    Nom del Treballador');
               writeln('================================================');
               writeln;
               for i:=1 to num-1 do begin
                   if (EntraEdat=Empresa[i].edat) then begin

                      write('[',i,']');
                      gotoxy(9,wherey);
                      writeln(Empresa[i].nOM);
                      checkk:=true;
                   End;
                   if (i mod 10=0) then begin
                      gotoxy(62,wherey);
                      writeln('-- M‚s --');
                      repeat
                      ch:=readkey;
                      Until (ch=#13);
                      clrscr;
                      Textcolor(LightGreen);
                      writeln('BUSCAR NOMS:');
                      Writeln;
                      Textcolor(White);
                      writeln;
                      writeln;
                      writeln('Pos.    Nom del Treballador');
                      writeln('================================================');
                      writeln;
                  
                   End;
               End;
               if checkk=false then begin
                  clrscr;
                  Textcolor(LightGreen);
                  writeln('BUSCAR NOMS:');
                  Writeln;
                  Textcolor(White);
                  writeln;
                  writeln;
                  writeln('No s''ha trobat ning£ amb ',EntraEdat,' anys.');
                  gotoxy(62,wherey);
                  writeln('-- Premi Enter...');
                  repeat
                  ch:=readkey;
                  Until (ch=#13);
               End
               Else begin
                  gotoxy(62,wherey);
                  writeln('-- Fi de la cerca.');
                  repeat
                  ch:=readkey;
                  Until (ch=#13);
               End;
          END
          ELSE BEGIN
            CLRSCR;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);
            repeat
             ch:=readkey;
            Until (ch=#13);
          eND;





               END; {'D'}
{----------------------------------------------------------------------------}
          'E':BEGIN
            IF EXISTIAARXIU=TRUE THEN BEGIN
              LINE:=0;
              Cont:=1;
              checkk:=false;
              Clrscr;
              Textcolor(LightGreen);
              writeln('BUSCAR PER SOU:');
              Writeln;
              Textcolor(White);
              write('Escrigui L¡mit 1er: ');EntraSou:=FiltreSou;
              writeln;
              write('Escrigui L¡mit 2on: ');EntraSou2:=filtreSou;
              Clrscr;
              Textcolor(LightGreen);
              writeln('BUSCAR PER SOU:');
              Writeln;
              Textcolor(White);
              writeln;

              

              { EntraSou ‚s el sou gran i EntraSou2 el petit }

              if (EntraSou2>EntraSou) then begin
                 EntraSouAUX:=EntraSou2;
                 EntraSou2:=EntraSou;
                 EntraSou:=EntraSoUAUX;
              End;
              LINE:=LINE+1;
              For cont:=1 to num-1 do begin
                 If (Empresa[cont].Sou>=EntraSou2) AND (Empresa[cont].Sou<=EntraSou) then begin
                   writeln('Nom     : ',Empresa[cont].nom);
                   writeln('Direcci¢: ',Empresa[cont].direccio);
                   writeln('TelŠfon : ',Empresa[cont].telefon);
                   writeln('Edat    : ',Empresa[cont].edat);
                   writeln('Sou     : ',Empresa[cont].sou);
                   checkk:=true;
                   LINE:=LINE+1;
                   writeln;
                 End;
                 if LINE mod 3 = 0 then begin
                        gotoxy(63,wherey);
                        writeln('-- M‚s --');
                        repeat
                        ch:=readkey;
                        Until (ch=#13);
                        clrscr;
                        Textcolor(LightGreen);
                        writeln('BUSCAR PER SOU:');
                        Writeln;
                        Textcolor(White);
                    End;

              End;
              iF line=1 then writeln('Ning£ t‚ un sou comprŠs entre els l¡mits...');

              gotoxy(62,wherey);
              writeln('-- Fi de la cerca');
              gotoxy(62,wherey);
              writeln('-- Premi Enter...');
              repeat
              ch:=readkey;
              Until (ch=#13);
          END
          ELSE BEGIN
          CLRSCR;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);
            repeat
             ch:=readkey;
            Until (ch=#13);
          END;





              END;{'E'}

{----------------------------------------------------------------------------}
          'F':
              begin
               LINE:=0;
               Cont:=1;
               clrscr;
              
            If (ExistiaArxiu=true) then begin
               Textcolor(LightGreen);
               writeln('REGISTRES (forma redu‹da):');
               Writeln;
               Textcolor(White);

               

               gotoxy(1,wherey+1);
               writeln('Pos.    Nom del Treballador');
               writeln('================================================');
               writeln;

               repeat

               write('[',cont,']'); gotoxy(9,wherey);
               writeLN(Empresa[cont].nom);
               LINE:=LINE+1;
               cont:= cont+1;

               If (LINE mod 15= 0) then begin
                  gotoxy(63,wherey);
                  writeln;
                  writeln('-- M‚s --');
                  repeat
                  ch:=readkey;
                  Until (ch=#13);
                  clrscr;
                  Textcolor(LightGreen);
                  writeln('REGISTRES (forma redu‹da):');
                  Writeln;
                  Textcolor(White);
               End;


               Until (cont=num);

               gotoxy(62,wherey+1);
               writeln('-- Fi del Registre');
               gotoxy(62,wherey);
               writeln('-- Premi ENTER...');
               repeat
               CH:=readkey;
               Until (ch=#13);

             End {existiaArxiu}
             Else Begin
                clrscr;
                GOTOXY(24,13);
                textcolor(yellow);
                writeln('NO HI HA CAP ENTRADA AL REGISTRE');
                textcolor(white);
                repeat
                ch:=readkey;
                Until (ch=#13);

             End;



               End; {'f'}


{----------------------------------------------------------------------------}

          'G': begin
             IF EXISTIAARXIU=TRUE THEN BEGIN
               cont:=1;
               CLRSCR;
               Textcolor(LightGreen);
               writeln('EMPLEAT MS REMUNERAT:');
               Writeln;
               Textcolor(White);

               EmpleatSPECIAL:=cont;

               FOR Cont:=1 to num-1 do begin
                 If (Empresa[cont+1].Sou > Empresa[cont].Sou) and (CONT+1<NUM)then
                    EmpleatSpecial:=cont+1;
               End; {for}

               writeln('Nom     : ',Empresa[EmpleatSPECIAL].nom);
               writeln('Direcci¢: ',Empresa[EmpleatSPECIAL].direccio);
               writeln('TelŠfon : ',Empresa[EmpleatSPECIAL].telefon);
               writeln('Edat    : ',Empresa[EmpleatSPECIAL].edat);
               writeln('Sou     : ',Empresa[EmpleatSPECIAL].sou);
               writeln;
               gotoxy(62,wherey);
               writeln('-- Premi Enter...');
               REPEAT
               ch:=readkey;
               Until (ch=#13);
          END
          ELSE BEGIN
          CLRSCR;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);
            repeat
             ch:=readkey;
            Until (ch=#13);
          END;


               End; {'g'}

{----------------------------------------------------------------------------}
          'H':begin
           IF EXISTIAARXIU=TRUE then BEGIN
              MitjaSous:=0;
              MitjaEdats:=0;
              cont:=1;
              CLRSCR;
              Textcolor(LightGreen);
              writeln('MITJA ARITMÔTICA DE SOUS i EDATS:');
              Writeln;
              Textcolor(White);
              For cont:=1 to num-1 do begin
                  MitjaSous:=MitjaSous+Empresa[cont].Sou;
                  MitjaEdats:=MitjaEdats+Empresa[cont].Edat;
              End;
              MitjaEdats:=MitjaEdats/(num-1);
              MitjaSous:=MitjaSous/(num-1);
              writeln;
              writeln('Mitja de Sous: ',MitjaSous:0:2,' ptes.');
              writeln('Mitja d''Edats: ',MitjaEdats:0:2,' anys.');
              writeln;
              gotoxy(62,wherey);
              writeln('-- Premi Enter..');
              repeat
              ch:=readkey;
              Until (ch=#13);
           END
           ELSE BEGIN
           CLRSCR;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);
            repeat
             ch:=readkey;
            Until (ch=#13);
           eND;
              end; {'H'}

{----------------------------------------------------------------------------}

          'I':BEGIN
           IF EXISTIAARXIU=TRUE THEN BEGIN
              cont:=1;
              
              checkk:=false;
              CLRSCR;
              Textcolor(LightGreen);
              writeln('ESBORRAR UN REGISTRE:');
              Writeln;
              Textcolor(White);
              Write('Nombre de posici¢ a esborrar?: ');

              {            Filtre posici¢          }

           REPEAT
              i:=1;
              gotoxy(33,wherey);
              clreol;
              repeat
              ch:=readkey;
              If ch=#0 then begin
                 ch:=readkey;
              End
              Else begin
                 if (ch>='0') and (ch<='9') and (i<3) then begin
                 write(ch);
                 pos[i]:=ch;
                 i:=i+1;
                 End;
              End;
              Until (ch=#13);


              pos[0]:=chr(i-1);
              val(pos,cont,error);

           UNTIL ((cont>=1) AND (cont<=num-1));

           {     FI    FILTRE   POSICIà     }

           repeat
            Empresa[cont]:=Empresa[cont+1];
            cont:=cont+1;
           Until (cont=num);
           num:=num-1;
           iF NUM=1 THEN ExistiaArxiu:=false;

              gotoxy(62,wherey);
              writeln;
              writeln;
              writeln('-- Premi Enter...');
              repeat
              ch:=readkey;
              Until (ch=#13);
           END
           ELSE BEGIN
           CLRSCR;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);
            repeat
             ch:=readkey;
            Until (ch=#13);
            END;

              END; {'I'}

          'J':BEGIN

                         IF EXISTIAARXIU=TRUE THEN BEGIN
              cont:=1;

              checkk:=false;
              CLRSCR;
              Textcolor(LightGreen);
              writeln('MODIFICAR UN REGISTRE:');
              Writeln;
              Textcolor(White);
              Write('Nombre de posici¢ a modificar?: ');

              {            Filtre posici¢          }

           REPEAT
              i:=1;
              gotoxy(33,wherey);
              clreol;
              repeat
              ch:=readkey;
              If ch=#0 then begin
                 ch:=readkey;
              End
              Else begin
                 if (ch>='0') and (ch<='9') and (i<3) then begin
                 write(ch);
                 pos[i]:=ch;
                 i:=i+1;
                 End;
              End;
              Until (ch=#13);


              pos[0]:=chr(i-1);
              val(pos,cont,error);

           UNTIL ((cont>=1) AND (cont<=num-1));

           {     FI    FILTRE   POSICIà     }
              writeln;
              writeln;
              writeln('*-*-*-*-*-*-*-*- DADES ANTERIORS -*-*-*-*-*-*-*-*');
              writeln;
              writeln('Nom     : ',Empresa[cont].nom);
              writeln('Direcci¢: ',Empresa[cont].direccio);
              writeln('TelŠfon : ',Empresa[cont].telefon);
              writeln('Edat    : ',Empresa[cont].edat);
              writeln('Sou     : ',Empresa[cont].sou);
              writeln;
              writeln;
              writeln;
              writeln('*-*-*-*-*-*-*-*-   NOVES DADES   -*-*-*-*-*-*-*-*');
              WRITELN;
              write('Nom     : '); Empresa[cont].nom:=filtrenom; writeln;
              write('Direcci¢: '); Empresa[cont].direccio:=filtreDireccio;writeln;
              write('TelŠfon : '); Empresa[cont].telefon:=filtretelefon;writeln;
              write('Edat    : '); Empresa[cont].edat:=FiltreEdat;writeln;
              write('Sou     : '); Empresa[cont].sou:=FiltreSou;writeln;

              gotoxy(62,wherey);
              writeln;
              writeln;
              writeln('-- Premi Enter...');
              repeat
              ch:=readkey;
              Until (ch=#13);
           END
           ELSE BEGIN
           CLRSCR;
            GOTOXY(24,13);
            textcolor(yellow);
            writeln('NO HI HA CAP ENTRADA AL REGISTRE');
            textcolor(white);
            repeat
             ch:=readkey;
            Until (ch=#13);
            END;

              END;{'j'}

          'K':begin
              


              IF ExistiaArxiu=false then begin

                 ERASE(ARXIU);
                 clrscr;
                 gotoxy(16,13);
                 write('No s''ha creat cap arxiu, no hi ha dades que arxivar');
                 repeat
                 ch:=readkey;
                 UntiL (ch=#13);

              End
              eLSE BEGIN
              rewrite(arxiu);
              for num:=1 to num-1 do begin

                  writeln(arxiu,Empresa[num].nom);
                  writeln(arxiu,Empresa[num].direccio);
                  writeln(arxiu,Empresa[num].telefon);
                  writeln(arxiu,Empresa[num].edat);
                  writeln(arxiu,Empresa[num].sou);
                  writeln(arxiu,'*-*-*');

              End;
              close(arxiu);


              
              END;
              credits;
              End; {'K'}

     End; (*case*)
 UNTIL (opcio='K');



END.
%====INFORMATION====%
% LFSAB1402 Projet 2016
% Nomas : 80721400-65441500
% Noms : (Meerts,Martin)-(Lamotte,Pierre)
%====MODULELINK====%
declare
{Property.put 'MyDir' '/Users/Baracuda/Downloads/ProjetOz2016_v3/'}
[Projet]={Module.link ["/Users/Baracuda/Downloads/ProjetOz2016_v3/Projet2016.ozf"]}

%====CODE====%
local
   MaxTime=10 % nombre de frame à l'animation
   FlattenList
   Transform
   For
   MyFunction
   Map
   CheckMap
   Extensions = opt(withExtendedFormula:true
		    withIfThenElse:true
		    withComparison:true
		    withTimeWindow:false
		    withCheckMapEasy:true
		    withCheckMapComplete:false)
   RealUn
   PokeUn
   RealU=[translate(dx:80 dy:25 1:[scale(rx:32 ry:47 1:[primitive(kind:water)])]) translate(dx:100 dy:55 1:[scale(rx:50 ry:10 1:[primitive(kind:water)])]) translate(dx:110 dy:46 1:[scale(rx:16 ry:10 1:[rotate(angle:0.2 1:[primitive(kind:building)])])]) translate(dx:50 dy:125 1:[scale(rx:1 ry:350 1:[rotate(angle:~1.571 1:[primitive(kind:road)])])]) translate(dx:50 dy:125 1:[scale(rx:400 ry:1 1:[primitive(kind:road)])]) translate(dx:60 dy:59 1:[scale(rx:50 ry:65 1:[primitive(kind:building)])]) translate(dx:200 dy:150 1:[scale(rx:100 ry:200 1:[primitive(kind:water)])]) translate(dx:190 dy:250 1:[scale(rx:120 ry:1 1:[primitive(kind:road)])]) translate(dx:250 dy:140 1:[scale(rx:1 ry:220 1:[rotate(angle:~1.571 1:[primitive(kind:road)])])]) translate(dx:200 dy:90 1:[scale(rx:100 ry:50 1:[primitive(kind:building)])]) translate(dx:310 dy:220 1:[scale(rx:35 ry:50 1:[primitive(kind:building)])])]
   PokeU=[translate(dx:10 dy:20 1:[primitive(kind:pokestop)]) translate(dx:plus(30 mult(20 time)) dy:60 1:[primitive(kind:pokemon)]) translate(dx:170 dy:200 1:[primitive(kind:arena)]) translate(dx:minus(400 exp(time)) dy:minus(360 mult(15 time)) 1:[primitive(kind:pokemon)]) translate(dx:50 dy:300 1:[primitive(kind:pokestop)]) translate(dx:450 dy:400 1:[primitive(kind:pokestop)]) translate(dx:400 dy:300 1:[primitive(kind:pokestop)]) translate(dx:350 dy:60 1:[primitive(kind:arena)]) translate(dx:plus(120 sin(time)) dy:plus(30 mult(time 15)) 1:[primitive(kind:pokemon)]) translate(dx:minus(300 mult(5 time)) dy:minus(400 mult(25 time)) 1:[primitive(kind:pokemon)])]
in
   Map=map(ru:RealU pu:PokeU)

   fun{For V Time}
      case V of plus(A B) then
	 {For A Time}+{For B Time}
      [] minus(A B) then
	 {For A Time}-{For B Time}
      [] 'div'(A B) then
	 {For A Time} div {For B Time}
      [] mult(A B) then
	 {For A Time}*{For B Time}
      [] cos(A) then
	 {Float.cos {For A Time}}
      [] sin(A) then
	 {Float.sin {For A Time}}
      [] tan(A) then
	 {Float.tan {For A Time}}
      [] exp(A) then
	 {Float.exp {For A Time}}
      [] log(A) then
	 {Float.log {For A Time}}
      [] neg(A) then
	 ~{For A Time} 
      [] ite(A B C) then 
	 if {For A Time}==0.0 then
	    {For C Time}
	 else
	    {For B Time}
	 end
      [] eq(A B) then 
	 if {For A Time}=={For B Time} then
	    1.0
	 else
	    0.0
	 end
      [] ne(A B) then 
	 if {For A Time}\={For B Time} then
	    1.0
	 else
	    0.0
	 end     
      [] lt(A B) then 
	 if {For A Time}<{For B Time} then
	    1.0
	 else
	    0.0
	 end
      [] le(A B) then 
	 if {For A Time}=<{For B Time} then
	    1.0
	 else
	    0.0
	 end
      [] gt(A B) then 
	 if {For A Time}>{For B Time} then
	    1.0
	 else
	    0.0
	 end
      [] ge(A B) then 
	 if {For A Time}>={For B Time} then
	    1.0
	 else
	    0.0
	 end
      [] time then
	 Time
      else
	 if {Int.is V} then
	    {Int.toFloat V}
	 else
	    V
	 end
      end
   end
   
   fun{FlattenList L}
      case L of nil then nil
      [] nil|T then
	 {FlattenList T}
      [] (H1|T1)|T then
	 {FlattenList H1|T1|T}
      [] X|T then
	 X|{FlattenList T}
      else L
      end
   end
   
   fun{Transform List X1 Y1 X2 Y2 X3 Y3 X4 Y4 Time} V P1 P2 P3 P4 P5 P6 P7 P8 PTX PTY Co Si in
      case List of nil then
	 [X1 Y1 X2 Y2 X3 Y3 X4 Y4]
      [] H|T then
	 case H of tr(dx:A dy:B) then
	    PTX={For A Time}
	    PTY={For B Time}
	    {Transform T {For plus(X1 PTX) Time} {For plus(Y1 PTY) Time} {For plus(X2 PTX) Time} {For plus(Y2 PTY) Time} {For plus(X3 PTX) Time} {For plus(Y3 PTY) Time} {For plus(X4 PTX) Time} {For plus(Y4 PTY) Time} Time}
	 [] sc(rx:A ry:B) then
	    PTX={For A Time}
	    PTY={For B Time}
	    {Transform T {For mult(X1 PTX) Time} {For mult(Y1 PTY) Time} {For mult(X2 PTX) Time} {For mult(Y2 PTY) Time} {For mult(X3 PTX) Time} {For mult(Y3 PTY) Time} {For mult(X4 PTX) Time} {For mult(Y4 PTY) Time} Time}
	 [] ro(angle:A) then
	    Co={For cos(A) Time}
	    Si={For sin(A) Time}
	    P1={For plus({For mult(X1 Co) Time} {For mult(Y1 Si) Time}) Time}
	    P2={For minus({For mult(Y1 Co) Time} {For mult(X1 Si) Time}) Time}
	    P3={For plus({For mult(X2 Co) Time} {For mult(Y2 Si) Time}) Time}
	    P4={For minus({For mult(Y2 Co) Time} {For mult(X2 Si) Time}) Time}
	    P5={For plus({For mult(X3 Co) Time} {For mult(Y3 Si) Time}) Time}
	    P6={For minus({For mult(Y3 Co) Time} {For mult(X3 Si) Time}) Time}
	    P7={For plus({For mult(X4 Co) Time} {For mult(Y4 Si) Time}) Time}
	    P8={For minus({For mult(Y4 Co) Time} {For mult(X4 Si) Time}) Time}
	    {Transform T P1 P2 P3 P4 P5 P6 P7 P8 Time}
	 end
      end
   end
   
   fun{RealUn List RList SecList} Cons Temp Obj in
      case List of nil then
	 SecList
      [] H|T then
	 case H of translate(dx:A dy:B 1:C) then
	    Cons={FlattenList tr(dx:A dy:B)|RList}
	    Temp={FlattenList {RealUn C Cons SecList}|{RealUn T RList SecList}}
	 [] scale(rx:A ry:B 1:C) then
	    Cons={FlattenList sc(rx:A ry:B)|RList}
	    Temp={FlattenList {RealUn C Cons SecList}|{RealUn T RList SecList}}
	 [] rotate(angle:A 1:B) then
	    Cons={FlattenList ro(angle:A)|RList}
	    Temp={FlattenList {RealUn B Cons SecList}|{RealUn T RList SecList}}
	 [] primitive(kind:A) then
	    case A of building then
	       case RList of nil then
 		  Obj=fun{$ Time}
			 realitem(kind:A p1:pt(x:0.0 y:0.0) p2:pt(x:1.0 y:0.0) p3:pt(x:1.0 y:1.0) p4:pt(x:0.0 y:1.0))
		      end
		  {RealUn T RList {FlattenList Obj|SecList}}
	       [] M|E then
		  Obj=fun{$ Time} Pts in
			 Pts={Transform RList 0.0 0.0 1.0 0.0 1.0 1.0 0.0 1.0 Time}
			 realitem(kind:A p1:pt(x:Pts.1 y:Pts.2.1) p2:pt(x:Pts.2.2.1 y:Pts.2.2.2.1) p3:pt(x:Pts.2.2.2.2.1 y:Pts.2.2.2.2.2.1) p4:pt(x:Pts.2.2.2.2.2.2.1 y:Pts.2.2.2.2.2.2.2.1))
		      end
		  {RealUn T RList {FlattenList Obj|SecList}}
	       end
	    [] road then
	       case RList of nil then
		  Obj=fun{$ Time}
			 realitem(kind:A p1:pt(x:0.0 y:0.0) p2:pt(x:1.0 y:0.0))
		      end
		  {RealUn T RList {FlattenList Obj|SecList}}
	       [] M|E then
		  Obj=fun{$ Time} Pts in
			 Pts={Transform RList 0.0 0.0 1.0 0.0 1.0 1.0 0.0 1.0 Time}
			 realitem(kind:A p1:pt(x:Pts.1 y:Pts.2.1) p2:pt(x:Pts.2.2.1 y:Pts.2.2.2.1))
		      end
		  {RealUn T RList {FlattenList Obj|SecList}}
	       end
	    [] water then
	       case RList of nil then
		  Obj=fun{$ Time}
			 realitem(kind:A p1:pt(x:0.0 y:0.0) p2:pt(x:1.0 y:0.0) p3:pt(x:1.0 y:1.0) p4:pt(x:0.0 y:1.0))
		      end
		  {RealUn T RList {FlattenList Obj|SecList}}
	       [] M|E then
		  Obj=fun{$ Time} Pts in
			 Pts={Transform RList 0.0 0.0 1.0 0.0 1.0 1.0 0.0 1.0 Time}
			 realitem(kind:A p1:pt(x:Pts.1 y:Pts.2.1) p2:pt(x:Pts.2.2.1 y:Pts.2.2.2.1) p3:pt(x:Pts.2.2.2.2.1 y:Pts.2.2.2.2.2.1) p4:pt(x:Pts.2.2.2.2.2.2.1 y:Pts.2.2.2.2.2.2.2.1))
		      end
		  {RealUn T RList {FlattenList Obj|SecList}}
	       end
	    end
	 end
      end
   end

   fun{PokeUn List RList SecList} Cons Temp Pokitem in
      case List of nil then
	 SecList
      [] H|T then
	 case H of translate(dx:A dy:B 1:C) then
	    Cons={FlattenList tr(dx:A dy:B)|RList}
	    Temp={FlattenList {PokeUn C Cons SecList}|{PokeUn T RList SecList}}
	 [] primitive(kind:A) then
	    case RList of nil then
	       Pokitem=fun{$ Time}
			  pokeitem(kind:A position:pt(x:50.0 y:250.0))
		       end
	       {PokeUn T RList {FlattenList Pokitem|SecList}}	    
	    [] H1|T1 then
	       Pokitem=fun{$ Time} Pts in
			  Pts={Transform RList 0.0 0.0 1.0 0.0 1.0 1.0 0.0 1.0 Time}
			  pokeitem(kind:A position:pt(x:Pts.1 y:Pts.2.1))
		       end
	       {PokeUn T RList {FlattenList Pokitem|SecList}}
	    end
	 end
      end
   end

   fun{MyFunction Map} Aff Aff2 Aff3 in
      Aff={FlattenList {RealUn Map.ru nil nil}}
      Aff2={FlattenList {PokeUn Map.pu nil nil}}
      Aff3={FlattenList Aff|Aff2}
      Aff3
   end
   
   fun{CheckMap Map}
      false %% TODO complete here the function for the checking of the maps
   end
   
   {Projet.run MyFunction Map MaxTime Extensions CheckMap}
end

SetS
I index for nodes
B index of bound  ;
Alias(I, J);
Alias(I, k);

Parameter TT(I,I);

$onecho > TSPJ.txt
dset=i   rng=TT!a1  rdim=1
par=TT  rng=TT!a1 rdim=1 cdim=1
$offecho

$call GDXXRW TSPJ.xlsx  @TSPJ.txt
$GDXIN TSPJ.gdx
$load I
$load TT
$GDXIN

Parameter T(I,I)
$onecho > TSPJ.txt
dset=I   rng=JT!a1  rdim=1
par=T   rng=JT!a1 rdim=1 cdim=1
$offecho

$call GDXXRW TSPJ.xlsx  @TSPJ.txt
$GDXIN TSPJ.gdx
$load T
$GDXIN

Parameter BOUNDS(B)
$onecho > TSPJ.txt
dset=B   rng=BOUNDS!a1  cdim=1
par=BOUNDS   rng=BOUNDS!a1    cdim=1
$offecho

$call GDXXRW TSPJ.xlsx  @TSPJ.txt
$GDXIN TSPJ.gdx
$load B
$load bounds
$GDXIN

Scalar MBIG /30000/;

Variables
L    objective

POSITIVE Variables
Y(I,J)
TS(I)
TF(I)
W(J)

binary Variables
X(I,J)        'DISTANCE'
Z(I,K)        'TASK TIME'
  ;
 W.FX(J)=1;


EQUATIONS
MAXLENGTHTIME(I)     DEFINE TOTALCOST
TSPTOUR              WHEN IT BIGGER THAN COMPLETION TIME
*UPPER_bound          heuristic bound
*LOWER_bound          heuristic bound
ZSUMROW(I)           Z:SUMATION EACH LINE
ZSUMCOLUMN(J)        Z:SUMATION EACH COLUMN
XSUMROW(I)           X:SUMATION EACH LINE
XSUMCOLUMN(J)        X:SUMATION EACH COLUMN
SUBTOUR(J)           REMOVE SUBTOUR
SUBTOUR2(I,J)        REMOVE SUBTOUR
STARTTIME(I,J)       START TIME OF NODE(I)
Finish_time(I)       finish ;



MAXLENGTHTIME(I)                                     ..      L =G= TF(I);
TSPTOUR                                              ..      L =G= bounds('2')+SUM(I,SUM(J$(ord(j) ne 1),X(I,J)*TT(I,J)));
*UPPER_bound                                          ..      L =L=  bounds('1') ;
*LOWER_bound                                          ..      L =g=  bounds('0');
ZSUMROW(I)$(ORD(I) NE 1)                             ..      SUM(J$(ORD(J) NE 1),Z(I,J))=E=1;
ZSUMCOLUMN(J)$(ORD(J) NE 1)                          ..      SUM(I$(ORD(I) NE 1),Z(I,J))=E=1;
XSUMROW(I)                                           ..      SUM(J,X(I,J))=E=1;
XSUMCOLUMN(J)                                        ..      SUM(I,X(I,J))=E=1;
SUBTOUR(J)$(ORD(J) NE 1)                             ..      SUM(I$(ORD(I) ne ORD(J)),Y(J,I))-SUM(I$(ORD(I) ne ORD(J)),Y(I,J))=E=1*W(J);
SUBTOUR2(I,J)$(ORD(I) ne ORD(J))                     ..      Y(I,J)=L= (CARD(I)-1)*X(I,J);
STARTTIME(I,J)$(ORD(J) GT 1 AND ORD(I) ne ORD(J))    ..      MBIG*X(I,J) =L= TS(J)-TS(I)-TT(I,J)+MBIG ;
Finish_time(I)$(ORD(I) NE 1)                         ..      TF(I) =E= TS(I)+SUM(K$(ORD(K) NE 1),Z(I,K)*T(I,K));


MODEL TSP /ALL/;
OPTION MIP=CPLEX;
OPTION RESLIM =2000;
* Set the threads based on your computer
OPTION THREADS=24;
OPTION LIMCOL=20, LIMROW=20;
OPTION OPTCR=0.01;
SOLVE TSP USING MIP MINIMIZING L;




execute_unload 'TSPJ_OUTPUT.gdx', L.L, X.L, Y.L, TT, T,TS.L, Z.L;
execute 'GDXXRW TSPJ_OUTPUT.gdx Var=MAXLENGTH rng=MAXLENGTH!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx Var=X rng=X!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx Var=Y rng=Y!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx par=TT rng=TT!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx par=T rng=T!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx Var=TS rng=TS!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx Var=Z rng=Z!a1';
execute 'GDXXRW TSPJ_OUTPUT.gdx Var=L rng=L!a1';

DISPLAY L.L, X.L, Y.L, TT, T,TS.L ,Z.L, bounds;

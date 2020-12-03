set I;
/* set of courses */
set J;
/* set of rooms */
set T;
/* set of teachers */
set K;
/* set of time slots */
set R0;
/* room 0 */
set ER0;
/* exception courses for room 0 */
set R1;
/* room 1 */
set ER1;
/* exception courses for room 1 */
set R2;
/* room 2 */
set ER2;
/* exception courses for room 2 */
set R4;
/* room 4 */
set ER4;
/* exception courses for room 4 */
set R5;
/* room 5 */
set ER5;
/* exception courses for room 5 */
set R6;
/* room 6 */
set ER6;
/* exception courses for room 6 */
set R8;
/* room 8 */
set ER8;
/* exception courses for room 8 */
set R9;
/* room 9 */
set ER9;
/* exception courses for room 9 */
set R10;
/* room 10 */
set ER10;
/* exception courses for room 10 */
set R11;
/* room 11 */
set ER11;
/* exception courses for room 11 */
set R12;
/* room 12 */
set ER12;
/* exception courses for room 12 */
set R13;
/* room 13 */
set ER13;
/* exception courses for room 13 */
set R14;
/* room 14 */
set ER14;
/* exception courses for room 14 */
set R15;
/* room 15 */
set ER15;
/* exception courses for room 15 */
set R17;
/* room 17 */
set ER17;
/* exception courses for room 17 */
set R18;
/* room 18 */
set ER18;
/* exception courses for room 18 */
set R19;
/* room 19 */
set ER19;
/* exception courses for room 19 */
set R20;
/* room 20 */
set ER20;
/* exception courses for room 20 */
set R21;
/* room 21 */
set ER21;
/* exception courses for room 21 */
set R22;
/* room 22 */
set ER22;
/* exception courses for room 22 */
set R23;
/* room 23 */
set ER23;
/* exception courses for room 23 */
set R24;
/* room 24 */
set ER24;
/* exception courses for room 24 */
set R25;
/* room 25 */
set ER25;
/* exception courses for room 25 */
set R26;
/* room 26 */
set ER26;
/* exception courses for room 26 */
set R27;
/* room 27 */
set ER27;
/* exception courses for room 27 */
set R29;
/* room 29 */
set ER29;
/* exception courses for room 29 */
set T2;
/* teacher 2 */
set ET2;
/* exception courses for teacher 2 */
set T4;
/* teacher 4 */
set ET4;
/* exception courses for teacher 4 */
set T5;
/* teacher 5 */
set ET5;
/* exception courses for teacher 5 */
set T6;
/* teacher 6 */
set ET6;
/* exception courses for teacher 6 */
set T7;
/* teacher 7 */
set ET7;
/* exception courses for teacher 7 */
set T9;
/* teacher 9 */
set ET9;
/* exception courses for teacher 9 */
set T10;
/* teacher 10 */
set ET10;
/* exception courses for teacher 10 */
set T12;
/* teacher 12 */
set ET12;
/* exception courses for teacher 12 */
set T13;
/* teacher 13 */
set ET13;
/* exception courses for teacher 13 */
set T14;
/* teacher 14 */
set ET14;
/* exception courses for teacher 14 */
set T16;
/* teacher 16 */
set ET16;
/* exception courses for teacher 16 */
set T17;
/* teacher 17 */
set ET17;
/* exception courses for teacher 17 */
set T18;
/* teacher 18 */
set ET18;
/* exception courses for teacher 18 */
set T20;
/* teacher 20 */
set ET20;
/* exception courses for teacher 20 */
set T21;
/* teacher 21 */
set ET21;
/* exception courses for teacher 21 */
set T23;
/* teacher 23 */
set ET23;
/* exception courses for teacher 23 */
set T24;
/* teacher 24 */
set ET24;
/* exception courses for teacher 24 */
set T25;
/* teacher 25 */
set ET25;
/* exception courses for teacher 25 */
set T27;
/* teacher 27 */
set ET27;
/* exception courses for teacher 27 */
set T28;
/* teacher 28 */
set ET28;
/* exception courses for teacher 28 */
set T29;
/* teacher 29 */
set ET29;
/* exception courses for teacher 29 */
param cost{i in I, j in J, t in T, k in K}, >= 0;
/* cost of allocating room j to course i with teacher t in time slot k */

var x{i in I, j in J, t in T, k in K} binary;
/* x[i,j,t,k] = 1 means room j is assigned to course i with teacher t in time slot k
x[i,j,t,k] = 0 otherwise  */

s.t. first{i in I}: sum{j in J, t in T, k in K} x[i,j,t,k] = 1;

s.t. second{j in J, k in K}: sum{i in I, t in T} x[i,j,t,k] <= 1;

s.t. third{t in T, k in K}: sum{i in I, j in J} x[i,j,t,k] <= 1;

s.t. cr0: sum{i in ER0, j in R0, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr1: sum{i in ER1, j in R1, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr2: sum{i in ER2, j in R2, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr4: sum{i in ER4, j in R4, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr5: sum{i in ER5, j in R5, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr6: sum{i in ER6, j in R6, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr8: sum{i in ER8, j in R8, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr9: sum{i in ER9, j in R9, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr10: sum{i in ER10, j in R10, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr11: sum{i in ER11, j in R11, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr12: sum{i in ER12, j in R12, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr13: sum{i in ER13, j in R13, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr14: sum{i in ER14, j in R14, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr15: sum{i in ER15, j in R15, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr17: sum{i in ER17, j in R17, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr18: sum{i in ER18, j in R18, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr19: sum{i in ER19, j in R19, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr20: sum{i in ER20, j in R20, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr21: sum{i in ER21, j in R21, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr22: sum{i in ER22, j in R22, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr23: sum{i in ER23, j in R23, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr24: sum{i in ER24, j in R24, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr25: sum{i in ER25, j in R25, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr26: sum{i in ER26, j in R26, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr27: sum{i in ER27, j in R27, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr29: sum{i in ER29, j in R29, t in T, k in K} x[i,j,t,k] = 0;

s.t. ct2: sum{i in ET2, j in J, t in T2, k in K} x[i,j,t,k] = 0;

s.t. ct4: sum{i in ET4, j in J, t in T4, k in K} x[i,j,t,k] = 0;

s.t. ct5: sum{i in ET5, j in J, t in T5, k in K} x[i,j,t,k] = 0;

s.t. ct6: sum{i in ET6, j in J, t in T6, k in K} x[i,j,t,k] = 0;

s.t. ct7: sum{i in ET7, j in J, t in T7, k in K} x[i,j,t,k] = 0;

s.t. ct9: sum{i in ET9, j in J, t in T9, k in K} x[i,j,t,k] = 0;

s.t. ct10: sum{i in ET10, j in J, t in T10, k in K} x[i,j,t,k] = 0;

s.t. ct12: sum{i in ET12, j in J, t in T12, k in K} x[i,j,t,k] = 0;

s.t. ct13: sum{i in ET13, j in J, t in T13, k in K} x[i,j,t,k] = 0;

s.t. ct14: sum{i in ET14, j in J, t in T14, k in K} x[i,j,t,k] = 0;

s.t. ct16: sum{i in ET16, j in J, t in T16, k in K} x[i,j,t,k] = 0;

s.t. ct17: sum{i in ET17, j in J, t in T17, k in K} x[i,j,t,k] = 0;

s.t. ct18: sum{i in ET18, j in J, t in T18, k in K} x[i,j,t,k] = 0;

s.t. ct20: sum{i in ET20, j in J, t in T20, k in K} x[i,j,t,k] = 0;

s.t. ct21: sum{i in ET21, j in J, t in T21, k in K} x[i,j,t,k] = 0;

s.t. ct23: sum{i in ET23, j in J, t in T23, k in K} x[i,j,t,k] = 0;

s.t. ct24: sum{i in ET24, j in J, t in T24, k in K} x[i,j,t,k] = 0;

s.t. ct25: sum{i in ET25, j in J, t in T25, k in K} x[i,j,t,k] = 0;

s.t. ct27: sum{i in ET27, j in J, t in T27, k in K} x[i,j,t,k] = 0;

s.t. ct28: sum{i in ET28, j in J, t in T28, k in K} x[i,j,t,k] = 0;

s.t. ct29: sum{i in ET29, j in J, t in T29, k in K} x[i,j,t,k] = 0;

minimize obj: sum{i in I, j in J, t in T, k in K} cost[i,j,t,k] * x[i,j,t,k];
/* the objective is to find a cheapest assignment */

solve;

printf {i in I, j in J, t in T, k in K: x[i,j,t,k] = 1} 'result: c:%s r:%s t:%s time:%s\n', i, j, t, k;

data;

set I := 0 1 2 3;

set T := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29;
set J := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29;
set K := 0;
set T2 := 2;
set ET2 := 0 2 3;

set T4 := 4;
set ET4 := 0;

set T5 := 5;
set ET5 := 0 2 3;

set T6 := 6;
set ET6 := 1 2;

set T7 := 7;
set ET7 := 1;

set T9 := 9;
set ET9 := 0 1 2;

set T10 := 10;
set ET10 := 0 1;

set T12 := 12;
set ET12 := 0 1 3;

set T13 := 13;
set ET13 := 1 2 3;

set T14 := 14;
set ET14 := 0;

set T16 := 16;
set ET16 := 1;

set T17 := 17;
set ET17 := 0;

set T18 := 18;
set ET18 := 0;

set T20 := 20;
set ET20 := 0 1;

set T21 := 21;
set ET21 := 0 2 3;

set T23 := 23;
set ET23 := 1;

set T24 := 24;
set ET24 := 1 3;

set T25 := 25;
set ET25 := 0 1;

set T27 := 27;
set ET27 := 0;

set T28 := 28;
set ET28 := 0 1 2;

set T29 := 29;
set ET29 := 0 1 2 3;

set R0 := 0;
set ER0 := 1 3;

set R1 := 1;
set ER1 := 1;

set R2 := 2;
set ER2 := 2 3;

set R4 := 4;
set ER4 := 1 2 3;

set R5 := 5;
set ER5 := 1;

set R6 := 6;
set ER6 := 2 3;

set R8 := 8;
set ER8 := 1 3;

set R9 := 9;
set ER9 := 0 2;

set R10 := 10;
set ER10 := 0;

set R11 := 11;
set ER11 := 0 1;

set R12 := 12;
set ER12 := 0 3;

set R13 := 13;
set ER13 := 0 2 3;

set R14 := 14;
set ER14 := 0;

set R15 := 15;
set ER15 := 1 3;

set R17 := 17;
set ER17 := 0 1;

set R18 := 18;
set ER18 := 0 2 3;

set R19 := 19;
set ER19 := 0;

set R20 := 20;
set ER20 := 0 1 2;

set R21 := 21;
set ER21 := 1 3;

set R22 := 22;
set ER22 := 0 1;

set R23 := 23;
set ER23 := 0 3;

set R24 := 24;
set ER24 := 0;

set R25 := 25;
set ER25 := 0 1;

set R26 := 26;
set ER26 := 1 3;

set R27 := 27;
set ER27 := 0 1;

set R29 := 29;
set ER29 := 0 1 2 3;

param cost :=
[*,*,0,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,1,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,2,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,3,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,4,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,5,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,6,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,7,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,8,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,9,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,10,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,11,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,12,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,13,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,14,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,15,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,16,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,17,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,18,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,19,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,20,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,21,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,22,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,23,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,24,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,25,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,26,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,27,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,28,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,29,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;
end;

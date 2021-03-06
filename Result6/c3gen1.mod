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
set R3;
/* room 3 */
set ER3;
/* exception courses for room 3 */
set R7;
/* room 7 */
set ER7;
/* exception courses for room 7 */
set R11;
/* room 11 */
set ER11;
/* exception courses for room 11 */
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
set R16;
/* room 16 */
set ER16;
/* exception courses for room 16 */
set R18;
/* room 18 */
set ER18;
/* exception courses for room 18 */
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
set R24;
/* room 24 */
set ER24;
/* exception courses for room 24 */
set T0;
/* teacher 0 */
set ET0;
/* exception courses for teacher 0 */
set T1;
/* teacher 1 */
set ET1;
/* exception courses for teacher 1 */
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
set T7;
/* teacher 7 */
set ET7;
/* exception courses for teacher 7 */
set T8;
/* teacher 8 */
set ET8;
/* exception courses for teacher 8 */
set T10;
/* teacher 10 */
set ET10;
/* exception courses for teacher 10 */
set T13;
/* teacher 13 */
set ET13;
/* exception courses for teacher 13 */
set T14;
/* teacher 14 */
set ET14;
/* exception courses for teacher 14 */
set T17;
/* teacher 17 */
set ET17;
/* exception courses for teacher 17 */
set T18;
/* teacher 18 */
set ET18;
/* exception courses for teacher 18 */
set T19;
/* teacher 19 */
set ET19;
/* exception courses for teacher 19 */
param cost{i in I, j in J, t in T, k in K}, >= 0;
/* cost of allocating room j to course i with teacher t in time slot k */

var x{i in I, j in J, t in T, k in K} binary;
/* x[i,j,t,k] = 1 means room j is assigned to course i with teacher t in time slot k
x[i,j,t,k] = 0 otherwise  */

s.t. first{i in I}: sum{j in J, t in T, k in K} x[i,j,t,k] = 1;

s.t. second{j in J, k in K}: sum{i in I, t in T} x[i,j,t,k] <= 1;

s.t. third{t in T, k in K}: sum{i in I, j in J} x[i,j,t,k] <= 1;

s.t. cr0: sum{i in ER0, j in R0, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr3: sum{i in ER3, j in R3, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr7: sum{i in ER7, j in R7, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr11: sum{i in ER11, j in R11, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr13: sum{i in ER13, j in R13, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr14: sum{i in ER14, j in R14, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr15: sum{i in ER15, j in R15, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr16: sum{i in ER16, j in R16, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr18: sum{i in ER18, j in R18, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr20: sum{i in ER20, j in R20, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr21: sum{i in ER21, j in R21, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr22: sum{i in ER22, j in R22, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr24: sum{i in ER24, j in R24, t in T, k in K} x[i,j,t,k] = 0;

s.t. ct0: sum{i in ET0, j in J, t in T0, k in K} x[i,j,t,k] = 0;

s.t. ct1: sum{i in ET1, j in J, t in T1, k in K} x[i,j,t,k] = 0;

s.t. ct2: sum{i in ET2, j in J, t in T2, k in K} x[i,j,t,k] = 0;

s.t. ct4: sum{i in ET4, j in J, t in T4, k in K} x[i,j,t,k] = 0;

s.t. ct5: sum{i in ET5, j in J, t in T5, k in K} x[i,j,t,k] = 0;

s.t. ct7: sum{i in ET7, j in J, t in T7, k in K} x[i,j,t,k] = 0;

s.t. ct8: sum{i in ET8, j in J, t in T8, k in K} x[i,j,t,k] = 0;

s.t. ct10: sum{i in ET10, j in J, t in T10, k in K} x[i,j,t,k] = 0;

s.t. ct13: sum{i in ET13, j in J, t in T13, k in K} x[i,j,t,k] = 0;

s.t. ct14: sum{i in ET14, j in J, t in T14, k in K} x[i,j,t,k] = 0;

s.t. ct17: sum{i in ET17, j in J, t in T17, k in K} x[i,j,t,k] = 0;

s.t. ct18: sum{i in ET18, j in J, t in T18, k in K} x[i,j,t,k] = 0;

s.t. ct19: sum{i in ET19, j in J, t in T19, k in K} x[i,j,t,k] = 0;

minimize obj: sum{i in I, j in J, t in T, k in K} cost[i,j,t,k] * x[i,j,t,k];
/* the objective is to find a cheapest assignment */

solve;

printf {i in I, j in J, t in T, k in K: x[i,j,t,k] = 1} 'result: c:%s r:%s t:%s time:%s\n', i, j, t, k;

data;

set I := 0 1 2 3;

set T := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19;
set J := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24;
set K := 0;
set T0 := 0;
set ET0 := 3;

set T1 := 1;
set ET1 := 0 2 3;

set T2 := 2;
set ET2 := 0 1 2;

set T4 := 4;
set ET4 := 1;

set T5 := 5;
set ET5 := 0;

set T7 := 7;
set ET7 := 0 1 3;

set T8 := 8;
set ET8 := 0;

set T10 := 10;
set ET10 := 1 2;

set T13 := 13;
set ET13 := 1 3;

set T14 := 14;
set ET14 := 3;

set T17 := 17;
set ET17 := 1 3;

set T18 := 18;
set ET18 := 2;

set T19 := 19;
set ET19 := 0 1 2 3;

set R0 := 0;
set ER0 := 0;

set R3 := 3;
set ER3 := 1;

set R7 := 7;
set ER7 := 1;

set R11 := 11;
set ER11 := 0 3;

set R13 := 13;
set ER13 := 0 1;

set R14 := 14;
set ER14 := 1 2;

set R15 := 15;
set ER15 := 1;

set R16 := 16;
set ER16 := 0;

set R18 := 18;
set ER18 := 0;

set R20 := 20;
set ER20 := 0;

set R21 := 21;
set ER21 := 0 1 3;

set R22 := 22;
set ER22 := 1;

set R24 := 24;
set ER24 := 0 1 2 3;

param cost :=
[*,*,0,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,1,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,2,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,3,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,4,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,5,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,6,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,7,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,8,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,9,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,10,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,11,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,12,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,13,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,14,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,15,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,16,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,17,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,18,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,19,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;
end;

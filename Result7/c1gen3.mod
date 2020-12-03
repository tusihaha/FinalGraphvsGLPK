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
set R3;
/* room 3 */
set ER3;
/* exception courses for room 3 */
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
set R7;
/* room 7 */
set ER7;
/* exception courses for room 7 */
set R8;
/* room 8 */
set ER8;
/* exception courses for room 8 */
set R9;
/* room 9 */
set ER9;
/* exception courses for room 9 */
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
set T3;
/* teacher 3 */
set ET3;
/* exception courses for teacher 3 */
set T4;
/* teacher 4 */
set ET4;
/* exception courses for teacher 4 */
set T6;
/* teacher 6 */
set ET6;
/* exception courses for teacher 6 */
set T7;
/* teacher 7 */
set ET7;
/* exception courses for teacher 7 */
set T8;
/* teacher 8 */
set ET8;
/* exception courses for teacher 8 */
set T9;
/* teacher 9 */
set ET9;
/* exception courses for teacher 9 */
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

s.t. cr3: sum{i in ER3, j in R3, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr4: sum{i in ER4, j in R4, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr5: sum{i in ER5, j in R5, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr6: sum{i in ER6, j in R6, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr7: sum{i in ER7, j in R7, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr8: sum{i in ER8, j in R8, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr9: sum{i in ER9, j in R9, t in T, k in K} x[i,j,t,k] = 0;

s.t. ct0: sum{i in ET0, j in J, t in T0, k in K} x[i,j,t,k] = 0;

s.t. ct1: sum{i in ET1, j in J, t in T1, k in K} x[i,j,t,k] = 0;

s.t. ct2: sum{i in ET2, j in J, t in T2, k in K} x[i,j,t,k] = 0;

s.t. ct3: sum{i in ET3, j in J, t in T3, k in K} x[i,j,t,k] = 0;

s.t. ct4: sum{i in ET4, j in J, t in T4, k in K} x[i,j,t,k] = 0;

s.t. ct6: sum{i in ET6, j in J, t in T6, k in K} x[i,j,t,k] = 0;

s.t. ct7: sum{i in ET7, j in J, t in T7, k in K} x[i,j,t,k] = 0;

s.t. ct8: sum{i in ET8, j in J, t in T8, k in K} x[i,j,t,k] = 0;

s.t. ct9: sum{i in ET9, j in J, t in T9, k in K} x[i,j,t,k] = 0;

minimize obj: sum{i in I, j in J, t in T, k in K} cost[i,j,t,k] * x[i,j,t,k];
/* the objective is to find a cheapest assignment */

solve;

printf {i in I, j in J, t in T, k in K: x[i,j,t,k] = 1} 'result: c:%s r:%s t:%s time:%s\n', i, j, t, k;

data;

set I := 0 1 2 3 4 5 6 7 8 9 10 11;

set T := 0 1 2 3 4 5 6 7 8 9;
set J := 0 1 2 3 4 5 6 7 8 9;
set K := 0 1;
set T0 := 0;
set ET0 := 0 2 3 5 6 7 8 9 10;

set T1 := 1;
set ET1 := 0 1 2 4;

set T2 := 2;
set ET2 := 0 3 7 10;

set T3 := 3;
set ET3 := 1 2;

set T4 := 4;
set ET4 := 0 1 2 3 5 6 7 9 11;

set T6 := 6;
set ET6 := 1 2 3 4 5 6 7 8 9 10 11;

set T7 := 7;
set ET7 := 0 1 2 3 4 5 6 7 8 9 11;

set T8 := 8;
set ET8 := 0 2 5 6 8 9 11;

set T9 := 9;
set ET9 := 0 1 2 3 4 5 6 7 8 9 10 11;

set R0 := 0;
set ER0 := 0 1 2 3 4 5 6 8 9 10 11;

set R1 := 1;
set ER1 := 0 1 2 3 4 5 7;

set R2 := 2;
set ER2 := 0;

set R3 := 3;
set ER3 := 0 1 2;

set R4 := 4;
set ER4 := 0 1 3 4 5 6 7 10 11;

set R5 := 5;
set ER5 := 0 1 2 3 4 6;

set R6 := 6;
set ER6 := 1 2 3;

set R7 := 7;
set ER7 := 1 2 3 4 5 6 7 8 9 10 11;

set R8 := 8;
set ER8 := 0 1 2 3 4 5 6 8 10 11;

set R9 := 9;
set ER9 := 0 1 2 3 4 5 6 7 8 9 10 11;

param cost :=
[*,*,0,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,1,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,2,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,3,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,4,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,5,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,6,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,7,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,8,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,9,0]: 0 1 2 3 4 5 6 7 8 9 :=
0 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1
[*,*,0,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,1,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,2,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,3,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,4,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,5,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,6,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,7,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,8,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
[*,*,9,1]: 0 1 2 3 4 5 6 7 8 9 :=
0 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2
;
end;

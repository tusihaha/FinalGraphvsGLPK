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
set T0;
/* teacher 0 */
set ET0;
/* exception courses for teacher 0 */
set T1;
/* teacher 1 */
set ET1;
/* exception courses for teacher 1 */
set T3;
/* teacher 3 */
set ET3;
/* exception courses for teacher 3 */
set T4;
/* teacher 4 */
set ET4;
/* exception courses for teacher 4 */
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

s.t. cr7: sum{i in ER7, j in R7, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr8: sum{i in ER8, j in R8, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr9: sum{i in ER9, j in R9, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr10: sum{i in ER10, j in R10, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr11: sum{i in ER11, j in R11, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr12: sum{i in ER12, j in R12, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr13: sum{i in ER13, j in R13, t in T, k in K} x[i,j,t,k] = 0;

s.t. cr14: sum{i in ER14, j in R14, t in T, k in K} x[i,j,t,k] = 0;

s.t. ct0: sum{i in ET0, j in J, t in T0, k in K} x[i,j,t,k] = 0;

s.t. ct1: sum{i in ET1, j in J, t in T1, k in K} x[i,j,t,k] = 0;

s.t. ct3: sum{i in ET3, j in J, t in T3, k in K} x[i,j,t,k] = 0;

s.t. ct4: sum{i in ET4, j in J, t in T4, k in K} x[i,j,t,k] = 0;

minimize obj: sum{i in I, j in J, t in T, k in K} cost[i,j,t,k] * x[i,j,t,k];
/* the objective is to find a cheapest assignment */

solve;

printf {i in I, j in J, t in T, k in K: x[i,j,t,k] = 1} 'result: c:%s r:%s t:%s time:%s\n', i, j, t, k;

data;

set I := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19;

set T := 0 1 2 3 4;
set J := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14;
set K := 0 1 2 3 4 5;
set T0 := 0;
set ET0 := 0 2;

set T1 := 1;
set ET1 := 0 1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18;

set T3 := 3;
set ET3 := 0 1 2 3 4 6 7 8 9 10 11 15;

set T4 := 4;
set ET4 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19;

set R0 := 0;
set ER0 := 0 1;

set R1 := 1;
set ER1 := 0 1 2 3 4 5 6 7 8 9 12;

set R2 := 2;
set ER2 := 1 2 3 4 5 6 7 8 9 10 11 12 17 18 19;

set R4 := 4;
set ER4 := 2;

set R5 := 5;
set ER5 := 0 1 2 3 4 5 6 7 8 9 10 12 14 15;

set R6 := 6;
set ER6 := 0;

set R7 := 7;
set ER7 := 0 1 3 4 5 6 7 8 9 10;

set R8 := 8;
set ER8 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;

set R9 := 9;
set ER9 := 0 1 2 4 5 6 7 8 9 10 11 14 15 16 17 18;

set R10 := 10;
set ER10 := 0 1 2 3 4;

set R11 := 11;
set ER11 := 0 1 2 3 5 8 10;

set R12 := 12;
set ER12 := 0 1 2 3 4 6 7 8 9 10 11 12 13 14 15 18;

set R13 := 13;
set ER13 := 2 3 4 5 6 8 10;

set R14 := 14;
set ER14 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19;

param cost :=
[*,*,0,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
12 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
13 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
14 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
15 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
16 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
17 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
18 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
19 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,1,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
12 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
13 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
14 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
15 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
16 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
17 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
18 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
19 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,2,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
12 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
13 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
14 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
15 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
16 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
17 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
18 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
19 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,3,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
12 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
13 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
14 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
15 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
16 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
17 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
18 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
19 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,4,0]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
6 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
7 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
8 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
11 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
12 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
13 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
14 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
15 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
16 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
17 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
18 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
19 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[*,*,0,1]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
12 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
13 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
14 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
15 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
16 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
17 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
18 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
19 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[*,*,1,1]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
12 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
13 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
14 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
15 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
16 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
17 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
18 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
19 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[*,*,2,1]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
12 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
13 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
14 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
15 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
16 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
17 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
18 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
19 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[*,*,3,1]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
12 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
13 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
14 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
15 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
16 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
17 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
18 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
19 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[*,*,4,1]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
4 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
5 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
6 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
7 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
9 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
10 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
11 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
12 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
13 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
14 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
15 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
16 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
17 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
18 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
19 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[*,*,0,2]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
4 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
5 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
6 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
7 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
8 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
9 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
10 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
11 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
12 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
13 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
14 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
15 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
16 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
17 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
18 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
19 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
[*,*,1,2]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
4 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
5 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
6 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
7 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
8 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
9 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
10 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
11 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
12 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
13 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
14 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
15 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
16 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
17 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
18 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
19 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
[*,*,2,2]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
4 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
5 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
6 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
7 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
8 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
9 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
10 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
11 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
12 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
13 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
14 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
15 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
16 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
17 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
18 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
19 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
[*,*,3,2]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
4 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
5 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
6 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
7 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
8 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
9 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
10 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
11 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
12 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
13 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
14 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
15 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
16 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
17 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
18 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
19 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
[*,*,4,2]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
4 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
5 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
6 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
7 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
8 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
9 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
10 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
11 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
12 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
13 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
14 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
15 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
16 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
17 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
18 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
19 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
[*,*,0,3]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
1 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
2 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
5 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
6 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
7 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
8 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
9 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
10 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
11 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
12 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
13 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
14 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
15 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
16 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
17 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
18 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
19 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
[*,*,1,3]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
1 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
2 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
5 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
6 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
7 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
8 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
9 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
10 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
11 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
12 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
13 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
14 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
15 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
16 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
17 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
18 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
19 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
[*,*,2,3]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
1 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
2 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
5 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
6 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
7 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
8 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
9 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
10 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
11 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
12 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
13 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
14 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
15 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
16 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
17 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
18 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
19 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
[*,*,3,3]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
1 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
2 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
5 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
6 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
7 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
8 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
9 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
10 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
11 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
12 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
13 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
14 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
15 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
16 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
17 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
18 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
19 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
[*,*,4,3]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
1 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
2 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
5 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
6 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
7 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
8 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
9 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
10 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
11 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
12 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
13 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
14 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
15 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
16 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
17 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
18 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
19 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
[*,*,0,4]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
1 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
3 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
6 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
7 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
8 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
9 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
10 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
11 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
12 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
13 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
14 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
15 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
16 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
17 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
18 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
19 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
[*,*,1,4]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
1 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
3 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
6 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
7 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
8 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
9 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
10 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
11 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
12 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
13 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
14 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
15 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
16 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
17 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
18 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
19 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
[*,*,2,4]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
1 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
3 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
6 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
7 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
8 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
9 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
10 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
11 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
12 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
13 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
14 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
15 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
16 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
17 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
18 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
19 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
[*,*,3,4]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
1 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
3 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
6 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
7 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
8 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
9 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
10 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
11 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
12 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
13 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
14 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
15 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
16 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
17 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
18 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
19 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
[*,*,4,4]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
1 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
3 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
6 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
7 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
8 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
9 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
10 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
11 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
12 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
13 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
14 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
15 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
16 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
17 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
18 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
19 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
[*,*,0,5]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
1 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
2 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
3 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
4 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
7 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
8 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
9 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
10 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
11 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
12 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
13 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
14 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
15 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
16 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
17 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
18 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
19 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
[*,*,1,5]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
1 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
2 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
3 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
4 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
7 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
8 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
9 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
10 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
11 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
12 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
13 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
14 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
15 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
16 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
17 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
18 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
19 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
[*,*,2,5]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
1 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
2 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
3 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
4 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
7 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
8 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
9 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
10 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
11 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
12 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
13 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
14 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
15 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
16 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
17 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
18 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
19 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
[*,*,3,5]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
1 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
2 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
3 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
4 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
7 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
8 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
9 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
10 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
11 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
12 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
13 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
14 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
15 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
16 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
17 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
18 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
19 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
[*,*,4,5]: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 :=
0 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
1 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
2 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
3 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
4 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
7 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
8 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
9 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
10 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
11 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
12 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
13 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
14 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
15 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
16 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
17 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
18 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
19 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
;
end;

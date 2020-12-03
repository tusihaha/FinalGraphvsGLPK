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

s.t. ct0: sum{i in ET0, j in J, t in T0, k in K} x[i,j,t,k] = 0;

s.t. ct1: sum{i in ET1, j in J, t in T1, k in K} x[i,j,t,k] = 0;

s.t. ct2: sum{i in ET2, j in J, t in T2, k in K} x[i,j,t,k] = 0;

s.t. ct3: sum{i in ET3, j in J, t in T3, k in K} x[i,j,t,k] = 0;

s.t. ct4: sum{i in ET4, j in J, t in T4, k in K} x[i,j,t,k] = 0;

s.t. ct5: sum{i in ET5, j in J, t in T5, k in K} x[i,j,t,k] = 0;

s.t. ct6: sum{i in ET6, j in J, t in T6, k in K} x[i,j,t,k] = 0;

s.t. ct7: sum{i in ET7, j in J, t in T7, k in K} x[i,j,t,k] = 0;

s.t. ct8: sum{i in ET8, j in J, t in T8, k in K} x[i,j,t,k] = 0;

s.t. ct9: sum{i in ET9, j in J, t in T9, k in K} x[i,j,t,k] = 0;

minimize obj: sum{i in I, j in J, t in T, k in K} cost[i,j,t,k] * x[i,j,t,k];
/* the objective is to find a cheapest assignment */

solve;

printf {i in I, j in J, t in T, k in K: x[i,j,t,k] = 1} 'result: c:%s r:%s t:%s time:%s\n', i, j, t, k;

data;

set I := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19;

set T := 0 1 2 3 4 5 6 7 8 9;
set J := 0 1 2 3;
set K := 0 1 2 3 4 5 6 7 8 9 10 11 12;
set T0 := 0;
set ET0 := 0 1 2 3 4 5 6 7 8 10 11 12 13 16;

set T1 := 1;
set ET1 := 1 2 3 4 9;

set T2 := 2;
set ET2 := 0 1 2 3 5 6 7 8 9 11 12 13 14;

set T3 := 3;
set ET3 := 1 2 3 5 6 7 9 10 11;

set T4 := 4;
set ET4 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17;

set T5 := 5;
set ET5 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;

set T6 := 6;
set ET6 := 0 1 2 3 4 5 6 7 8 9 10 11 12 16;

set T7 := 7;
set ET7 := 0 1 2 3 4 5 6 7 8 9 10 11 12 14;

set T8 := 8;
set ET8 := 1;

set T9 := 9;
set ET9 := 0 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19;

set R0 := 0;
set ER0 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 16 17 19;

set R1 := 1;
set ER1 := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14;

set R2 := 2;
set ER2 := 0 1 2 3 4 5 6 7 8 9 10 11 13 15 16 17 18;

set R3 := 3;
set ER3 := 12 14 15 16 17 18 19;

param cost :=
[*,*,0,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,1,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,2,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,3,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,4,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,5,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,6,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,7,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,8,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,9,0]: 0 1 2 3 :=
0 1 1 1 1
1 1 1 1 1
2 1 1 1 1
3 1 1 1 1
4 1 1 1 1
5 1 1 1 1
6 1 1 1 1
7 1 1 1 1
8 1 1 1 1
9 1 1 1 1
10 1 1 1 1
11 1 1 1 1
12 1 1 1 1
13 1 1 1 1
14 1 1 1 1
15 1 1 1 1
16 1 1 1 1
17 1 1 1 1
18 1 1 1 1
19 1 1 1 1
[*,*,0,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,1,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,2,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,3,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,4,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,5,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,6,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,7,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,8,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,9,1]: 0 1 2 3 :=
0 2 2 2 2
1 2 2 2 2
2 2 2 2 2
3 2 2 2 2
4 2 2 2 2
5 2 2 2 2
6 2 2 2 2
7 2 2 2 2
8 2 2 2 2
9 2 2 2 2
10 2 2 2 2
11 2 2 2 2
12 2 2 2 2
13 2 2 2 2
14 2 2 2 2
15 2 2 2 2
16 2 2 2 2
17 2 2 2 2
18 2 2 2 2
19 2 2 2 2
[*,*,0,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,1,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,2,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,3,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,4,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,5,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,6,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,7,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,8,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,9,2]: 0 1 2 3 :=
0 3 3 3 3
1 3 3 3 3
2 3 3 3 3
3 3 3 3 3
4 3 3 3 3
5 3 3 3 3
6 3 3 3 3
7 3 3 3 3
8 3 3 3 3
9 3 3 3 3
10 3 3 3 3
11 3 3 3 3
12 3 3 3 3
13 3 3 3 3
14 3 3 3 3
15 3 3 3 3
16 3 3 3 3
17 3 3 3 3
18 3 3 3 3
19 3 3 3 3
[*,*,0,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,1,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,2,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,3,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,4,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,5,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,6,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,7,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,8,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,9,3]: 0 1 2 3 :=
0 4 4 4 4
1 4 4 4 4
2 4 4 4 4
3 4 4 4 4
4 4 4 4 4
5 4 4 4 4
6 4 4 4 4
7 4 4 4 4
8 4 4 4 4
9 4 4 4 4
10 4 4 4 4
11 4 4 4 4
12 4 4 4 4
13 4 4 4 4
14 4 4 4 4
15 4 4 4 4
16 4 4 4 4
17 4 4 4 4
18 4 4 4 4
19 4 4 4 4
[*,*,0,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,1,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,2,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,3,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,4,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,5,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,6,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,7,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,8,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,9,4]: 0 1 2 3 :=
0 5 5 5 5
1 5 5 5 5
2 5 5 5 5
3 5 5 5 5
4 5 5 5 5
5 5 5 5 5
6 5 5 5 5
7 5 5 5 5
8 5 5 5 5
9 5 5 5 5
10 5 5 5 5
11 5 5 5 5
12 5 5 5 5
13 5 5 5 5
14 5 5 5 5
15 5 5 5 5
16 5 5 5 5
17 5 5 5 5
18 5 5 5 5
19 5 5 5 5
[*,*,0,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,1,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,2,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,3,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,4,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,5,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,6,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,7,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,8,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,9,5]: 0 1 2 3 :=
0 6 6 6 6
1 6 6 6 6
2 6 6 6 6
3 6 6 6 6
4 6 6 6 6
5 6 6 6 6
6 6 6 6 6
7 6 6 6 6
8 6 6 6 6
9 6 6 6 6
10 6 6 6 6
11 6 6 6 6
12 6 6 6 6
13 6 6 6 6
14 6 6 6 6
15 6 6 6 6
16 6 6 6 6
17 6 6 6 6
18 6 6 6 6
19 6 6 6 6
[*,*,0,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,1,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,2,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,3,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,4,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,5,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,6,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,7,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,8,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,9,6]: 0 1 2 3 :=
0 7 7 7 7
1 7 7 7 7
2 7 7 7 7
3 7 7 7 7
4 7 7 7 7
5 7 7 7 7
6 7 7 7 7
7 7 7 7 7
8 7 7 7 7
9 7 7 7 7
10 7 7 7 7
11 7 7 7 7
12 7 7 7 7
13 7 7 7 7
14 7 7 7 7
15 7 7 7 7
16 7 7 7 7
17 7 7 7 7
18 7 7 7 7
19 7 7 7 7
[*,*,0,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,1,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,2,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,3,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,4,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,5,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,6,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,7,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,8,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,9,7]: 0 1 2 3 :=
0 8 8 8 8
1 8 8 8 8
2 8 8 8 8
3 8 8 8 8
4 8 8 8 8
5 8 8 8 8
6 8 8 8 8
7 8 8 8 8
8 8 8 8 8
9 8 8 8 8
10 8 8 8 8
11 8 8 8 8
12 8 8 8 8
13 8 8 8 8
14 8 8 8 8
15 8 8 8 8
16 8 8 8 8
17 8 8 8 8
18 8 8 8 8
19 8 8 8 8
[*,*,0,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,1,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,2,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,3,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,4,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,5,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,6,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,7,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,8,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,9,8]: 0 1 2 3 :=
0 9 9 9 9
1 9 9 9 9
2 9 9 9 9
3 9 9 9 9
4 9 9 9 9
5 9 9 9 9
6 9 9 9 9
7 9 9 9 9
8 9 9 9 9
9 9 9 9 9
10 9 9 9 9
11 9 9 9 9
12 9 9 9 9
13 9 9 9 9
14 9 9 9 9
15 9 9 9 9
16 9 9 9 9
17 9 9 9 9
18 9 9 9 9
19 9 9 9 9
[*,*,0,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,1,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,2,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,3,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,4,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,5,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,6,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,7,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,8,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,9,9]: 0 1 2 3 :=
0 10 10 10 10
1 10 10 10 10
2 10 10 10 10
3 10 10 10 10
4 10 10 10 10
5 10 10 10 10
6 10 10 10 10
7 10 10 10 10
8 10 10 10 10
9 10 10 10 10
10 10 10 10 10
11 10 10 10 10
12 10 10 10 10
13 10 10 10 10
14 10 10 10 10
15 10 10 10 10
16 10 10 10 10
17 10 10 10 10
18 10 10 10 10
19 10 10 10 10
[*,*,0,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,1,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,2,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,3,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,4,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,5,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,6,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,7,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,8,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,9,10]: 0 1 2 3 :=
0 11 11 11 11
1 11 11 11 11
2 11 11 11 11
3 11 11 11 11
4 11 11 11 11
5 11 11 11 11
6 11 11 11 11
7 11 11 11 11
8 11 11 11 11
9 11 11 11 11
10 11 11 11 11
11 11 11 11 11
12 11 11 11 11
13 11 11 11 11
14 11 11 11 11
15 11 11 11 11
16 11 11 11 11
17 11 11 11 11
18 11 11 11 11
19 11 11 11 11
[*,*,0,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,1,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,2,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,3,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,4,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,5,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,6,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,7,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,8,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,9,11]: 0 1 2 3 :=
0 12 12 12 12
1 12 12 12 12
2 12 12 12 12
3 12 12 12 12
4 12 12 12 12
5 12 12 12 12
6 12 12 12 12
7 12 12 12 12
8 12 12 12 12
9 12 12 12 12
10 12 12 12 12
11 12 12 12 12
12 12 12 12 12
13 12 12 12 12
14 12 12 12 12
15 12 12 12 12
16 12 12 12 12
17 12 12 12 12
18 12 12 12 12
19 12 12 12 12
[*,*,0,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,1,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,2,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,3,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,4,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,5,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,6,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,7,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,8,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
[*,*,9,12]: 0 1 2 3 :=
0 13 13 13 13
1 13 13 13 13
2 13 13 13 13
3 13 13 13 13
4 13 13 13 13
5 13 13 13 13
6 13 13 13 13
7 13 13 13 13
8 13 13 13 13
9 13 13 13 13
10 13 13 13 13
11 13 13 13 13
12 13 13 13 13
13 13 13 13 13
14 13 13 13 13
15 13 13 13 13
16 13 13 13 13
17 13 13 13 13
18 13 13 13 13
19 13 13 13 13
;
end;
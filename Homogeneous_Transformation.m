syms t1 t2 t3 t4 t5 t6 real;  % Joint angles or parameters
% for 1-2

H01 = [cos(t1)      0    sin(t1)    0;
       sin(t1)      0   -cos(t1)    0;
       0            1      0        210;
       0            0      0        1];

H12 = [-cos(t2)  -sin(t2)    0      -250*cos(t2);
       -sin(t2)   cos(t2)    0      -250*sin(t2);
        0           0       -1      76.2;
        0           0        0      1];


H23 = [-cos(t3) -sin(t3) 0       250*cos(t3);
       -sin(t3)  cos(t3) 0       250*sin(t3);
       0        0       -1      76.2;
       0        0        0      1];


H34 = [-cos(t4)   0  sin(t4)    0;
       -sin(t4)   0  -cos(t4)   0;
       0         -1        0    76.2;
       0          0        0    1];

H45 = [cos(t5)   0   sin(t5)    0;
       sin(t5)   0  -cos(t5)    0;
       0        1       0       107;
       0        0       0       1];


H56 = [-cos(t6)   sin(t6) 0     0;
       -sin(t6)  -cos(t6) 0     0;
       0        0       1       109.5;
       0        0       0       1];


t1v= -4;
t2v= -161;
t3v= 108;
t4v= -257;
t5v= 24;
t6v= 0;


% Angles in radians
t1_val = t1v* pi / 180; 
t2_val = (t2v) * pi / 180;
t3_val = t3v * pi * (-1)/ 180;
t4_val = (t4v) * pi / 180;
t5_val = (t5v) * pi / 180; 
t6_val = (t6v) * pi / 180;
% Substituting
H01_sub = subs(H01, t1, t1_val);
H12_sub = subs(H12, t2, t2_val);
H23_sub = subs(H23, t3, t3_val);
H34_sub = subs(H34, t4, t4_val);
H45_sub = subs(H45, t5, t5_val);
H56_sub = subs(H56, t6, t6_val);
% Computing H1e
H06_sub = H01_sub * H12_sub * H23_sub * H34_sub * H45_sub * H56_sub;
H06_numeric = double(H06_sub);
% Result
disp('H06 = ');
disp(H06_numeric);
X = H06_numeric(1, 4);  % x-coordinate
Y = H06_numeric(2, 4);  % y-coordinate
Z = H06_numeric(3, 4);  % z-coordinate
% Display the result
disp('X = ');
disp(-1*X);
disp('Y = ');
disp(-1*Y);
disp('Z = ');
disp(Z);
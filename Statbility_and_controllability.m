clear all;
clc;
M=0.5;
m=0.2;
b=0.1;
l=0.3;
I=0.0006;
g=9.81;
A = [0 1                                0                              0;
   0 (-(I+m*l^2)*b)/(I*(M+m)+M*m*l^2) m^2*g*l^2/(I*(M+m)+M*m*l^2)    0;
   0 0                                0                              1;
   0 -m*l*b/(I*(M+m)+M*m*l^2)        (m*g*l*(M+m))/(I*(M+m)+M*m*l^2) 0]
B=[0;(I+m*l^2)/(I*(M+m)+M*m*l^2);0;m*l/(I*(M+m)+M*m*l^2)];
C=[1 0 0 0;
   0 0 1 0];
D=[0;0];

sys_ss=ss(A,B,C,D)
sys_tf=tf(sys_ss)
%Xet tinh on dinh
[num,den]=ss2tf(A,B,C,D)
pzmap (A,B,C,D)
nghiem=roots(den)
%Xet tinh dieu khien
P=[B A*B A^2*B A^3*B]
rank(P)

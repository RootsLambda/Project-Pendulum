clear all;
clc;
M=0.5;
m=0.2;
b=0.1;
l=0.3;
I=0.0006;
g=9.81;
s = tf('s');
q = (M+m) *(I+m*l^2) - (m*l) ^2;
P_pend = (m*l*s/q)/ (s^3 + (b*(I + m*l^2)) *s^2/q - ((M + m) *m*g*l) * s/q - b*m*g*l/q)
Kp = 100;
Ki = 1;
Kd = 20;
C = pid (Kp, Ki, Kd);
T = feedback (P_pend, C);
t=0:0.01:10;
impulse (T, t)
axis ([0, 2.5, -0.2, 0.2]);

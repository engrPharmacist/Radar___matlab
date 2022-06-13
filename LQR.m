clc;clear;

Kt = 0.18; %współczynnik tarcia dla prędkości 0.05 
%Kt = 0.000143; %współczynnik tarcia dla prędkości 7

sys1 = tf( 1 , [9.64e-6+1/2*2.1*0.1^2 0.0257^2/2.675]);
sys2 = tf(Kt);
sys3=feedback(sys1,sys2);
sys4=tf(0.0257/2.675);
sys5=series(sys4,sys3)


[A,B,C,D]=ssdata(sys5)
ss_sys=ss(sys5);

Aroz=[A C; 0 0];
Broz=[C;B];
Croz=[B 0];
Droz=0;

sys=ss(Aroz,Broz,Croz,Droz)
Q=[1 0;0 10];
R=[0.002];

%[K, S, e]=lqr(sys,Q,R)
K=lqr(Aroz,Broz,Q,R)
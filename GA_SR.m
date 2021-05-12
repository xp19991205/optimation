clear all;
clc
fun = @(x)10*sin(5*x)+7*abs(x-5)+10;
IntCon = [];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0];
ub = [10];
nonlcon = [];
[x,fval] = ga(fun,1,A,b,Aeq,beq,lb,ub,nonlcon,IntCon);
x1 = 0:0.01:10;
y = 10*sin(5*x1)+7*abs(x1-5)+10;
plot(x1,y)
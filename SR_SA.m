fun = @SNR_D;
x0 = [1.0];
lb = [0.1];
ub = [3];
options = optimoptions(@simulannealbnd,'MaxIterations',100);%����ľ���������Բ鿴�ĵ�
[x,fval] = simulannealbnd(fun,x0,lb,ub,options)
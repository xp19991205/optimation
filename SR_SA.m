fun = @SNR_D;
x0 = [1.0];
lb = [0.1];
ub = [3];
options = optimoptions(@simulannealbnd,'MaxIterations',100);%这里的具体参数可以查看文档
[x,fval] = simulannealbnd(fun,x0,lb,ub,options)
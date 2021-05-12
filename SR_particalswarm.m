fun = @SNR_D;%函数句柄
nvars = 1;%变量个数
lb = [0.1];%自变量下限
ub = [2];%自变量上限
[x,fval,exitflag,output] =  particleswarm(fun,nvars,lb,ub,optimoptions('particleswarm','MaxIterations',50));
%%这里粒子群算法一定注意参数 fun--函数句柄 nvars ---自变量个数 lb--自变量下限 ub----自变量上限
%%optimoptions--具体查阅文档
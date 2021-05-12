IntCon =[];%变量的整数约束
rng default % For reproducibility
fun = @SNR_D;%函数句柄，主要的定义方式有两种①直接定义②通过函数文件来定义
A = [];%线性约束矩阵A（AX <= b）
b = [];%线性约束矩阵b（AX <= b）
Aeq = [];%线性约束矩阵A（Aeq*X = beq）
beq = [];%线性约束矩阵b（Aeq*X = beq）
lb = [0.1];%各变量的下限lower boundrary
ub = [3];%各变量的上限upper boundrary
nonlcon = [];%非线性条件具体可以查阅文档，以<=的形式编写函数
[x,fval] = ga(fun,1,A,b,Aeq,beq,lb,ub,nonlcon,IntCon,optimoptions('ga','PopulationSize',5,'FunctionTolerance',2e-1,'MaxGenerations',50,'InitialPopulationRange',[0;1]));
D = 0.1:0.1:3;
SNRg = zeros(1,length(D));
for k=1:length(D)
    SNRg(k) = -SNR_D(D(k));
end
plot(D,SNRg)
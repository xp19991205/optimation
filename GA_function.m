IntCon =[];%����������Լ��
rng default % For reproducibility
fun = @SNR_D;%�����������Ҫ�Ķ��巽ʽ�����֢�ֱ�Ӷ����ͨ�������ļ�������
A = [];%����Լ������A��AX <= b��
b = [];%����Լ������b��AX <= b��
Aeq = [];%����Լ������A��Aeq*X = beq��
beq = [];%����Լ������b��Aeq*X = beq��
lb = [0.1];%������������lower boundrary
ub = [3];%������������upper boundrary
nonlcon = [];%����������������Բ����ĵ�����<=����ʽ��д����
[x,fval] = ga(fun,1,A,b,Aeq,beq,lb,ub,nonlcon,IntCon,optimoptions('ga','PopulationSize',5,'FunctionTolerance',2e-1,'MaxGenerations',50,'InitialPopulationRange',[0;1]));
D = 0.1:0.1:3;
SNRg = zeros(1,length(D));
for k=1:length(D)
    SNRg(k) = -SNR_D(D(k));
end
plot(D,SNRg)
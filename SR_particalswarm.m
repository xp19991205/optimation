fun = @SNR_D;%�������
nvars = 1;%��������
lb = [0.1];%�Ա�������
ub = [2];%�Ա�������
[x,fval,exitflag,output] =  particleswarm(fun,nvars,lb,ub,optimoptions('particleswarm','MaxIterations',50));
%%��������Ⱥ�㷨һ��ע����� fun--������� nvars ---�Ա������� lb--�Ա������� ub----�Ա�������
%%optimoptions--��������ĵ�
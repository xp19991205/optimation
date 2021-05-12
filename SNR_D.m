function [outputArg1] = SNR_D(D)
%SNR_D 这里用来求解SNR对D的变化情况
%   此处显示详细说明
%% =====原始信号的相关参数设置=============
    fs=5;
    Ts=1/fs;
    N=10000;
    t=0:Ts:(N-1)*Ts;
    A=0.1;f0=0.01;
    s=A*cos(2*pi*f0.*t);
    x=s+sqrt(2*D).*randn(1,N);%输入随机共振系统的参数
    NN=10000;%傅里叶变换点数
    ff=fs.*(0:NN/2-1)/NN;
%% ===
    mm1=0;
    mm2=0;
    flag1=0;flag2=0;%%用于统计成功的数量
     Nout = 0;%%用于计算输出信噪比
    for i=1:100
            x=s+sqrt(2*D).*randn(1,N);%输入信号
            y=fft(x,NN);%输入信号谱函数
            py=y.*conj(y)/NN;%输入信号功率谱
            ff0=find(ff==0.01);%找出目标频率的谱函数的自变量标号
            m1=py(ff0);
            %求输入信噪比
            if m1>0
                flag1=flag1+1;      
                mm1=mm1+m1;
            end

             Nin=sum(py(1:NN/2));
            a=1;b=2;h=1/fs;
            x1=sr(a,b,h,x);%经典双稳
        %     x1=sr1ouhe(a,b,c,r,h,x);%耦合双稳
            y1=fft(x1,NN);
            py1=y1.*conj(y1)/NN;
            m2=py1(ff0);
            %求输出信噪比
            if m2>0
                flag2=flag2+1;      
                mm2=mm2+m2;
                Nout =Nout +sum(py1(1:NN/2));
            end
      
%     Bwout=0;  
%     for i=1:NN/2 
%         Bwout=py1(i)+Bwout; 
%     end 
    end
     Sin=mm1/flag1;
     Sout=mm2/flag2;
     Nout = Nout/flag2;
     SNRin=10*log10(Sin/(Nin-Sin));%%计算输入信噪比
     SNRout=10*log10(Sout/(Nout-Sout));%%计算输出信噪比


%% =======================================
if(SNRout -SNRin == Inf)
    outputArg1 = 1000;
else
    outputArg1 = -(SNRout-SNRin)
end
end


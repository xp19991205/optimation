function [outputArg1] = SNR_D(D)
%SNR_D �����������SNR��D�ı仯���
%   �˴���ʾ��ϸ˵��
%% =====ԭʼ�źŵ���ز�������=============
    fs=5;
    Ts=1/fs;
    N=10000;
    t=0:Ts:(N-1)*Ts;
    A=0.1;f0=0.01;
    s=A*cos(2*pi*f0.*t);
    x=s+sqrt(2*D).*randn(1,N);%�����������ϵͳ�Ĳ���
    NN=10000;%����Ҷ�任����
    ff=fs.*(0:NN/2-1)/NN;
%% ===
    mm1=0;
    mm2=0;
    flag1=0;flag2=0;%%����ͳ�Ƴɹ�������
     Nout = 0;%%���ڼ�����������
    for i=1:100
            x=s+sqrt(2*D).*randn(1,N);%�����ź�
            y=fft(x,NN);%�����ź��׺���
            py=y.*conj(y)/NN;%�����źŹ�����
            ff0=find(ff==0.01);%�ҳ�Ŀ��Ƶ�ʵ��׺������Ա������
            m1=py(ff0);
            %�����������
            if m1>0
                flag1=flag1+1;      
                mm1=mm1+m1;
            end

             Nin=sum(py(1:NN/2));
            a=1;b=2;h=1/fs;
            x1=sr(a,b,h,x);%����˫��
        %     x1=sr1ouhe(a,b,c,r,h,x);%���˫��
            y1=fft(x1,NN);
            py1=y1.*conj(y1)/NN;
            m2=py1(ff0);
            %����������
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
     SNRin=10*log10(Sin/(Nin-Sin));%%�������������
     SNRout=10*log10(Sout/(Nout-Sout));%%������������


%% =======================================
if(SNRout -SNRin == Inf)
    outputArg1 = 1000;
else
    outputArg1 = -(SNRout-SNRin)
end
end


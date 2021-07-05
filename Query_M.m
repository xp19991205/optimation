%这里我们需要编写的是多服务窗口的情况
%%设第i个人到达的时间为a（i）,开始接受服务的时刻为b（i），离开服务系统的时刻为c（i）
M_s = 6;%这里以三服务台为例
service_end = zeros(1,M_s);%定义每个服务台结束上一顾客服务的时间
n=6000;%模拟1000个人
a=zeros(1,n);%每个人到达时刻
b=zeros(1,n);%每个人开始服务的时刻
c=zeros(1,n);%每个人服务的结束时间
dt = exprnd(3,1,n);    %模拟人数到达的时间间隔，到达率体现在这里
st = exprnd(1,1,n);    %每个人的服务时间，参数自己定,服务率体现在这里
a(1)=0; %假设第一个顾客的到达时间为0s，默认分配给1号服务台
for i=2 :n
    a(i)=a(1,i-1)+dt(i-1);%计算每个人到达的时刻
end
b(1)=0;
c(1)=b(1)+st(1);%1号服务台服务1号客户
service_end(1) = c(1);

for i=2 :n%对接下来的每个客户采用的策略
    for k=1:M_s
        if a(i)>service_end(k)%给k号台
            break;
        end
    end
    if a(i)<service_end(k)%当前所有服务台已满
        b(i) = a(i);
        c(i) = a(i);%采用不服务的策略
    else %当前第k个服务台可服务
        b(i) = a(i);%立即服务
        c(i) = b(i) + st(i);
        service_end(k) = c(i);
    end
end
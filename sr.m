function R = sr( a,b,h,x1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x=zeros(1,length(x1));
for i=1:length(x1)-1
%     if abs(x(i))>10;
%         x(i)=sign(x(i))*10;
%      end
    k1=h*(a*x(i)-b*x(i).^3+x1(i));%k1 = h*(ax-bx^3+x1(i))
    k2=h*(a*(x(i)+k1/2)-b*(x(i)+k1/2).^3+x1(i));
    k3=h*(a*(x(i)+k2/2)-b*(x(i)+k1*(sqrt(2)-1)/2+k2*(2-sqrt(2))/2).^3+x1(i+1));
    k4=h*(a*(x(i)+k3)-b*(x(i)-k2*sqrt(2)/2+k3*(2+sqrt(2))/2).^3+x1(i+1));
    x(i+1)=x(i)+(1/6)*(k1+(2-sqrt(2))*k2+(2+sqrt(2))*k3+k4);
end
R=x;
end


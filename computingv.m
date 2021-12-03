function [v] = computingv(I)


s=size(I);
s=s(1);

esp=linspace(-1/2,1/2,s);

sum1=0;
sum2=0;

for k=1:s
    
    for j=1:s
        
        
        sum1=sum1+I(j,k)*esp(k);
        sum2=sum2+I(j,k)*esp(j);
        
    end
    
end


v=[sum1 sum2];
v=sum1+i*sum2;
v=angle(v)*(180/pi);
end

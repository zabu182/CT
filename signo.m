function [sn , sp] = signo(grad,sp,sn,ang,sizepart,acumu)



vini=grad(1,:);

for i=1:2*sizepart

castemp=acumu+fix((i-1)/sizepart)+1;

vtemp=grad(i,:);  
s=sign(dot(vtemp,vini));

if( s < 0)
    
    sn{castemp}=[sn{castemp} ang(i)];
    
end
    
if( 0 <= s)
    
    sp{castemp}=[sp{castemp} ang(i)];
    
end
    
end

end


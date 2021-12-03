function [v] = color(C1,C2,grad,sizepart)

vini=grad(2,:);
v=zeros(1,2*sizepart);


figure

for i=1:2*sizepart
    vtemp=grad(i,:);  
    v(i)=sign(dot(vtemp,vini));
    
    if(  v(i)==1)
     scatter(C1(i),C2(i),'filled','b');
     hold on
        
    end


    if( v(i) < 1)
     scatter(C1(i),C2(i),'filled','r');
     hold on
        
    end


end

title('Two-dimensional embedding ')
end


function [v] = color2(C1,C2,grad,sizepart)

vini=grad(2,:);
v=zeros(1,2*sizepart);


figure

for i=1:2*sizepart
    vtemp=grad(i,:);  
    v(i)=sign(dot(vtemp,vini));
    
  
    
   
  
    if(  v(i)==1)
     scatter(vtemp(1),vtemp(2),'filled','b');
     hold on
        
    end


    if( v(i) < 1)
     scatter(vtemp(1),vtemp(2),'filled','r');
     hold on
        
    end


end

title('Gradient estimator')
end

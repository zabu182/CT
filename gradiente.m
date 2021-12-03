function [grad] = gradiente(X1,C,kern,xp)
stempve=size(X1);
s=size(C);
svec=s(2);
s=s(1);
grad=0*C;
onesnorm=ones(1,stempve(1));


for i=1:s
    sum=zeros(1,svec);
    vx=C(i,:);
    fx=dot(X1(:,i),xp)/dot(X1(:,i),onesnorm);
    
   orga=kern(i,:);

   [B,I] = sort(orga);
    for j=1:10
        indi=I(s-j+1);
        vy=C(indi,:);
        fy=dot(X1(:,indi),xp)/dot(X1(:,indi),onesnorm);
         
        vtemp=(vy-vx);
        stemp=(fy-fx)*vtemp*exp(-power(norm(vtemp),2)/2);
        sum=sum+stemp;
        
        
    end

    grad(i,:)=sum/norm(sum);
end




end
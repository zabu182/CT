function [s1] = color3(sp,sn,X1,xp,sizepart)

s1=size(sp);
s2=size(sn);

SP = cell2mat(sp);
SN = cell2mat(sn);
s1=size(SP);
s2=size(SN);
s1=s1(2);
s2=s2(2);
ang=[SP SN];

DB = vectorsort(X1,ang);
[C1,C2,ker] = optialgo(DB,xp);

figure


for i=sizepart:s1+s2


    
    if(  i < s1+1)
     scatter(C1(i),C2(i),'filled','b');
     hold on
        
    end


    if( s1 < i)
     scatter(C1(i),C2(i),'filled','r');
     hold on
        
    end


end

title('Two-dimensional embedding ')
end


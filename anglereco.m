function [angu,ndatabase,Indices] = anglereco(rad,database,xp)


s=size(database);
s=s(2);
angu={};
ndatabase={};
Indices={};
conta=1;

sum=0;
for i=1:s
    
    vtemp=database(:,i);
    temp=dot(vtemp,xp)/rad;
    
    
    
    if( abs(temp) <= 1)
    temp=acos(temp);
    angu{conta}=temp*(180/pi);
    ndatabase{conta}=vtemp;
    Indices{conta}=i;
    conta=conta+1;
    
    
    end
end

angu=cell2mat(angu);
ndatabase=cell2mat(ndatabase);
Indices=cell2mat(Indices);


end
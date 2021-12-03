function [ang,c,sp,sn] = angsort(ang,n)

s=size(ang);
[B,I] = sort(ang);
c={};
sp=[];
sn=[];
tamsi=fix(s(2)/n)+1;

for j=1:tamsi
    c{j}=[]; 
    sp{j}=[]; 
    sn{j}=[]; 
end

if(   0 < B(1))
    
    ang=180*ones(s)- ang;
 
end

[B,I] = sort(ang);


for j=1:s(2)
    
    pitemp=fix(j/n)+1;
    
    c{pitemp}=[c{pitemp} I(j)];
    

end
    
    
end


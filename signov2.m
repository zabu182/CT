function [sn , sp,alarm,signf] = signov2(C,sp,sn,ang,sizepart,acumu,alarm,signf)

Mn=sn{acumu+1};
Mp=sp{acumu+1};
stn=size(Mn);
stp=size(Mp);

if(stn(2)==0)
alarm=1;
signf=1;
end

if(stp(2)==0)
alarm=1;
signf=-1;
end

if(alarm==0)

minindex=find(ang==Mn(stn(2)));
mipindex=find(ang==Mp(stp(2)));



Cn=C(minindex,:);
Cp=C(mipindex,:);

for i=sizepart+1:2*sizepart

castemp=acumu+2;

vtemp=C(i,:);  

va1=norm(Cn-vtemp);
va2=norm(Cp-vtemp);



if( va1 < va2)

sn{castemp}=[sn{castemp} ang(i)];
    
end
    
if( va2 < va1)

    sp{castemp}=[sp{castemp} ang(i)];
    
end
    
end

end
end

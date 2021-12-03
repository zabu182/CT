clear all
clc
close all


%%%%%%%%%%%%---------Parametes-----------%%%%%%%%%

nsample=2000;    %%%%%%%----------Number of points ----------%%%%%%%
sizepart=20;     %%%%%%%----------parameter r according the paper ----------%%%%%%%
noilev=0.1;      %%%%%%%----------Noise level----------%%%%%%%
P=imread('knee.jpg');    %%%%%%%----------  Image sample ----------%%%%%%%
%P=phantom(548);         %%%%%%%----------  Phantom Sample ----------%%%%%%%
 
%%%%----------Set up-------%%%%%%

P=rgb2gray(P);
P=im2double(P);
Pcop=P;
v=180*(rand(1,nsample));

%%%%----------Set up-------%%%%%%

%%%%----------Radon transform-------%%%%%%

[X1,xp] = radon(P,v);
X1=X1+noilev*rand(size(X1));
stempe=size(xp);
stempe=stempe(1);
xp=linspace(-1/2,1/2,stempe);

%%%%----------Radon transform-------%%%%%%


[I,Imin]=maxfun(X1,xp);
radiu=abs(dot(X1(:,I),xp));
[ang,ndatabase] = anglereco(radiu,X1,xp);
[ang,c,sp,sn] = angsort(ang,sizepart);
[p1 p2]=sort(ang);
mxv=180-p1(nsample);


%%%%----------Radon transform-------%%%%%%


%%%%----------Radon transform-------%%%%%%
DB0=[c{1} c{2} c{3} ];
DB = vectorsort(X1,DB0);
[C1,C2,ker] = optialgo(DB,xp);
C=[C1 C2];
Ccop1=C1;
Ccop2=C2;
grad = gradiente(DB,C,ker,xp);
gradcop=grad;
acumu=0;
[sn , sp] = signo(grad,sp,sn,DB0,sizepart,acumu);
stempe=size(c);



signf=0;
alarm=0;

while( alarm==0  &  acumu < stempe(2)-3)

DBtemp=[c{acumu+2} c{acumu+3} c{acumu+4}];
DB = vectorsort(X1,DBtemp);
[C1,C2,ker] = optialgo(DB,xp);
C=[C1 C2];
grad = gradiente(DB,C,ker,xp);
acumu=acumu+1;
[sn , sp , alarm,signf] = signov2(C,sp,sn,DBtemp,sizepart,acumu,alarm,signf);


end




for j=acumu+2:stempe(2)

if(signf==1)
sp{j}=c{j};
end

if(signf==-1)
sn{j}=c{j};
end


end

SP = cell2mat(sp);
SN = cell2mat(sn);
SN=flip(SN);

VP=vectorsort(X1,SP);
VN=vectorsort(X1,SN);

angp=ang(SP);
angn=-ang(SN);




V=[VN VP];
ANG=[ angn angp];


IP=iradon(X1,v);
I1=iradon(V,ANG);
I2=iradon(X1,ang);


figure
imshow(IP)
title('Original')

figure
imshow(I1)
title('With implementation')



figure
imshow(I2)
title('Without implementation')




%%%%%%%-----end-----%%%%%%%






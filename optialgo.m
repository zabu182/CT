function [C1,C2,kernec] = optialgo(X1,xp)

s=size(X1);

kerne=zeros(s(2),s(2));
unve=transpose(ones(1,s(2)));
vecnoru=ones(1,s(1));


for i=1:s(2)
    v1=X1(:,i);
    v1=v1/dot(v1,vecnoru);
    
    for j=1:s(2)
    v2=X1(:,j);
    v2=v2/dot(v2,vecnoru);
    
    kerne(i,j)=norm(v1-v2);
    

    
end
end




kerne=kerne.^2;
kerne=exp(-kerne/2);     
kernec=kerne;



norma=kerne*unve;        %%Diffusion map embedding
norma=power(norma,-1/2);
Nv=diag(norma);
kerne=Nv*kerne*Nv;






[V,D,W] = svd(kerne);
[d,ind] = sort(abs(diag(D)));
Ds = D(ind,ind);
Vs = V(:,ind);



C1=Ds(s(2)-1,s(2)-1)*Vs(:,s(2)-1);
C2=Ds(s(2)-2,s(2)-2)*Vs(:,s(2)-2);
C3=Ds(s(2)-3,s(2)-3)*Vs(:,s(2)-3);



%figure
%xnum=1:1:s(2);
%d=flip(d);
%d=d(1:end-980);
%xnum=xnum(1:end-980);



%scatter(xnum,d,'filled')
%title('Eigenvalues of the matrix L')
%hold on
%xlabel('Number of eigenvalues') 
%ylabel('Eigenvalue')




end
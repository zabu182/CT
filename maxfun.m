function [Imax,Imin] = maxfun(X1,xp)


s=size(X1);
vec=zeros(1,s(2));

for i=1:s(2)
    v=X1(:,i);
    vec(i)=abs(dot(v,xp));
    
end

[sol,Ind] =sort(vec);
Imax=Ind(s(2));
Imin=Ind(1);

end

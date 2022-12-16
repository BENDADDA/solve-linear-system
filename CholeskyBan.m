function L=CholeskyBan(A)
[n,m]=size(A);
if(n~=m) error('the matrix must be a square matrix');
end
for i=1:n
    for j=1:i
    s=0;
    for k=1:(j-1)
       s=s+L(i,k)*L(j,k); 
    end
    if(i==j)
        if(A(i,i)-s<0) error('Matrix must be positive definite.');end
        L(i,i)=sqrt(A(i,i)-s);
    else
        L(i,j)=(1.0/L(j,j)*(A(i,j)-s));
    end
    end
end
end

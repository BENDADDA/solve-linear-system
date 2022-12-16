function x=JacobiMethod(A,B,N,X0)
[n,m]=size(A);
if(n~=m) error('the matrix must be a squre matrix.');
end
if([n,1]~=size(B))error('the dimensions of the matrix B must be %d*1.',n);
end
x=X0;
E=-tril(A,-1);
F=-triu(A,1);
D=diag(diag(A));
D=InversMatrix(D);
for i=1:N
    x=D*(E+F)*x+D*B;
end
end
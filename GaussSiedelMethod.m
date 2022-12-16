function x=GaussSiedelMethod(A,B,epsilon,X0)
[n,m]=size(A);
if(n~=m) error('the matrix must be a squre matrix.');
end
if([n,1]~=size(B))error('the dimensions of the matrix B must be %d*1.',n);
end
x=X0;
E=-tril(A,-1);
F=-triu(A,1);
D=diag(diag(A));
epsilon=ones(n,1)*epsilon;
k=0;
while(all(abs(x-X0)<abs(epsilon)))
    X0=x;
    x=InversMatrix(D-E)*(B+F*x);
    k=k+1;
end
end
%%slove linear system using cholesky method
%%-------------prat 1--------------------
disp('solving linver system using cholesky method . . . ');
%%clear the command window and work space 
clc
%%decalre variables that we need
%%a.Read the matrix A
A=input('enter the matrix A:');
B=input('enter the matrix B:');
try
   
    if(~all(all(A==A'))) error('the matirx must be a symetric matrix.');
    end
    n=length(A);
    L=CholeskyBan(A);
    L
    %%find the solutions now 
    %%frist we have to find  W /A.X=B => L.L'.X=B => L.W=B where W=L'.X
    W=zeros(n,1);
    for i=1:n
        sum=0;
        for j=1:i-1
            sum=sum+W(j)*L(i,j);
        end
        W(i)=(B(i)-sum)/L(i,i);
    end 
    W
    %%second we should find x and we done /L'.x=W
    X=zeros(n,1);
    Lt=L';
    for i=n:-1:1
        sum=0;
        for j=i+1:n
            sum=sum+X(j)*Lt(i,j);
        end
        X(i)=(W(i)-sum)/Lt(i,i);
    end
    X
catch e
    disp(e);
end

function [x]=InversMatrix(A)
[n,m]=size(A);
if(n~=m) error('the matrix must be a squre matrix');
end
x=eye([n,m]);
for i=1:n
    if(A(i,i)==0)
        for k=1:n
            if(k~=i && A(k,k)~=0)
            A([i,k],:)=A([k,i],:);
            x([i,k],:)=x([k,i],:);
            break;
            end
        end
    end
    lamda=A(i,i);
    A(i,:)=A(i,:)/lamda;
    x(i,:)=x(i,:)/lamda;
    for j=1:n
    if(i~=j)
    lamda=A(j,i)/A(i,i);
    A(j,:)=A(j,:)-lamda*A(i,:);
    x(j,:)=x(j,:)-lamda*x(i,:);
    end
    end
end
end
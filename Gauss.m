%%before we start we need to clear the workspace and declare a new
%%variables
clc
clear
A=[];
B=[];
%%First read the elements of the matrices
lenght=input('Please, Enter the lenght of the square matrix:');
for i=1:lenght
    for j=1:lenght
        s=sprintf('A(%d,%d)=',i,j);
        A(i,j)=input(s);
    end
end
disp('Now enter the elements of the table');
for i=1:lenght
    s=sprintf('B(%d)=',i);
    B(i)=input(s);
end
%%Second find the solutions
A=[A B'];
Isright=1;
i=1;
while(i<=lenght && Isright==1)
    for j=1+i:lenght
        %%---------begin checking------------
        if A(i,i)==0
           for k=i+1:lenght
                if (A(k,i)~=0)
                    A([i,k],:)=A([k,i],:);
                    break;
                end
           end
        end
        if (A(i,i)==0)
            Isright=0;
            break;
        end
        %%----------end checking--------------
        lamda=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-lamda*A(i,:);
    end
    i=i+1;
end
A
%%-----check one more time------
for h=1:lenght
    if(A(h,h)==0) Isright=0;
        break;
    end
end
%%---the end of the checking----
if(Isright==1)
for k=lenght:-1:1
s=0;
    for j=k+1:lenght
    s=s+A(k,j)*x(j);
    end
    x(k)=(A(k,lenght+1)-s)/A(k,k);
end
disp('we have  a unique solution here');
x
else
disp('there is no unique solution');
end




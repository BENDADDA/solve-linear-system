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
U=A;
L=eye(lenght);
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
        L(j,i)=lamda;
        A(j,i:lenght)=A(j,i:lenght)-lamda*A(i,i:lenght);
    end
    i=i+1;
end
A;
%%-----check one more time------
for h=1:lenght
    if(A(h,h)==0) Isright=0;
        break;
    end
end
%%---the end of the checking----

L;
U;
Y = zeros(lenght,1);
Y(1) = B(1);

if(Isright==1)
for i = 2 : lenght
Y(i)= B(i) - L(i,i-1:-1:1)*Y(i-1:-1:1);
end
%------------------------------------
x=zeros(lenght,1);
x(lenght)= Y(lenght)/ U(lenght,lenght);
for i = lenght-1 : -1 : 1
x(i)=(Y(i) - U(i,i+1:lenght)*x(i+1:lenght)) / U(i,i);
end
disp('we have  a unique solution here');
x
else
disp('there is no unique solution');
end




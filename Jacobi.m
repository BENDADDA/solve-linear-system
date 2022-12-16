%%slove linear system using jacobi method
%%-------------prat 1--------------------
disp('solving linver system using jacobi method . . . ');
%%clear the command window and work space 
clc
clear all;
%%decalre variables that we need
A=[];
B=[];
X0=[];
%%a.Read the matrix A
A=input('enter the matrix A:');
B=input('enter the matrix B:');
X0=input('enter the matirx X0:');
N=input('N=');
try
    disp('the solutin is:');
    [A,B]=makeDD(A,B);
    x=JacobiMethod(A,B,N,X0);
    x
    disp('the real solution is:');
    linsolve(A,B)
    disp('errors:');
    x-linsolve(A,B)
catch e
    disp(e);
end

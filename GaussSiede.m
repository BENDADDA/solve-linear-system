%%slove linear system using gauss siedel method
%%-------------prat 1--------------------
disp('solving linver system using gauss siedel method . . . ');
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
epsilon=input('epsilon=');
try
    disp('the solutin is:');
    [A,B]=makeDD(A,B);
    x=GaussSiedelMethod(A,B,epsilon,X0);
    x
    disp('the real solution is:');
    linsolve(A,B)
    disp('errors:');
    x-linsolve(A,B)
catch 
    disp('error');
end

% MATH 205 | Project 1 | Eva Huang

% Q1 (8 pts) Solve the system using rref and write the solutions using a parametric vector form.
format rat;
disp ('Question 1: Solve the system using rref and write the solutions using a parametric vector form.')
syms x_1 x_2 x_3 x_4 x_5 x_6
% varialbles x1 through x6

A=[0 0 6 2 -4 8 8; 0 0 3 1 -2 0 4;2 -3 1 4 -7 1 2;6 -9 0 11 -19 3 1] 
% Augmented matrix

disp('rref(A):')
rref(A)
%run rref


% Write solutions using a parametric vector form
disp('solution in vector form')
disp('[x1 x2 x3 x4 x5 x6]=[1/24; 0; 5/3; 0; 0; 1/4]+x2*[3/2; 1; 0; 0; 0; 0]+x4*[-11/6; 0; -1/3; 1; 0;0]+x5*[ 19/6; 0; 2/3; 0; 1;0]')
solution1=[1/24; 0; 5/3; 0; 0; 1/4]+x_2*[3/2; 1; 0; 0; 0; 0]+x_4*[-11/6; 0; -1/3; 1; 0;0]+x_5*[ 19/6; 0; 2/3; 0; 1;0]

%/Q1
disp('====')
% Q2 (8 pts) Solve the homogeneous system and write the solutions using a parametric vector form.
disp ('Question 2: Solve the homogeneous system and write the solutions using a parametric vector form')

A=[3 1 1 1 0; 5 -1 1 -1 0]
% Augmented matrix to check homogeneous system Ax=0

disp('rref(A):')
rref(A)
%run rref

% Write solutions using a parametric vector form
disp('solution in vector form')
disp('[x1 x2 x3 x4 ]=[0; 0; 0; 0]+x3*[-1/4; -1/4; 1; 0]+x4*[0; -1; 0;1]')
%Trivial + non-trivial solutions
solution2=[0; 0; 0; 0]+x_3*[-1/4; -1/4; 1; 0]+x_4*[0; -1; 0;1]
% x3 and x4 arefree variables, Trivial + non-trivial solutions=many solutions

%/Q2
disp('====')

% Q3 Determine if the following sets of vectors will span R3. Explain why or why not.
disp ('Question 3: Determine if the following sets of vectors will span R^3. Explain why or why not.')
disp ('(a) (3 pts) v1 = (2, 0, 1), v2 = (-1, 3, 4), and v3 = (1, 1, -2).')
A=[2 -1 1; 0 3 1; 1 4 -2]
% Augmented matrix

disp('rref(A):')
rref(A)
%run rref

% Determine if the following sets of vectors will span R^3
% Check theorem 4
fprintf('\nEvery row has a pivot in this sets of vectors. \nBased on theorem 4, this spans R^3.')
disp('====')
disp ('(b) (3 pts) v1 = (1, 2, -1), v2 = (3, -1, 1), and v3 = (-3, 8, -5).')
A=[1 3 -3; 2 -1 8; -1 1 -5]
% Augmented matrix

disp('rref(A):')
rref(A)
%run rref

% Determine if the following sets of vectors will span R^3
% Check theorem 4
fprintf('\nFree variable in this sets of vectors. \nBased on theorem 4, this does not span R^3.')

%/Q3
disp('====')

% Q4 Determine if the following sets of vectors are linearly independent or linearly dependent, and explain why.
disp ('Question 4: Determine if the following sets of vectors are linearly independent or linearly dependent, and explain why.')
disp ('(a) (3 pts) v1 = (-2, 1), v2 = (-1, -3), and v3 = (4, -2).')
A=[-2 -1 4 0;1 -3 -2 0]
% Augmented matrix

disp('rref(A):')
rref(A)
%run rref

% Determine if the following sets of vectors are linearly independent
% Find out if Ax=0 is trivial solution only or otherwise.
fprintf('\nbasic:x1, x2, free:x3. \nLinearly Dependent.')
disp('====')
disp ('(b) (3 pts) v1 = (1, 1, -1, 2), v2 = (2, -2, 0, 2), and v3 = (2, -8, 3, -1).')
A=[1 2 2 0; 1 -1 -8 0; -1 0 3 0; 2 2 -1 0]
% Augmented matrix

disp('rref(A):')
rref(A)
%run rref

% Determine if the following sets of vectors are linearly independent
% Find out if Ax=0 is trivial solution only or otherwise.
fprintf('\nbasic:x1, x2, x3. \nLinearly Independent')

%/Q4
disp('====')

% Q5 (8 pts) Is b in the range of the transformation x→Ax ? If so, find an x whose image under the transformation is b.
disp ('Question 5: Is b in the range of the transformation x→Ax ? If so, find an x whose image under the transformation is b.')

A=[4 -2 5 -5 7; -9 7 -8 0 5; -6 4 5 3 9; 5 -3 8 -4 7]
% Augmented matrix


disp('rref(A):')
rref(A)
%run rref

% we can assume that b is part of the column space of A since the result of rref is consistent
x = [4;7;1;0]
disp('Solution for the equation Ax =b')
disp(x)

%/Q5
disp('====')

% Q6 (8 pts) Solve the system using method of matrix inversion.
disp ('Question 6: Solve the system using method of matrix inversion.')

A=[6 2 0 -4 1; 3 1 -2 0 -4;-1 0 3 1 5;2 -3 1 4 -1; 0 1 1 -2 3] 
% Augmented matrix
b=[6;8;1;0;2]
disp('inv(A):')
inv(A)

disp('inv(A)*b:')
inv(A)*b
%run rref


%/Q6
disp('====')

% Q7 (6 pts) Define 4 by 4 P matrix using pascal and compute P^2 and P.^2. What is the difference between these two matrices?
disp ('Question 7: Define 4 by 4 P matrix using pascal and compute P^2 and P.^2. What is the difference between these two matrices?')

P = pascal(4)
% P= 4 by 4 pascal matrix (symmetric matrix)
A = P^2;
% P^2 = A * A (matrix multiplication)
B = P.^2;
% P.^2 gives element-by-element powers of A (each element of A is squared)
disp('P^2 ='), disp(A)
disp('P.^2 ='), disp(B)
fprintf('\nP^2 is the product of the matrix P with itself, but \nP.^2 is the matrix obtained by squaring each element of P.\n')

%/Q7
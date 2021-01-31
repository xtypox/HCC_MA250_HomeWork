% MATH 205 | Project 2 | Eva Huang

% Q1 Determine whether w is in the column space of A, the null space of A, both, or none.
format rat;
disp ('Question 1: Determine whether w is in the column space of A, the null space of A, both, or none.')

A=[0 5 0 1; -5 2 1 -2; 10 -8 6 -3; 3 -2 1 -1]; 
w=[1;2;1;0];
% does Ax=w has a solution?
C=[A w];
disp('rref(A w) :')
rref(C)
disp('Ax=w has solutions. w is in col A')

fprintf('\nA*w:')
A*w
% Nullspace={Aw=0}
disp('A*w does not equal to 0, w is not in the null space of A')
fprintf('\nrref(A):')
rref(A)

% Rank= Dim of col A = # of pivot columns.
fprintf('\n Rank of A = 4')
% Dim of null A= numbers of free variables.
fprintf('\n Dimension for null A = 0')
%/Q1
fprintf('\n====\n')

% Q2 Let H = Span {u1, u2, u3}, K = Span{ v1 , v2 , v3 } where.
disp ('Question 2: Let H = Span {u1, u2, u3}, K = Span{ v1 , v2 , v3 } where')

u1=[-1; 4; 6; -1]
u2=[0; 2; -1; 1]
u3=[1; 0; 8; -4]
v1=[1; 2; 3; -1]
v2=[-2; 0; 2; 1]
v3=[-2; -2; 7; -3]
disp ('Find bases for H, K and H + K ("H and K combined").')
% Find H and K
H=[u1,u2,u3]
K=[v1,v2,v3]


% preform rref for pivot points.
disp('rref(H):')
rref(H)
fprintf('All three columns of K has a pivot point.\nBasis for H={u1, u2, u3}\n\n')
disp('rref(K):')
rref(K)
fprintf('All three columns of K has a pivot point.\nBasis for K={v1, v2, v3}\n\n')
% Find H+K
HK=[H K]
% preform rref for pivot points.
disp('rref(HK):')
rref(HK)
fprintf('Columns 1, 2, 3 and 5 are linearly independent.\nBasis HK={u1, u2, u3, v2} ')
%/Q2
fprintf('\n====\n')
% Q3 Solve the system using method of matrix inversion.
disp ('Question 3: Solve the system using method of matrix inversion.')
fprintf('\n 6x1 + 2x2 - 4x4 + x5 = 6 \n 3x1 + x2 - 2x3 -4x5 = 8 \n -x1 + 3x3 + x4 + 5x5 = 1 \n 2x1 - 3x2 + x3 + 4x4 - x5 = 0 \n x2 + x3 - 2x4 + 3x5 = 2')
A=[6 2 0 -4 1;3 1 -2 0 -4;-1 0 3 1 5;2 -3 1 4 -1;0 1 1 -2 3]
b=[6;8;1;0;2]
% x=A^-1*b
% A[x1 x2 x3 x4 x5]=[6 8 1 0 2]
disp('inv(A):')
inv(A)
disp('A^-1*b=x:')
A\b
%/Q3
fprintf('\n====\n')
% Q4 Use lu factorization to solve #3. Compare with the solution obtained in #3, are the solutions (#3 and #4 the same?) What is the difference between LU we did in class and LU using Matlab?
disp ('Question 4: Use lu factorization to solve #3. Compare with the solution obtained in #3, are the solutions (#3 and #4 the same?) What is the difference between LU we did in class and LU using Matlab?')

%find the LU decomposition
disp('find L and U of A')
[L,U]=lu(A)
% solve for y. Ly=b => y=inv(L)*b 
disp('y=inv(L)*b')
y=L\b
% solve for x. Ux=y => x=inv(U)*y
disp('x=inv(U)*y')
x=U\y
fprintf('Result of Q4 is the same as Q3. \nThe matlab lu solution performs pivoting by default, then we solve y by invers(L)*b then solve x by invers(U)*y.\nBy hand we solve LU by preforming row replacements only, then we solve y in parametric vector form of Ly=b, the solve x in parametric vector form of Ux=y.')
%/Q4
fprintf('\n====\n')
% Q5 Is the set of all vectors of the form: [x1 x2 x3 x4] where x1=x2 a subspace of R^4 ? Explain your answer using the definition of subspace.
disp ('Question 5: Is the set of all vectors of the form: [x1 x2 x3 x4] where x1=x2 a subspace of R^4 ? Explain your answer using the definition of subspace.')
% 3 conditions: 1) Closed under vector addition 2) Closed under scalar multiplication 3)Zero vector.
syms x1 x2 x3 x4  y1 y2 y3 y4 a b c
% create 2 vecors that satisfy x1=x2 / y1=y2
x1=x2
y1=y2
u=[x1 ; x2; x3; x4]
v=[y1 ; y2; y3; y4]

% Condition 1: Is u closed under vector addition? Check if v+u is in R^4 
disp ('sub x1 with a, y1 with b')
disp ('Condition 1: u+v:')
subs(subs(u+v,x1,a),y1,b)
fprintf('x1+y1=x2+y2=a+b, u+v is another vector in subspace R^4 satisfying closed under vector addition. \n \n')

% Condition 2: Is u closed under scalar multiplication? Check if cu is in R^4 
disp ('Condition 2: Let c be a scalar, cu:')
c*u
fprintf('c*x1=c*x2, cu is another vector in R^4 satisfying closed under vector addition \n \n')


% Condition 3: Zero vector
disp ('Condition 3: Zero vector:')
subs(subs(subs(u,0),x3,0),x4,0)
fprintf('0 vector satisfies x1=x2=0, 0 vector is in R^4\n')
fprintf('Set of all vectors of the form: [x1 x2 x3 x4] where x1=x2 is a subspace of R^4')
%/Q5
